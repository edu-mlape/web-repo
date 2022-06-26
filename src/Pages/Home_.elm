module Pages.Home_ exposing (Model, Msg, page)

import Element exposing (Element, el, padding, text)
import Element.Background as BG
import Element.Font as Font
import Gen.Params.Home_ exposing (Params)
import Page
import Request
import Shared
import UI exposing (PageSplit(..), ui)
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    {}


init : Model
init =
    {}



-- UPDATE


type Msg
    = ReplaceMe


update : Msg -> Model -> Model
update msg model =
    case msg of
        ReplaceMe ->
            model



-- VIEW


view : Model -> View Msg
view model =
    { title = "PowerSystems Inc."
    , body = [ banner, news ] |> ui
    }


banner : Element Msg
banner =
    let
        pcColor =
            BG.color (Element.rgb255 255 255 0)
    in
    UI.content Col [ pcColor ] [ text "WIP" ]


news : Element Msg
news =
    let
        header =
            \t -> Element.paragraph [ Font.size 72, Font.bold ] [ text t ]
    in
    UI.content Col
        [ padding 10 ]
        [ header "Celebrating our website's release."
        , Element.paragraph [] [ text "Welcome, customers! Our brand new website comes with features that ensure our services are more accessible to you." ]
        ]
