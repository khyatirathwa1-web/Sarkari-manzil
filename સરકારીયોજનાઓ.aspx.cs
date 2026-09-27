using System;
using System.Activities.Debugger;
using System.Activities.Statements;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;

public partial class સરકારીયોજનાઓ : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadYojana();
        }
    }

    void LoadYojana()

    {
        string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
 "SELECT * FROM Yojana WHERE IsActive=1 ORDER BY Id DESC", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptYojana.DataSource = dt;
            rptYojana.DataBind();
        }
    }

}
