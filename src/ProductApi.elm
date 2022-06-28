module ProductApi exposing (ItemDetails, SelectedItem, itemIcon, items)

import Element exposing (..)
import Element.Font as Font
import Gen.Route as Route


type SelectedItem
    = OfficePack
    | ServerPack
    | DevPack
    | WebPack
    | CreativePack


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
    Element.link [ width fill, height fill ] { url = Route.toHref <| Route.Shop__Item_ { item = item.page }, label = icon }


items : List ItemDetails
items =
    [ ItemDetails "Office Pack" "" "Package for small organisations" 1000.0 "small-business-package"
    , ItemDetails "Server Pack" "" "" 3000.0 "server-package"
    , ItemDetails "Developers Pack" "" "" 4000.0 "dev-package"
    , ItemDetails "Creativity Pack" "" "" 9000.0 "creative-package"
    , ItemDetails "Webserver Pack" "" "" 10000.0 "web-package"
    ]
