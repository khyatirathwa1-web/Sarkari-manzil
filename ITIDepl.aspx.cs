using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class ITIDepl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadITITJobs();
            SetWhatsAppShare();
        }
    }

    void LoadITITJobs()
    {
        string cs = ConfigurationManager
                        .ConnectionStrings["SarkariManzilDB"]
                        .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                @"SELECT Id, JobTitle, Department, Qualification, LastDate
                  FROM Jobs
                  WHERE Category = 'ITI'
                  AND IsActive = 1
                  ORDER BY Id DESC", con);

            con.Open();
            rptITIJobs.DataSource = cmd.ExecuteReader();
            rptITIJobs.DataBind();
        }
    }

    // 🔥 WhatsApp Share
    void SetWhatsAppShare()
    {
        string pageUrl = Request.Url.AbsoluteUri;

        string shareText =
            "🛠️ ITI / Diploma માટે નવી ભરતી આવી ગઈ 🔥\n\n" +

            "📢 ITI Jobs, Diploma Recruitment, Apply Links, Last Date અને Important Updates માટે નીચે link ખોલો 👇\n\n" +

            pageUrl + "\n\n" +

            "📲 Sarkari Manzil - ITI / Diploma Latest Jobs Updates";

        whatsappShare.HRef =
            "https://wa.me/?text=" + Server.UrlEncode(shareText);
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}