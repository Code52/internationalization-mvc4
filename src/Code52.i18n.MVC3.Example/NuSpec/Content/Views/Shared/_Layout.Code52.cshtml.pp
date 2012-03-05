@using $rootnamespace$.Resources
@using $rootnamespace$.Code52.i18n
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>@ViewBag.Title</title>
    <link href="@Url.Content("~/Content/Site.css")" rel="stylesheet" type="text/css" />
    <script src="@Url.Content("~/Scripts/jquery-1.5.1.min.js")" type="text/javascript"></script>
    <script src="@Url.Content("~/Scripts/modernizr-1.7.min.js")" type="text/javascript"></script>
    <script src="@Url.Content("~/Scripts/jquery.cookie.js")" type="text/javascript"></script>
    <link href="@Url.Content("~/Content/code52.i18n/Code52.i18n.css")" rel="stylesheet" type="text/css" />
    <script src="@Url.Content("~/Scripts/Code52.i18n.js")" type="text/javascript"></script>
    <style>
        #i18n-options a {
            color: white!important;
        }
        
    </style>
</head>
<body>
    <div id="placeholder-regions">
    </div>
    <div id="i18n-options-container">
        <div id="i18n-options">
            <a title="International" href="#" id="currentlanguage_link"><span id="currentlanguage_text">
            </span>&nbsp;<span id="expandSign">[+]</span> </a>
        </div>
        <div id="i18n-regions">
            <ul>
                <li>Languages
                    <ol>
                        <li class="lang">
                            <div class="language language_EN">
                                <a id="langOption" title="English" class="en-GB" href="#">English</a>
                            </div>
                        </li>
                        <li class="lang">
                            <div class="language language_FR">
                                <a title="français" href="#" class="fr-FR" href="#">Français</a>
                            </div>
                        </li>
                        <li class="lang">
                            <div class="language language_FR">
                                <a title="français" href="#" class="pl-PL" href="#">Polish</a>
                            </div>
                        </li>
                    </ol>
                </li>
            </ul>
        </div>
    </div>
    <div class="page">
        <header>
            <div id="title">
                <h1>@Language.Logo_Title</h1>
            </div>
            <div id="logindisplay">
                @Html.Partial("_LogOnPartial")
            </div>
            <nav>
                <ul id="menu">
                        <li>@Html.ActionLink(@Language.Menu_Home, "Index", "Home")</li>
                        <li>@Html.ActionLink(@Language.Menu_About, "About", "Home")</li>
                </ul>
            </nav>
        </header>
        <section id="main">
            @RenderBody()
        </section>
        <footer>
        </footer>
    </div>
    <script src="@Url.Content("~/Scripts/jquery.globalize/globalize.js")" type="text/javascript"></script>
    <script src="@Url.Content(string.Format("~/Scripts/jquery.globalize/cultures/globalize.culture.{0}.js", CultureHelper.GetCurrentCulture()))" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
    @if (CultureHelper.GetCurrentNeutralCulture() != "en") {
        <script type="text/javascript" src="@String.Format("http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/localization/messages_{0}.js", CultureHelper.GetCurrentNeutralCulture())"></script>
    }
    <script type="text/javascript" src="@Url.Content("/Scripts/Code52.i18n.js")"></script>
    @* ReSharper disable Html.PathError *@
    <script type="text/javascript" src="@Url.Content("/i18n/Code52.i18n.language.js")"></script>
    @* ReSharper restore Html.PathError *@
    <script type="text/javascript">
        Code52.Language.Init('@CultureHelper.GetCurrentCulture()');
    </script>
</body>
</html>