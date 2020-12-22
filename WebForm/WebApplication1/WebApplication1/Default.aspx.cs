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
            }
        }


    }
}