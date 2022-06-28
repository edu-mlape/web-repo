module Pages.Shop.Item_ exposing (Model, Msg, page)

import Array exposing (Array)
import Element as El exposing (fill)
import Element.Font as Font
import Element.Input as Input
import Gen.Params.Shop.Item_ exposing (Params)
import Page
import ProductApi exposing (ItemDetails, SelectedItem(..), items)
import Request
import Shared
import UI exposing (PageSplit(..), ui)
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.sandbox
        { init = init req.params
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    { item : ItemDetails
    , title : String
    }


init : Params -> Model
init params =
    let
        lookup =
            \index -> Array.get index (Array.fromList items)

        unpack =
            \m ->
                case m of
                    Just a ->
                        a

                    Nothing ->
                        ItemDetails "" "" "" 0 ""
    in
    case params.item of
        "small-business-package" ->
            { item = 0 |> lookup |> unpack
            , title = "Get the Office Package"
            }

        "server-package" ->
            { item = 1 |> lookup |> unpack
            , title = "Get the Server Package"
            }

        "dev-package" ->
            { item = 2 |> lookup |> unpack
            , title = "Get the Developer Package"
            }

        "creative-package" ->
            { item = 3 |> lookup |> unpack
            , title = "Get the Creative Package"
            }

        "web-package" ->
            { item = 4 |> lookup |> unpack
            , title = "Get the WebPackage"
            }

        _ ->
            { item = ItemDetails "" "" "" 0 ""
            , title = "Get the Small Business Package"
            }



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
    { title = model.title
    , body =
        ui
            [ UI.content Row
                [ El.padding 40 ]
                [ El.image [ El.width fill, El.height fill ] { src = model.item.image, description = "" }
                , UI.content Col
                    []
                    [ El.column [ El.spacing 20 ]
                        [ Input.button [ El.width fill ]
                            { onPress = Nothing
                            , label = El.text "Buy" |> El.el [ El.centerX, Font.bold, Font.size 40 ]
                            }
                        , model.item.name |> El.text |> El.el [ Font.bold, Font.size 30 ]
                        , model.item.description |> El.text
                        ]
                    ]
                ]
            ]
    }
