using System;

using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BinaryGaming.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class ExternalLoginListViewModel
    {
        public string ReturnUrl { get; set; }
    }

    public class SendCodeViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberMe { get; set; }
    }

    public class VerifyCodeViewModel
    {
        [Required]
        public string Provider { get; set; }

        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }
        public string ReturnUrl { get; set; }

        [Display(Name = "Remember this browser?")]
        public bool RememberBrowser { get; set; }

        public bool RememberMe { get; set; }
    }

    public class ForgotViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class LoginViewModel
    {
        [Required]
        [Display(Name = "Email")]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        [Required]
        [StringLength(40)]
        [Display(Name = "Surname")]
        public String Surname { get; set; }

        [StringLength(30)]
        [Display(Name = "First Given Name")]
        public String FirstName { get; set; }

        [StringLength(30)]
        [Display(Name = "Middle Given Name")]
        public String MiddleNames { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Address 1")]
        public String Address1 { get; set; }

        [StringLength(50)]
        [Display(Name = "Address 2")]
        public String Address2 { get; set; }

        [Required]
        [StringLength(40)]
        [Display(Name = "Suburb")]
        public String Suburb { get; set; }

        [Required]
        [StringLength(3)]
        [Display(Name = "State")]
        public String State { get; set; }

        [Required]
        [StringLength(4)]
        [Display(Name = "Postal Code")]
        public String PostCode { get; set; }

        [StringLength(25)]
        [Display(Name = "Home Phone")]
        public String Phone { get; set; }

        [StringLength(25)]
        [Display(Name = "Mobile Phone")]
        public String Mobile { get; set; }

        public int MembershipTypesId { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Discord Name")]
        public String DiscordName { get; set; }

        [Required]
        [Display(Name = "Discord ID")]
        public Int64 DiscordId { get; set; }

    }

    public class ResetPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        public string Code { get; set; }
    }

    public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }
}
