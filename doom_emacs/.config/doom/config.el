;;;  -*- lexical-binding: t; -*-

(load! +ui)
(load! +bindings)

(after! evil-multiedit
  (setq evil-multiedit-follow-matches t))

(after! cc-mode
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
  ;; (map! :after cc-mode :mode c-mode-base "{" #'c-electric-brace)
  )

(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2
        company-transformers nil))

(def-package! company-lsp
  :custom (company-lsp-cache-candidates nil))

(def-package! clang-format
  :commands (clang-format-region clang-format-buffer))

(def-package! lsp-mode
  :defer t)

(def-package! lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-sideline--show-symbol nil) ;; FIXME
  :custom-face
  (lsp-ui-peek-filename ((t :foreground "#f1fa8c")))
  (lsp-ui-peek-highlight ((t :background "#bd93f9")))
  (lsp-face-highlight-textual ((t :background "#565761"))))

(def-package! cquery
  :load-path "~/code/repos/emacs-cquery"
  :hook ((c-mode-common . lsp-cquery-enable)
         (c-mode-common . flycheck-mode))
  :custom
  (cquery-extra-args (list "--log-file" "cquery.log"))
  (cquery-extra-init-params '(:cacheFormat "msgpack"))
  (cquery-project-root-matchers '("compile_commands.json" ".cquery"))
  (cquery-sem-highlight-method 'overlay)
  :config
  (require 'projectile)
  (add-to-list 'projectile-globally-ignored-directories ".cquery_cached_index")
  (set! :company-backend 'c-mode #'company-lsp)
  (set! :company-backend 'c++-mode #'company-lsp))

(def-package! rainbow-mode
  :commands (rainbow-mode))

(def-package! git-gutter+
  :if (not window-system)
  :init
  (add-hook! 'magit-pre-refresh-hook #'git-gutter+-refresh)
  (run-with-idle-timer 1 nil #'global-git-gutter+-mode)
  (setq git-gutter+-modified-sign "="
        git-gutter+-added-sign "+"
        git-gutter+-deleted-sign "-"
        git-gutter+-diff-option "-w"
        git-gutter+-hide-gutter t))

;; clipboard
(setq x-select-enable-clipboard t)
(when (eq 'gnu/linux system-type)
  (if window-system
      (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
    (progn ;; (when (getenv "DISPLAY")
      (defun xsel-cut-function (text &optional push)
        (with-temp-buffer
          (insert text)
          (call-process-region (point-min) (point-max) "xsel" nil 0 nil "-b" "-i")))
      (defun xsel-paste-function()
        (let ((xsel-output (shell-command-to-string "xsel -b -o")))
          (unless (string= (car kill-ring) xsel-output)
            xsel-output )))
      (setq interprogram-cut-function 'xsel-cut-function)
      (setq interprogram-paste-function 'xsel-paste-function))))
