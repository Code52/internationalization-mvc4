namespace Code52.i18n.MVCFour.Sample.CSharp.Controllers
{
    using System.Web.Mvc;

    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            ViewBag.Message = Resources.Language.Index_Title;

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = Resources.Language.About_Title;

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = Resources.Language.Contact_Title;

            return View();
        }
    }
}
