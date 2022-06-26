module UI.Theme exposing (..)

import Element as El
import Element.Background as BG
import Element.Font as Font


type Theme
    = Header
    | Content


themePreset : Theme -> List (El.Attribute msg)
themePreset tpreset =
    case tpreset of
        Header ->
            [ BG.color <| El.rgb255 0 0 128
            , Font.color <| El.rgb255 255 255 255
            ]

        Content ->
            []
