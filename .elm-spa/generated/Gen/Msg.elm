module Gen.Msg exposing (Msg(..))

import Gen.Params.AboutUs
import Gen.Params.ConsultForm
import Gen.Params.DebugEx
import Gen.Params.Home_
import Gen.Params.Products
import Gen.Params.Shop.Item_
import Gen.Params.NotFound
import Pages.AboutUs
import Pages.ConsultForm
import Pages.DebugEx
import Pages.Home_
import Pages.Products
import Pages.Shop.Item_
import Pages.NotFound


type Msg
    = AboutUs Never
    | ConsultForm Pages.ConsultForm.Msg
    | DebugEx Pages.DebugEx.Msg
    | Home_ Pages.Home_.Msg
    | Products Pages.Products.Msg
    | Shop__Item_ Pages.Shop.Item_.Msg

