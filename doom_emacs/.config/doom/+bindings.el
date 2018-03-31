;;; -*- lexical-binding: t; -*-

(setq doom-localleader-key ",")

(map!
 :gnvime "M-:" #'eval-expression

 (:leader
   :n "SPC" #'execute-extended-command
   :n ":"   #'eval-expression

   :n "c l" #'evil-commentary-line
   :v "s"   #'evil-surround-region

   :n "b m" #'switch-to-messages-buffer
   :n "b d" #'kill-this-buffer

   :n "f t" #'neotree-toggle

   :n "p t" #'+neotree/open
   :n "p f" #'projectile-find-file
   :n "p s" #'+ivy/project-search

   :n "g a" #'projectile-find-other-file
   :n "g p" #'git-gutter:previous-hunk
   :n "g n" #'git-gutter:next-hunk
   :n "g s" #'magit-status

   :n "e l" #'flycheck-list-errors
   :n "e p" #'previous-error
   :n "e n" #'next-error

   ;; TODO

   ))
