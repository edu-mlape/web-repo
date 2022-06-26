module Pages.AboutUs exposing (page)

import Element as E
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
    in
    { title = "Products"
    , body =
        ui
            [ UI.content Col
                [ E.padding 10 ]
                [ h1 "About Us"
                , E.paragraph [] [ E.text "Insert summary of company here." ]
                ]
            , UI.content Col
                (E.paddingXY 50 10 :: Font.alignRight :: themePreset Header)
                [ h1 "Contact Us"
                , E.paragraph [] [ E.text "Contact info of company should go here." ]
                ]
            ]
    }
