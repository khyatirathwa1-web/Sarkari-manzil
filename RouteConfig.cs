using System;
using System.Web;
using System.Web.Routing;

public class RouteConfig
{
    public static void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute(
            "YojanaDetailRoute",
            "yojana/{SeoUrl}",
            "~/YojanaDetail.aspx"
        );
    }
}