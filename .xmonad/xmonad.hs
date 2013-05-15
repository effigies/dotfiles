import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Config.Gnome
import System.IO

main = do
    --xmproc <- spawnPipe "/usr/bin/xmobar /home/chris/.xmobarrc"
    xmonad $ defaultConfig
        { terminal = "urxvt +sb -tr -tint Grey25 -fg Grey75 \
                    \-fn \"xft:Inconsolata,xft:Terminus\""
        , borderWidth = 1
        , normalBorderColor   = "#111111"
        , focusedBorderColor  = "#333333"
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  smartBorders  $
                        layoutHook defaultConfig
        {-, logHook = dynamicLogWithPP xmobarPP
                    { ppOutput = hPutStrLn xmproc
                    , ppTitle = xmobarColor "white" "" . shorten 50
                    }-}
        , startupHook = setWMName "LG3D"
        } `additionalKeys`
        [ ((mod4Mask, xK_l), spawn "slock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((mod4Mask, xK_space), spawn "chromium-browser")
        ]
