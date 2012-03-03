@using $rootnamespace$.Resources

@model $rootnamespace$.Models.Book

@{
    ViewBag.Title = "Delete";
    Layout = "~/Views/Shared/_Layout.cshtml";
}

<h2>@Language.Global_Delete</h2>

<h3>@Language.Global_DeleteConfirm</h3>
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
@using (Html.BeginForm()) {
    <p>
        <input type="submit" value="@Language.Global_Delete" /> |
        @Html.ActionLink(@Language.Global_BackToList, "Index")
    </p>
}
