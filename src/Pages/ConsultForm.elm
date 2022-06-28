module Pages.ConsultForm exposing (Model, Msg, page)

import Element exposing (Element, el, fill, height, width)
import Element.Background as BG
import Element.Input as Form
import Gen.Params.ConsultForm exposing (Params)
import Page
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
    { name : String
    , role : String
    , company : String
    , email : String
    , mobileNumber : String
    , branch : String
    , date : String
    , meetingDescription : String
    }


init : ( Model, Cmd Msg )
init =
    ( { name = ""
      , role = ""
      , company = ""
      , email = ""
      , mobileNumber = ""
      , branch = ""
      , date = ""
      , meetingDescription = ""
      }
    , Cmd.none
    )



-- UPDATE


type Field
    = Name
    | CompanyRole
    | CompanyName
    | Email
    | MobileNumber
    | Branch
    | Date
    | MeetingDescription


type Msg
    = FormEdited Field String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FormEdited field str ->
            case field of
                Name ->
                    ( { model | name = str }, Cmd.none )

                CompanyRole ->
                    ( { model | role = str }, Cmd.none )

                CompanyName ->
                    ( { model | company = str }, Cmd.none )

                Email ->
                    ( { model | email = str }, Cmd.none )

                MobileNumber ->
                    ( { model | mobileNumber = str }, Cmd.none )

                Branch ->
                    ( { model | branch = str }, Cmd.none )

                Date ->
                    ( { model | date = str }, Cmd.none )

                MeetingDescription ->
                    ( { model | meetingDescription = str }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> View Msg
view model =
    { title = "Book a Consultation"
    , body = ui [ form model ]
    }



-- PAGE ELEMENTS


form : Model -> Element Msg
form model =
    let
        field : String -> String -> String -> Field -> Element Msg
        field var plDefault label msg =
            Form.text []
                { onChange = \s -> FormEdited msg s
                , text = var
                , placeholder =
                    Just
                        (plDefault
                            |> Element.text
                            |> Form.placeholder []
                        )
                , label = label |> Element.text |> Form.labelAbove []
                }

        part1 =
            UI.content Col
                []
                [ UI.content Row
                    [ Element.spacing 20 ]
                    [ field model.name "Your name" "Name" Name
                    , field model.role "i.e. CEO, Owner etc." "Role" CompanyRole
                    ]
                , field model.company "Your company" "Company" CompanyName
                , UI.content Row
                    [ Element.spacing 20 ]
                    [ field model.email "Your email" "Email" Email
                    , field model.mobileNumber "+61 XXX XXX XXXX" "Your number" MobileNumber
                    ]
                , UI.content Row
                    [ Element.spacing 20 ]
                    [ field model.branch "Where do you want to meet?" "Preferred branch" Branch
                    , field model.date "dd/mm/yyyy" "Meeting date" Date
                    ]
                ]

        part2 =
            UI.content Col
                []
                [ Form.multiline [ width fill, height fill ]
                    { onChange = \t -> FormEdited MeetingDescription t
                    , text = model.meetingDescription
                    , placeholder =
                        Just
                            ("What do you want to talk about?"
                                |> Element.text
                                |> Form.placeholder []
                            )
                    , label = "Description" |> Element.text |> Form.labelAbove []
                    , spellcheck = True
                    }
                , Form.button [ Element.padding 30, Element.rgb255 128 128 0 |> BG.color ]
                    { onPress = Nothing, label = Element.text "Submit" }
                ]
    in
    UI.content Row [ Element.padding 30, Element.spacing 30 ] [ part1, part2 ]
