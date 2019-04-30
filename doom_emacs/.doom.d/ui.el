;;; -*- lexical-binding: t; -*-

(remove-hook 'doom-init-ui-hook #'blink-cursor-mode)
(blink-cursor-mode -1)

(setq doom-font (font-spec :family "Source Code Pro Medium" :size 17))
(setq doom-theme 'doom-dracula)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
