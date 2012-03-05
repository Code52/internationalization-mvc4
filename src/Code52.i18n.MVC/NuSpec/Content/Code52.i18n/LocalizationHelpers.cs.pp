namespace $rootnamespace$.Code52.i18n
{
    using System;
    using System.Web;
    using System.Web.Mvc;

    public static class LocalizationHelpers {
        public static IHtmlString MetaAcceptLanguage<t>(this HtmlHelper<t> html) {
            var acceptLanguage = HttpUtility.HtmlAttributeEncode(System.Threading.Thread.CurrentThread.CurrentUICulture.ToString());
            return new HtmlString(String.Format("<meta name=\"accept-language=\" content=\"{0}\">", acceptLanguage));
        }
    }
}