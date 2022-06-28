module Pages.Shop.Item_ exposing (Model, Msg, page)

import Gen.Params.Shop.Item_ exposing (Params)
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


view : Params -> Model -> View Msg
view model =
    { title = "", body = ui [] }
