<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JaWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="card">
  <h3 class="card-header"><i class="fa fa-cloud fa-2x mx-1 my-1"></i>Invoice Cloud</h3>
  <div class="card-body">
    <h5 class="card-title">Customers</h5>
    <button class="btn btn-primary mx-1 my-1" onclick="AddCustomer()" type="button">
   <i class="fa fa-user-plus fa-1x"></i> Add 
  </button>
     
      <button type="button"  class="btn btn-secondary bg-danger my-1 mx-1" onclick="DeleteCustomer()"><i class="fa fa-user-times"></i> Mass Delete</button>

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
  <button class="btn btn-primary" hidden type="button" data-toggle="collapse" data-target="#collapseAddCustomer" aria-expanded="false" aria-controls="collapseExample">
   <i class="fa fa-user-plus fa-2x"></i> Add Customer
  </button>
</p>

<div class="collapse" id="collapseAddCustomer" hidden>
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

    <!--Modal_Edit_Brand-->
  <div class="modal fade" id="Modal_CR" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="Modal_CR_Header"><i class="fa fa-id-card-alt"></i>Invoice Cloud</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
         <div class="container" >
             <h2 id="Modal_CR_SubHeader"></h2>
          
                
              <div class="col-lg-6 col-md-6 ">
                 
                  <form>
                 
                 </form>

                  <form id="form_Modal_CR">

                <div class="form-group d-none">
                     
                    <input class="form-control py-4 d-none"  id="Modal_CR_Id" name="Modal_CR_Id" value="" type="text" />
                 </div>

                <div class="form-group">
                     <i class="fa fa-user"></i>
                    <label class="small mb-1" for="Modal_CR_Name">Name</label>
                    <input class="form-control py-4"  id="Modal_CR_Name" name="Modal_CR_Name" value="" type="text" />
                 </div>

                 <div class="form-group">
                     <i class="fa fa-house-user"></i>
                    <label class="small mb-1" for="Modal_CR_Address">Address</label>
                    <input class="form-control py-4" id="Modal_CR_Address" name="Modal_CR_Address" value="" type="text" />
                 </div>
                
                  <div class="form-group">
                     <i class="fa fa-city"></i>
                    <label class="small mb-1" for="Modal_CR_City">City</label>
                    <input class="form-control py-4" id="Modal_CR_City" name="Modal_CR_City" value="" type="text" />
                 </div>

                  <div class="form-group">
                    <i class="fa fa-university"></i>
                    <label class="small mb-1" for="Modal_CR_State">State</label>
                    <select class="form-control" id="Modal_CR_State">
                          <option value="TX">TX</option>
                          <option value="CA">CA</option>
                          <option value="FL">FL</option>
                    </select>
                 </div>

                   <div class="form-group">
                     <i class="fa fa-flag"></i>
                    <label class="small mb-1" for="Modal_CR_Zip">Zip</label>
                    <input class="form-control py-4" id="Modal_CR_Zip" name="Modal_CR_Zip" value="" type="text" />
                 </div>
                      
                      
                                        </form>
                  <input id="inputCRType" name="inputCRType" value="" type="text" hidden />
              </div>
              

       

         </div>
            
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="ModalCRCancel()">Cancel</button>
            <a class="btn btn-primary" id="Button" onclick="ModalCrSubmit()">Save</a>
          
        </div>
      </div>
          
    </div>
  </div>
    <!--Modal_Edit_Brand-->

    <script src="Scripts/Page_Default/Page_Default.js"></script>

</asp:Content>
