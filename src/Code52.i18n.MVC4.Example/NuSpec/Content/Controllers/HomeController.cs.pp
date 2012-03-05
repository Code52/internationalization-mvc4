namespace $rootnamespace$.Controllers
{
    using System.Web.Mvc;

    public class HomeController : Controller
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
