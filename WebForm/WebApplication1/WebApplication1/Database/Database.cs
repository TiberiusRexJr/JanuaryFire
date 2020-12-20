using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using WebApplication1.Models;

namespace WebApplication1.Database
{
    public class Database
    {
        #region Variables
        private readonly string dbRoot = HttpContext.Current.Server.MapPath("~/App_Data/");
        private OleDbConnection con = default;
        #endregion
        #region Properties

        #endregion
        #region NestedClasses

        #endregion
        #region Constructors
        public Database()
        {
            OleDbConnectionStringBuilder builder = new OleDbConnectionStringBuilder();

            builder.Provider = "Microsoft.Jet.OLEDB.4.0;";
            builder.DataSource = dbRoot + "CustomersDb.mdb";
            builder.PersistSecurityInfo = true;

            con = new OleDbConnection(builder.ConnectionString);
        }
        #endregion
        #region Functions
        /*todo C.R.U.D */

        public Customers CreateEntry(Customers newCustomer)
        {
            Customers returnCustomer = default;


            return returnCustomer;
        }
        #endregion
    }
}