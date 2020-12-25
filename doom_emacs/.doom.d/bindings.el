;;; -*- lexical-binding: t; -*-

(map! ;; mimic emacs
 :ie "C-b" #'backward-char
 :ie "C-f" #'forward-char
 :i  "A-b" #'backward-word
 :i  "A-f" #'forward-word
 :i  "C-p" #'previous-line
 :i  "C-n" #'next-line
 :i  "C-h" #'delete-backward-char
 :i  "C-d" #'delete-char

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
   )
 )

(map!
 :gnvime "M-:" #'eval-expression
 :m "," nil ;; unbind localleader
 :ni "M-;" #'evilnc-comment-or-uncomment-lines

 (:leader
   :n "SPC" #'execute-extended-command
   :n ":"   #'eval-expression
   :n [tab] #'evil-switch-to-windows-last-buffer  ;; spc `
   :n "TAB" #'evil-switch-to-windows-last-buffer  ;; spc b l

   :n "b m" #'my/switch-to-messages-buffer
   :n "b d" #'kill-this-buffer
   :n "w d" #'evil-quit  ;; spc w q

   :n "f t" #'+treemacs/toggle  ;; spc o p
   ;; :n "p f" #'projectile-find-file

   :n "g a" #'projectile-find-other-file  ;; spc p o
   :n "g p" #'git-gutter:previous-hunk  ;; spc g [
   :n "g n" #'git-gutter:next-hunk  ;; spc g ]

   :n "e l" #'flycheck-list-errors  ;; spc c x
   :n "e p" #'flycheck-previous-error  ;; [ e
   :n "e n" #'flycheck-next-error  ;; ] e

   :n "/" nil
   :n "/ h" #'my/symbol-highlight
   :n "/ b" #'swiper-thing-at-point  ;; spc s S
   :n "/ p" #'+default/search-project  ;; spc s p
   :n "/ P" #'+default/search-project-for-symbol-at-point  ;; spc *

   :n "t t" #'tab-bar-switch-to-tab
   )

 (:after lsp-ui
   :map lsp-ui-peek-mode-map
   "j"   #'lsp-ui-peek--select-next
   "k"   #'lsp-ui-peek--select-prev
   [tab] #'lsp-ui-peek--toggle-file
   )

 (:after lsp-ui
   :map lsp-ui-imenu-mode-map
   :n "l" #'lsp-ui-imenu--view
   :n "o" #'lsp-ui-imenu--view
   :n "RET" #'lsp-ui-imenu--visit
   )

 (:after evil-org
   :map evil-org-mode-map
   :i "C-h" #'delete-backward-char
   :i "C-d" #'delete-char
   )

 (:after company
  :map company-active-map
  "C-h" nil  ;; del instead of doc
  )

 (:after magit
  :map magit-status-mode-map
   :n "gT" #'tab-bar-switch-to-prev-tab
   :n "gt" #'tab-bar-switch-to-next-tab
  )

 (:after deft
  :map deft-mode-map
   :ni "C-p" #'evil-previous-line
   :ni "C-n" #'evil-next-line ;; #'deft-new-file
   :i "C-m" nil ;; #'deft-new-file-named
   :n "a"   nil ;; #'deft-new-file
   :n "A"   nil ;; #'deft-new-file-named
   )
 )
