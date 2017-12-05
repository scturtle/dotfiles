;;; packages.el --- lsp layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: scturtle <scturtle@gmail.com>
;; URL: https://github.com/scturtle/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

(defconst lsp-cquery-packages
  '(lsp-mode
    (company-lsp :toggle (configuration-layer/package-usedp 'company))
    (cquery :location local)
    ))

(defun lsp-cquery/init-lsp-mode ()
  (use-package lsp-mode
    :defer t
    :config (use-package lsp-flycheck :defer t :after flycheck)
    ))

(defun lsp-cquery/init-company-lsp ()
  (use-package company-lsp
    :defer t
    :init (push 'company-lsp company-backends-c-mode-common)
    ))

(defun lsp-cquery/init-cquery ()
  (use-package cquery
    :init
    (progn
      ;; (setq cquery_root "/Users/scturtle/code/github/cquery")
      (spacemacs/add-to-hooks #'lsp-cquery-enable '(c-mode-hook c++-mode-hook))
      (dolist (mode '(c-mode c++-mode))
        (evil-leader/set-key-for-mode mode
          "r." 'xref-find-definitions
          "r," 'xref-find-references
          "rl" 'helm-imenu
          )))))

;;; packages.el ends here
