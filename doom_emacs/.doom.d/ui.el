;;; -*- lexical-binding: t; -*-

(menu-bar-mode -1)

(setq doom-font (font-spec :family "JetBrains Mono" :weight 'medium :size 17))

(if (eq system-type 'darwin)
    (setq doom-unicode-font (font-spec :family "PingFang SC" :weight 'light :size 20))
  (setq doom-unicode-font (font-spec :family "WenQuanYi Micro Hei Mono" :size 20)))

;; (setq doom-theme 'doom-dracula)
(setq doom-theme 'doom-vibrant)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
