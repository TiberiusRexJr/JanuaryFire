﻿using System.Web;
using System.Web.Optimization;

namespace MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
           

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/BootstrapJs").Include(
                            "~/Scripts/BootstrapJs/bootstrap.min.js",
                            "~/Scripts/BootstrapJs/popper.min.js",
                            "~/Scripts/jquery-3.5.1.js"
                            ));

            bundles.Add(new StyleBundle("~/bundles/BootstrapCss").Include(
                 "~/Content/BootstrapCss/bootstrap.min.css"
                 ));

            bundles.Add(new StyleBundle("~/bundles/FontAwesome").Include(
                "~/Content/FontAwesome4/css/font-awesome.min.css"
                ));
        }
    }
}
