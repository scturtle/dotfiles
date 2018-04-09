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
(defun my/switch-to-alternate-buffer ()
  "Stolen from spacemacs."
  (interactive)
  (let ((current-buffer (window-buffer)))
    (switch-to-buffer
     (cl-find-if (lambda (buffer) (not (eq buffer current-buffer)))
                 (mapcar #'car (window-prev-buffers))))))

;;;###autoload
(defun my/symbol-highlight (beg end)
  "Highlight current symbol. Restrict by evil visual region."
  (interactive
   (if (evil-visual-state-p)
       (prog1 (list evil-visual-beginning evil-visual-end)
         (evil-exit-visual-state))
     (list (point-min) (point-max))))
  (when-let ((symbol (or (thing-at-point 'symbol) (thing-at-point 'word))))
    (setq evil-multiedit--dont-recall t)
    (setq regexp (format "\\_<%s\\_>" (regexp-quote symbol))
          iedit-initial-string-local regexp)
    (iedit-start regexp beg end)
    (evil-multiedit-state)))
