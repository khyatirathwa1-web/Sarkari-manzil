using System;
using System.Web;
using System.Web.Routing;

public class Global : HttpApplication
{
    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(RouteTable.Routes);
    }

    public static void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute(
            "YojanaDetailRoute",
            "yojana/{SeoUrl}",
            "~/YojanaDetail.aspx"
        );
    }
}