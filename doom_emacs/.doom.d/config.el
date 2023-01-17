;;;  -*- lexical-binding: t; -*-

(load! "ui")
(load! "bindings")

;; tab bar
(setq tab-bar-close-button-show nil
      tab-bar-tab-name-function 'tab-bar-tab-name-truncated
      tab-bar-tab-name-ellipsis "…")

(setq treesit-extra-load-path '("~/code/repos/tree-sitter-module/dist"))

(setq evil-want-fine-undo t)

(setq recenter-redisplay nil)

(setq org-directory "~/code/notes")
(after! deft
  (setq deft-directory org-directory)
  (setq deft-auto-save-interval 0))

;; setup llvm
(let* ((dirs '("~/workspace/llvm-utils" "~/code/llvm-project"))
       (llvm-dir (cl-first (cl-remove-if-not 'file-directory-p dirs)))
       (lsp-cmds '("tblgen-lsp-server" "--tablegen-compilation-database=tablegen_compile_commands.yml")))
  (when llvm-dir
    (add-load-path! (concat llvm-dir "/llvm/utils/emacs"))
    (add-load-path! (concat llvm-dir "/mlir/utils/emacs"))
    (require 'tablegen-mode)
    (require 'mlir-mode)
    (add-hook! 'tablegen-mode-hook :append #'lsp!)
    (after! lsp-mode
      (add-to-list 'lsp-language-id-configuration '(tablegen-mode . "tablegen"))
      (lsp-register-client
       (make-lsp-client :new-connection (lsp-stdio-connection lsp-cmds)
                        :major-modes '(tablegen-mode)
                        :server-id 'tblgenls)))))

;; non-blocking json rpc FTW
(setq lsp-idle-delay 0
      eldoc-idle-delay 0
      company-idle-delay 0)

(after! cc-mode
  (remove-hook 'c-mode-common-hook #'rainbow-delimiters-mode))

(after! evil-multiedit
  (setq evil-multiedit-follow-matches t))

(after! flycheck
  (defun flycheck-disable-excessive-checker (_ __)))

(after! magit
  (setq magit-diff-refine-hunk nil))

(setq evil-collection-magit-want-horizontal-movement t
      evil-collection-magit-use-z-for-folds t)

(after! rustic
  (setq rust-match-angle-brackets nil))

;; extract and show short signature for rust-analyzer
(cl-defmethod lsp-clients-extract-signature-on-hover (contents (_server-id (eql rust-analyzer)))
  (let* ((value (if lsp-use-plists (plist-get contents :value) (gethash "value" contents)))
         (groups (--partition-by (s-blank? it) (s-lines (s-trim value))))
         (sig_group (if (s-equals? "```rust" (car (-third-item groups)))
                        (-third-item groups)
                      (car groups)))
         (sig (--> sig_group
                   (--drop-while (s-equals? "```rust" it) it)
                   (--take-while (not (s-equals? "```" it)) it)
                   (--map (s-trim it) it)
                   (s-join " " it))))
    (lsp--render-element (concat "```rust\n" sig "\n```"))))

;; do not cache the shitty result from rust-analyzer
(advice-add #'lsp-eldoc-function :after (lambda (&rest _) (setq lsp--hover-saved-bounds nil)))

(use-package! lsp-mode
  :defer t
  :custom
  (lsp-lens-enable nil)
  (lsp-enable-file-watchers nil)
  (lsp-signature-render-documentation nil)
  (lsp-client-packages '(ccls lsp-rust lsp-pyright)))

;; lsp over tramp
(after! tramp-sh ;; for magit to use newer git
  (add-to-list 'tramp-remote-path "~/.local/bin"))
(after! lsp-mode
  ;; https://github.com/emacs-lsp/lsp-mode/pull/2531
  ;; https://github.com/emacs-lsp/lsp-mode/issues/2375
  (defun lsp-tramp-connection@override (local-command)
    (defvar tramp-connection-properties)
    (list :connect (lambda (filter sentinel name environment-fn _workspace)
                     (add-to-list 'tramp-connection-properties
                                  (list (regexp-quote (file-remote-p default-directory))
                                        "direct-async-process" t))
                     (let* ((final-command (lsp-resolve-final-function local-command))
                            (process-name (generate-new-buffer-name name))
                            (stderr-buf (format "*%s::stderr*" process-name))
                            (process-environment (lsp--compute-process-environment environment-fn))
                            (proc (make-process
                                   :name process-name
                                   :buffer (format "*%s*" process-name)
                                   :command final-command
                                   :connection-type 'pipe
                                   :coding 'no-conversion
                                   :noquery t
                                   :filter filter
                                   :sentinel sentinel
                                   :stderr (generate-new-buffer stderr-buf)
                                   :file-handler t)))
                       (cons proc proc)))
          :test? (lambda () (-> local-command lsp-resolve-final-function lsp-server-present?))))
  (advice-add 'lsp-tramp-connection :override #'lsp-tramp-connection@override)

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-tramp-connection "ccls")
                    :activation-fn (lsp-activate-on "c" "cpp")
                    :remote? t
                    :multi-root nil
                    :server-id 'ccls-remote)))

(use-package! lsp-ui
  :defer t
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-sideline-enable nil)
  :custom-face
  (lsp-ui-peek-highlight ((t :forground unspecified :background unspecified :inherit highlight)))
  )

(use-package! ccls
  :defer t
  :custom
  (ccls-args '("--log-file=/tmp/ccls.log"))
  (ccls-initialization-options
   '(:index (:trackDependency 1 :threads 8)
     :clang (:excludeArgs ["-fopenmp" "-no-canonical-prefixes" "-fno-canonical-system-headers"])))
  )

(use-package! centered-cursor-mode :defer t)

(use-package! golden-ratio
  :defer t
  :custom
  (golden-ratio-extra-commands '(evil-window-left evil-window-right evil-window-up
                                 evil-window-down evil-window-next evil-window-prev)))

(use-package! explain-pause-mode :defer t)

(defun all-the-icons-octicon (&rest _))
