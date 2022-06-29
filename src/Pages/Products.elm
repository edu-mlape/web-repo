module Pages.Products exposing (Model, Msg, page)

import Element as El exposing (Element)
import Gen.Params.Products exposing (Params)
import Gen.Route as Route
import Page
import ProductApi exposing (ItemDetails, SelectedItem(..), itemIcon, items)
import Request
import Shared
import UI exposing (PageSplit(..), ui)
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    { currentItemSelected : Maybe SelectedItem }


init : ( Model, Cmd Msg )
init =
    ( Model Nothing, Cmd.none )



-- UPDATE


type Msg
    = ReplaceMe


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- PAGE ELEMENTS


catalogue : Element Msg
catalogue =
    List.map itemIcon items
        |> El.row
            [ El.centerY
            , El.spaceEvenly
            , El.width El.fill
            , El.padding 30
            ]



-- VIEW


view : Model -> View Msg
view model =
    { title = "Products"
    , body = ui [ catalogue ]
    }
