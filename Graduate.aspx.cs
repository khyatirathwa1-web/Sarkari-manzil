using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Graduate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGraduateJobs();
            SetWhatsAppShare();
        }
    }

    void LoadGraduateJobs()
    {
        string cs = ConfigurationManager
                        .ConnectionStrings["SarkariManzilDB"]
                        .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                @"SELECT Id, JobTitle, Department, Qualification, LastDate
                  FROM Jobs
                  WHERE Category = 'Graduate'
                  AND IsActive = 1
                  ORDER BY Id DESC", con);

            con.Open();
            rptGraduateJobs.DataSource = cmd.ExecuteReader();
            rptGraduateJobs.DataBind();
        }
    }

    // 🔥 WhatsApp Share
    void SetWhatsAppShare()
    {
        string pageUrl = Request.Url.AbsoluteUri;

        string shareText =
            "🎓 Graduate માટે નવી ભરતી આવી ગઈ 🔥\n\n" +

            "📢 Graduate Jobs, Apply Links, Last Date અને Important Updates માટે નીચે link ખોલો 👇\n\n" +

            pageUrl + "\n\n" +

            "📲 Sarkari Manzil - Graduate Latest Jobs Updates";

        whatsappShare.HRef =
            "https://wa.me/?text=" + Server.UrlEncode(shareText);
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}