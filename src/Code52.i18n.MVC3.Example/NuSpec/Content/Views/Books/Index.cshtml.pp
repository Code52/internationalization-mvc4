@using $rootnamespace$.Resources

@model IEnumerable<$rootnamespace$.Models.Book>

@{
    ViewBag.Title = "Index";
    Layout = "~/Views/Shared/_Layout.cshtml";
}

<h2>@Books.Books_Books</h2>

<p>
    @Html.ActionLink(Language.Global_CreateNew, "Create")
</p>
<table>
    <tr>
        <th>
            @Html.DisplayNameFor(model => model.Title)
        </th>
        <th>
            @Html.DisplayNameFor(model => model.Author)
        </th>
        <th></th>
    </tr>

@foreach (var item in Model) {
    <tr>
        <td>
            @Html.DisplayFor(modelItem => item.Title)
        </td>
        <td>
            @Html.DisplayFor(modelItem => item.Author)
        </td>
        <td>
            @Html.ActionLink(@Language.Global_Edit, "Edit", new { id=item.Id }) |
            @Html.ActionLink(@Language.Global_Details, "Details", new { id=item.Id }) |
            @Html.ActionLink(@Language.Global_Delete, "Delete", new { id=item.Id })
        </td>
    </tr>
}

</table>
