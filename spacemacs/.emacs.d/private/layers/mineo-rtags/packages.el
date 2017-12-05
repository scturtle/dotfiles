;;; packages.el --- mineo-rtags layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Wieland Hoffmann <wieland@mineo>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `mineo-rtags-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mineo-rtags/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mineo-rtags/pre-init-PACKAGE' and/or
;;   `mineo-rtags/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mineo-rtags-packages
  '(cmake-ide
    helm-rtags
    rtags
    company-rtags
    flycheck-rtags))

(defun mineo-rtags/init-cmake-ide ()
  (use-package cmake-ide
    :config
    (cmake-ide-setup)))

(defun mineo-rtags/init-rtags ()
  (use-package rtags
    :config
    (setq rtags-autostart-diagnostics t
          rtags-completions-enabled t
          rtags-display-result-backend 'helm)
    (rtags-enable-standard-keybindings)
    (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)))

(defun mineo-rtags/init-helm-rtags ()
  (use-package helm-rtags))

(defun mineo-rtags/init-flycheck-rtags ()
  (use-package flycheck-rtags
    :config
    (add-hook 'c-mode-hook #'mineo-flycheck-rtags-setup)
    (add-hook 'c++-mode-hook #'mineo-flycheck-rtags-setup)
    (add-hook 'objc-mode-hook #'mineo-flycheck-rtags-setup)))

(defun mineo-rtags/init-company-rtags ()
  (use-package company-rtags
    :config
    (push '(company-rtags)
          company-backends-c-mode-common)))

;;; packages.el ends here
