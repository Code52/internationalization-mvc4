// -----------------------------------------------------------------------
// <copyright file="AppStart_Code52_i18n.cs" company="">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

[assembly: WebActivator.PreApplicationStartMethod(typeof($rootnamespace$.AppStart_Code52_I18n), "Start")]
namespace $rootnamespace$.App_Start {
    /// <summary>
    /// TODO: Update summary.
    /// </summary>
    public class AppStart_Code52_i18n {
        public static void Start() {
            RouteTable.Routes.MapRoute("Language", "i18n/Code52.i18n.language.js", new { controller = "Language", action = "Language" });
        }
    }
}
