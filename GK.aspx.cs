using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class GK : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGK();
        }
    }

    void LoadGK()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT Id, Title, Description, PdfPath FROM PdfMaterials WHERE Category='GK' AND IsActive=1 ORDER BY Id DESC",
                con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptGK.DataSource = dt;
            rptGK.DataBind();
        }
    }
}