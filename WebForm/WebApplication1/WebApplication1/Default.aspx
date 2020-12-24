<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
           <h1> Customers</h1> 
        
        <div>  
            <asp:TextBox ID="txtSearch" AutoPostBack="true" runat="server" ToolTip="Search by Complete Customer Name"></asp:TextBox>  
            <asp:Button ID="btnSearch" Text="Search" runat="server" CausesValidation="false" OnClick="btnSearch_Click" />  
        </div>  
        <div>  
            <asp:ListView ID="EmployeeList" ItemType="WebApplication1.Models.Customers" SelectMethod="GetSearchedItems" DataKeyName="CustomerID" UpdateMethod="UpdateCustomer" DeleteMethod="DeleteEmployee" OnSelectedIndexChanged="EmployeeList_SelectedIndexChanged" runat="server">  
                <EmptyDataTemplate>  
                    <table>  
                        <tr>  
                            <td>Sorry,No Record Found.Try Again!</td>  
                        </tr>  
                    </table>  
                </EmptyDataTemplate>  
                <EmptyItemTemplate>  
                    <td />  
                </EmptyItemTemplate>  
                <LayoutTemplate>  
                    <div class="outerContainer">  
                        <table id="EmployeeTable">  
                            <caption style="color:deeppink"><b>Employees</b></caption>  
                            <tr style="background-color:crimson">  
                                <th>EmpId</th>  
                                <th>FirstNam</th>  
                                <th>LastName</th>  
                                <th>Salary</th>  
                                <th>ContactNo</th>  
                                <th>DateOfBirth</th>  
                                <th style="width:140px;">      Action</th>  
                            </tr>  
                            <tr runat="server" id="itemPlaceholder"></tr>  
                        </table>  
                    </div>  
                </LayoutTemplate>  
                <ItemTemplate>  
                    <tr>  
                        <td>  
                            <%# Item.Id %>  
                        </td>  
                        <td>  
                            <%# Item.FirstName %>  
                        </td>  
                        <td>  
                            <%# Item.LastName %>  
                        </td>  
                        <td>  
                            <%# Item.Salary %>  
                        </td>  
                        <td>  
                            <%# Item.ContactNo %>  
                        </td>  
                        <td>  
                            <%# Item.Date_Of_Birth %>  
                        </td>  
                        <td>  
                            <asp:Button BackColor="#ff3399" CommandName="Edit" Text="Edit" tooltip="Edit a record" CausesValidation="false" runat="server" />  
                            <asp:Button BackColor="#ff3399" CommandName="Delete" tooltip="Delete a record" CausesValidation="false" onclientclick="javascript:return confirm('Are you sure to delete record?')" Text="Delete" runat="server" />  
                        </td>  
                    </tr>  
                </ItemTemplate>  
                <EditItemTemplate>  
                    <tr>  
                        <input type="hidden" name="EmpId" value="<%# Item.Id %>" />  
                        <td>EmpId:  
                            <asp:TextBox ID="txtEmpId" runat="server" TextMode="SingleLine" Text='<%# BindItem.Id%>' />  
                        </td>  
                        <td>FirstName:  
                            <asp:TextBox ID="txtFName" runat="server" TextMode="SingleLine" Text='<%# BindItem.FirstName %>' />  
                        </td>  
                        <td>LastName:  
                            <asp:TextBox ID="txtLName" runat="server" TextMode="SingleLine" Text='<%# BindItem.LastName %>' />  
                        </td>  
                        <td>Salary:  
                            <asp:TextBox ID="txtSalary" runat="server" TextMode="SingleLine" Text='<%# BindItem.Salary %>' />  
                        </td>  
                        <td>ContactNo:  
                            <asp:TextBox ID="txtContactNo" runat="server" TextMode="SingleLine" Text='<%# BindItem.ContactNo %>' />  
                        </td>  
                        <td>Date of Birth:  
                            <asp:TextBox ID="txtDOB" runat="server" TextMode="SingleLine" Text='<%# BindItem.Date_Of_Birth %>' />  
                        </td>  
                        <td>  
                            <asp:Button BackColor="#ff0066" CommandName="Update" Text="Update" CausesValidation="false" runat="server" />  
                            <asp:Button BackColor="#ff0066" CommandName="Cancel" Text="Cancel" CausesValidation="false" runat="server" />  
                        </td>  
                    </tr>  
                </EditItemTemplate>  
            </asp:ListView>  
            <hr style="color:darkblue" />  
            <div style="clear: both;">  
                <asp:DataPager ID="DataPager1" PagedControlID="EmployeeList" PageSize="2" runat="server">  
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
        <h3>Add Employee:</h3>  
        <table>  
            <tr>  
                <td>  
                    <asp:Label ID="LabelAddId" runat="server">ID:</asp:Label>  
                </td>  
                <td>  
                    <asp:TextBox ID="AddId" runat="server"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Text="* Id required." ControlToValidate="AddId" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>  
                </td>  
            </tr>  
            <tr>  
                <td>  
                    <asp:Label ID="LabelAddFName" runat="server">FirstName:</asp:Label>  
                </td>  
                <td>  
                    <asp:TextBox ID="AddFirstName" runat="server"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="* First name required." ControlToValidate="AddFirstName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>  
                </td>  
            </tr>  
            <tr>  
                <td>  
                    <asp:Label ID="LabelAddLName" runat="server">LastName:</asp:Label>  
                </td>  
                <td>  
                    <asp:TextBox ID="AddLastName" runat="server"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="* Last name required." ControlToValidate="AddLastName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>  
                </td>  
            </tr>  
            <tr>  
                <td>  
                    <asp:Label ID="LabelAddSalary" runat="server">Salary:</asp:Label>  
                </td>  
                <td>  
                    <asp:TextBox ID="AddSalary" runat="server"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="* Salary required." ControlToValidate="AddSalary" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>  
                </td>  
            </tr>  
            <tr>  
                <td>  
                    <asp:Label ID="LabelAddContactNo" runat="server">ContactNo:</asp:Label>  
                </td>  
                <td>  
                    <asp:TextBox ID="AddContactNo" runat="server"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="* ContactNo required." ControlToValidate="AddContactNo" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>  
                </td>  
            </tr>  
            <tr>  
                <td>  
                    <asp:Label ID="LabelAddDOB" runat="server">Date Of Birth:</asp:Label>  
                </td>  
                <td>  
                    <asp:TextBox ID="AddDOB" runat="server"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="* Date of Birth required." ControlToValidate="AddDOB" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>  
                </td>  
            </tr>  
        </table>  
        <p></p>  
        <p></p>  
        <asp:Button ID="AddEmployeeButton" runat="server" Text="Add Employee" OnClick="AddEmployeeButton_Click" CausesValidation="true" />  
        <p></p>  
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
</asp:Content>
