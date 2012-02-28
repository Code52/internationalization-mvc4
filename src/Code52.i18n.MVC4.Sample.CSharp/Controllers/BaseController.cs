namespace Code52.i18n.MVCFour.Sample.CSharp.Controllers
{
    using System.Threading;
    using System.Web;
    using System.Web.Mvc;

    using Code52Code;

    public abstract class BaseController : Controller {

        protected override System.IAsyncResult BeginExecute(System.Web.Routing.RequestContext requestContext, System.AsyncCallback callback, object state)
        {
            string cultureName = null;
            var request = requestContext.HttpContext.Request;
            HttpCookie cultureCookie = request.Cookies["_culture"];
            if (request.UserLanguages != null)
                cultureName = cultureCookie != null ? cultureCookie.Value : request.UserLanguages[0];
            cultureName = CultureHelper.GetImplementedCulture(cultureName);
            Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(cultureName);
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;

            return base.BeginExecute(requestContext, callback, state);
        }
    }
}