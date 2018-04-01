;;; -*- lexical-binding: t; -*-

(setq doom-localleader-key ",")

(map!
 :gnvime "M-:" #'eval-expression

 ;; mimic emacs
 :i "C-b" #'backward-char
 :i "C-f" #'forward-char
 :i "A-b" #'backward-word
 :i "A-f" #'forward-word
 :i "C-p" #'previous-line
 :i "C-n" #'next-line
 :i "C-h" #'delete-backward-char
 :i "C-d" #'delete-char

 (:leader
   :n "SPC" #'execute-extended-command
   :n ":"   #'eval-expression
   :n [tab] #'my/switch-to-alternate-buffer
   :n "TAB" #'my/switch-to-alternate-buffer

   :n "c l" #'evil-commentary-line

   :n "b m" #'my/switch-to-messages-buffer
   :n "b d" #'kill-this-buffer
   :n "w d" #'evil-quit

   :n "f t" #'neotree-toggle

   :n "p t" #'+neotree/open
   :n "p f" #'projectile-find-file

   :n "g a" #'projectile-find-other-file
   :n "g p" #'git-gutter:previous-hunk
   :n "g n" #'git-gutter:next-hunk
   :n "g s" #'magit-status

   :n "e l" #'flycheck-list-errors
   :n "e p" #'previous-error
   :n "e n" #'next-error

   ;; TODO

   ))
