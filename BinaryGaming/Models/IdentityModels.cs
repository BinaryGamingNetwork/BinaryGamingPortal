using System;
using System.Data;
using System.Data.Entity;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.ComponentModel.DataAnnotations;

namespace BinaryGaming.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        [StringLength(40)]
        public String Surname { get; set; }

        [StringLength(30)]
        public String FirstName { get; set; }

        [StringLength(30)]
        public String MiddleNames { get; set; }

        [StringLength(50)]
        public String Address1 { get; set; }

        [StringLength(50)]
        public String Address2 { get; set; }

        [StringLength(40)]
        public String Suburb { get; set; }

        [StringLength(3)]
        public String State { get; set; }

        [StringLength(4)]
        public String PostCode { get; set; }

        [StringLength(25)]
        public String Phone { get; set; }

        [StringLength(25)]
        public String Mobile { get; set; }

        
        public DateTime? DateJoined { get; set; }

        public DateTime? MembershipExpiry { get; set; }

        public Boolean FinancialYN { get
            {   if (MembershipExpiry == null || MembershipExpiry < DateTime.Now)
                    return (false);
                else
                    return (true);
            }
        }

        public int MembershipTypesId { get; set; }

        [StringLength(50)]
        public String DiscordName { get; set; }

        public Int64 DiscordId { get; set; }

        public DateTime? LastLoggedIn { get; set; }

        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {

    // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
        var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}