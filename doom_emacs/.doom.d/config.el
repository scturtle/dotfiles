;;;  -*- lexical-binding: t; -*-

(load! "ui")
(load! "bindings")

(setq doom-localleader-key ",")

(setq evil-want-fine-undo t)

(setq recenter-redisplay nil)

(setq org-directory "~/code/notes")
(after! deft
  (setq deft-directory org-directory)
  (setq deft-auto-save-interval 0))

(after! cc-mode
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

(after! company
  (setq company-idle-delay 0.0))

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
  (lsp-signature-render-documentation nil))

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

(use-package! protobuf-mode :defer t)
