module Web.Controller.DonorReg where

import Web.Controller.Prelude
import Web.View.DonorReg.Index
import Web.View.DonorReg.New
import Web.View.DonorReg.Edit
import Web.View.DonorReg.Show

instance Controller DonorRegController where
    action DonorRegsAction = do
        donorReg <- query @DonorReg |> fetch
        render IndexView { .. }

    action NewDonorRegAction = do
        let donorReg = newRecord
        render NewView { .. }

    action ShowDonorRegAction { donorRegId } = do
        donorReg <- fetch donorRegId
        render ShowView { .. }

    action EditDonorRegAction { donorRegId } = do
        donorReg <- fetch donorRegId
        render EditView { .. }

    action UpdateDonorRegAction { donorRegId } = do
        donorReg <- fetch donorRegId
        donorReg
            |> buildDonorReg
            |> ifValid \case
                Left donorReg -> render EditView { .. }
                Right donorReg -> do
                    donorReg <- donorReg |> updateRecord
                    setSuccessMessage "DonorReg updated"
                    redirectTo EditDonorRegAction { .. }

    action CreateDonorRegAction = do
        let donorReg = newRecord @DonorReg
        donorReg
            |> buildDonorReg
            |> ifValid \case
                Left donorReg -> render NewView { .. } 
                Right donorReg -> do
                    donorReg <- donorReg |> createRecord
                    setSuccessMessage "DonorReg created"
                    redirectTo DonorRegsAction

    action DeleteDonorRegAction { donorRegId } = do
        donorReg <- fetch donorRegId
        deleteRecord donorReg
        setSuccessMessage "DonorReg deleted"
        redirectTo DonorRegsAction

buildDonorReg donorReg = donorReg
    |> fill @'[]
