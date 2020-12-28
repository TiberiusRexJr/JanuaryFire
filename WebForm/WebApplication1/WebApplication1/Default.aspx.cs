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


        public void UpdateCustomer(Customers updatedCustomer)
        {
            if (updatedCustomer == null)
            {
                Response.Write("<script>ModalMessage(" + updatedCustomer + "," + false + "," + "Update" + "," + "null value provided!" + ")</script>");
            }

            if (db.Update(updatedCustomer))
            {
                
            }
            else
            {
                
            }
        }

        public void DeleteCustomer(int? CustomerID)

        {
            if (db.DeleteEntry(CustomerID))
            {

            }
        }

        public void AddCustomer(object sender, EventArgs e)
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

            if (db.CreateEntry(customer))
            {
                string modalMessenger = "ModalMessage('customer','false','Add','Created!' )";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "ModalMessenger", modalMessenger, true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ReloadPage", "ReloadPage()", true);
            }
            else
            {

            }

        }


        public ICollection<Customers> GetAllCustomer()
        {
            ICollection<Customers> searchResult = default;

            searchResult = db.GetAllCustomers();

            
            return searchResult;

        }

        protected void ObjectDataSourceCustomers_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            System.Console.WriteLine(e.ToString());
        }

        protected void CustomersListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            if(!IsPostBack)
            {
                CustomersListView.EditIndex = -1;
                CustomersListView.InsertItemPosition = InsertItemPosition.LastItem;
            }
        }

        protected void ObjectDataSourceCustomers_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            System.Console.WriteLine(e.ToString());
        }
    }
        
}