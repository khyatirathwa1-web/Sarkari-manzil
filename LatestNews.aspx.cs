using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class LatestNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadNews();
            SetWhatsAppShare();
        }
    }

    void LoadNews()
    {
        string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT Id, Title, ShortDesc, OfficialLink FROM LatestNews ORDER BY CreatedDate DESC",
                con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptNews.DataSource = dt;
            rptNews.DataBind();
        }
    }

    // 🔥 WhatsApp Share
    void SetWhatsAppShare()
    {
        string pageUrl = Request.Url.AbsoluteUri;

        string shareText =
            "📰 નવી Latest News Updates આવી ગઈ 🔥\n\n" +

            "📢 Government Jobs, Results, Call Later, Yojana Updates અને Important Notifications માટે નીચે link ખોલો 👇\n\n" +

            pageUrl + "\n\n" +

            "📲 Sarkari Manzil - Latest News | Results | Jobs | Yojana";

        whatsappShare.HRef =
            "https://wa.me/?text=" + Server.UrlEncode(shareText);
    }
}