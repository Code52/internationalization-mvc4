using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Code52.i18n.MVCFour.Sample.CSharp.Resources;
using Code52.i18n.MVCFour.Sample.CSharp.Code52Code;
using ModelMetadataExtensions;

namespace Code52.i18n.MVCFour.Sample.CSharp
{

    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute("Language", "i18n/Code52.i18n.language.js", new { controller = "Language", action = "Language" });
            routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);

            BundleTable.Bundles.RegisterTemplateBundles();

        }

        public override string GetVaryByCustomString(HttpContext context, string arg)
        {
            // It seems this executes multiple times and early, so we need to extract language again from cookie.
            if (arg == "culture") // culture name (e.g. "en-US") is what should vary caching
            {
                string cultureName = null;
                // Attempt to read the culture cookie from Request
                HttpCookie cultureCookie = this.Request.Cookies["_culture"];
                if (cultureCookie != null)
                    cultureName = cultureCookie.Value;
                else if (this.Request.UserLanguages != null)
                    cultureName = this.Request.UserLanguages[0]; // obtain it from HTTP header AcceptLanguages

                // Validate culture name
                cultureName = CultureHelper.GetImplementedCulture(cultureName); // This is safe

                return cultureName.ToLower(); // use culture name as cache key, "es", "en-us", "es-cl", etc.
            }

            return base.GetVaryByCustomString(context, arg);
        }

    }
}