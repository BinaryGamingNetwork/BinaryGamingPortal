//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BinaryGaming
{
    using System;
    using System.Collections.Generic;
    
    public partial class MemberRoles
    {
        public int Id { get; set; }
        public int RolesId { get; set; }
        public int MembersId { get; set; }
        public bool InsertYN { get; set; }
        public bool ChangeYN { get; set; }
        public bool DeleteYN { get; set; }
        public bool LookupYN { get; set; }
    
        public virtual Roles Role { get; set; }
        public virtual Members Member { get; set; }
    }
}