using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using WebApplication1.Database;
using WebApplication1.Models;
using System.Data.OleDb;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        private Db db = new Db();
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

       
        public List<Customers> GetSearchedItems([Control("txtSearch")] string search)
        {
            List<Customers> searchResult = default;

            if (!string.IsNullOrEmpty(search))
            {
                searchResult = db.SearchByName(search);
                if(searchResult==null)
                {
                    return searchResult = null;
                }
                
            }
            return searchResult;
        }

        public void UpdateCustomer(Customers updatedCustomer)
        {
            if(updatedCustomer==null)
            {
                Response.Write("<script>ModalMessage()</script>");
                Response.Write("<script>Window.location.reload()</script>");
            }

            if(db.Update(updatedCustomer))
            {
                Response.Write("<script>ModalMessage()</script>");
                Response.Write("<script>Window.location.reload()</script>");
            }
            else
            {
                Response.Write("<script>ModalMessage()</script>");

                Response.Write("<script>Window.location.reload()</script>");
            }
        }
        
        public void DeleteCustomer(Customers customer)
        {
            if(customer==null)
            {
                Response.Write("<script>ModalMessage()</script>");
                Response.Write("<script>Window.location.reload()</script>");
            }

            if(db.DeleteEntry(customer))
            {
                Response.Write("<script>ModalMessage()</script>");
                Response.Write("<script>Window.location.reload()</script>");
            }
            else
            {
                Response.Write("<script>ModalMessage()</script>");
                Response.Write("<script>Window.location.reload()</script>");
            }
        }

        public void AddCustomer(Customers customer)
        {
            if (customer == null)
            {
                Response.Write("<script>ModalMessage()</script>");
                Response.Write("<script>Window.location.reload()</script>");
            }

            if(db.CreateEntry(customer))
            {
                Response.Write("<script>ModalMessage()</script>");
                Response.Write("<script>Window.location.reload()</script>");
            }
            else
            {
                Response.Write("<script>ModalMessage()</script>");
                Response.Write("<script>Window.location.reload()</script>");
            }

        }

        public List<Customers> GetAllCustomer( )
        {
            List<Customers> customers = default;

            customers = db.GetAllCustomers();

            return customers;
        }
    }
}