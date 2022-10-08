;;; -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "JetBrains Mono" :weight 'medium :size 17))

(setq doom-unicode-font
      (if (eq system-type 'darwin)
          (font-spec :family "PingFang SC" :weight 'light :size 20)
        (font-spec :family "WenQuanYi Micro Hei Mono" :size 20)))

;; (setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-vibrant)
;; (setq doom-theme 'doom-city-lights)
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-aura)

(add-hook 'window-setup-hook #'toggle-frame-maximized)

(after! doom-modeline
  (setq all-the-icons-scale-factor 0.8)
  (advice-add #'doom-modeline--font-height :override (lambda () (frame-char-height)))
  (doom-modeline-def-modeline 'main
    '(bar modals buffer-info buffer-position) '(misc-info lsp major-mode process checker)))
