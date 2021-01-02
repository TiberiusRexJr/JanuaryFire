using JaWeb.Database;
using System;
using JaWeb.Models;
using System.Diagnostics;
using System.Web;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
using System.Collections;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.IO;

namespace JaWeb.Api
{
    public class CustomersController:ApiController
    {
        #region Variables
        private Db db = new Db();
        #endregion

        #region Methods

        [HttpGet]
        [Route("api/Customers/GetCustomers")]
        public ResponseMessage<List<Customers>> GetCustomers()
        {
            ResponseMessage<List<Customers>> responseMessage = new ResponseMessage<List<Customers>>();

            try
            {
                List<Customers> customers= db.GetAllCustomers();

                    responseMessage.status = HttpStatusCode.OK;
                    responseMessage.returnData = customers;
                
            }
            catch(Exception e)
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

            if(customer==null)
            {
                responseMessage.returnData = null;
                responseMessage.status = HttpStatusCode.BadRequest;
                return responseMessage;
            }
            try
            {
                if(db.CreateEntry(customer))
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
            catch(Exception e)
            {
                
            }
            return responseMessage;
        }

        [HttpDelete]
        [Route("api/Customers/DeleteCustomer/customer")]
        public ResponseMessage<Customers> DeleteCustomer([FromBody] Customers customer)
        {
            ResponseMessage<Customers> responseMessage = new ResponseMessage<Customers>();

            if (customer == null)
            {
                responseMessage.returnData = null;
                responseMessage.status = HttpStatusCode.BadRequest;
            }
            try
            {
                if (db.DeleteEntry(customer))
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
        #endregion
    }
}