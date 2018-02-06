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
  '((lsp-mode :location local)
    (lsp-ui :location local)
    (company-lsp :location local)
    (cquery :location local)
    helm-xref
    markdown-mode
    ))

(defun lsp-cquery/init-lsp-mode ()
  (use-package lsp-mode))

(defun lsp-cquery/init-markdown-mode ()
  (use-package markdown-mode))

(defun lsp-cquery/init-lsp-ui ()
  (use-package lsp-ui
    :after lsp-mode
    :after markdown-mode
    :config
    (add-hook 'lsp-after-open-hook 'lsp-ui-mode)
    ))

(defun lsp-cquery/init-company-lsp ()
  (use-package company-lsp
    :config
    (progn
      (setq company-lsp-async t
            company-transformers nil
            company-lsp-cache-candidates nil)
      (spacemacs|add-company-backends :backends company-lsp :modes c-mode-common)
      )))

(defun lsp-cquery/init-helm-xref ()
  "from github.com/MaskRay/Config"
  (use-package helm-xref
    :config
    (progn
      (setq xref-prompt-for-identifier
            '(not xref-find-definitions xref-find-definitions-other-window
                  xref-find-definitions-other-frame xref-find-references
                  spacemacs/jump-to-definition spacemacs/jump-to-reference))
      (setq xref-show-xrefs-function 'helm-xref-show-xrefs))
    ))

(defun lsp-cquery/init-cquery ()
  (use-package cquery
    :init
    (progn
      (spacemacs/add-to-hooks #'lsp-cquery-enable '(c-mode-hook c++-mode-hook))
      (dolist (mode '(c-mode c++-mode))
        (evil-leader/set-key-for-mode mode
          "r." 'lsp-ui-peek-find-definitions
          "r," 'lsp-ui-peek-find-references
          "r[" 'lsp-ui-peek-jump-backward
          "r]" 'lsp-ui-peek-jump-forward
          "rl" 'helm-imenu
          )))))

;;; packages.el ends here
