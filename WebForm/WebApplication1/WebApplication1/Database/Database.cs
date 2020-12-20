using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;

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

        }
        #endregion
        #region Functions

        #endregion
    }
}