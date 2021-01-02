class Customer
{
    constructor(Id,Name, Address, City, State, Zip)
    {
        this.CustomerID = Id;
        this.Name = Name;
        this.Address = Address;
        this.City = City;
        this.State = State;
        this.Zip = Zip;
         
    }
}

const RequestType = { "POST": "Post", "GET": "Get", "PUT": "Put", "DELETE": "Delete" }
Object.freeze(RequestType);

const CRUDType = { "EDIT": "Edit", "UPDATE":"Update", "DELETE":"Delete", "CREATE":"Create" }
Object.freeze(CRUDType);

$(document).ready(function()
{
    $("#buttonCancel").on("click", function () {
        $('#formAddCustomer').trigger("reset");
       
        $("#collapseAddCustomer").collapse('toggle');
    });

    AjaxGet();
    

});

function AddCustomerSubmit()
{
    let customer = new Customer($("#inputName").val(), $("#inputAddress").val(), $("#inputCity").val(), $("#selectState").val(), $("#inputZip").val());

    
    AjaxApi(customer, RequestType.POST);    
}

function EditCustomer(event, Id)
{
    var table = $('#dataTableInventory').DataTable();

    $('.dataTableInventoryRow').removeClass('selected');

    $("#" + event.currentTarget.id).toggleClass('selected');

    var RowData = table.row('#' + Id).data();
   

    ModalCrDisplay(CRUDType.EDIT,RowData);

}

function DeleteCustomer()
{
    table = $("#dataTableInventory").DataTable();
    var rowsSelected = table.rows('.selected').data();

    if (rowsSelected === undefined || rowsSelected.length == 0)
    {
        ModalMessenger("Nothing to Delete!", false, "Delete", "Please Select a row or Rows");

    }
    else {

        
        var idsToDelete= new Array(rowsSelected.length);

        $.each(rowsSelected, function (index, record)
        {
            idsToDelete[index] = record;
        });

        var deleteList = new JSONArray(idsToDelete);
        AjaxApi(deleteList, RequestType.DELETE);    

    }

}

function AddCustomer()
{
    let customer = new Customer("","", "", "", "", "");

    ModalCrDisplay(CRUDType.CREATE,customer);
}

function ModalCrSubmit()
{
    let customer = new Customer($("#Modal_CR_Id").val(),$("#Modal_CR_Name").val(), $("#Modal_CR_Address").val(), $("#Modal_CR_City").val(), $("#Modal_CR_State").val(), $("#Modal_CR_Zip").val());
    let requestType = $("#inputCRType").val();

    AjaxApi(customer, requestType);
}

function ModalCRCancel()
{
    $('#form_Modal_CR').trigger("reset");
    $("#Modal_CR").modal('hide');
}

function ModalCrDisplay(CRType,CustomerObj)
{
    var ModalCrSubTitle = "";

    var ModalEdit = "<h4 class='modalCrSubTitleDynamic'><i class='fa fa-user-edit'></i>Edit</h4>";
    var ModalCreate = "<h4 class='modalCrSubTitleDynamic'><i class='fa fa-user-plus modalCrSubTitleDynamic'></i>Add</h4>";
    var inputCRTypeVal = "";

    switch (CRType)
    {
        case "Edit": ModalCrSubTitle = ModalEdit; inputCRTypeVal = RequestType.PUT;
            break;
        case "Create": ModalCrSubTitle = ModalCreate; inputCRTypeVal = RequestType.POST;
            break;
    }


    $("#selectOptionCurrentState").remove();
    $(".modalCrSubTitleDynamic").remove();



    $("#Modal_CR_Id").val(CustomerObj.CustomerID);
    $("#Modal_CR_Name").val(CustomerObj.Name);
    $("#Modal_CR_Address").val(CustomerObj.Address);
    $("#Modal_CR_City").val(CustomerObj.City);
    $("#Modal_CR_State").append("<option selected id='selectOptionCurrentState' value='" + CustomerObj.State +"'>" + CustomerObj.State + "<p class='font-weight-bold'>(Current)</p>" + "</option>");
    $("#Modal_CR_Zip").val(CustomerObj.Zip);





    $("#Modal_CR_SubHeader").append(ModalCrSubTitle);
    $("#inputCRType").val(inputCRTypeVal);

    $("#Modal_CR").modal("show");
}

