namespace Code52.i18n.MVCFour.Sample.CSharp.Controllers
{
    using System.Threading;
    using System.Web;
    using System.Web.Mvc;

    using Code52.i18n.MVCFour.Sample.CSharp.Code52Code;

    public abstract class BaseController : Controller {
        protected override void ExecuteCore() {
            string cultureName = null;
            HttpCookie cultureCookie = this.Request.Cookies["_culture"];
            if (this.Request.UserLanguages != null)
                cultureName = cultureCookie != null ? cultureCookie.Value : this.Request.UserLanguages[0];
            cultureName = CultureHelper.GetImplementedCulture(cultureName); // This is safe
            Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(cultureName);
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
            base.ExecuteCore();
        }

    }
}