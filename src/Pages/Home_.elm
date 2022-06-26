module Pages.Home_ exposing (Model, Msg, page)

import Element exposing (text)
import Gen.Params.Home_ exposing (Params)
import Page
import Request
import Shared
import UI exposing (ui)
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
    , body = [ text "WIP" ] |> ui
    }
