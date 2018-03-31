;; -*- lexical-binding: t; -*-

;;;###autoload
(defun switch-to-messages-buffer ()
  (interactive)
  (with-current-buffer (messages-buffer)
    (goto-char (point-max))
    (switch-to-buffer (current-buffer))))

;;;###autoload
(defun sync-lsp-ui-face ()
    (set-face-attribute 'lsp-ui-peek-highlight nil
                        :foreground (face-attribute 'highlight :foreground nil t)
                        :background (face-attribute 'highlight :background nil t))
    (set-face-attribute 'lsp-ui-peek-filename nil
                        :foreground (face-attribute 'font-lock-builtin-face :foreground nil t))
    )
