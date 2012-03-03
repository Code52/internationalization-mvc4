namespace $rootnamespace$.Controllers 
{
    using System;
    using System.Collections;
    using System.Globalization;
    using System.Resources;
    using System.Text;
    using System.Web;
    using System.Web.Mvc;

    [OutputCache(Duration = 60, VaryByCustom = "culture")]
    public class LanguageController : Controller 
	{
		public RedirectResult Change(string customer, string token, string language)
        {
            if (string.IsNullOrWhiteSpace(language))
                Response.Redirect("/", true);
            if (!string.IsNullOrWhiteSpace(language))
            {
                switch (language.ToLower())
                {
                    case "fr":
                        SetCulture("fr");
                        break;
                    case "pl":
                        SetCulture("pl");
                        break;
                    case "en-US":
                        SetCulture("en-US");
                        break;
                    default:
                        SetCulture("en-GB");
                        break;
                }
            }
            return new RedirectResult(string.Format("/{0}/{1}/verify", customer, token));
        }

        protected void SetCulture(string name)
        {
            var cultureCookie = Request.Cookies["_culture"] ?? new HttpCookie("_culture");
            cultureCookie.Value = name;
            // NOTE: you should specify the domain for the cookie.
            // cultureCookie.Domain = Request.Url.Host;
            cultureCookie.Expires = DateTime.Now.AddYears(1);
            cultureCookie.Path = "/";
            Response.Cookies.Add(cultureCookie);
        }

        public JavaScriptResult Language()
        {
            return GetResourceScript(Resources.Language.ResourceManager);
        }

        JavaScriptResult GetResourceScript(ResourceManager resourceManager)
        {
            var cacheName = string.Format("ResourceJavaScripter.{0}", CultureInfo.CurrentCulture.Name);
            var value = HttpRuntime.Cache.Get(cacheName) as JavaScriptResult;
            if (value == null)
            {
                JavaScriptResult javaScriptResult = CreateResourceScript(resourceManager);
                HttpContext.Cache.Insert(cacheName, javaScriptResult);
                return javaScriptResult;
            }
            return value;
        }

        static JavaScriptResult CreateResourceScript(ResourceManager resourceManager)
        {
            var resourceSet = resourceManager.GetResourceSet(CultureInfo.CurrentCulture, true, true);
            var sb = new StringBuilder("Code52.Language.Dictionary={");
            foreach (DictionaryEntry dictionaryEntry in resourceSet)
            {
                var s = dictionaryEntry.Value as string;
                if (s == null)
                {
                    continue;
                }
                string value = resourceSet.GetString((string)dictionaryEntry.Key) ?? s;
                sb.AppendFormat("\"{0}\":\"{1}\",", dictionaryEntry.Key, Microsoft.Security.Application.Encoder.JavaScriptEncode(value.Replace("\"", "\\\"").Replace('{', '[').Replace('}', ']'), false));
            }
            string script = sb.ToString();
            if (!string.IsNullOrEmpty(script))
            {
                script = script.Remove(script.Length - 1);
            }
            script += "};";
            return new JavaScriptResult { Script = script };
        }
    }
}
