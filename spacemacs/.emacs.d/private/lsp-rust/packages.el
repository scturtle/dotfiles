;;; packages.el --- lsp-rust layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: scturtle <scturtle@gmail.com>
;; URL: https://github.com/scturtle/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

;;; Code:

(defconst lsp-rust-packages
  '((lsp-rust :location local)
    company-lsp
    ))

(defun lsp-rust/post-init-company-lsp ()
  (use-package company-lsp
    :config (push 'company-lsp company-backends-rust-mode)))

(defun lsp-rust/init-lsp-rust ()
  (use-package lsp-rust
    :init
    (progn
      (add-hook 'rust-mode-hook #'lsp-rust-enable)
      (evil-leader/set-key-for-mode 'rust-mode
        "r." 'xref-find-definitions
        "r," 'xref-find-references
        "r[" 'xref-pop-marker-stack
        "rl" 'helm-imenu
        ))))

;;; packages.el ends here
