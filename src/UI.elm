module UI exposing (PageSplit(..), content, ui)

import Element exposing (..)
import Element.Border as Borders
import Element.Font as Font
import Gen.Route as Route exposing (Route)


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
                    |> el [ Borders.width 3, width fill ]

        nav =
            row [ width fill, Borders.width 1, paddingXY 50 10, spaceEvenly ]
                [ a (centered "About Us") Route.AboutUs
                , a (centered "Products") Route.Products
                , a (centered "Consulting") Route.ConsultForm
                ]

        logo =
            text "PowerSystems Inc."

        {- Placeholder, will change soon. -}
        header =
            link [ width fill, Font.center, padding 20 ]
                { url = Route.toHref Route.Home_
                , label = logo
                }
    in
    column [ width fill, height fill ] (header :: nav :: children)


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
