import XMonad
import XMonad.Hooks.ManageHelpers (isFullscreen,doFullFloat)
import XMonad.Layout.Fullscreen (fullscreenManageHook, fullscreenEventHook, fullscreenFull)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Config.Gnome (gnomeConfig)

main = xmonad $ gnomeConfig
        { terminal = "urxvt"
        , normalBorderColor   = "#111111"
        , focusedBorderColor  = "#333333"
        , manageHook = composeAll
            [ manageHook gnomeConfig
            , fullscreenManageHook
            ]
        , handleEventHook = fullscreenEventHook
        , layoutHook = smartBorders . fullscreenFull $ layoutHook gnomeConfig
        } `additionalKeys`
        [ ((mod1Mask .|. shiftMask, xK_q), spawn "gnome-session-quit")
        , ((mod4Mask, xK_space), spawn "firefox")
        ]
--        , ((mod4Mask, xK_l), spawn "slock")
--        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
--        , ((0, xK_Print), spawn "scrot")
--        , ((mod4Mask, xK_space), spawn "chromium-browser")
