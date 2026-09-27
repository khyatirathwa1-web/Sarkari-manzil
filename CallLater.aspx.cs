using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class CallLater : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCallLaterData();
            SetWhatsAppShare();
        }
    }

    void LoadCallLaterData()
    {
        string cs = ConfigurationManager
                        .ConnectionStrings["SarkariManzilDB"]
                        .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                @"SELECT Id, Title, LinkUrl
                  FROM CallLater
                  WHERE IsActive = 1
                  ORDER BY Id DESC", con);

            con.Open();

            rptCallLater.DataSource = cmd.ExecuteReader();
            rptCallLater.DataBind();

            con.Close();
        }
    }

    // 🔥 WhatsApp Share
    void SetWhatsAppShare()
    {
        string pageUrl = Request.Url.AbsoluteUri;

        string shareText =
            "📞 મહત્વપૂર્ણ Call Later Updates ઉપલબ્ધ 🔥\n\n" +

            "📌 Important callback updates, contact notices અને useful alerts માટે નીચે link ખોલો 👇\n\n" +

            pageUrl + "\n\n" +

            "📲 Sarkari Manzil - Latest Jobs | Results | Call Later Updates";

        whatsappShare.HRef =
            "https://wa.me/?text=" + Server.UrlEncode(shareText);
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}