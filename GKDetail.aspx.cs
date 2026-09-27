using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class GKDetail : System.Web.UI.Page
{
    string cs = ConfigurationManager
                .ConnectionStrings["SarkariManzilDB"]
                .ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGK();
        }
    }

    void LoadGK()
    {
        string id = Request.QueryString["id"];

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM PdfMaterials WHERE Id=@Id", con);

            cmd.Parameters.AddWithValue("@Id", id);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblTitle.Text = dr["Title"].ToString();
                lblDesc.Text = dr["Description"].ToString();

                if (dr["PdfPath"] != DBNull.Value &&
                    dr["PdfPath"].ToString() != "")
                {
                    lnkPdf.HRef = dr["PdfPath"].ToString();
                }

                // =========================
                // Professional WhatsApp Share
                // =========================

                string pageUrl = Request.Url.AbsoluteUri;

                string shareText =
                    "📚 મહત્વપૂર્ણ GK મટિરિયલ ઉપલબ્ધ 🔥\n\n" +

                    "📖 Title: " + lblTitle.Text + "\n\n" +

                    "📝 " + lblDesc.Text + "\n\n" +

                    "📄 સંપૂર્ણ PDF / Notes જોવા માટે નીચે link ખોલો 👇\n\n" +

                    pageUrl + "\n\n" +

                    "📲 Sarkari Manzil - GK | PDF | Notes | Study Material";

                whatsappShare.HRef =
                    "https://wa.me/?text=" + Server.UrlEncode(shareText);
            }

            dr.Close();
            con.Close();
        }
    }
}