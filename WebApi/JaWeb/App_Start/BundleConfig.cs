using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace JaWeb
{
    public class BundleConfig
    {
        // For more information on Bundling, visit https://go.microsoft.com/fwlink/?LinkID=303951
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
                            "~/Scripts/WebForms/WebForms.js",
                            "~/Scripts/WebForms/WebUIValidation.js",
                            "~/Scripts/WebForms/MenuStandards.js",
                            "~/Scripts/WebForms/Focus.js",
                            "~/Scripts/WebForms/GridView.js",
                            "~/Scripts/WebForms/DetailsView.js",
                            "~/Scripts/WebForms/TreeView.js",
                            "~/Scripts/WebForms/WebParts.js"));

            bundles.Add(new ScriptBundle("~/bundles/JqueryBootstrapSeralizetoJsonValidate").Include("~/Scripts/jquery-3.5.1.js", "~/Scripts/bootstrap.min.js", "~/Scripts/jquery.serializeToJSON.js","~/Scripts/popper.min.js", "~/Scripts/jquery.dataTables.min.js", "~/Scripts/jquery.validate.js"));
            bundles.Add(new StyleBundle("~/bundles/SiteBootstrapDataTables").Include("~/Content/Site.css","~/Content/bootstrap.min.css", "~/Content/jquery.dataTables.min.css"));

            // Order is very important for these files to work, they have explicit dependencies
            bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include(
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

            bundles.Add(new StyleBundle("~/bundles/FontAwesome").Include(
                "~/Content/FontAwesome4/css/font-awesome.min.css"
                ));

            // Use the Development version of Modernizr to develop with and learn from. Then, when you’re
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                            "~/Scripts/modernizr-*"));
        }
    }
}