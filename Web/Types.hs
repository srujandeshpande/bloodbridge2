module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data DonorRegController
    = DonorRegsAction
    | NewDonorRegAction
    | ShowDonorRegAction { donorRegId :: !(Id DonorReg) }
    | CreateDonorRegAction
    | EditDonorRegAction { donorRegId :: !(Id DonorReg) }
    | UpdateDonorRegAction { donorRegId :: !(Id DonorReg) }
    | DeleteDonorRegAction { donorRegId :: !(Id DonorReg) }
    deriving (Eq, Show, Data)
