using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;

namespace WebApplication1.Utilities
{
    public class ErrorHandling
    {

        public void ErrorheadOleDbException(OleDbException exception)
        {
            for (int i = 0; i < exception.Errors.Count; i++)
            {
                Console.WriteLine("OLEDB_EXCEPTION");
                Console.WriteLine("Index #" + i + "\n" +
                    "Message: " + exception.Errors[i].Message + "\n" +
                    "Native: " + exception.Errors[i].NativeError.ToString() + "\n" +
                    "Source: " + exception.Errors[i].Source + "\n" +
                    "SQL: " + exception.Errors[i].SQLState + "\n");
            }
        }
    }
}