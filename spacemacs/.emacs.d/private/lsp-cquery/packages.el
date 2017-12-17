;;; packages.el --- lsp-cquery layer packages file for Spacemacs.
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
    (lsp-ui :location local)
    (company-lsp :toggle (configuration-layer/package-usedp 'company))
    (cquery :location local)
    helm-xref
    ))

(defun lsp-cquery/init-lsp-mode ()
  (use-package lsp-mode)
  (use-package lsp-flycheck :after flycheck)
  )

(defun lsp-cquery/init-lsp-ui ()
  (use-package lsp-ui
    :after lsp-mode
    :config (add-hook 'lsp-after-open-hook 'lsp-line-mode)
    ))

(defun lsp-cquery/init-company-lsp ()
  (use-package company-lsp
    :init (push 'company-lsp company-backends-c-mode-common)
    ))

(defun lsp-cquery/init-helm-xref ()
  "from github.com/MaskRay/Config"
  (use-package helm-xref
    :config
    (progn
      (setq xref-prompt-for-identifier '(not xref-find-definitions xref-find-definitions-other-window
                                             xref-find-definitions-other-frame xref-find-references
                                             spacemacs/jump-to-definition spacemacs/jump-to-reference))
      (setq xref-show-xrefs-function 'helm-xref-show-xrefs))))

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
          "r[" 'xref-pop-marker-stack
          "rl" 'helm-imenu
          )))))

;;; packages.el ends here
