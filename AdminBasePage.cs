using System;
using System.Web;

public class AdminBasePage : System.Web.UI.Page
{
    protected override void OnInit(EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("~/Admin/Login.aspx");
        }

        base.OnInit(e);
    }
}
