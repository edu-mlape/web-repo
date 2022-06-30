module Gen.Route exposing
    ( Route(..)
    , fromUrl
    , toHref
    )

import Gen.Params.AboutUs
import Gen.Params.ConsultForm
import Gen.Params.DebugEx
import Gen.Params.Home_
import Gen.Params.Products
import Gen.Params.Shop.Item_
import Gen.Params.NotFound
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser)


type Route
    = AboutUs
    | ConsultForm
    | DebugEx
    | Home_
    | Products
    | Shop__Item_ { item : String }
    | NotFound


fromUrl : Url -> Route
fromUrl =
    Parser.parse (Parser.oneOf routes) >> Maybe.withDefault NotFound


routes : List (Parser (Route -> a) a)
routes =
    [ Parser.map Home_ Gen.Params.Home_.parser
    , Parser.map AboutUs Gen.Params.AboutUs.parser
    , Parser.map ConsultForm Gen.Params.ConsultForm.parser
    , Parser.map DebugEx Gen.Params.DebugEx.parser
    , Parser.map Products Gen.Params.Products.parser
    , Parser.map NotFound Gen.Params.NotFound.parser
    , Parser.map Shop__Item_ Gen.Params.Shop.Item_.parser
    ]


toHref : Route -> String
toHref route =
    let
        joinAsHref : List String -> String
        joinAsHref segments =
            "/" ++ String.join "/" segments
    in
    case route of
        AboutUs ->
            joinAsHref [ "about-us" ]
    
        ConsultForm ->
            joinAsHref [ "consult-form" ]
    
        DebugEx ->
            joinAsHref [ "debug-ex" ]
    
        Home_ ->
            joinAsHref []
    
        Products ->
            joinAsHref [ "products" ]
    
        Shop__Item_ params ->
            joinAsHref [ "shop", params.item ]
    
        NotFound ->
            joinAsHref [ "not-found" ]

