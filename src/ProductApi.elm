module ProductApi exposing (ItemDetails, itemIcon)

import Element exposing (..)
import Element.Font as Font
import Gen.Route as Route


type alias ItemDetails =
    { name : String
    , image : String
    , description : String
    , cost : Float
    , page : String
    }


itemIcon : ItemDetails -> Element msg
itemIcon item =
    let
        icon =
            column []
                [ Element.image []
                    { src = item.image
                    , description = ""
                    }
                , text item.name |> el [ Font.size 28 ]
                , ("$" ++ String.fromFloat item.cost)
                    |> text
                    |> el [ Font.bold, Font.size 48 ]
                ]
    in
    Element.link [] { url = Route.toHref <| Route.Shop__Item_ { item = item.page }, label = icon }
