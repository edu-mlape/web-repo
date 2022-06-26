module UI exposing (content, ui)

import Element exposing (..)
import Element.Border as Borders
import Element.Font as Font
import Gen.Route as Route exposing (Route)


type PageSplit
    = Row
    | Col


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
                    |> el [ Borders.width 3, width fill ]

        nav =
            row [ width fill, Borders.width 1, paddingXY 50 10, spaceEvenly ]
                [ a (centered "About Us") Route.AboutUs
                , a (centered "Products") Route.Products
                , a (centered "Consulting") Route.ConsultForm
                ]

        logo =
            text "PowerSystems Inc."

        header =
            link [ width fill, Font.center ]
                { url = Route.toHref Route.Home_
                , label = logo
                }
    in
    column [ width fill, height fill ] (header :: nav :: children)


content : PageSplit -> List (Attribute msg) -> List (Element msg) -> Element msg
content split attr elements =
    case split of
        Row ->
            row ([ width fill, height fill ] ++ attr) elements

        Col ->
            column ([ width fill, height fill ] ++ attr) elements
