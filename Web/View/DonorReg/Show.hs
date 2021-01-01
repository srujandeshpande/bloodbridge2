module Web.View.DonorReg.Show where
import Web.View.Prelude

data ShowView = ShowView { donorReg :: DonorReg }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={DonorRegsAction}>DonorRegs</a></li>
                <li class="breadcrumb-item active">Show DonorReg</li>
            </ol>
        </nav>
        <h1>Show DonorReg</h1>
        <p>{donorReg}</p>
    |]
