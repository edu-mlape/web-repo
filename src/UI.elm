module UI exposing (PageSplit(..), content, ui)

import Element exposing (..)
import Element.Border as Borders
import Element.Font as Font
import Gen.Route as Route exposing (Route)
import UI.Theme exposing (Theme(..), themePreset)


{-| Main UI structure of the website.

Declares the header and where to put the content.

-}
ui : List (Element msg) -> Element msg
ui children =
    let
        a : Element msg -> Route -> Element msg
        a label route =
            link []
                { url = Route.toHref route
                , label = label
                }

        centered =
            \t ->
                t
                    |> text
                    |> el [ width fill ]

        nav =
            row
                (themePreset Header
                    ++ [ width fill, paddingXY 50 10, spaceEvenly ]
                )
                [ a (centered "Products") Route.Products
                , a (centered "About Us") Route.AboutUs
                , a (centered "Consulting") Route.ConsultForm
                ]

        logo =
            image [] { src = "/assets/logo.png", description = "" }

        {- Placeholder, will change soon. -}
        header =
            link (themePreset Header ++ [ width fill, Font.center ])
                { url = Route.toHref Route.Home_
                , label = logo
                }
    in
    column
        [ width fill
        , height fill
        , Font.family [ Font.monospace ]
        ]
        (header :: nav :: children)


{-| Has identical functionality of row and column from elm-ui,
except it as much space as possible.
-}
type PageSplit
    = Row
    | Col


content : PageSplit -> List (Attribute msg) -> List (Element msg) -> Element msg
content split attr elements =
    case split of
        Row ->
            row ([ width fill, height fill ] ++ attr) elements

        Col ->
            column ([ width fill, height fill ] ++ attr) elements
