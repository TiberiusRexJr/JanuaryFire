<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JaWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="card">
  <h3 class="card-header"><i class="fa fa-cloud fa-2x mx-1 my-1"></i>Invoice Cloud</h3>
  <div class="card-body">
    <h5 class="card-title">Customers</h5>
    
       <table id="dataTableInventory" class="display" style="width:100%">
        <thead>
            <tr id="dataTableInventoryThead_Tr">
                
                
               

                
            </tr>
        </thead>
                                        <tbody>

                                        </tbody>
        <tfoot>
            <tr>
                <th></th>
                
            </tr>
        </tfoot>
    </table>


      <p>
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseAddCustomer" aria-expanded="false" aria-controls="collapseExample">
   <i class="fa fa-user-plus fa-2x"></i> Add Customer
  </button>
</p>

<div class="collapse" id="collapseAddCustomer">
  <div class="card card-body">
     <form>
                 
                 </form>
          <form id="formAddCustomer" name="formAddCustomer" >
      <div class="form-group">

        <label for="inputName">Name</label>

        <input type="text" class="form-control" id="inputName" name="Name" value="" aria-describedby="Name" >

      </div>

      <div class="form-group">
        <label for="inputAddress">Address</label>
        <input type="text" class="form-control" id="inputAddress" name="Address" value="" placeholder="Address">
      </div>

        <div class="form-group">
        <label for="inputCity">City</label>
        <input type="text" class="form-control" id="inputCity" name="City" value="" aria-describedby="City" placeholder="City">
      </div>

      <div class="form-group">
        <label for="selectState">State</label>
        <select class="form-control" id="selectState">
            <option>TX</option>
            <option>FL</option>
            <option>CA</option>
      </select>
      </div>

        <div class="form-group">
        <label for="inputZip">Zip</label>
        <input type="number" class="form-control" id="inputZip">
      </div>
     
    </form>

     <button type="button" class="btn btn-success btn-sm mx-1 my-1" onclick="AddCustomerSubmit()"><i class="fa fa-check fa-2x my-1 mx-1" ></i>Save</button>
      <button type="button" id="buttonCancel" class="btn btn-outline-danger mx-1 my-1 btn-sm"><i class="fa fa-window-close fa-2x my-1 mx-1"></i>Cancel</button>


  </div>
</div>


  </div>
</div>

    <div class="modal fade" id="ModalAdminMessenger" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
<div class="modal-content">
    <div class="modal-header" id="ModalAdminMessengerHeader">
    <h5 class="modal-title" id="exampleModalLabel">Success</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>
    <div class="modal-body" id="ModalAdminMessengerBody">
       
    </div>
    <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    <button type="button" class="btn btn-primary">Save changes</button>
    </div>
</div>
</div>
</div>

    <script src="Scripts/Page_Default/Page_Default.js"></script>

</asp:Content>
