;;; -*- lexical-binding: t; -*-

;; use ',' as localleader
(map! :m "," nil)  ;; repeat
(setq doom-localleader-key ",")  ;; spc m

;; mimic emacs in vim
(map!
 :ie "C-b" #'backward-char
 :ie "C-f" #'forward-char
 :i  "A-b" #'backward-word
 :i  "A-f" #'forward-word
 :i  "C-p" #'previous-line
 :i  "C-n" #'next-line
 :i  "C-h" #'delete-backward-char
 :i  "C-d" #'delete-char
 :i  "C-k" #'kill-line
 (:after evil :after ivy
  :map (evil-ex-completion-map
        ivy-minibuffer-map
        minibuffer-local-map
        minibuffer-local-ns-map
        minibuffer-local-completion-map
        minibuffer-local-must-match-map
        minibuffer-local-isearch-map
        read-expression-map)
  "C-b" #'backward-char
  "C-f" #'forward-char
  "C-h" #'delete-backward-char
  "C-d" #'delete-char
  "C-k" #'kill-line
  )

 :ni "M-;" #'evilnc-comment-or-uncomment-lines

 :ni "C-t" #'better-jumper-jump-backward
 :n "g b" #'better-jumper-jump-backward
 :n "g h" #'better-jumper-jump-forward

 (:leader
  :n "SPC" #'execute-extended-command
  :n ":"   #'eval-expression  ;; spc ;
  :n [tab] #'evil-switch-to-windows-last-buffer  ;; spc `
  :n "TAB" #'evil-switch-to-windows-last-buffer  ;; spc b l

  :n "b m" (lambda() (interactive) (switch-to-buffer "*Messages*"))

  :n "g a" #'projectile-find-other-file  ;; spc p o
  :n "g p" #'+vc-gutter/previous-hunk  ;; spc g [
  :n "g n" #'+vc-gutter/next-hunk  ;; spc g ]
  :n "c p" #'smerge-prev
  :n "c n" #'smerge-next

  :n "e l" #'flycheck-list-errors  ;; spc c x
  :n "e p" #'flycheck-previous-error  ;; [ e
  :n "e n" #'flycheck-next-error  ;; ] e

  :n "s h" #'my/symbol-highlight
  :n "/" nil  ;; #'search-project
  :n "/ p" #'+vertico/project-search
  :n "/ f" #'+vertico/consult-fd
  :n "/ h" #'+vertico/search-symbol-at-point  ;; s S

  :n "t n" #'tab-bar-new-tab
  :n "1" (lambda() (interactive) (tab-bar-select-tab 1))
  :n "2" (lambda() (interactive) (tab-bar-select-tab 2))
  :n "3" (lambda() (interactive) (tab-bar-select-tab 3))
  :n "4" (lambda() (interactive) (tab-bar-select-tab 4))
  :n "5" (lambda() (interactive) (tab-bar-select-tab 5))
  )

 (:after lsp-ui
  :map lsp-ui-peek-mode-map
  "j"   #'lsp-ui-peek--select-next
  "k"   #'lsp-ui-peek--select-prev
  [tab] #'lsp-ui-peek--toggle-file
  :map lsp-ui-imenu-mode-map
  :n "l" #'lsp-ui-imenu--view
  :n "o" #'lsp-ui-imenu--view
  :n "RET" #'lsp-ui-imenu--visit
  )

 (:after evil-org
  :map evil-org-mode-map
  :i "C-h" #'delete-backward-char
  :i "C-d" #'delete-char
  :i "C-k" #'kill-line
  )

 (:after company
  :map company-active-map
  "C-h" nil  ;; del instead of doc
  )

 (:after magit
  :map magit-status-mode-map
  :n "gT" #'tab-bar-switch-to-prev-tab
  :n "gt" #'tab-bar-switch-to-next-tab
  :map magit-diff-mode-map
  :n "$" #'evil-end-of-line
  :n "w" #'evil-forward-word-begin
  :n "b" #'evil-backward-word-begin
  )

 (:after deft
  :map deft-mode-map
  :ni "C-p" #'evil-previous-line
  :ni "C-n" #'evil-next-line  ;; #'deft-new-file
  :i "C-m" nil  ;; #'deft-new-file-named
  :n "a"   nil  ;; #'deft-new-file
  :n "A"   nil  ;; #'deft-new-file-named
  )

 (:after neotree
  :map neotree-mode-map
  :n "w" #'neotree-stretch-toggle
  )
 )
