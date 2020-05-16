;; -*- lexical-binding: t; -*-

(require 'evil-multiedit)

;;;###autoload
(defun my/switch-to-messages-buffer ()
  "Stolen from spacemacs."
  (interactive)
  (with-current-buffer (messages-buffer)
    (goto-char (point-max))
    (switch-to-buffer (current-buffer))))

;;;###autoload
(defun my/symbol-highlight (beg end)
  "Highlight current symbol. Restrict by evil visual region."
  (interactive
   (if (evil-visual-state-p)
       (prog1 (list evil-visual-beginning evil-visual-end)
         (evil-exit-visual-state))
     (list (point-min) (point-max))))
  (when-let* ((word (current-word t))
              (regexp (format "\\_<%s\\_>" (regexp-quote word))))
    (iedit-start regexp beg end)
    (evil-multiedit-state)))

;;;###autoload
(defun mu4e-goodies~break-cjk-word (word)
  "Break CJK word into list of bi-grams like: 我爱你 -> 我爱 爱你"
  (if (or (<= (length word) 2)
          (equal (length word) (string-bytes word))) ; only ascii chars
      word
    (let ((pos nil)
          (char-list nil)
          (br-word nil))
      (if (setq pos (string-match ":" word))     ; like: "s:abc"
          (concat (substring word 0 (+ 1 pos))
                  (mu4e-goodies~break-cjk-word (substring word (+ 1 pos))))
        (if (memq 'ascii (find-charset-string word)) ; ascii mixed with others like: abcあいう
            word
          (progn
            (setq char-list (split-string word "" t))
            (while (cdr char-list)
              (setq br-word (concat br-word (concat (car char-list) (cadr char-list)) " "))
              (setq char-list (cdr char-list)))
            br-word))))))

;;;###autoload
(defun mu4e-goodies~break-cjk-query (expr)
  " from: https://github.com/panjie/mu4e-goodies/blob/master/mu4e-goodies-hacks.el "
  (let ((word-list (split-string expr " " t))
        (new ""))
    (dolist (word word-list new)
      (setq new (concat new (mu4e-goodies~break-cjk-word word) " ")))))
