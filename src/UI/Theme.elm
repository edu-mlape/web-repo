module UI.Theme exposing (..)

import Element as El
import Element.Background as BG
import Element.Border as Border
import Element.Font as Font


type Theme
    = Header
    | Content
    | Button
    | ItemShowcase


type Palette
    = BluePigment
    | Alabaster


themePreset : Theme -> List (El.Attribute msg)
themePreset tpreset =
    let
        paletteColor =
            \col ->
                case col of
                    BluePigment ->
                        El.rgb255 41 51 155

                    Alabaster ->
                        El.rgb255 232 237 223
    in
    case tpreset of
        Header ->
            [ BG.color <| paletteColor BluePigment
            , Font.color <| paletteColor Alabaster
            ]

        Content ->
            [ Font.color <| El.rgb255 0 0 0
            , BG.color <| paletteColor Alabaster
            ]

        Button ->
            [ Font.color <| paletteColor BluePigment
            , Border.width 1
            , Border.rounded 3
            , BG.color <| paletteColor Alabaster
            , Font.bold
            , Font.center
            , El.mouseOver
                [ BG.color <| paletteColor BluePigment
                , Font.color <| paletteColor Alabaster
                ]
            ]

        ItemShowcase ->
            [ Border.color <| paletteColor BluePigment
            , Border.width 5
            , Border.rounded 20
            ]
