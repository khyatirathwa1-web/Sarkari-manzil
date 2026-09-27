using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class _12pass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Load12PassJobs();
            SetWhatsAppShare();
        }
    }

    void Load12PassJobs()
    {
        string cs = ConfigurationManager
                        .ConnectionStrings["SarkariManzilDB"]
                        .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                @"SELECT Id, JobTitle, Department, Qualification, LastDate
                  FROM Jobs
                  WHERE Category = '12th'
                  AND IsActive = 1
                  ORDER BY Id DESC", con);

            con.Open();
            rpt12PassJobs.DataSource = cmd.ExecuteReader();
            rpt12PassJobs.DataBind();
        }
    }

    // 🔥 WhatsApp Share
    void SetWhatsAppShare()
    {
        string pageUrl = Request.Url.AbsoluteUri;

        string shareText =
            "🚨 12th Pass નવી ભરતી આવી ગઈ 🔥\n\n" +

            "📢 12 પાસ માટે Government Jobs, Apply Links, Last Date અને Important Updates માટે નીચે link ખોલો 👇\n\n" +

            pageUrl + "\n\n" +

            "📲 Sarkari Manzil - 12th Pass Latest Jobs Updates";

        whatsappShare.HRef =
            "https://wa.me/?text=" + Server.UrlEncode(shareText);
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}

