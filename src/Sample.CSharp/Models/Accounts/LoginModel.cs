using System.ComponentModel.DataAnnotations;

namespace Code52.i18n.MVCFour.Sample.CSharp.Models.Accounts
{
    public class LoginModel
    {
        [Required]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }
}