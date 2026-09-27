using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class YojanaDetail : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadYojanaDetail();
        }
    }

    void LoadYojanaDetail()
    {
        // QueryString thi slug levanu
        string slug = Request.QueryString["slug"];

        // Jo slug empty hoy to route mathi levanu
        if (string.IsNullOrEmpty(slug))
        {
            slug = Page.RouteData.Values["SeoUrl"] != null
                ? Page.RouteData.Values["SeoUrl"].ToString()
                : "";
        }

        // Jo slug na male to page stop
        if (string.IsNullOrEmpty(slug))
        {
            Response.Write("Yojana not found.");
            return;
        }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM Yojana WHERE SeoUrl = @SeoUrl", con);

            cmd.Parameters.AddWithValue("@SeoUrl", slug);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblTitle.Text = dr["YojanaName"].ToString();
                lblDepartment.Text = dr["Department"].ToString();
                lblSchemeType.Text = dr["SchemeType"].ToString();
                lblState.Text = dr["State"].ToString();
                lblEligibility.Text = dr["Eligibility"].ToString();
                lblBenefits.Text = dr["Benefits"].ToString();
                lblDocs.Text = dr["DocumentsRequired"].ToString();
                lblApply.Text = dr["HowToApply"].ToString();

                if (dr["OfficialLink"] != DBNull.Value &&
                    dr["OfficialLink"].ToString() != "")
                {
                    lnkOfficial.Text = "👉 Official Website";
                    lnkOfficial.NavigateUrl = dr["OfficialLink"].ToString();
                }

                // 🔥 WhatsApp Share Message
                string pageUrl = Request.Url.AbsoluteUri;

                string whatsappText =
                    "📢 સરકારી યોજના માહિતી\n\n" +
                    "📌 યોજના નામ: " + lblTitle.Text + "\n" +
                    "🏢 વિભાગ: " + lblDepartment.Text + "\n" +
                    "📂 યોજના પ્રકાર: " + lblSchemeType.Text + "\n" +
                    "📍 રાજ્ય: " + lblState.Text + "\n\n" +
                    "🎯 Eligibility, Benefits, Documents & Full Details માટે નીચે link ખોલો 👇\n\n" +
                    pageUrl + "\n\n" +
                    "🔔 વધુ સરકારી યોજનાઓ માટે Sarkari Manzil જોડાઓ";

                whatsappShare.HRef =
                    "https://wa.me/?text=" + Server.UrlEncode(whatsappText);
            }
            else
            {
                Response.Write("Yojana details not found.");
            }

            dr.Close();
            con.Close();
        }
    }
}