using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace JaWeb.Models
{
    public class Customers 
    {
        #region Variables
        public List<Customers> customersList;
        #endregion

        #region Properties

        [Required]
        [Display(Name = "Customer ID")]
        [DataType(DataType.Text)]
        public int CustomerID { get; set; }

        [Required]
        [Display(Name = "Name")]
        [DataType(DataType.Text)]
        public string Name { get; set; }

        [Required]
        [Display(Name = "Address")]
        [DataType(DataType.Text)]
        public string Address { get; set; }

        [Required]
        [Display(Name = "City")]
        [DataType(DataType.Text)]
        public string City { get; set; }


        [Display(Name = "State")]
        [DataType(DataType.Text)]
        public string State { get; set; }

        [Required]
        [Display(Name = "Zip")]
        [DataType(DataType.Text)]
        public string Zip { get; set; }

        #endregion



        


        

    }
}