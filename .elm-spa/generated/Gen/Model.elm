module Gen.Model exposing (Model(..))

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


type Model
    = Redirecting_
    | AboutUs Gen.Params.AboutUs.Params ()
    | ConsultForm Gen.Params.ConsultForm.Params Pages.ConsultForm.Model
    | DebugEx Gen.Params.DebugEx.Params Pages.DebugEx.Model
    | Home_ Gen.Params.Home_.Params Pages.Home_.Model
    | Products Gen.Params.Products.Params Pages.Products.Model
    | Shop__Item_ Gen.Params.Shop.Item_.Params Pages.Shop.Item_.Model
    | NotFound Gen.Params.NotFound.Params

