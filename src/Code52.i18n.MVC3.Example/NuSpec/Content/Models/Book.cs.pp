namespace $rootnamespace$.Models
{
  using System.ComponentModel.DataAnnotations;
  using Resources;

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