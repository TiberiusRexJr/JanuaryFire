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

        public void DeleteCustomer(Customers customers)

        {
            if (db.DeleteEntry(customers))
            {

            }
        }

        public void AddCustomer(Customers customers)
        {
            

            if (db.CreateEntry(customers))
            {
                
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

        protected void ButtonAddNewCustomer_Click(object sender, EventArgs e)
        {
            CustomersListView.InsertItemPosition = InsertItemPosition.FirstItem;
        }

        protected void ButtonCancelInsert_Click(object sender, EventArgs e)
        {
            CustomersListView.InsertItemPosition = InsertItemPosition.None;
        }

        protected void ObjectDataSourceCustomers_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            CustomersListView.InsertItemPosition = InsertItemPosition.None;
        }

        protected void KeyUp(object sender, EventArgs e)
        {

        }
    }
        
}