using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

public partial class Admin_PdfManage : AdminBasePage
{
    string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAllPdf();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!fuPdf.HasFile) return;

        string folder = "/PDF/" + ddlCat.SelectedValue + "/";

        if (!Directory.Exists(Server.MapPath(folder)))
            Directory.CreateDirectory(Server.MapPath(folder));

        string fileName = DateTime.Now.Ticks + "_" + fuPdf.FileName;
        string fullPath = folder + fileName;

        fuPdf.SaveAs(Server.MapPath(fullPath));

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // STEP 1: Save in PdfMaterials
            SqlCommand cmd = new SqlCommand(@"
INSERT INTO PdfMaterials
(
    Category,
    Title,
    Description,
    PdfPath,
    IsActive
)
VALUES
(
    @c,
    @t,
    @d,
    @p,
    @a
)", con);

            cmd.Parameters.AddWithValue("@c", ddlCat.SelectedValue);
            cmd.Parameters.AddWithValue("@t", txtTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@d", txtDesc.Text.Trim());
            cmd.Parameters.AddWithValue("@p", fullPath);
            cmd.Parameters.AddWithValue("@a", chkActive.Checked);

            cmd.ExecuteNonQuery();

            // STEP 2: Auto Save in LatestNews
            SqlCommand latestCmd = new SqlCommand(@"
INSERT INTO LatestNews
(
    Title,
    ShortDesc,
    FullNews,
    OfficialLink,
    CreatedDate
)
VALUES
(
    @Title,
    @ShortDesc,
    @FullNews,
    @OfficialLink,
    GETDATE()
)", con);

            latestCmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());

            latestCmd.Parameters.AddWithValue("@ShortDesc",
                ddlCat.SelectedValue + " Material");

            latestCmd.Parameters.AddWithValue("@OfficialLink", fullPath);

            latestCmd.Parameters.AddWithValue("@FullNews",
                "Category: " + ddlCat.SelectedValue +
                "\nTitle: " + txtTitle.Text.Trim() +
                "\nDescription: " + txtDesc.Text.Trim() +
                "\nPDF Available for Download");

            latestCmd.ExecuteNonQuery();
        }

        LoadAllPdf();
    }

    void LoadAllPdf()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT Id, Title, Category, PdfPath FROM PdfMaterials ORDER BY Id DESC",
                con);

            con.Open();

            rptPdf.DataSource = cmd.ExecuteReader();
            rptPdf.DataBind();
        }
    }

    protected void DeletePdf(object sender, CommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        string path = "";

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT PdfPath FROM PdfMaterials WHERE Id=@id", con);

            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            path = Convert.ToString(cmd.ExecuteScalar());
            con.Close();

            SqlCommand del = new SqlCommand(
                "DELETE FROM PdfMaterials WHERE Id=@id", con);

            del.Parameters.AddWithValue("@id", id);

            con.Open();
            del.ExecuteNonQuery();
        }

        if (!string.IsNullOrEmpty(path))
        {
            string full = Server.MapPath(path);

            if (File.Exists(full))
                File.Delete(full);
        }

        LoadAllPdf();
    }
}