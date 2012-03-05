@using $rootnamespace$.Resources

@model $rootnamespace$.Models.Book

@{
    ViewBag.Title = "Create";
    Layout = "~/Views/Shared/_Layout.cshtml";
}

<h2>@Language.Global_Create</h2>

<script src="@Url.Content("~/Scripts/jquery.validate.min.js")"></script>
<script src="@Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")"></script>

@using (Html.BeginForm()) {
    @Html.ValidationSummary(true)

    <fieldset>
        <legend>@Books.Books_Book</legend>

        <div class="editor-label">
            @Html.LabelFor(model => model.Title)
        </div>
        <div class="editor-field"> 
            @Html.EditorFor(model => model.Title)
            @Html.ValidationMessageFor(model => model.Title)
        </div>

        <div class="editor-label">
            @Html.LabelFor(model => model.Author)
        </div>
        <div class="editor-field">
            @Html.EditorFor(model => model.Author)
            @Html.ValidationMessageFor(model => model.Author)
        </div>

        <p>
            <input type="submit" value="@Language.Global_Create" />
        </p>
    </fieldset>
}

<div>
    @Html.ActionLink(@Language.Global_BackToList, "Index")
</div>
