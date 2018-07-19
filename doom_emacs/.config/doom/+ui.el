;;; -*- lexical-binding: t; -*-

(remove-hook 'doom-init-ui-hook #'blink-cursor-mode)
(blink-cursor-mode -1)

(setq doom-font (font-spec :family "Source Code Pro" :size 18 :weight 'semi-bold))
(setq doom-theme 'doom-dracula)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
