using System.Threading;
using System.Web.Mvc;

namespace Sample.CSharp.MVC3.Razor
{
    public class LanguageFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var request = filterContext.HttpContext.Request;
            string cultureName = null;
            var cultureCookie = request.Cookies["_culture"];
            if (request.UserLanguages != null)
                cultureName = cultureCookie != null ? cultureCookie.Value : request.UserLanguages[0];
            cultureName = CultureHelper.GetImplementedCulture(cultureName); // This is safe
            Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(cultureName);
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;

            base.OnActionExecuting(filterContext);
        }
    }
}