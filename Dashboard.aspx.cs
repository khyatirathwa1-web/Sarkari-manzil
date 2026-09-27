using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_Dashboard : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCounts();
        }
    }

    void LoadCounts()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            
            lblResults.Text = GetCount(con, "SELECT COUNT(*) FROM ResultUpdates").ToString();

            lblCallLater.Text = GetCount(con, "SELECT COUNT(*) FROM CallLater").ToString();

            lblNews.Text = GetCount(con, "SELECT COUNT(*) FROM LatestNews").ToString();

            lblContact.Text = GetCount(con, "SELECT COUNT(*) FROM ContactMessages").ToString();

            con.Close();
        }
    }

    int GetCount(SqlConnection con, string query)
    {
        SqlCommand cmd = new SqlCommand(query, con);
        return Convert.ToInt32(cmd.ExecuteScalar());
    }
}