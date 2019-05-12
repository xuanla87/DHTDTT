using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ProjectNews.Startup))]
namespace ProjectNews
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
