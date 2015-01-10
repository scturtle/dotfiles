;;; scturtle.el --- Emacs config of scturtle
;; Copyright (C) 2015  Shen Chao
;; Author: Shen Chao <scturtle@gmail.com>
;; Keywords:
;;; Commentary:
;;; Code:

;; quick access to this config file
(global-set-key (kbd "C-c e")
   '(lambda () (interactive)
      (find-file (concat user-emacs-directory (getenv "USER") ".el"))))

;; bars
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;; global config
(global-auto-revert-mode t)
(setq size-indication-mode t)
(setq column-number-mode t)
(add-hook 'prog-mode-hook
  (lambda ()
    (setq show-trailing-whitespace t)))

;; mouse in terminal
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))

;; coding system
(prefer-coding-system 'chinese-gbk)
(prefer-coding-system 'utf-8)

;; font
(set-frame-font "Source Code Pro-18" nil t)

;; theme
(load-theme 'tango-plus t)

;; linum mode
(global-linum-mode 1)
;; (setq linum-format "%3d")
(set-face-background 'linum "#fcfcfc")
(set-face-background 'fringe "#fcfcfc")

;; highlight current line
(global-hl-line-mode t)
(set-face-background 'hl-line "#fcfcfc")

;; transparency
(set-frame-parameter (selected-frame) 'alpha '(99 99))
(add-to-list 'default-frame-alist '(alpha 99 99))

;; history
(require 'undo-tree)
(savehist-mode t) ;; minibuffer
(setq undo-tree-auto-save-history t ;; undo
      undo-tree-history-directory-alist
        `(("." . ,(concat user-emacs-directory "undo"))))

;; turn off visual bell
(setq ring-bell-function 'ignore)


;; --------- plugins -----------

;; enable helm-mode
(helm-mode 1)

;; color-theme-approximate
(color-theme-approximate-on)

;; exec-path-from-shell
(when (memq window-system '(mac ns))
      (exec-path-from-shell-initialize))

;; aspell
(require 'ispell)
(setq ispell-program-name "/usr/local/bin/aspell")

;; evil mode
(evil-mode t)
(global-evil-tabs-mode t) ;; evil-tabs package
(evilnc-default-hotkeys)

;; evil-easymotion
(require 'evil)
(require 'ace-jump-mode) ;; FIEME: 'require' required?
(evilem-default-keybindings "SPC")

;; evil-tabs: cmd-t to open new tab and cmd-w to close
(global-set-key (kbd "s-t") '(lambda () (interactive) (elscreen-create)))
(global-set-key (kbd "s-w") '(lambda () (interactive) (elscreen-kill)))

;; evil-tabs: elscreen quick jump, index from 1
(global-set-key (kbd "s-1") '(lambda () (interactive) (elscreen-goto 0)))
(global-set-key (kbd "s-2") '(lambda () (interactive) (elscreen-goto 1)))
(global-set-key (kbd "s-3") '(lambda () (interactive) (elscreen-goto 2)))
(global-set-key (kbd "s-4") '(lambda () (interactive) (elscreen-goto 3)))
(global-set-key (kbd "s-5") '(lambda () (interactive) (elscreen-goto 4)))
(global-set-key (kbd "s-6") '(lambda () (interactive) (elscreen-goto 5)))
(global-set-key (kbd "s-7") '(lambda () (interactive) (elscreen-goto 6)))
(global-set-key (kbd "s-8") '(lambda () (interactive) (elscreen-goto 7)))
(global-set-key (kbd "s-9") '(lambda () (interactive) (elscreen-goto 8)))

;; evil-tabs: tabbar color
(custom-set-faces
 '(elscreen-tab-background-face ((t (:background "#f0f0f0"))))
 '(elscreen-tab-other-screen-face ((t (:background "#f0f0f0"
                                       :foreground "black")))))

;; cursor color in evil mode
(require 'evil)
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("black" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))

;; smooth scrolling like vim
(setq smooth-scroll-margin 5)
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t)

;; rainbow-delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; company mode
(require 'company)
(add-hook 'prog-mode-hook 'company-mode)

;; flycheck
(require 'flycheck)
(add-hook 'prog-mode-hook 'flycheck-mode)

;; python
(require 'elpy)
;; FIXME: unkown issue of highlight-indentation
(setq elpy-modules (remove 'elpy-module-highlight-indentation elpy-modules))
(elpy-use-ipython)
(elpy-enable)
(add-to-list 'company-backends 'company-anaconda) ;; company-anaconda

;; ------- c++ start -------
;; clang-format
(global-set-key (kbd "C-c =") 'clang-format-region)

;; flycheck
(setq flycheck-clang-language-standard "c++11")

;; semantic
(add-hook 'c++-mode-hook 'semantic-mode)

;; compile
(add-hook 'c++-mode-hook
          (lambda () (set (make-local-variable 'compile-command)
                          (concat "g++ -std=c++11 -Wall "
                                  buffer-file-name " && ./a.out"))))

;; company mode
;; FIXME: semantic-mode and company-mode neither works perfectly
(defun check-expansion ()
  (interactive)
  (if (and (eq major-mode 'c++-mode)
       (or (looking-back "\\.\\w*")
           (looking-back "->\\w*")
           (looking-back "::\\w*")))
    (company-begin-backend 'company-clang)
    (company-complete)))

(global-set-key (kbd "C-x C-o") 'check-expansion)
;; (global-set-key (kbd "C-x C-o") 'company-complete)

(require 'company-clang)
(setq company-clang-arguments '("-std=c++11"))

;; company-c-headers
(add-to-list 'company-backends 'company-c-headers)
(require 'company-c-headers)
;; (add-to-list 'company-c-headers-path-system "/usr/include/c++/4.2.1")
(add-to-list 'company-c-headers-path-system
             (concat "/Applications/Xcode.app/Contents/Developer/Toolchains"
                     "/XcodeDefault.xctoolchain/usr/include/c++/v1"))


;;  ------- haskell start -------

(custom-set-variables
 '(haskell-tags-on-save t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type 'cabal-repl))

;; indentation
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-hi2)

;; hotkey
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))

(require 'haskell-cabal)
  (eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

;; ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; company mode for haskell
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

;; shm
;; (require 'shm)
;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)
;; (set-face-background 'shm-current-face "#eee8d5")
;; (set-face-background 'shm-quarantine-face "lemonchiffon")

;; flycheck
;; FIXME: ghc checker doesn't work with sandbox
(setq flycheck-checkers (delete 'haskell-ghc flycheck-checkers))
(require 'flycheck-ghcmod)


;; ------- latex start -------

(require 'tex)
(require 'reftex)
(setq TeX-auto-save t
      TeX-parse-self t
      reftex-plug-into-AUCTeX t
      TeX-PDF-mode t
      TeX-source-correlate-mode t
      TeX-source-correlate-method 'synctex)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;; skim (reverse search: cmd-shift-click)
(setq TeX-view-program-list
'(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

(eval-after-load 'tex
  '(progn
      (assq-delete-all 'output-pdf TeX-view-program-selection)
      (add-to-list 'TeX-view-program-selection '(output-pdf "PDF Viewer"))))


;; ------- other -------

;; coq
;; (setq auto-mode-alist (cons '("\\.v$" . coq-mode) auto-mode-alist))
;; (autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)

;; proof-general
;; (load-file "/usr/local/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")
;; (customize-set-variable 'proof-three-window-mode-policy 'hybrid)

;; Racer - code completion for Rust
;; (setenv "DYLD_LIBRARY_PATH" "/usr/local/lib/rustlib/x86_64-apple-darwin/lib")
;; (add-to-list 'load-path "~/code/racer/editors") (require 'racer)

(provide 'scturtle)
;;; scturtle.el ends here
