;;; keybindings.el ---                               -*- lexical-binding: t; -*-

;; Copyright (C) 2016, 2017  Wieland Hoffmann

;; Author: Wieland Hoffmann <wieland@mineo>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(defconst mineo-rtags-overrides
  '(("C-]" 'rtags-find-symbol-at-point)
    ("M-." 'rtags-find-symbol-at-point)))

(defun mineo-rtags-set-evil-keys ()
  (dolist (override mineo-rtags-overrides)
    (evil-local-set-key 'normal (car override) (cdr override))))

(add-hook 'c-mode-common-hook 'mineo-rtags-set-evil-keys)

;;; https://github.com/mheathr/spacemacs/blob/develop/contrib/!lang/c-c%2B%2B/packages.el

(dolist (mode '(c-mode c++-mode))
  (evil-leader/set-key-for-mode mode
    "r ." 'rtags-find-symbol-at-point
    "r ," 'rtags-find-references-at-point
    "r v" 'rtags-find-virtuals-at-point
    "r V" 'rtags-print-enum-value-at-point
    "r /" 'rtags-find-all-references-at-point
    "r Y" 'rtags-cycle-overlays-on-screen
    "r >" 'rtags-find-symbol
    "r <" 'rtags-find-references
    "r [" 'rtags-location-stack-back
    "r ]" 'rtags-location-stack-forward
    "r D" 'rtags-diagnostics
    "r G" 'rtags-guess-function-at-point
    "r p" 'rtags-set-current-project
    "r P" 'rtags-print-dependencies
    "r e" 'rtags-reparse-file
    "r E" 'rtags-preprocess-file
    "r R" 'rtags-rename-symbol
    "r M" 'rtags-symbol-info
    "r S" 'rtags-display-summary
    "r O" 'rtags-goto-offset
    "r ;" 'rtags-find-file
    "r F" 'rtags-fixit
    "r L" 'rtags-copy-and-print-current-location
    "r X" 'rtags-fix-fixit-at-point
    "r B" 'rtags-show-rtags-buffer
    "r I" 'rtags-imenu
    "r T" 'rtags-taglist
    "r h" 'rtags-print-class-hierarchy
    "r a" 'rtags-print-source-arguments))

(provide 'keybindings)
;;; keybindings.el ends here
