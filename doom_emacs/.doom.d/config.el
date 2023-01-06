;;;  -*- lexical-binding: t; -*-

(load! "ui")
(load! "bindings")

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

;; fix "zz" to scroll line to center in neotree
(after! neotree
  (evil-define-key 'normal neotree-mode-map "z" nil))

;; do not cache the shitty result from rust-analyzer
(advice-add #'lsp-eldoc-function :after (lambda (&rest _) (setq lsp--hover-saved-bounds nil)))

(after! cc-mode
  (remove-hook 'c-mode-common-hook #'rainbow-delimiters-mode)
  (c-add-style
   "work"
   '((tab-width . 2)
     (c-basic-offset . 2)
     (indent-tabs-mode . nil)
     (c-offsets-alist
      . ((innamespace . 0)
         (substatement-open . 0)
         (access-label . /)
         (inline-open . 0)
         ))))
  (setq c-default-style "work"))

(after! web-mode
  (setq web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-markup-indent-offset 2))

(after! lsp-pyls
  (setq lsp-pyls-plugins-flake8-enabled t)
  (setq lsp-pyls-plugins-mccabe-enabled nil)
  (setq lsp-pyls-plugins-pyflakes-enabled nil)
  (setq lsp-pyls-plugins-pycodestyle-enabled nil))

(after! evil-multiedit
  (setq evil-multiedit-follow-matches t))

(after! flycheck
  (defun flycheck-disable-excessive-checker (_ __)))

(after! magit
  (setq magit-diff-refine-hunk nil))

(setq evil-collection-magit-want-horizontal-movement t
      evil-collection-magit-use-z-for-folds t)

(after! rustic
  (setq rustic-lsp-server 'rust-analyzer
        rust-match-angle-brackets nil))

(cl-defmethod lsp-clients-extract-signature-on-hover (contents (_server-id (eql rust-analyzer)))
  (-let* (((&hash "value") contents)
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

(use-package! lsp-mode
  :defer t
  :custom
  (lsp-lens-enable nil)
  (lsp-enable-file-watchers nil)
  (lsp-signature-render-documentation nil))

;; lsp over tramp
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
  (lsp-ui-peek-highlight ((t :forground nil :background nil :inherit highlight)))
  )

(use-package! ccls
  :defer t
  :custom
  (ccls-args '("--log-file=/tmp/ccls.log"))
  (ccls-initialization-options
   '(:clang (:excludeArgs ["-fopenmp" "-no-canonical-prefixes" "-fno-canonical-system-headers"])))
  (ccls-sem-highlight-method 'font-lock)  ; overlay or font-lock(faster)
  :config
  (after! projectile
    (add-to-list 'projectile-globally-ignored-directories ".ccls-cache")))

(use-package! centered-cursor-mode :defer t)

(use-package! golden-ratio
  :defer t
  :custom
  (golden-ratio-extra-commands '(evil-window-left evil-window-right evil-window-up
                                 evil-window-down evil-window-next evil-window-prev)))

(use-package! explain-pause-mode :defer t)

; (use-package! protobuf-mode :defer t)
