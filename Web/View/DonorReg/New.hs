module Web.View.DonorReg.New where
import Web.View.Prelude

data NewView = NewView { donorReg :: DonorReg }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={DonorRegsAction}>DonorRegs</a></li>
                <li class="breadcrumb-item active">New DonorReg</li>
            </ol>
        </nav>
        <h1>New DonorReg</h1>
        {renderForm donorReg}
    |]

renderForm :: DonorReg -> Html
renderForm donorReg = formFor donorReg [hsx|

    {submitButton}
|]
