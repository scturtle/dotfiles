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
  (map! :after cc-mode :mode c-mode-base "{" #'c-electric-brace)
  )

(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2
        company-transformers nil))

(def-package! company-lsp
  :defer t
  :config
  (setq company-lsp-async t
        company-lsp-cache-candidates nil))

(def-package! clang-format
  :defer t
  :commands (clang-format-region clang-format-buffer))

(def-package! lsp-mode
  :defer t)

(def-package! lsp-ui
  :demand t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable nil
        lsp-ui-sideline--show-symbol nil ;; FIXME
        )
  (add-hook! 'doom-load-theme-hook #'my/sync-lsp-ui-face))

(def-package! cquery
  :load-path "~/code/repos/emacs-cquery"
  :init (add-hook 'c-mode-common-hook #'lsp-cquery-enable)
  :config
  (setq cquery-extra-args (list "--log-file" "cquery.log"))
  (setq cquery-extra-init-params '(:cacheFormat "msgpack"))
  (setq cquery-project-root-matchers '("compile_commands.json" ".cquery"))
  (setq cquery-sem-highlight-method 'overlay)
  (require 'projectile)
  (add-to-list 'projectile-globally-ignored-directories ".cquery_cached_index")
  (add-hook! 'c-mode-common-hook #'flycheck-mode)
  (set! :company-backend 'c-mode #'company-lsp)
  (set! :company-backend 'c++-mode #'company-lsp)
  )

(def-package! rainbow-mode
  :defer t
  :commands (rainbow-mode))

(def-package! git-gutter+
  :commands (global-git-gutter+-mode git-gutter+-mode git-gutter+-refresh)
  :init
  (progn
    (add-hook 'magit-pre-refresh-hook 'git-gutter+-refresh)
    (if (not window-system)
        (run-with-idle-timer 1 nil 'global-git-gutter+-mode))
    (setq git-gutter+-modified-sign "="
          git-gutter+-added-sign "+"
          git-gutter+-deleted-sign "-"
          git-gutter+-diff-option "-w"
          git-gutter+-hide-gutter t)
    ))
