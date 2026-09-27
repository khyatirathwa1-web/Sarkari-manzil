using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class NewsDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                LoadNewsDetail();
            }
        }
    }

    void LoadNewsDetail()
    {
        string id = Request.QueryString["id"];

        string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM LatestNews WHERE Id=@Id", con);

            cmd.Parameters.AddWithValue("@Id", id);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblTitle.Text = dr["Title"] != DBNull.Value
                    ? dr["Title"].ToString()
                    : "";

                // default panels hidden
                pnlYojana.Visible = false;
                pnlPdf.Visible = false;
                pnlCallLater.Visible = false;

                string schemeType = dr["SchemeType"] != DBNull.Value
                    ? dr["SchemeType"].ToString()
                    : "";

                string shortDesc = dr["ShortDesc"] != DBNull.Value
                    ? dr["ShortDesc"].ToString()
                    : "";

                /*
                 YOJANA TYPE DATA
                */
                if (!string.IsNullOrEmpty(schemeType))
                {
                    pnlYojana.Visible = true;

                    lblDepartment.Text = dr["Department"] != DBNull.Value
                        ? dr["Department"].ToString()
                        : "";

                    lblSchemeType.Text = dr["SchemeType"] != DBNull.Value
                        ? dr["SchemeType"].ToString()
                        : "";

                    lblState.Text = dr["State"] != DBNull.Value
                        ? dr["State"].ToString()
                        : "";

                    lblEligibility.Text = dr["Eligibility"] != DBNull.Value
                        ? dr["Eligibility"].ToString()
                        : "";

                    lblBenefits.Text = dr["Benefits"] != DBNull.Value
                        ? dr["Benefits"].ToString()
                        : "";

                    lblDocs.Text = dr["DocumentsRequired"] != DBNull.Value
                        ? dr["DocumentsRequired"].ToString()
                        : "";

                    lblApply.Text = dr["HowToApply"] != DBNull.Value
                        ? dr["HowToApply"].ToString()
                        : "";

                    lnkOfficial.NavigateUrl = dr["OfficialLink"] != DBNull.Value
                        ? dr["OfficialLink"].ToString()
                        : "#";
                }

                /*
                 PDF / GK / CALLTYPE
                */
                else
                {
                    // CALL LATER SPECIAL CATEGORY
                    if (shortDesc.Trim() == "CALLTYPE")
                    {
                        pnlYojana.Visible = false;
                        pnlPdf.Visible = false;
                        pnlCallLater.Visible = true;

                        lblCallLaterTitle.Text = dr["Title"] != DBNull.Value
                            ? dr["Title"].ToString()
                            : "";
                    }
                    else
                    {
                        pnlCallLater.Visible = false;
                        pnlPdf.Visible = true;

                        lblPdfDescription.Text = dr["FullNews"] != DBNull.Value
                            ? dr["FullNews"].ToString().Replace("\n", "<br/>")
                            : "";

                        lnkPdf.NavigateUrl = dr["OfficialLink"] != DBNull.Value
                            ? dr["OfficialLink"].ToString()
                            : "#";
                    }
                }

                // =========================
                // Professional WhatsApp Share
                // =========================

                string pageUrl = Request.Url.AbsoluteUri;

                string shareText =
                    "📰 નવી અપડેટ આવી ગઈ 🔥\n\n" +

                    "📢 " + lblTitle.Text + "\n\n" +

                    "📌 સંપૂર્ણ માહિતી, PDF, યોજના, Result અથવા Important Update માટે નીચે link ખોલો 👇\n\n" +

                    pageUrl + "\n\n" +

                    "📲 Sarkari Manzil - Latest Jobs | Results | Yojana | GK Updates";

                whatsappShare.HRef =
                    "https://wa.me/?text=" + Server.UrlEncode(shareText);
            }

            dr.Close();
            con.Close();
        }
    }
}