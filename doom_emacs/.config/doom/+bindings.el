;;; -*- lexical-binding: t; -*-

(setq doom-localleader-key ",")

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

 (:leader
   :n "SPC" #'execute-extended-command
   :n ":"   #'eval-expression
   :n [tab] #'my/switch-to-alternate-buffer
   :n "TAB" #'my/switch-to-alternate-buffer

   :n "c l" #'evil-commentary-line

   :n "b m" #'my/switch-to-messages-buffer
   :n "b d" #'kill-this-buffer
   :n "w d" #'evil-quit

   :n "f t" #'+neotree/find-this-file

   :n "p t" #'+neotree/open
   :n "p f" #'projectile-find-file

   :n "g a" #'projectile-find-other-file
   :n "g p" #'git-gutter:previous-hunk
   :n "g n" #'git-gutter:next-hunk
   :n "g s" #'magit-status

   :n "e l" #'flycheck-list-errors
   :n "e p" #'previous-error
   :n "e n" #'next-error

   :n "/ h" #'my/symbol-highlight
   )

 (:localleader
   :n "r ." #'lsp-ui-peek-find-definitions
   :n "r ," #'lsp-ui-peek-find-references
   :n "r [" #'lsp-ui-peek-jump-backward
   :n "r ]" #'lsp-ui-peek-jump-forward
   )

 (:after lsp-ui
   :map lsp-ui-peek-mode-map
   "j"   #'lsp-ui-peek--select-next
   "k"   #'lsp-ui-peek--select-prev
   [tab] #'lsp-ui-peek--toggle-file
   )
 )
