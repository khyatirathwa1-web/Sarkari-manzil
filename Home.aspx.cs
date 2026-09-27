using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class home : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadNews();
        }
    }

    void LoadNews()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT ShortText, LinkUrl FROM NewsUpdates WHERE IsActive = 1 ORDER BY CreatedDate DESC",
                con
            );

            con.Open();
            rptNews.DataSource = cmd.ExecuteReader();
            rptNews.DataBind();
        }
    }

}
