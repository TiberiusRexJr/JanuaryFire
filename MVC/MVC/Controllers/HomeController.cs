using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVC.Database;
using MVC.Models;
using PagedList;

namespace MVC.Controllers
{
    public class HomeController : Controller
    {
        private Db db = new Db(); 
        public ActionResult Index(int? page)
        {
            List<Customers> allCustomers = db.GetAllCustomers();

            int pageSize = 10;
            int pageIndex = 1;

            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;

            IPagedList<Customers> pagedCustomers = allCustomers.ToPagedList(pageIndex, pageSize); 

            return View(pagedCustomers);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult EditCustomer(Customers customers)
        {
            //string currentState = customers.State;

            //SelectListItem stateListItem = new SelectListItem { Selected = true, Text =currentState, Value = currentState };
            //List<SelectListItem> stateList = new List<SelectListItem>();
            //stateList = Customers.stateList;
            //stateList.Add(stateListItem);

            //customers.States= new SelectList(stateList, "Value", "Text");




            return View(customers);
        }
        
        public ActionResult DeleteCustomer(Customers customers)
        {

            return View(customers);
        }

        [HttpPost]
        public ActionResult EditCustomerSave(Customers customers)
        {
            if(!ModelState.IsValid)
            {
                TempData["ErrorMessage"] = "Model State Invalid, please enter all fields correctly and Try again";

                return RedirectToAction("FailureView", "Home", customers);


            }

            if (db.Update(customers))
            {
                TempData["SuccessMessage"] = "SuccessFully Updated";
                return RedirectToAction("SuccessView", "Home", customers);


            }

            else
            {
                TempData["ErrorMessage"] = "Update Failed";

                return RedirectToAction("FailureView", "Home", customers);

            }


        }

       public ActionResult AddCustomerView()
        {
            Customers customers = new Customers();
                
            return View(customers);
        }

        public ActionResult DeleteCustomerDelete(Customers customers)
        {
            if (!ModelState.IsValid)
            {
                TempData["ErrorMessage"] = "Model State Invalid, please enter all fields correctly and Try again";

                return RedirectToAction("FailureView", "Home", customers);


            }

            if (db.DeleteEntry(customers))
            {
                TempData["SuccessMessage"] = "Deleted!";
                return RedirectToAction("SuccessView", "Home", customers);


            }

            else
            {
                TempData["ErrorMessage"] = "Delete Failed";

                return RedirectToAction("FailureView", "Home", customers);

            }
        }

        [HttpPost]
        public ActionResult AddCustomerSubmit(Customers customers)
        {
            if (!ModelState.IsValid)
            {
                TempData["ErrorMessage"] = "Model State Invalid, please enter all fields correctly and Try again";

                return RedirectToAction("FailureView", "Home", customers);


            }

            if (db.CreateEntry(customers))
            {
                TempData["SuccessMessage"] = "SuccessFully Updated";
                return RedirectToAction("SuccessView", "Home", customers);


            }

            else
            {
                TempData["ErrorMessage"] = "Update Failed";

                return RedirectToAction("FailureView", "Home", customers);

            }
        }
        #region SuccessViews
        public ActionResult SuccessView(Customers customers)
        {
            return View(customers);
        }

  

        #endregion

        #region FailViews
        public ActionResult FailureView(Customers customers)
        {
            return View(customers);
        }
      
        #endregion

    }
}