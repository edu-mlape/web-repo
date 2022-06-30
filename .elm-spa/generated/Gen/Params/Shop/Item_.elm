module Gen.Params.Shop.Item_ exposing (Params, parser)

import Url.Parser as Parser exposing ((</>), Parser)


type alias Params =
    { item : String }


parser =
    Parser.map Params (Parser.s "shop" </> Parser.string)

