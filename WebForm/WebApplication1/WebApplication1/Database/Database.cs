using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using WebApplication1.Models;
using WebApplication1.Utilities;
using System.Web.UI;

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
            List<OleDbCommand> commands = new List<OleDbCommand>();

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
          

            string query = "SELECT * FROM Customers";

            OleDbCommand command = new OleDbCommand(query, con);
             try
            {
                con.Open();
                OleDbDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        Customers customer= new Customers();

                        customer.CustomerID = reader.GetInt32(0);
                        customer.Name = reader.GetString(1);
                        customer.Address = reader.GetString(2);
                        customer.City = reader.GetString(3);
                        customer.State = reader.GetString(4);
                        customer.Zip = reader.GetInt32(5);

                        customers.Add(customer);
                    }
                    reader.Close();
                }
                else return customers = null;
            }
            catch (OleDbException e)
            {
                er.ErrorheadOleDbException(e);
            }
            finally
            {
                con.Close();
            }
            return customers;
        }

        public Customers GetCustomer(Customers customer)
        {
            Customers returnCustomer = new Customers();
            string query = "Select* FROM Customers WHERE CustomerID==@Id";

            OleDbCommand command = new OleDbCommand(query, con);
            command.Parameters.AddWithValue("@Id", customer.CustomerID);


            try
            {
                con.Open();
            OleDbDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {

                    while (reader.Read())
                    {

                        returnCustomer.CustomerID = reader.GetInt32(0);
                        returnCustomer.Name = reader.GetString(1);
                        returnCustomer.Address = reader.GetString(2);
                        returnCustomer.City = reader.GetString(3);
                        returnCustomer.State = reader.GetString(4);
                        returnCustomer.Zip = reader.GetInt32(5);
                    }
                    reader.Close();

                }
                else return returnCustomer = null;
            }
            catch (OleDbException e)
            {
                er.ErrorheadOleDbException(e);
            }
            finally
            {
                con.Close();
            }

            return returnCustomer;
        }
        #endregion

        #region Update
        public bool Update(Customers customers)
        {
            bool status = false;
            try
            {

            }
            catch (OleDbException e)
            {
                er.ErrorheadOleDbException(e);
            }
            finally
            {
                con.Close();
            }
            return status;
        }
        #endregion

        #region Delete
        public bool DeleteEntry(Customers customer)
        {
            bool status = false;
            string query = "Delete FROM Customers WHERE CustomerID==@Id";

            if(customer==null)
            {
                return status;
            }
            try
            {

            }
            catch (OleDbException e)
            {
                er.ErrorheadOleDbException(e);
            }
            finally
            {
                con.Close();
            }



            return status;
        }
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