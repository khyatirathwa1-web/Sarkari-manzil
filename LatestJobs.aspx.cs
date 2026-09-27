using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class LatestJobs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string cat = Request.QueryString["cat"];

            if (!string.IsNullOrEmpty(cat))
            {
                lblPageTitle.Text = cat + " Jobs";
            }
            else
            {
                lblPageTitle.Text = "Latest Jobs";
            }

            LoadJobs();
            SetWhatsAppShare();
        }
    }

    void LoadJobs()
    {
        string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            string cat = Request.QueryString["cat"];

            SqlCommand cmd;

            if (!string.IsNullOrEmpty(cat))
            {
                cmd = new SqlCommand(
                    "SELECT * FROM Jobs WHERE Category=@cat AND IsActive=1 ORDER BY Id DESC",
                    con);

                cmd.Parameters.AddWithValue("@cat", cat);
            }
            else
            {
                cmd = new SqlCommand(
                    "SELECT * FROM Jobs WHERE IsActive=1 ORDER BY Id DESC",
                    con);
            }

            con.Open();
            rptJobs.DataSource = cmd.ExecuteReader();
            rptJobs.DataBind();
        }
    }

    // 🔥 WhatsApp Share
    void SetWhatsAppShare()
    {
        string pageUrl = Request.Url.AbsoluteUri;

        string shareText =
            "🚨 નવી સરકારી ભરતી અપડેટ્સ આવી ગઈ 🔥\n\n" +

            "📢 " + lblPageTitle.Text + "\n\n" +

            "🎯 Latest Jobs, Recruitment Updates, Apply Links અને Important Notifications માટે નીચે link ખોલો 👇\n\n" +

            pageUrl + "\n\n" +

            "📲 Sarkari Manzil - Latest Jobs | Results | Admit Card | Yojana";

        whatsappShare.HRef =
            "https://wa.me/?text=" + Server.UrlEncode(shareText);
    }
}