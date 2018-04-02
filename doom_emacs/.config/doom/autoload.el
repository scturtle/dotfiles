;; -*- lexical-binding: t; -*-

(require 'evil-multiedit)

;;;###autoload
(defun my/switch-to-messages-buffer ()
  "Stolen from syacemacs."
  (interactive)
  (with-current-buffer (messages-buffer)
    (goto-char (point-max))
    (switch-to-buffer (current-buffer))))

;;;###autoload
(defun my/sync-lsp-ui-face ()
    (set-face-attribute 'lsp-ui-peek-highlight nil
                        :foreground (face-attribute 'highlight :foreground nil t)
                        :background (face-attribute 'highlight :background nil t))
    (set-face-attribute 'lsp-ui-peek-filename nil
                        :foreground (face-attribute 'font-lock-builtin-face :foreground nil t))
    )

;;;###autoload
(defun my/switch-to-alternate-buffer ()
  "Stolen from syacemacs."
  (interactive)
  (let ((current-buffer (window-buffer)))
    (switch-to-buffer
     (cl-find-if (lambda (buffer) (not (eq buffer current-buffer)))
                 (mapcar #'car (window-prev-buffers))))))

;;;###autoload
(defun my/symbol-highlight ()
  "Highlight current symbol. Restrict by evil visual region."
  (interactive)
  (setq evil-multiedit--dont-recall t)
  (let ((beg (point-min)) (end (point-max)))
    (when (evil-visual-state-p)
      (setq beg evil-visual-beginning
            end evil-visual-end)
      (evil-exit-visual-state))
    (setq symbol (or (thing-at-point 'symbol) (thing-at-point 'word)))
    (when symbol
      (setq regexp (format "\\_<%s\\_>" (regexp-quote symbol))
            iedit-initial-string-local regexp)
      (iedit-start regexp beg end)
      (evil-multiedit-state))))
