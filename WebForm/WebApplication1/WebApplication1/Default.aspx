<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        body   
        {
          font-size: 10pt;
            font-family: Trebuchet MS, Arial, Tahoma;
            text-align:center;
        }
        .item { background-color: #E0FFFF }
        .alternatingItem { background-color: #B0E0E6 }
    </style>
    <div class="container">
           <h1> Customers</h1> 

        <div>
           
            <asp:TextBox ID="txtSearch" AutoPostBack="true" runat="server" onKeyUp="KeyUp" ToolTip="Search by Complete Customer Name"></asp:TextBox>  

            <asp:Button ID="btnSearch" Text="Search" runat="server" CausesValidation="false" CommandName=""  />  
        </div>  
        <div>  
           

            <asp:ListView ID="CustomersListView" DataSourceID="ObjectDataSourceCustomers" TypeName="WebApplication1._Default" OnItemCanceling="CustomersListView_ItemCanceling"  DataKeyNames="CustomerID" runat="server">
                <EmptyDataTemplate>
                     <table class="emptyTable">
                <tr>
                  <td>
                    <asp:Image ID="NoDataImage"
                      ImageUrl="~/App_Data/Images/NoData.png"
                      runat="server"/>
                  </td>
                  <td>
                    No records available.
                  </td>
                </tr>
              </table>
                </EmptyDataTemplate>
                <LayoutTemplate>

                         <asp:Button ID="ButtonAddNewCustomer" CausesValidation="false"  runat="server" CommandName="Create" CssClass="btn btn-success" OnClick="ButtonAddNewCustomer_Click" Text="New Customer" />

                    <table cellpadding="2" width="640px" border="1" runat="server" id="tblProducts">
                        <tr runat="server">
                          <th runat="server">Action</th>
                          <th runat="server">Customer ID</th>
                          <th runat="server">Name</th>
                          <th runat="server">Address</th>
                          <th runat="server">City</th>
                          <th runat="server">State</th>
                          <th runat="server">Zip</th>
                        </tr>
                        
                        <tr runat="server" id="itemPlaceholder" />
                      </table>
                  <asp:DataPager runat="server" ID="DataPagerCustomers" PageSize="10">
                    <Fields>
                      <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true"
                        FirstPageText="|&lt;&lt; " LastPageText=" &gt;&gt;|"
                        NextPageText=" &gt; " PreviousPageText=" &lt; " />
                    </Fields>
                  </asp:DataPager>
                </LayoutTemplate>
                    <ItemTemplate>
                      <tr runat="server">
                        <td>
                         <asp:Button BackColor="#ff3399" CommandName="Edit" Text="Edit" tooltip="Edit a record" CausesValidation="false" runat="server" />  

                        <asp:Button BackColor="#ff3399" CommandName="Delete" tooltip="Delete a record" CausesValidation="false" onclientclick="javascript:return confirm('Are you sure to delete record?')" Text="Delete" runat="server" />
                             </td>
                        <td>
                          <asp:Label ID="LabelCustomerID" runat="Server" Text='<%#Eval("CustomerID") %>' />
                        </td>
                        <td>
                          <asp:Label ID="LabelName" runat="Server" Text='<%#Eval("Name") %>' />
                        </td>
                           <td>
                          <asp:Label ID="LabelAddress" runat="Server" Text='<%#Eval("Address") %>' />
                        </td>
                           <td>
                          <asp:Label ID="LabelCity" runat="Server" Text='<%#Eval("City") %>' />
                        </td>
                           <td>
                          <asp:Label ID="LabelState" runat="Server" Text='<%#Eval("State") %>' />
                        </td>
                           <td>
                          <asp:Label ID="LabelZip" runat="Server" Text='<%#Eval("Zip") %>' />
                        </td>
                      </tr>
                    </ItemTemplate>
               <EditItemTemplate>
              <tr style="background-color: #ADD8E6">
                <td>
                    <asp:Button BackColor="#ff3399" CommandName="Update" Text="Update" tooltip="Submit Update" CausesValidation="false" runat="server" />
                    
                    <asp:Button BackColor="#ff3399" CommandName="Cancel" Text="Cancel" tooltip="Cancel Submission" CausesValidation="false" runat="server" /> 
               
                </td>
                <td>
                  <asp:TextBox ID="TextBoxCustomerID" ReadOnly="true" runat="server" Text='<%#Bind("CustomerID") %>' 
                    MaxLength="50" /><br />
                    
                </td>
                <td>
                  <asp:TextBox ID="TextBoxEditName" runat="server" Text='<%#Bind("Name") %>' 
                    MaxLength="256" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxEditName" runat="server" Text="* First name required." ForeColor="Red" ControlToValidate="TextBoxEditName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                  <td>
                  <asp:TextBox ID="TextBoxAddress" runat="server" Text='<%#Bind("Address") %>' 
                    MaxLength="256" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxAddress" runat="server" Text="* Address Required." ForeColor="Red" ControlToValidate="TextBoxAddress" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    
                </td>
                  <td>
                  <asp:TextBox ID="TextBoxCity" runat="server" Text='<%#Bind("City") %>' 
                    MaxLength="256" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxCity" runat="server" Text="* City Required" ForeColor="Red" ControlToValidate="TextBoxCity" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>

                </td>
                  <td>
                  <asp:DropDownList  ID="DropDownState"  SelectedValue='<%# Bind("State") %>'
                runat="server">
                <asp:ListItem Value="CA"></asp:ListItem>
                <asp:ListItem Value="TX"></asp:ListItem>
                  </asp:DropDownList>
                </td>
                  <td>
                      <asp:TextBox ID="TextBoxEditZip" runat="server" Text='<%#Bind("Zip") %>' 
                    MaxLength="256" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxEditZip" runat="server" Text="* City Required" ForeColor="Red" ControlToValidate="TextBoxEditZip" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>

                  </td>
              </tr>
            </EditItemTemplate>
                  <InsertItemTemplate>
                    <tr style="background-color:#D3D3D3">
                          <td>

                        <asp:LinkButton ID="InsertButton" runat="server" 
                          CommandName="Insert" Text="Insert" CausesValidation="false" CssClass="btn btn-primary" />

                          <asp:Button runat="server" CssClass="btn btn-danger" ID="ButtonCancelInsert" Text="Cancel" CausesValidation="false"  OnClick="ButtonCancelInsert_Click" />
                      </td>
                        <td>

                        </td>
                        <td>                      
                        <asp:TextBox ID="TextBoxInsertName" runat="server" 
                          Text='<%#Bind("Name") %>' />
                          
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxInsertName" runat="server" Text="* Name Required" ForeColor="Red" ControlToValidate="TextBoxInsertName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                             </td>
                        <td>
                        <asp:TextBox ID="TextBoxInsertAddress" runat="server" 
                          Text='<%#Bind("Address") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxInsertAddress" runat="server" Text="* Address Required" ForeColor="Red" ControlToValidate="TextBoxInsertAddress" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>

                            </td>
                        <td>
                        <asp:TextBox ID="TextBoxInsertCity" runat="server" 
                          Text='<%#Bind("City") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxInsertCity" runat="server" Text="* City Required" ForeColor="Red" ControlToValidate="TextBoxInsertCity" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>

                            </td>
                        <td>
                        <asp:DropDownList id="DropDownInsertState" SelectedValue='<%# Bind("State") %>' runat="server">
                          <asp:ListItem Value="TX" Selected="True"> TX </asp:ListItem>
                          <asp:ListItem Value="CA"> CA </asp:ListItem>

                       </asp:DropDownList>
                            </td>
                        <td>
                        <asp:TextBox ID="TextboxInsertZip" runat="server" 
                          Text='<%#Bind("Zip") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextboxInsertZip" runat="server" Text="* Zip Required" ForeColor="Red" ControlToValidate="TextboxInsertZip" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>

                      </td>
                    
                    </tr>
                </InsertItemTemplate>
                   <SelectedItemTemplate>
                      <tr runat="server" style="background-color:#90EE90">
           
                                    <td>
                                      <asp:LinkButton ID="EditButton" runat="Server" Text="Edit" CommandName="Edit" />
                                    </td>
                                      <td>
                                      <asp:LinkButton ID="DeleteButton" runat="Server" Text="Delete" CommandName="Delete" />
                                    </td>
                                    <td>
                                      <asp:Label ID="LabelCustomerID" runat="Server" Text='<%#Eval("CustomerID") %>' />
                                    </td>
                                    <td>
                                      <asp:Label ID="LabelName" runat="Server" Text='<%#Eval("Name") %>' />
                                    </td>
                                       <td>
                                      <asp:Label ID="LabelAddress" runat="Server" Text='<%#Eval("Address") %>' />
                                    </td>
                                       <td>
                                      <asp:Label ID="LabelCity" runat="Server" Text='<%#Eval("City") %>' />
                                    </td>
                                       <td>
                                      <asp:Label ID="LabelState" runat="Server" Text='<%#Eval("State") %>' />
                                    </td>
                                       <td>
                                      <asp:Label ID="LabelZip" runat="Server" Text='<%#Eval("Zip") %>' />
                                    </td>
                                  </tr>
                   </SelectedItemTemplate>
                <ItemSeparatorTemplate>
          <td class="separator" runat="server">&nbsp;</td>
        </ItemSeparatorTemplate>
                  <AlternatingItemTemplate>
                  <tr class="alternatingItem" runat="server">
                           
                        <td>
                              <asp:Button BackColor="#ff3399" CommandName="Edit" Text="Edit" tooltip="Edit a record" CausesValidation="false" runat="server" />  

                        <asp:Button BackColor="#ff3399" CommandName="Delete" tooltip="Delete a record" CausesValidation="false" onclientclick="javascript:return confirm('Are you sure to delete record?')" Text="Delete" runat="server" />
                        </td>
                        <td>
                          <asp:Label ID="LabelCustomerID" runat="Server" Text='<%#Eval("CustomerID") %>' />
                        </td>
                        <td>
                          <asp:Label ID="LabelName" runat="Server" Text='<%#Eval("Name") %>' />
                        </td>
                           <td>
                          <asp:Label ID="LabelAddress" runat="Server" Text='<%#Eval("Address") %>' />
                        </td>
                           <td>
                          <asp:Label ID="LabelCity" runat="Server" Text='<%#Eval("City") %>' />
                        </td>
                           <td>
                          <asp:Label ID="LabelState" runat="Server" Text='<%#Eval("State") %>' />
                        </td>
                           <td>
                          <asp:Label ID="LabelZip" runat="Server" Text='<%#Eval("Zip") %>' />
                        </td>
                      </tr>
                  </tr>
                    </AlternatingItemTemplate>
            </asp:ListView>
            <asp:ObjectDataSource id="ObjectDataSourceCustomers" DataObjectTypeName="WebApplication1.Models.Customers"  TypeName="WebApplication1._Default" SelectMethod="GetAllCustomer" UpdateMethod="UpdateCustomer" InsertMethod="AddCustomer" OnUpdating="ObjectDataSourceCustomers_Updating" OnDeleting="ObjectDataSourceCustomers_Deleting" DeleteMethod="DeleteCustomer" OnInserted="ObjectDataSourceCustomers_Inserted" runat="server">
                <deleteparameters>
                <asp:parameter name="CustomerID" type="Int32"  />
                </deleteparameters>
            </asp:ObjectDataSource>
        </div>  
        <hr style="width:5px;color:darkblue;" />  
        <asp:Label ID="LabelStatus" BackColor="Blue" Width="540px" Height="5px" runat="server" Text=""></asp:Label>
        <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            <h5>Add Customer</h5>
        </button>

        <div class="collapse" id="collapseExample">
          <div class="card card-body">
            <h3>Add Customer:</h3>  
        <table>  
            
            <tr>  
                <td>  
                    <asp:Label ID="LabelAddFName" runat="server">FirstName:</asp:Label>  
                </td>  
                <td> 
                    
                    <asp:TextBox ID="txtAddName" runat="server"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtAddName" runat="server" Text="* First name required." ForeColor="Red" ControlToValidate="txtAddName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>  
                </td>  
            </tr>  
            <tr>  
                <td>  
                    <asp:Label ID="LabelAddAddress" runat="server">Address:</asp:Label>  
                </td>  
                <td>  
                    <asp:TextBox ID="txtAddAddress" runat="server"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtAddAddress" runat="server" Text="* Last name required." ForeColor="Red" ControlToValidate="txtAddAddress" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>  
                </td>  
            </tr>  
            <tr>  
                <td>  
                    <asp:Label ID="LabelAddCity" runat="server">City:</asp:Label>  
                </td>  
                <td>  
                    <asp:TextBox ID="txtAddCity" runat="server"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtAddCity" runat="server" Text="* Salary required." ForeColor="Red" ControlToValidate="txtAddCity" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>  
                </td>  
            </tr>  
            <tr>  
                <td>  
                    <asp:Label ID="LabelAddState" runat="server">ContactNo:</asp:Label>  
                </td>  
                <td>  
                    <asp:DropDownList id="DropDownListAddState" 
                       runat="server">
                     <asp:ListItem></asp:ListItem>
                     <asp:ListItem Value="TX">TX</asp:ListItem>
                     <asp:ListItem Value="CA">CA</asp:ListItem>
                  </asp:DropDownList>  

                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddState" runat="server" Text="* Add a State" InitialValue="-1" ForeColor="Red" ControlToValidate="DropDownListAddState" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>  
                </td>  
            </tr>  
            <tr>  
                <td>  
                    <asp:Label ID="LabelAddZip" runat="server">Zip:</asp:Label>  
                </td>  
                <td>  
                    <input type="number" value="" runat=server id="inputAddZip" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorinputAddZip" runat="server" Text="* Zip code rquired." ForeColor="Red" ControlToValidate="inputAddZip" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>  
                </td>  
            </tr>  
        </table>  
        
              
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
   <script src="Scripts/Default/Default.js" language="javascript" type="text/javascript"></script>
     
</asp:Content>

