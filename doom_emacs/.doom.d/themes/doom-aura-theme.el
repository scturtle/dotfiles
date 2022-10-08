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

  ;; name        default   256       16
  ((bg         '("#21202e" "#262626" "black"        ))
   (bg-alt     '("#1E2029" "#1c1c1c" "black"        ))
   (base0      '("#1E2029" "#1c1c1c" "black"        ))
   (base1      '("#282a36" "#1e1e1e" "brightblack"  ))
   (base2      '("#373844" "#2e2e2e" "brightblack"  ))
   (base3      '("#44475a" "#262626" "brightblack"  ))
   (base4      '("#565761" "#3f3f3f" "brightblack"  ))
   (base5      '("#6272a4" "#525252" "brightblack"  ))
   (base6      '("#b6b6b2" "#bbbbbb" "brightblack"  ))
   (base7      '("#ccccc7" "#cccccc" "brightblack"  ))
   (base8      '("#edecee" "#dfdfdf" "white"        ))
   (fg         '("#edecee" "#ffffff" "white"        ))
   (fg-alt     '("#e2e2dc" "#bfbfbf" "brightwhite"  ))

   (grey       base4)
   (red        '("#ff6767" "#ff6666" "red"          ))
   (orange     '("#ffca85" "#ffbb66" "brightred"    ))
   (green      '("#61ffca" "#55ff77" "green"        ))
   (teal       '("#a277ff" "#0088cc" "brightgreen"  ))
   (yellow     '("#ffca85" "#ffff88" "yellow"       ))
   (blue       '("#a277ff" "#66bbff" "brightblue"   ))
   (dark-blue  '("#a277ff" "#0088cc" "blue"         ))
   (magenta    '("#a277ff" "#ff77cc" "magenta"      ))
   (violet     '("#a277ff" "#bb99ff" "brightmagenta"))
   (cyan       '("#61ffca" "#88eeff" "brightcyan"   ))
   (dark-cyan  '("#61ffca" "#88eeff" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      violet)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        orange)
   (comments       base5)
   (doc-comments   (doom-lighten base5 0.25))
   (constants      cyan)
   (functions      green)
   (keywords       magenta)
   (methods        teal)
   (operators      violet)
   (type           violet)
   (strings        yellow)
   (variables      (doom-lighten magenta 0.6))
   (numbers        violet)
   (region         `(,(car base3) ,@(cdr base1)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   (region-alt `(,(car base3) ,@(cdr base4)))

   (modeline-fg 'unspecified)
   (modeline-fg-alt base5)

   (modeline-bg-inactive `(,(doom-darken (car bg) 0.075) ,@(cdr base1)))
   (modeline-bg-inactive-l (doom-darken bg 0.1)))

  ;;;; Base theme face overrides
  (
   ;;;; company
   (company-tooltip-common :foreground yellow :bold)
   (company-tooltip-selection :background (doom-darken blue 0.3))
   ;;;; org <built-in>
   ((org-block &override) :background (doom-darken base1 0.125) :foreground base7)
   ((org-block-begin-line &override) :background (doom-darken base1 0.125) :foreground comments)
   ((org-code &override) :foreground yellow)
   (org-todo :foreground orange :bold 'inherit)
   ((org-link &override) :foreground orange)
   )

  ;;;; Base theme variable overrides-
  ()
  )

;;; doom-aura-theme.el ends here
