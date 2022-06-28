module Pages.Home_ exposing (Model, Msg, page)

import Element exposing (Element, el, fill, padding, text)
import Element.Background as BG
import Element.Font as Font
import Element.Input as Input
import Gen.Params.Home_ exposing (Params)
import Page
import Random
import Request
import Shared
import Time
import UI exposing (PageSplit(..), ui)
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subs
        }



-- INIT


type alias Model =
    { businessCounter : Int
    , currentBanner : Banner
    }


init : ( Model, Cmd Msg )
init =
    let
        initialCount =
            Random.generate StartedCount (Random.int 100 150)
    in
    ( Model 100 EmpowerBusiness, initialCount )



-- UPDATE


type Banner
    = EmpowerBusiness
    | CustomerCount


type Msg
    = ChangedBanner
    | StartedCount Int
    | IncrementCounter Time.Posix


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StartedCount c ->
            ( { model | businessCounter = c }, Cmd.none )

        IncrementCounter tick ->
            ( { model | businessCounter = model.businessCounter + 1 }
            , Cmd.none
            )

        ChangedBanner ->
            case model.currentBanner of
                EmpowerBusiness ->
                    ( { model | currentBanner = CustomerCount }, Cmd.none )

                CustomerCount ->
                    ( { model | currentBanner = EmpowerBusiness }, Cmd.none )



-- VIEW


view : Model -> View Msg
view model =
    { title = "PowerSystems Inc."
    , body = [ banner model, news ] |> ui
    }



-- SUBSCRIPTIONS


subs : Model -> Sub Msg
subs model =
    Time.every 1000 IncrementCounter


banner : Model -> Element Msg
banner model =
    let
        pcColor =
            BG.color (Element.rgb255 128 128 128)

        rightArrow =
            "→" |> text |> el [ Font.bold, Font.size 30 ]

        leftArrow =
            "←" |> text |> el [ Font.bold, Font.size 30 ]

        empowerBanner =
            UI.content Col
                [ BG.image "assets/data.gif" ]
                [ Element.column [ Element.centerX, Element.centerY ]
                    [ "Empowering today's businesses."
                        |> text
                        |> el
                            [ Font.size 72
                            , Font.bold
                            , Font.color <| Element.rgb255 255 255 255
                            ]
                    ]
                ]

        countBanner =
            UI.content Col
                [ BG.image "assets/logos-anim.gif" ]
                [ Element.paragraph
                    [ Font.center
                    , Element.centerY
                    , Font.size 32
                    , Font.glow (Element.rgb255 255 255 255) 10
                    ]
                    [ String.fromInt model.businessCounter
                        |> text
                        |> el [ Font.size 72, Font.bold ]
                    , text " supported businesses and counting..."
                    ]
                ]

        displayed =
            case model.currentBanner of
                EmpowerBusiness ->
                    empowerBanner

                CustomerCount ->
                    countBanner
    in
    UI.content Row
        []
        [ Input.button [ Element.height fill ] { onPress = Just ChangedBanner, label = leftArrow }
        , displayed
        , Input.button [ Element.height fill ] { onPress = Just ChangedBanner, label = rightArrow }
        ]


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
