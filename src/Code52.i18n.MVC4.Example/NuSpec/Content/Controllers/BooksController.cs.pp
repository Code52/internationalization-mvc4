namespace $rootnamespace$.Controllers
{
  using System.Linq;
  using System.Web.Mvc;
  using System.Collections.Generic;
  using Models;

  public class BooksController : Controller
  {
    private static readonly List<Book> _booksRepository = new List<Book>(); // not thread safe.

    public ActionResult Index()
    {
      return View(_booksRepository);
    }

    public ActionResult Details(int id)
    {
      var bookToView = _booksRepository.Single(b => b.Id == id);

      return View(bookToView);
    }

    public ActionResult Create()
    {
      return View();
    }

    [HttpPost]
    public ActionResult Create(Book book)
    {
      if (!ModelState.IsValid)
      {
        return View(book);
      }

      book.Id = _booksRepository.Count == 0 ? 1 : _booksRepository.Max(b => b.Id) + 1;
      _booksRepository.Add(book);

      return RedirectToAction("Index");
    }

    public ActionResult Edit(int id)
    {
      var bookToEdit = _booksRepository.Single(b => b.Id == id);

      return View(bookToEdit);
    }

    [HttpPost]
    public ActionResult Edit(int id, Book book)
    {
      if (!ModelState.IsValid)
      {
        return View(book);
      }

      var bookToEdit = _booksRepository.Single(b => b.Id == book.Id);
      bookToEdit.Title = book.Title;
      bookToEdit.Author = book.Author;

      return RedirectToAction("Index");
    }

    public ActionResult Delete(int id)
    {
      var bookToRemove = _booksRepository.Single(b => b.Id == id);

      return View(bookToRemove);
    }

    [HttpPost]
    public ActionResult Delete(int id, FormCollection collection)
    {
      if (!ModelState.IsValid)
      {
        return View();
      }

      var bookToRemove = _booksRepository.Single(b => b.Id == id);
      _booksRepository.Remove(bookToRemove);

      return RedirectToAction("Index");
    }
  }
}