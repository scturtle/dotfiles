;; -*- lexical-binding: t; -*-

;;;###autoload
(defun switch-to-messages-buffer ()
  (interactive)
  (with-current-buffer (messages-buffer)
    (goto-char (point-max))
    (switch-to-buffer (current-buffer))))
