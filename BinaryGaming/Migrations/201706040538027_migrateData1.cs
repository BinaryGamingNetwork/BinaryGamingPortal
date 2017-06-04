namespace BinaryGaming.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class migrateData1 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.AspNetUsers", "DateJoined", c => c.DateTime());
            AlterColumn("dbo.AspNetUsers", "MembershipExpiry", c => c.DateTime());
            AlterColumn("dbo.AspNetUsers", "LastLoggedIn", c => c.DateTime());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.AspNetUsers", "LastLoggedIn", c => c.DateTime(nullable: false));
            AlterColumn("dbo.AspNetUsers", "MembershipExpiry", c => c.DateTime(nullable: false));
            AlterColumn("dbo.AspNetUsers", "DateJoined", c => c.DateTime(nullable: false));
        }
    }
}
