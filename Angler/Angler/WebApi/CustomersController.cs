using Microsoft.AspNetCore.Mvc;
using System;
using System.Net;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Angler.Models;
using Angler.WebApi;
using Microsoft.AspNetCore.Http;
using Angler.Database;
using Microsoft.AspNetCore.Hosting;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Angler.WebApi
{
    
    [ApiController]
    public class CustomersController : ControllerBase
    {
        private readonly IWebHostEnvironment _env;
        private Db db;

        public CustomersController(IWebHostEnvironment env)
        {
            _env = env;
            db = new Db(_env);
        }
        

        [HttpGet]
        [Route("api/Customers/GetCustomers")]
        public ResponseMessage<List<Customers>> GetCustomers()
        {
            ResponseMessage<List<Customers>> responseMessage = new ResponseMessage<List<Customers>>();

            try
            {
                List<Customers> customers = db.GetAllCustomers();

                responseMessage.status = HttpStatusCode.OK;
                responseMessage.returnData = customers;

            }
            catch (Exception e)
            {
                responseMessage.status = HttpStatusCode.InternalServerError;
                responseMessage.returnData = null;
            }

            return responseMessage;

        }

        [HttpPost]
        [Route("api/Customers/PostCustomer/customer")]
        public ResponseMessage<Customers> PostCustomer([FromBody] Customers customer)
        {
            ResponseMessage<Customers> responseMessage = new ResponseMessage<Customers>();

            if (customer == null)
            {
                responseMessage.returnData = null;
                responseMessage.status = HttpStatusCode.BadRequest;
                return responseMessage;
            }
            try
            {
                if (db.CreateEntry(customer))
                {
                    responseMessage.returnData = customer;
                    responseMessage.status = HttpStatusCode.Created;
                }
                else
                {
                    responseMessage.returnData = null;
                    responseMessage.status = HttpStatusCode.InternalServerError;
                }
            }
            catch (Exception e)
            {

            }
            return responseMessage;
        }

        [HttpDelete]
        [Route("api/Customers/DeleteCustomer/customers")]
        public ResponseMessage<bool> DeleteCustomer([FromBody] List<Customers> customers)
        {
            ResponseMessage<bool> responseMessage = new ResponseMessage<bool>();

            if (customers == null)
            {
                responseMessage.returnData = false;
                responseMessage.status = HttpStatusCode.BadRequest;
            }
            try
            {
                if (db.DeleteEntry(customers))
                {
                    responseMessage.returnData = true;
                    responseMessage.status = HttpStatusCode.OK;
                }
                else
                {
                    responseMessage.returnData = false;
                    responseMessage.status = HttpStatusCode.InternalServerError;
                }
            }
            catch (Exception e)
            {
                responseMessage.returnData = false;
                responseMessage.status = HttpStatusCode.InternalServerError;
            }
            return responseMessage;
        }

        [HttpPut]
        [Route("api/Customers/UpdateCustomer/customer")]
        public ResponseMessage<Customers> UpdateCustomer([FromBody] Customers customer)
        {
            ResponseMessage<Customers> responseMessage = new ResponseMessage<Customers>();

            if (customer == null)
            {
                responseMessage.returnData = null;
                responseMessage.status = HttpStatusCode.BadRequest;
            }
            try
            {
                if (db.Update(customer))
                {
                    responseMessage.returnData = customer;
                    responseMessage.status = HttpStatusCode.OK;
                }
                else
                {
                    responseMessage.returnData = null;
                    responseMessage.status = HttpStatusCode.InternalServerError;
                }
            }
            catch (Exception e)
            {
                responseMessage.returnData = null;
                responseMessage.status = HttpStatusCode.InternalServerError;
            }
            return responseMessage;
        }

    }


}
