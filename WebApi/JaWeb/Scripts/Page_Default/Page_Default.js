class Customer
{
    constructor(Name, Address, City, State, Zip)
    {
        this.Name = Name;
        this.Address = Address;
        this.City = City;
        this.State = State;
        this.Zip = Zip;
         
    }
}

const RequestType = { "POST": "Post", "GET": "Get", "PUT": "Put", "DELETE": "Delete" }
Object.freeze(RequestType);

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

function AjaxApi(data, apiType)
{

    var sendToAdress = "https://localhost:44309/";

    let apiPost = "api/Customers/PostCustomer/customer";
    let apiPut = "api/Customers/UpdateCustomer/customer";
    let apiDelete = "api/Customers/DeleteCustomer/customer";

    var requestType = "";

    if (data == null || apiType == null)
    {
        ModalMessenger(data, false, apiType, "null parameters provided");
    }

    switch (apiType)
    {
        case "Post": sendToAdress + apiPost; requestType = RequestType.POST;
            break;
        case "Delete": sendToAdress + apiDelete; requestType = RequestType.DELETE;
            break;
        case "Put": sendToAdress + apiPut; requestType = RequestType.PUT;
            break;
        default: ModalMessenger(apiType, false, apiType, "could not determine Ajax Type");
            break;
    }

    $.ajax({

        type: requestType,
        url: sendToAdress,
        data: data,
        success: function () { },
        statusCode:
        {
            400: ModalMessenger(data.Name, false, apiType, "Bad Data sent"),

            500: ModalMessenger(data.Name, false, apiType, "Success"),

            200: ModalMessenger(data.Name, true, apiType, "Success"),

            201: ModalMessenger(data.Name, true, apiType, "Success")
        },
        error: function (response, jqXHR, data) {
            ModalMessenger(data, false, apiType, "Ajax Error");
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



        var table = $('#dataTableInventory').DataTable(
            {
                responsive: true,
                columns: columnsArray,
                columnDefs: [
                    {
                        'targets': 0,
                        "render": function (CustomerID, type, row) {
                            return '<a class="btn btn-primary bg-warning" href="#" id="" role="button"  onclick="AjaxEditRecord(event,' + CustomerID + ')"><i class="fas fa-edit"></i></a>' + CustomerID;
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


