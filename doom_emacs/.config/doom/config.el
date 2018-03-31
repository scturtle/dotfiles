;;;  -*- lexical-binding: t; -*-

(load! +bindings)
(load! +ui)

(after! cc-mode
  (setq tab-width 4)
  (setq c-basic-offset tab-width)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'innamespace 0)
  (remove-hook 'c-mode-common-hook #'rainbow-delimiters-mode)
  )

(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2
        ))

(def-package! company-lsp
  :defer t)

(def-package! clang-format
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

  (map! :map lsp-ui-mode-map
        :localleader
        :n "r ." #'lsp-ui-peek-find-definitions
        :n "r ," #'lsp-ui-peek-find-references
        :n "r [" #'lsp-ui-peek-jump-backward
        :n "r ]" #'lsp-ui-peek-jump-forward
        )

  (map! :map lsp-ui-peek-mode-map
        "j"   #'lsp-ui-peek--select-next
        "k"   #'lsp-ui-peek--select-prev
        [tab] #'lsp-ui-peek--toggle-file
        )

  (add-hook! 'doom-load-theme-hook #'sync-lsp-ui-face)
  )

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

(def-package! rainbow-mode)

(def-package! git-gutter+
  :commands (global-git-gutter+-mode git-gutter+-mode git-gutter+-refresh)
  :init
  (progn
    (add-hook 'magit-pre-refresh-hook 'git-gutter+-refresh)
    (run-with-idle-timer 1 nil 'global-git-gutter+-mode)
    (setq git-gutter+-modified-sign "="
          git-gutter+-added-sign "+"
          git-gutter+-deleted-sign "-"
          git-gutter+-diff-option "-w"
          git-gutter+-hide-gutter t)
    ;; TODO sync theme color
    )
  :config (global-git-gutter+-mode)
  )
