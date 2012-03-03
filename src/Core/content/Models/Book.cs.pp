using System.ComponentModel.DataAnnotations;
using $rootnamespace$.Resources;

namespace $rootnamespace$.CSharp.Models
{
  public class Book
  {
    public int Id { get; set; }

    [Required(ErrorMessageResourceType = typeof(Books))]
    [Display(ResourceType = typeof(Books))]
    public string Title { get; set; }

    [Required(ErrorMessageResourceType = typeof(Books))]
    [Display(ResourceType = typeof(Books))]
    public string Author { get; set; }
  }
}