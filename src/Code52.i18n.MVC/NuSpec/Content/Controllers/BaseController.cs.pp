namespace $rootnamespace$.Controllers
{
    using System.Threading;
    using System.Web.Mvc;
    using System.Web.Routing;
    using Code52.i18n;

    public abstract class BaseController : Controller 
    {
        protected override void Execute(RequestContext requestContext)
        {
            var request = requestContext.HttpContext.Request;
            string cultureName = null;
            var cultureCookie = request.Cookies["_culture"];
            if (request.UserLanguages != null)
                cultureName = cultureCookie != null ? cultureCookie.Value : request.UserLanguages[0];
            cultureName = CultureHelper.GetImplementedCulture(cultureName); // This is safe
            Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(cultureName);
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;

            base.Execute(requestContext);
        }
    }
}