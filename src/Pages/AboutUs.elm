module Pages.AboutUs exposing (page)

import Element as E
import Element.Background as BG
import Element.Font as Font
import Gen.Params.AboutUs exposing (Params)
import Page exposing (Page)
import Request
import Shared
import UI exposing (PageSplit(..), ui)
import UI.Theme exposing (Theme(..), themePreset)
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page
page shared req =
    Page.static
        { view = view
        }


view : View msg
view =
    let
        h1 =
            \t -> E.paragraph [ Font.bold, Font.size 72 ] [ E.text t ]

        summary =
            """Launched in 2005, PowerSystems Inc. was created to help other businesses when it comes to
IT solutions, helping them overcome technological hurdles and adapt to the ever-changing, ever-advancing world.
        """

        contactDetail =
            \str ->
                [ str
                    |> E.text
                ]
                    |> E.paragraph []
    in
    { title = "About Us"
    , body =
        ui
            [ UI.content Col
                [ E.padding 10
                , BG.image "/assets/about-anim2.gif"
                , Font.color <| E.rgb255 232 237 223
                ]
                [ h1 "About Us"
                , E.paragraph [] [ E.text summary ]
                ]
            , E.column
                (E.paddingXY 50 25 :: E.width E.fill :: Font.alignRight :: themePreset Header)
                [ h1 "Contact Us"
                , contactDetail "PO Box: 727 Elm Street, Dundas Valley, NSW"
                , contactDetail "Mo. Number: 1500 1337 365"
                ]
            ]
    }
