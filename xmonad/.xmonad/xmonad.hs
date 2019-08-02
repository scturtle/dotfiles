import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "xmobar"

  xmonad $ def
    { manageHook = manageDocks <+> manageHook def
    , layoutHook = avoidStruts  $  layoutHook def
    , handleEventHook = handleEventHook def <+> docksEventHook
    , logHook = dynamicLogWithPP xmobarPP
                  { ppOutput = hPutStrLn xmproc
                  , ppTitle = xmobarColor "#dfdfdf" "" . shorten 80
                  , ppCurrent = xmobarColor "#0091e6" "" . \s -> "●"
                  , ppHidden  = xmobarColor "#aaaaaa" "" . \s -> "●"
                  , ppHiddenNoWindows = xmobarColor "#aaaaaa" "" . \s -> "○"
                  , ppWsSep = " "
                  , ppSep = " - "
                  }
    , modMask = mod4Mask
    , workspaces = map show [1..6]
    , focusedBorderColor = "#0077bb"
    , normalBorderColor = "#49483e"
    , borderWidth = 2
    , terminal = "st"
    }
    `additionalKeys`
    [
      ((mod4Mask, xK_p), spawn "rofi -show run"),
      ((mod4Mask, xK_s), spawn "gnome-screenshot -a -i"),
      ((mod4Mask .|. shiftMask, xK_l), spawn "slock")
    ]
