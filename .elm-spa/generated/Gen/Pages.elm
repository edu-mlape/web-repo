module Gen.Pages exposing (Model, Msg, init, subscriptions, update, view)

import Browser.Navigation exposing (Key)
import Effect exposing (Effect)
import ElmSpa.Page
import Gen.Params.AboutUs
import Gen.Params.ConsultForm
import Gen.Params.DebugEx
import Gen.Params.Home_
import Gen.Params.Products
import Gen.Params.Shop.Item_
import Gen.Params.NotFound
import Gen.Model as Model
import Gen.Msg as Msg
import Gen.Route as Route exposing (Route)
import Page exposing (Page)
import Pages.AboutUs
import Pages.ConsultForm
import Pages.DebugEx
import Pages.Home_
import Pages.Products
import Pages.Shop.Item_
import Pages.NotFound
import Request exposing (Request)
import Shared
import Task
import Url exposing (Url)
import View exposing (View)


type alias Model =
    Model.Model


type alias Msg =
    Msg.Msg


init : Route -> Shared.Model -> Url -> Key -> ( Model, Effect Msg )
init route =
    case route of
        Route.AboutUs ->
            pages.aboutUs.init ()
    
        Route.ConsultForm ->
            pages.consultForm.init ()
    
        Route.DebugEx ->
            pages.debugEx.init ()
    
        Route.Home_ ->
            pages.home_.init ()
    
        Route.Products ->
            pages.products.init ()
    
        Route.Shop__Item_ params ->
            pages.shop__item_.init params
    
        Route.NotFound ->
            pages.notFound.init ()


update : Msg -> Model -> Shared.Model -> Url -> Key -> ( Model, Effect Msg )
update msg_ model_ =
    case ( msg_, model_ ) of
        ( Msg.AboutUs msg, Model.AboutUs params model ) ->
            pages.aboutUs.update params msg model
    
        ( Msg.ConsultForm msg, Model.ConsultForm params model ) ->
            pages.consultForm.update params msg model
    
        ( Msg.DebugEx msg, Model.DebugEx params model ) ->
            pages.debugEx.update params msg model
    
        ( Msg.Home_ msg, Model.Home_ params model ) ->
            pages.home_.update params msg model
    
        ( Msg.Products msg, Model.Products params model ) ->
            pages.products.update params msg model
    
        ( Msg.Shop__Item_ msg, Model.Shop__Item_ params model ) ->
            pages.shop__item_.update params msg model

        _ ->
            \_ _ _ -> ( model_, Effect.none )


view : Model -> Shared.Model -> Url -> Key -> View Msg
view model_ =
    case model_ of
        Model.Redirecting_ ->
            \_ _ _ -> View.none
    
        Model.AboutUs params model ->
            pages.aboutUs.view params model
    
        Model.ConsultForm params model ->
            pages.consultForm.view params model
    
        Model.DebugEx params model ->
            pages.debugEx.view params model
    
        Model.Home_ params model ->
            pages.home_.view params model
    
        Model.Products params model ->
            pages.products.view params model
    
        Model.Shop__Item_ params model ->
            pages.shop__item_.view params model
    
        Model.NotFound params ->
            pages.notFound.view params ()


subscriptions : Model -> Shared.Model -> Url -> Key -> Sub Msg
subscriptions model_ =
    case model_ of
        Model.Redirecting_ ->
            \_ _ _ -> Sub.none
    
        Model.AboutUs params model ->
            pages.aboutUs.subscriptions params model
    
        Model.ConsultForm params model ->
            pages.consultForm.subscriptions params model
    
        Model.DebugEx params model ->
            pages.debugEx.subscriptions params model
    
        Model.Home_ params model ->
            pages.home_.subscriptions params model
    
        Model.Products params model ->
            pages.products.subscriptions params model
    
        Model.Shop__Item_ params model ->
            pages.shop__item_.subscriptions params model
    
        Model.NotFound params ->
            pages.notFound.subscriptions params ()



-- INTERNALS


pages :
    { aboutUs : Bundle Gen.Params.AboutUs.Params () Never
    , consultForm : Bundle Gen.Params.ConsultForm.Params Pages.ConsultForm.Model Pages.ConsultForm.Msg
    , debugEx : Bundle Gen.Params.DebugEx.Params Pages.DebugEx.Model Pages.DebugEx.Msg
    , home_ : Bundle Gen.Params.Home_.Params Pages.Home_.Model Pages.Home_.Msg
    , products : Bundle Gen.Params.Products.Params Pages.Products.Model Pages.Products.Msg
    , shop__item_ : Bundle Gen.Params.Shop.Item_.Params Pages.Shop.Item_.Model Pages.Shop.Item_.Msg
    , notFound : Static Gen.Params.NotFound.Params
    }
pages =
    { aboutUs = bundle Pages.AboutUs.page Model.AboutUs Msg.AboutUs
    , consultForm = bundle Pages.ConsultForm.page Model.ConsultForm Msg.ConsultForm
    , debugEx = bundle Pages.DebugEx.page Model.DebugEx Msg.DebugEx
    , home_ = bundle Pages.Home_.page Model.Home_ Msg.Home_
    , products = bundle Pages.Products.page Model.Products Msg.Products
    , shop__item_ = bundle Pages.Shop.Item_.page Model.Shop__Item_ Msg.Shop__Item_
    , notFound = static Pages.NotFound.view Model.NotFound
    }


type alias Bundle params model msg =
    ElmSpa.Page.Bundle params model msg Shared.Model (Effect Msg) Model Msg (View Msg)


bundle page toModel toMsg =
    ElmSpa.Page.bundle
        { redirecting =
            { model = Model.Redirecting_
            , view = View.none
            }
        , toRoute = Route.fromUrl
        , toUrl = Route.toHref
        , fromCmd = Effect.fromCmd
        , mapEffect = Effect.map toMsg
        , mapView = View.map toMsg
        , toModel = toModel
        , toMsg = toMsg
        , page = page
        }


type alias Static params =
    Bundle params () Never


static : View Never -> (params -> Model) -> Static params
static view_ toModel =
    { init = \params _ _ _ -> ( toModel params, Effect.none )
    , update = \params _ _ _ _ _ -> ( toModel params, Effect.none )
    , view = \_ _ _ _ _ -> View.map never view_
    , subscriptions = \_ _ _ _ _ -> Sub.none
    }
    
