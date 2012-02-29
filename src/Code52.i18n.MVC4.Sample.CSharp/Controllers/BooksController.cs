using System.Linq;
using System.Collections.Generic;
using System.Web.Mvc;
using Code52.i18n.MVCFour.Sample.CSharp.Models;

namespace Code52.i18n.MVCFour.Sample.CSharp.Controllers
{
  public class BooksController : BaseController
  {
    private static readonly List<Book> _books = new List<Book>();

    //
    // GET: /Books/

    public ActionResult Index()
    {
      return View(_books);
    }

    //
    // GET: /Books/Details/5

    public ActionResult Details(int id)
    {
      var bookToView = _books.Single(b => b.Id == id);

      return View(bookToView);
    }

    //
    // GET: /Books/Create

    public ActionResult Create()
    {
      return View();
    }

    //
    // POST: /Books/Create

    [HttpPost]
    public ActionResult Create(Book book)
    {
      try
      {
        book.Id = _books.Count == 0 ? 1 : _books.Max(b => b.Id) + 1;
        _books.Add(book);

        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }

    //
    // GET: /Books/Edit/5

    public ActionResult Edit(int id)
    {
      var bookToEdit = _books.Single(b => b.Id == id);

      return View(bookToEdit);
    }

    //
    // POST: /Books/Edit/5

    [HttpPost]
    public ActionResult Edit(int id, Book book)
    {
      try
      {
        var bookToEdit = _books.Single(b => b.Id == book.Id);
        bookToEdit.Title = book.Title;
        bookToEdit.Author = book.Author;

        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }

    //
    // GET: /Books/Delete/5

    public ActionResult Delete(int id)
    {
      var bookToRemove = _books.Single(b => b.Id == id);

      return View(bookToRemove);
    }

    //
    // POST: /Books/Delete/5

    [HttpPost]
    public ActionResult Delete(int id, FormCollection collection)
    {
      try
      {
        var bookToRemove = _books.Single(b => b.Id == id);
        _books.Remove(bookToRemove);

        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }
  }
}
