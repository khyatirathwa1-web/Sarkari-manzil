using System;
using System.Security.Cryptography;
using System.Text;


public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Session["Admin"] != null)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string hashedInputPassword = HashPassword(txtPass.Text);

        string adminUser = "bhavin";
        string adminHashedPassword = HashPassword("bhavin2502"); // ek baar generate

        if (adminUser == adminUser && hashedInputPassword == adminHashedPassword)
        {
            Session["Admin"] = adminUser;
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            lblMsg.Text = "Invalid username or password";
        }

    }
    public static string HashPassword(string password)
    {
        using (SHA256 sha = SHA256.Create())
        {
            byte[] bytes = sha.ComputeHash(Encoding.UTF8.GetBytes(password));
            StringBuilder sb = new StringBuilder();
            foreach (byte b in bytes)
            {
                sb.Append(b.ToString("x2"));
            }
            return sb.ToString();
        }
    }
}
