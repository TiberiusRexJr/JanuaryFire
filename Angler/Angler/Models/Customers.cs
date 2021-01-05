using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Angler.Models
{
    public class Customers : IEnumerable
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



      

        #region NestedClasses
        public class CustomersEnumerator : IEnumerator
        {
            List<Customers> customersEnumerationList;

            int position = -1;

            public CustomersEnumerator(List<Customers> customers)
            {
                customersEnumerationList = customers;

            }

            public object Current
            {
                get
                {
                    try
                    {
                        return customersEnumerationList[position];
                    }
                    catch (IndexOutOfRangeException)
                    {
                        throw new InvalidOperationException();
                    }
                }
            }

            public bool MoveNext()
            {
                position++;
                return (position < customersEnumerationList.Count);
            }

            public void Reset()
            {
                position = -1;
            }
        }
        #endregion


        #region IEnumerator Implementation
        // Implementation for the GetEnumerator method.
        IEnumerator IEnumerable.GetEnumerator()
        {
            return (IEnumerator)GetEnumerator();
        }

        public CustomersEnumerator GetEnumerator()
        {
            return new CustomersEnumerator(customersList);
        }
        #endregion

    }
}