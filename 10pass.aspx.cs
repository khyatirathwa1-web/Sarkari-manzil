using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class _10pass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Load10PassJobs();
        }
    }

    void Load10PassJobs()
    {
        string cs = ConfigurationManager
                        .ConnectionStrings["SarkariManzilDB"]
                        .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
    @"SELECT Id, JobTitle, Department, Qualification, LastDate
      FROM Jobs
      WHERE Category = '10th'
        AND IsActive = 1
      ORDER BY Id DESC", con);
            con.Open();
            rpt10PassJobs.DataSource = cmd.ExecuteReader();
            rpt10PassJobs.DataBind();
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}
