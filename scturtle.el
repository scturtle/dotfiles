;; for Emacs Starter Kit
;; quick access to this config file
(global-set-key (kbd "C-c e")
                '(lambda ()
                   (interactive)
                   (find-file (concat "~/.emacs.d/" (getenv "USER") ".el"))))

;; (setq linum-mode t)
(setq column-number-mode t)
;; (setq show-trailing-whitespace t)

;; coding system
(prefer-coding-system 'chinese-gbk)
(prefer-coding-system 'utf-8)

;; font (osx)
(set-face-attribute 'default nil :family "Source Code Pro" :height 165 :weight 'normal)

;; theme
(load-theme 'tango-plus t)

;; persistent undo history
(custom-set-variables '(undo-tree-auto-save-history t))

;; turn off visual bell
(setq ring-bell-function 'ignore)

;; --------- plugins -----------

;; exec-path-from-shell
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
      (exec-path-from-shell-initialize))

; helm mode
;; (require 'helm-config)

;; fix flyspell (osx)
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; aspell
(setq ispell-program-name "/usr/local/bin/aspell")

;; evil mode
(evil-mode t)
(global-evil-tabs-mode t) ;; evil-tabs package
(evilnc-default-hotkeys)

;; cursor color in evil mode
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("black" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))

;; smooth scrolling like vim
(require 'smooth-scrolling)
(setq smooth-scroll-margin 5)
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t)

;; company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-x C-o") 'company-complete)

;; rainbow
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; python
(package-initialize)
(elpy-enable)
(elpy-use-ipython)

;; coq
;; (setq auto-mode-alist (cons '("\\.v$" . coq-mode) auto-mode-alist))
;; (autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)

;; proof-general
(load-file "/usr/local/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")
(customize-set-variable 'proof-three-window-mode-policy 'hybrid)

;;  -- haskell start --

;; env variable (osx)
(setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/.cabal/bin")
(setenv "PATH" (concat "/Applications/ghc-7.8.3.app/Contents/bin:" 
                       (getenv "PATH")))
(add-to-list 'exec-path "/Applications/ghc-7.8.3.app/Contents/bin")

(custom-set-variables
 '(haskell-tags-on-save t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type 'cabal-repl))

;; indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; hi2
;; (require 'hi2)
;; (add-hook 'haskell-mode-hook 'turn-on-hi2)

;; hotkey
(eval-after-load 'haskell-mode '(progn
 (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
 (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
 (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
 (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
 (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
 (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
 (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))

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
(add-hook 'haskell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

;; shm
;; (require 'shm)
;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)
;; (set-face-background 'shm-current-face "#eee8d5")
;; (set-face-background 'shm-quarantine-face "lemonchiffon")

;;  -- haskell end --

;; -- latex start --
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)

;; skim (reverse search: cmd-shift-click)
(setq TeX-view-program-list
'(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

(eval-after-load 'tex
  '(progn
      (assq-delete-all 'output-pdf TeX-view-program-selection)
      (add-to-list 'TeX-view-program-selection '(output-pdf "PDF Viewer"))))

;; -- latex end --
