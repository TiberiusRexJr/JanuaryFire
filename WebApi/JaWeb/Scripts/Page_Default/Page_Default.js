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

const apiType = { "POST": "Post", "GET": "Get", "PUT": "Put", "DELETE": "Delete" }
Object.freeze(apiType);

$(document).ready(function()
{
    $("#buttonCancel").on("click", function () {
        $('#formAddCustomer').trigger("reset");
       
        $("#collapseAddCustomer").collapse('toggle');
    });

    

});

function AddCustomerSubmit()
{
    let customer = new Customer($("#inputName").val(), $("#inputAddress").val(), $("#inputCity").val(), $("#selectState").val(), $("#inputZip").val());

    AjaxApi(customer, apiType.POST);    
}

function AjaxApi(data, apiType)
{

    var sendToApiAddress = "";

    if (data == null || apiType == null)
    {
        ModalMessenger(data, false, apiType, "null parameters provided");
    }

    switch (apiType)
    {
        case "Get":
            break;
        case "Post":
            break;
        case "Delete":
            break;
        case "Put":
            break;
        default: ModalMessenger(apiType, false, apiType, "could not determine Ajax Type");
            break;
    }

}

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


