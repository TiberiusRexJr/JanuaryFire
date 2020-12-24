<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
           <h1> Customers</h1> 
   
        <div>  
            <asp:TextBox ID="txtSearch" AutoPostBack="true" runat="server" ToolTip="Search by part of EmployeeName"></asp:TextBox>  
            <asp:Button ID="btnSearch" Text="Search" runat="server" CausesValidation="false" OnClick="btnSearch_Click" />  
        </div>  
        <div>  
            <asp:ListView ID="CustomerListView" ItemType="WebApplication1.Models.Customers" SelectMethod="GetSearchedItems" DataKeyName="CustomerID" UpdateMethod="UpdateCustomer" DeleteMethod="DeleteCustomer" OnSelectedIndexChanged="SelectedIndexChange" runat="server">  
                <EmptyDataTemplate>  
                    <table>  
                        <tr>  
                            <td>Nothing to Show</td>  
                        </tr>  
                    </table>  
                </EmptyDataTemplate>  
                <EmptyItemTemplate>  
                    <td />  
                </EmptyItemTemplate>  
                <LayoutTemplate>  
                    <div class="table-responsive">  
                        <table id="CustomerTable" class="table">  
                            <caption style="color:deeppink"><b>Customers</b></caption>  
                            <tr style="background-color:crimson">  
                                <th>CustomerId</th>  
                                <th>Name</th>  
                                <th>Address</th>  
                                <th>City</th>  
                                <th>State</th>  
                                <th>Zip</th>  
                                <th style="width:140px;">Action</th>  
                            </tr>  
                            <tr runat="server" id="itemPlaceholder"></tr>  
                        </table>  
                    </div>  
                </LayoutTemplate>  
                <ItemTemplate>  
                    <tr>  
                        <td>  
                            <%# Item.CustomerID %>  
                        </td>  
                        <td>  
                            <%# Item.Name%>  
                        </td>  
                        <td>  
                            <%# Item.Address %>  
                        </td>  
                        <td>  
                            <%# Item.City %>  
                        </td>  
                        <td>  
                            <%# Item.State %>  
                        </td>  
                        <td>  
                            <%# Item.Zip %>  
                        </td>  
                        <td>  
                            <asp:Button BackColor="#ff3399" CommandName="Edit" Text="Edit" tooltip="Edit a Customer" CausesValidation="false" runat="server" />  
                            <asp:Button BackColor="#ff3399" CommandName="Delete" tooltip="Delete a Customer" CausesValidation="false" onclientclick="javascript:return confirm('Are you sure to delete record?')" Text="Delete" runat="server" />  
                        </td>  
                    </tr>  
                </ItemTemplate>  
                <EditItemTemplate>  
                    <tr>  
                        <input type="hidden" name="CustomerI" value="<%# Item.CustomerID %>" />  
                        <td>EmpId:  
                            <asp:TextBox ID="txtCustomerID" runat="server" TextMode="SingleLine" ReadOnly="true" Text='<%# BindItem.CustomerID%>' />  
                        </td>  
                        <td>Name:  
                            <asp:TextBox ID="txtName" runat="server" TextMode="SingleLine" Text='<%# BindItem.Name %>' />  
                   
                        <td>Address:  
                            <asp:TextBox ID="txtAddress" runat="server" TextMode="SingleLine" Text='<%# BindItem.Address %>' />  
                        </td>  
                        <td>City:  
                            <asp:TextBox ID="txtCity" runat="server" TextMode="SingleLine" Text='<%# BindItem.City %>' />  
                        </td>  
                        <td>State:  
                            <asp:TextBox ID="txtState" runat="server" TextMode="SingleLine" Text='<%# BindItem.State %>' />  
                        </td>  
                          </td>  
                        <td>Zip:  
                            <input type="text" class="form-control" name="inputZip" value="<%# Item.Zip %>" />  
                        </td>
                        <td>  
                            <asp:Button class="btn btn-primary" CommandName="Update" Text="Update" CausesValidation="false" runat="server" />  
                            <asp:Button class="btn btn-danger" CommandName="Cancel" Text="Cancel" CausesValidation="false" runat="server" />  
                        </td>  
                    </tr>  
                </EditItemTemplate>  
            </asp:ListView>  
            <hr style="color:darkblue" />  
            <div style="clear: both;">  
                <asp:DataPager ID="DataPager1" PagedControlID="CustomerListView" PageSize="10" runat="server">  
                    <Fields>  
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false" />  
                        <asp:NumericPagerField ButtonType="Link" />  
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="true" ShowNextPageButton="true" ShowFirstPageButton="false" ShowPreviousPageButton="false" />  
                    </Fields>  
                </asp:DataPager>  
            </div>  
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
        
        <asp:Button ID="ButtonAddCustomer" runat="server" Text="Add Customer" OnClick="AddCustomer" CausesValidation="true" />  
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

