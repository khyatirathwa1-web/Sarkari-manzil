using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

public partial class JobDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Request.QueryString["jobid"] != null)
        {
            LoadJobDetails();
        }
    }

    void LoadJobDetails()
    {
        string id = Request.QueryString["jobid"];
        string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // =========================
            // 1. Load Job Details
            // =========================

            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM Jobs WHERE Id=@Id AND IsActive=1", con);

            cmd.Parameters.AddWithValue("@Id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (!dr.Read()) return;

            lblJobTitle.Text = dr["JobTitle"].ToString();
            lblDepartment.Text = dr["Department"].ToString();
            lblPostName.Text = dr["PostName"].ToString();
            lblQualification.Text = dr["Qualification"].ToString();
            lblSalary.Text = dr["Salary"].ToString();
            lblRecruitmentType.Text = dr["RecruitmentType"].ToString();
            lblLastDate.Text = dr["LastDate"].ToString();

            lblFullDescription.Text =
                dr["FullDescription"] != DBNull.Value
                ? dr["FullDescription"].ToString().Replace("\n", "<br/>")
                : "";

            if (dr["OfficialLink"] != DBNull.Value &&
                dr["OfficialLink"].ToString() != "")
            {
                lnkOfficial.Text = "👉 Official Website / Notice";
                lnkOfficial.NavigateUrl = dr["OfficialLink"].ToString();
            }

            dr.Close();

            // =========================
            // 2. Professional WhatsApp Share Message
            // =========================

            string currentPageUrl = Request.Url.AbsoluteUri;

            string message =
                "🚨 નવી સરકારી ભરતી આવી ગઈ 🚨\n\n" +

                "📢 પોસ્ટ નામ: " + lblPostName.Text + "\n" +
                "🏢 વિભાગ: " + lblDepartment.Text + "\n" +
                "🎓 લાયકાત: " + lblQualification.Text + "\n" +
                "💰 પગાર: " + lblSalary.Text + "\n" +
                "📌 ભરતી પ્રકાર: " + lblRecruitmentType.Text + "\n" +
                "📅 છેલ્લી તારીખ: " + lblLastDate.Text + "\n\n" +

                "🔥 સંપૂર્ણ માહિતી અને ફોર્મ ભરવા માટે નીચે ક્લિક કરો 👇\n\n" +

                currentPageUrl + "\n\n" +

                "📲 Sarkari Manzil - Latest Jobs, Results & Yojana Updates";

            whatsappShare.HRef =
                "https://wa.me/?text=" + Server.UrlEncode(message);
        }
    }
}