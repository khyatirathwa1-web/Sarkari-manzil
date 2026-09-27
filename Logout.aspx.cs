using System;
using System.Web;
using System.Web.Security;

public partial class Admin_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Clear session
        Session.Clear();
        Session.Abandon();

        // Clear auth cookie
        FormsAuthentication.SignOut();

        // Redirect to login
        Response.Redirect("~/Admin/Login.aspx");
    }
}
