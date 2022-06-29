module ProductApi exposing (ItemDetails, SelectedItem, itemIcon, items)

import Element exposing (..)
import Element.Border as Border
import Element.Font as Font
import Gen.Route as Route
import UI.Theme exposing (Theme(..), themePreset)


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
            column [ Element.centerX ]
                [ Element.image
                    [ Border.rounded 3
                    , Border.width 1
                    , Border.glow (Element.rgb255 232 237 223) 3
                    , Element.width <| Element.px <| 300
                    ]
                    { src = item.image
                    , description = ""
                    }
                , text item.name |> el [ Font.size 28 ]
                , ("$" ++ String.fromFloat item.cost)
                    |> text
                    |> el [ Font.bold, Font.size 48 ]
                ]
    in
    Element.link
        (themePreset ItemShowcase
            ++ [ height fill, padding 20 ]
        )
        { url = Route.toHref <| Route.Shop__Item_ { item = item.page }, label = icon }


items : List ItemDetails
items =
    [ ItemDetails
        "Office Pack"
        "/assets/product-images/office-pack.jpg"
        """A package containing the necessary technology for any kind of small or starting businesses.
Contains 10 Windows-based computer sets, and a central file server.
        """
        10000.0
        "small-business-package"
    , ItemDetails
        "Server Pack"
        "/assets/product-images/servers-pack.jpg"
        """Planning to create an online service? This package is for you!
Contains 5 server towers, as well as a PC for accessing these servers.
        """
        6000.0
        "server-package"
    , ItemDetails
        "Developers Pack"
        "/assets/product-images/dev-pack.jpg"
        """A package for software companies.
Comes with a Visual Studio Enterprise license, as well as 10 multimonitor computer
workstations.
        """
        4000.0
        "dev-package"
    , ItemDetails
        "Creativity Pack"
        "/assets/product-images/creative-pack.jpg"
        """For creative teams, this pack is specifically designed for graphic/animation studios
Comes with the Adobe CC Team plan, as well as 5 computers, with appropriate peripherals.
        """
        9000.0
        "creative-package"
    , ItemDetails
        "Webserver Pack"
        "/assets/product-images/webserver-pack.jpg"
        """Planning to create a website for your company? This package is the best way to start!
The physical server is shipped and installed by our team. Comes with documentation
for maintaining the server, and a PC for accessing said server.
        """
        10000.0
        "web-package"
    ]
