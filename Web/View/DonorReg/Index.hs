module Web.View.DonorReg.Index where
import Web.View.Prelude

data IndexView = IndexView { donorReg :: [DonorReg] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={DonorRegsAction}>DonorRegs</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewDonorRegAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>DonorReg</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach donorReg renderDonorReg}</tbody>
            </table>
        </div>
    |]


renderDonorReg donorReg = [hsx|
    <tr>
        <td>{donorReg}</td>
        <td><a href={ShowDonorRegAction (get #id donorReg)}>Show</a></td>
        <td><a href={EditDonorRegAction (get #id donorReg)} class="text-muted">Edit</a></td>
        <td><a href={DeleteDonorRegAction (get #id donorReg)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
