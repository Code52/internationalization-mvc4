@using $rootnamespace$.Resources

@model $rootnamespace$.Models.Book

@{
    ViewBag.Title = "Details";
    Layout = "~/Views/Shared/_Layout.cshtml";
}

<h2>@Language.Global_Details</h2>

<fieldset>
  <legend>@Books.Books_Book</legend>

    <div class="display-label">
         @Html.DisplayNameFor(model => model.Title)
    </div>
    <div class="display-field">
        @Html.DisplayFor(model => model.Title)
    </div>

    <div class="display-label">
         @Html.DisplayNameFor(model => model.Author)
    </div>
    <div class="display-field">
        @Html.DisplayFor(model => model.Author)
    </div>
</fieldset>
<p>
    @Html.ActionLink(@Language.Global_Edit, "Edit", new { id=Model.Id }) |
    @Html.ActionLink(@Language.Global_BackToList, "Index")
</p>
