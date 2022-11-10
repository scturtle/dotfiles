;;; doom-aura-theme.el --- inspired by the aura theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: scturtle <https://github.com/scturtle>
;; Maintainer: hlissner <https://github.com/hlissner>
;; Source: https://github.com/daltonmenezes/aura-theme
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)

;;
;;; Variables

(defgroup doom-aura-theme nil
  "Options for the `doom-aura' theme."
  :group 'doom-themes)

;;
;;; Theme definition

(def-doom-theme doom-aura
  "A dark theme based on aura theme"

  ((bg         '("#21202e"))
   (bg-alt     '("#1c1b27")) ;; hl-line
   (base0      '("#1c1b27"))
   (base1      '("#21202e"))
   (base2      '("#373844"))
   (base3      '("#44475a"))
   (base4      '("#565761"))
   (base5      '("#6272a4")) ;; line-number, comments
   (base6      '("#b6b6b2"))
   (base7      '("#ccccc7"))
   (base8      '("#edecee"))
   (fg         '("#edecee"))
   (fg-alt     '("#e1e0e2"))

   (grey       base4)
   (red        '("#ff6767"))
   (orange     '("#ffca85"))
   (green      '("#61ffca"))
   (teal       '("#61ffca"))
   (yellow     '("#ffca85"))
   (blue       '("#a277ff"))
   (dark-blue  '("#a277ff"))
   (magenta    '("#a277ff"))
   (violet     '("#f694ff"))
   (cyan       '("#61ffca"))
   (dark-cyan  '("#61ffca"))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   bg-alt)
   (selection      blue)
   (builtin        orange)
   (comments       base5)
   (doc-comments   (doom-lighten base5 0.25))
   (constants      "#82e2ff")
   (functions      orange)
   (keywords       blue)
   (methods        orange)
   (operators      blue) ;; include,define
   (type           blue)
   (strings        green)
   (variables      violet)
   (numbers        green)
   (region         base2)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   (modeline-fg 'unspecified)
   (modeline-fg-alt base5)

   (modeline-bg-inactive `(,(doom-darken (car bg) 0.075) ,@(cdr base1)))
   (modeline-bg-inactive-l (doom-darken bg 0.1)))

  ;;;; Base theme face overrides
  (
   ;;;; tree-sitter
   (tree-sitter-hl-face:property :inhert nil)
   (tree-sitter-hl-face:function.call :foreground blue)
   (tree-sitter-hl-face:operator :foreground fg) ;; or "#82e2ff"
   (tree-sitter-hl-face:number :foreground green)
   ;;;; company
   (company-tooltip-common :foreground yellow :bold)
   (company-tooltip-selection :background (doom-darken blue 0.3))
   ;;;; org <built-in>
   ((org-block &override) :background (doom-darken base1 0.125) :foreground base7)
   ((org-block-begin-line &override) :background (doom-darken base1 0.125) :foreground comments)
   ((org-code &override) :foreground yellow)
   (org-todo :foreground orange :bold 'inherit)
   ((org-link &override) :foreground orange)
   ;;; markdown
   ((markdown-code-face &override) :background (doom-darken base1 0.125))
   )

  ;;;; Base theme variable overrides-
  ()
  )

;;; doom-aura-theme.el ends here
