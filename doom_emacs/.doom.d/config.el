;;;  -*- lexical-binding: t; -*-

(load! "ui")
(load! "bindings")

(setq read-process-output-max (* 1024 1024))

(setq recenter-redisplay nil)

(setq org-directory "~/code/notes")
(setq deft-directory org-directory)

(setenv "XAPIAN_CJK_NGRAM" "1")

(set-email-account! "megvii"
  '((mu4e-sent-folder         . "/megvii/已发送邮件")
    (mu4e-drafts-folder       . "/megvii/草稿")
    (mu4e-trash-folder        . "/megvii/已删除邮件")
    (mu4e-refile-folder       . "/megvii/存档")
    (smtpmail-smtp-user       . "shenchao@megvii.com")
    (user-mail-address        . "shenchao@megvii.com")
    (mu4e-compose-signature   . "")
    (mu4e-view-date-format    . "%F %T")
    (mu4e-headers-date-format . "%F %T")
    (mu4e-headers-include-related . nil)
    (mu4e-headers-fields . ((:human-date . 24) (:flags . 8) (:from . 16) (:subject)))
    ) t)

(add-hook! cc-mode
  (c-add-style
   "work"
   '((tab-width . 4)
     (c-basic-offset . 4)
     (indent-tabs-mode . nil)
     (c-offsets-alist
      . ((innamespace . 0)
         (substatement-open . 0)
         (access-label . /)
         (inline-open . 0)
         ))))
  (setq c-default-style "work")
  (remove-hook 'c-mode-common-hook #'rainbow-delimiters-mode)
  )

(after! evil-multiedit
  (setq evil-multiedit-follow-matches t))

(after! flycheck
  ;(setq flycheck-checker-error-threshold nil)
  (defun flycheck-disable-excessive-checker (_ _))
  )

(after! magit
  (setq magit-diff-refine-hunk nil))

;; (use-package! rustic
;;   :custom (rustic-lsp-server 'rust-analyzer)
;;   :config (setq lsp-eldoc-prefer-signature-help nil)
;;   )

(after! web-mode
  (setq web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-markup-indent-offset 2))

(after! company
  (setq company-idle-delay 0.0))

(use-package! clang-format
  :commands (clang-format-region clang-format-buffer))

(use-package! lsp-python-ms
  :hook (python-mode . (lambda () (require 'lsp-python-ms) (lsp)))
  :custom (lsp-python-ms-executable "~/.local/bin/Microsoft.Python.LanguageServer")
  )

(use-package! lsp-mode
  :config (require 'lsp-clients)
  ;:hook ((rustic-mode python-mode) . lsp)
  :custom-face
  (lsp-face-highlight-textual ((t :background "#565761")))
  ;:custom (lsp-signature-render-documentation nil)
  )

(use-package! company-lsp
  :custom (company-lsp-cache-candidates nil)
  :config (set-company-backend! '(c-mode c++-mode rustic-mode python-mode) #'company-lsp)
  )

(use-package! lsp-ui
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-sideline-enable nil)
  :custom-face
  (lsp-ui-doc-background ((t :background "#1e2029")))
  (lsp-ui-peek-filename ((t :foreground "#f1fa8c")))
  (lsp-ui-peek-highlight ((t :background "#bd93f9")))
  :config
  (flycheck-add-next-checker 'lsp 'python-flake8)
  )

(use-package! ccls
  :load-path "~/code/repos/emacs-ccls"
  :hook ((c-mode c++-mode) . +lsp|init-ccls)
  :custom
  (ccls-args '("--log-file=/tmp/ccls.log"))
  ;(ccls-initialization-options '(:index (:blacklist (".*boost.*")))
  (ccls-initialization-options '(:clang (:excludeArgs ["-fopenmp" "-no-canonical-prefixes" "-fno-canonical-system-headers" "-mmxu2" "-mips32r2"
                                                       "--sysroot=external/toolchain_v3_tk1_gcc5_archive"])))
  (ccls-sem-highlight-method 'overlay)
  :config
  (defun +lsp|init-ccls ()
    (setq-local company-transformers nil)
    (setq-local company-lsp-async t)
    (setq-local company-lsp-cache-candidates nil)
    (lsp))
  (after! projectile
    (add-to-list 'projectile-globally-ignored-directories ".ccls-cache")
    (add-to-list 'projectile-project-root-files-bottom-up ".ccls-root")
    (add-to-list 'projectile-project-root-files-top-down-recurring "compile_commands.json"))
  )

(use-package! rainbow-mode
  :commands (rainbow-mode))

(use-package! centered-cursor-mode)

(use-package! golden-ratio
  :custom
  (golden-ratio-extra-commands '(evil-window-left evil-window-right evil-window-up
                                 evil-window-down evil-window-next evil-window-prev)))

(use-package! evil-commentary)
(use-package! xclip)

;; clipboard
(setq select-enable-clipboard t)
(when (eq 'gnu/linux system-type)
  (if window-system
      (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
    (progn ;; (when (getenv "DISPLAY")
      (defun xsel-cut-function (text &optional _)
        (with-temp-buffer
          (insert text)
          (call-process-region (point-min) (point-max) "xsel" nil 0 nil "-b" "-i")))
      (defun xsel-paste-function()
        (let ((xsel-output (shell-command-to-string "xsel -b -o")))
          (unless (string= (car kill-ring) xsel-output)
            xsel-output )))
      (setq interprogram-cut-function 'xsel-cut-function)
      (setq interprogram-paste-function 'xsel-paste-function))))
