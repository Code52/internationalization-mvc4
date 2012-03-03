namespace Code52.i18n.MVCFour.Sample.CSharp.Controllers
{
    using System;
    using System.Threading;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Routing;

    using Code52Code;

    public abstract class BaseController : Controller {

        protected override IAsyncResult BeginExecute(RequestContext requestContext, AsyncCallback callback, object state)
        {
            var request = requestContext.HttpContext.Request;
            string cultureName = null;
            var cultureCookie = request.Cookies["_culture"];
            if (request.UserLanguages != null)
                cultureName = cultureCookie != null ? cultureCookie.Value : request.UserLanguages[0];
            cultureName = CultureHelper.GetImplementedCulture(cultureName); // This is safe
            Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(cultureName);
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;

            return base.BeginExecute(requestContext, callback, state);
        }
    }
}