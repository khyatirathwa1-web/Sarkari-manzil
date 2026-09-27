using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Result : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadResults();
            SetWhatsAppShare();
        }
    }

    void LoadResults()
    {
        string cs = ConfigurationManager
            .ConnectionStrings["SarkariManzilDB"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                @"SELECT Id, Title, LinkUrl
                  FROM ResultUpdates
                  WHERE IsActive = 1
                  ORDER BY Id DESC", con);

            con.Open();

            rptResults.DataSource = cmd.ExecuteReader();
            rptResults.DataBind();

            con.Close();
        }
    }

    // 🔥 WhatsApp Share
    void SetWhatsAppShare()
    {
        string pageUrl = Request.Url.AbsoluteUri;

        string shareText =
            "📢 નવા Result Updates આવી ગયા 🔥\n\n" +

            "🎯 Latest Result, Merit List, Selection List અને Important Updates માટે નીચે link ખોલો 👇\n\n" +

            pageUrl + "\n\n" +

            "📲 Sarkari Manzil - Latest Results & Updates";

        whatsappShare.HRef =
            "https://wa.me/?text=" + Server.UrlEncode(shareText);
    }
}