module Web.View.DonorReg.Edit where
import Web.View.Prelude

data EditView = EditView { donorReg :: DonorReg }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={DonorRegsAction}>DonorRegs</a></li>
                <li class="breadcrumb-item active">Edit DonorReg</li>
            </ol>
        </nav>
        <h1>Edit DonorReg</h1>
        {renderForm donorReg}
    |]

renderForm :: DonorReg -> Html
renderForm donorReg = formFor donorReg [hsx|

    {submitButton}
|]
