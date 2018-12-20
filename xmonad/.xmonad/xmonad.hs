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
                  , ppTitle = xmobarColor "#bfbfbf" "" . shorten 80
                  , ppCurrent = xmobarColor "#f1fa8c" "" . wrap "[" "]"
                  , ppWsSep = "  "
                  , ppSep = "  -  "
                  }
    , modMask = mod4Mask
    , workspaces = ["term", "web", "fm"] ++ map show [4..9]
    , focusedBorderColor = "#0077bb"
    , normalBorderColor = "#49483e"
    , borderWidth = 2
    , terminal = "st"
    }
    `additionalKeys`
    [
      ((mod4Mask, xK_p), spawn "dmenu_run -fn -*-fixed-*-*-*-*-18-*-*-*-*-*-*-*")
    ]
