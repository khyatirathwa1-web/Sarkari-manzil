using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Syllabus : System.Web.UI.Page
{
    string cs = ConfigurationManager
                    .ConnectionStrings["SarkariManzilDB"]
                    .ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadPdf("Syllabus");
        }
    }

    void LoadPdf(string category)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
SELECT Id, Title, Description, PdfPath
FROM PdfMaterials
WHERE Category=@cat
AND IsActive=1
ORDER BY Id DESC", con);

            cmd.Parameters.AddWithValue("@cat", category);

            con.Open();

            rptPdf.DataSource = cmd.ExecuteReader();
            rptPdf.DataBind();
        }
    }
}