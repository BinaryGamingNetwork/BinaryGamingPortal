using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BinaryGaming.Startup))]
namespace BinaryGaming
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