function AjaxApi(customerData, apiType)
{
    

    var sendToAdress = "https://localhost:44309/";

    let apiPost = "api/Customers/PostCustomer/customer";
    let apiPut = "api/Customers/UpdateCustomer/customer";
    let apiDelete = "api/Customers/DeleteCustomer/customers";

    var requestType = "";

    if (customerData == null || apiType == null)
    {
        ModalMessenger(customerData, false, apiType, "null parameters provided");
    }

    switch (apiType)
    {
        case "Post": sendToAdress += apiPost; requestType = RequestType.POST;
            break;
        case "Delete": sendToAdress += apiDelete; requestType = RequestType.DELETE;
            break;
        case "Put": sendToAdress += apiPut; requestType = RequestType.PUT;
            break;
        default: ModalMessenger(apiType, false, apiType, "could not determine Ajax Type");
            break;
    }
   

    $.ajax({
        type: requestType,
        url: sendToAdress,
        data: customerData,
        success: function () { },
        statusCode:
        {
            400: function () { ModalMessenger("Null!", false, apiType, "Bad Data sent") },

            500: function () { ModalMessenger("500", false, apiType, "Internal Server Error")},

            200: function () { AjaxGet(); ModalMessenger(customerData, true, apiType, "Success"); $("#Modal_CR").modal('hide'); },

            201: function () { AjaxGet(); ModalMessenger(customerData, true, apiType, "Created"); $("#Modal_CR").modal('hide'); }
        },
        error: function (response, jqXHR, data) {
            ModalMessenger("error", false, apiType, "Ajax Error");
        }

    });

};

function AjaxGet()
{
    let sendToAdress = "https://localhost:44309/api/Customers/GetCustomers";



    $.ajax({

        type: "Get",
        url: sendToAdress,
        success: function (response, jqXHR, data) {

            IntializeDatatable(data.responseJSON);
        },
        error: function (response, jqXHR, data)
        {
            ModalMessenger(data, false, apiType, "Ajax Error");
        }

    });



}

function IntializeDatatable(data) {
    
    if (data == null) {
        ModalMessenger("InitialzizeDatable", false, "GET", "data passed to IntialzieDatable was NULL");
    }
 
    if (data.length > 0)
    {
        if ($.fn.DataTable.isDataTable('#dataTableInventory'))
        {

            $('#dataTableInventory').DataTable().destroy();
        }



        //todo Individual Objects
        var indiviaulObj = data[0];

        //todo Keys
        var keys = Object.keys(indiviaulObj);

        //todo columnArrays
        var columnsArray = new Array(keys.length);

        $("#dataTableInventoryThead_Tr").empty();
        $.each(keys, function (index, key) {
            columnsArray[index] = {
                data: key, title: key
            };

            $("#dataTableInventoryThead_Tr").append('<th> </th>');
        })

        var tableType = "Customers";

        var table = $('#dataTableInventory').DataTable(
            {
                responsive: true,
                columns: columnsArray,
                columnDefs: [
                    {
                        'targets': 0,
                        "render": function (CustomerID, type, row) {
                            return '<a class="btn btn-primary bg-warning mx-1 my-1" href="#" id="' + tableType + '" role="button"  onclick="EditCustomer(event,' + CustomerID + ')"><i class="fa fa-edit"></i></a>' + CustomerID;
                        },
                    }
                ],
                rowId: function (data) { return data.CustomerID },
                createdRow: function (row, data, dataIndex) {
                    $(row).addClass('dataTableInventoryRow');

                },
                select: {
                    'style': 'multi'
                },
                retrieve: true,
                data: data,
                select: "multi",
                autoWidth: true,
                pageLength: data.length,

            });

        $('.dataTableInventoryRow').on('click', this, function () {
            $("#" + this.id).toggleClass('selected');
        });


    }
    else {
        var table = $('#dataTableInventory').DataTable();
        table.clear();
        table.destroy();
        $('#dataTableInventoryThead_Tr').empty();
        $("#dataTableInventoryThead_Tr").append('<th> </th>');

        var table2 = $('#dataTableInventory').DataTable();

        console.log("hi from empty");
    }


};

function ModalMessenger(data, successStatus, crudType, serverMessage) {
    var successOrFailureMessage = " ";
    var successOrFailureMessageHeader = " ";



    if (data == null || successStatus === false) {
        $("#ModalAdminMessengerHeader").removeClass("bg-success");
        $("#ModalAdminMessengerHeader").addClass("bg-danger");

        $("#ModalAdminMessengerHeader").empty()
        $("#ModalAdminMessengerBody").empty()


        successOrFailureMessage = "UnSuccessfully";
        successOrFailureMessageHeader = "Failed" + "(" + serverMessage + ")";
    }
    else if (successStatus === true) {
        $("#ModalAdminMessengerHeader").removeClass("bg-danger");
        $("#ModalAdminMessengerHeader").addClass("bg-success");

        $("#ModalAdminMessengerHeader").empty()
        $("#ModalAdminMessengerBody").empty()

        successOrFailureMessage = "Successfully";
        successOrFailureMessageHeader = "Success!";

    }

    var htmlModalBodyElementMessage = '<p class="text-justify">' + data.Name + '" "' + crudType + '" "' + successOrFailureMessage + '</p>';

    var htmlModalBodyElementHeader = '<h4>' + successOrFailureMessageHeader + '</h4>';


    $("#ModalAdminMessengerBody").append(htmlModalBodyElementMessage);
    $("#ModalAdminMessengerHeader").append(htmlModalBodyElementHeader);

    $('#ModalAdminMessenger').modal('show');
    $('#ModalAdminMessenger').modal('hide');

}


