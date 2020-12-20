using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using WebApplication1.Models;
using WebApplication1.Utilities;


namespace WebApplication1.Database
{
    public class Database
    {
        #region Variables
        private readonly string dbRoot = HttpContext.Current.Server.MapPath("~/App_Data/");
        private OleDbConnection con = default;
        public ErrorHandling er = new ErrorHandling();
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

        #region CRUD


        #region Create
        public bool CreateEntry(Customers newCustomer)
        {
            bool status = false;
            int rowsAffect = default;
            string query = "INSERT into Customers(@Name,@Address,@City,@State,@Zip) VALUES(?,?,?,?,?)";

            OleDbCommand command = new OleDbCommand(query, con);
            command.Parameters.AddWithValue("@Name", newCustomer.Name);
            command.Parameters.AddWithValue("@Address", newCustomer.Address);
            command.Parameters.AddWithValue("@City", newCustomer.City);
            command.Parameters.AddWithValue("@State", newCustomer.State);
            command.Parameters.AddWithValue("@Zip", newCustomer.Zip);
            

            try
            {
                con.Open();
               rowsAffect= command.ExecuteNonQuery();
            }
            catch (OleDbException e)
            {
                er.ErrorheadOleDbException(e);
            }
            finally
            {
                con.Close();
            }

            if(rowsAffect>0)
            {
                status = true;
            }

            return status;
        }
        #endregion

        #region Retrieve
        public List<Customers> GetAllCustomers()
        {
            List<Customers> customers = new List<Customers>();

            return customers;
        }
        #endregion

        #region Update

        #endregion

        #region Delete

        #endregion
        #endregion

        #region TableInfo
        List<string> GetColumnHeaders()
        {
            List<string> columnHeaders = new List<string>();


            return columnHeaders;
        }
        #endregion

        #endregion
    }
}