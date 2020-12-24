using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using WebApplication1.Database;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        
        private Db db = new Db();
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

       
        public IQueryable<Customers> GetSearchedItems([Control("txtSearch")] string search)
        {
            EnumerableQuery<Customers> searchResult = default;

            if (!string.IsNullOrEmpty(search))
            {
                List<Customers> returnList = db.SearchByName(search);

                if (returnList == null)
                {
                    return searchResult = new EnumerableQuery<Customers>(new List<Customers> { });
                }
                else
                    searchResult = new EnumerableQuery<Customers>(returnList);
                
            }
            else
            {
                List<Customers> allCustomers = db.GetAllCustomers();
                if (allCustomers == null)
                {
                    return searchResult = new EnumerableQuery<Customers>(new List<Customers> { });
                }
                else
                    searchResult = new EnumerableQuery<Customers>(allCustomers);
            }
            return searchResult;
        }

        public void UpdateCustomer(Customers updatedCustomer)
        {
            if(updatedCustomer==null)
            {
                Response.Write("<script>ModalMessage("+updatedCustomer+","+false+","+"Update"+","+"null value provided!"+")</script>");
                Response.Write("<script>Window.location.reload()</script>");
            }

            if(db.Update(updatedCustomer))
            {
                Response.Write("<script>ModalMessage(" + updatedCustomer + "," + true + "," + "Update" + "," + "success" + ")</script>");
                Response.Write("<script>Window.location.reload()</script>");
            }
            else
            {
                Response.Write("<script>ModalMessage(" + updatedCustomer + "," + false + "," + "Update" + "," + "success" + ")</script>");

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

        public void AddCustomer(object sender,EventArgs e)
        {
            Customers customer = new Customers();

           

            customer.Name = txtAddName.Text;
            customer.Address = txtAddAddress.Text;
            customer.City = txtAddCity.Text;
            customer.State = DropDownListAddState.SelectedValue;
            customer.Zip = inputAddZip.Value;

            if (customer == null)
            {
                
            }

            if(db.CreateEntry(customer))
            {
                string modalMessenger = "ModalMessage('customer','false','Add','Created!' )";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "ModalMessenger", modalMessenger, true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ReloadPage", "ReloadPage()", true);
            }
            else
            {
                
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Write("<script>Window.location.reload()</script>");

        }

        public void SelectedIndexChange(object sender,EventArgs e)
        {
            CustomerListView.DataBind();
            Response.Write("<script>Window.location.reload()</script>");

        }




    }
}