using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Yojana : AdminBasePage
{
    string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadYojana();

            if (Request.QueryString["edit"] != null)
            {
                LoadForEdit(Convert.ToInt32(Request.QueryString["edit"]));
            }

            if (Request.QueryString["delete"] != null)
            {
                DeleteYojana(Convert.ToInt32(Request.QueryString["delete"]));
            }
        }
    }

    void LoadYojana()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT Id, YojanaName, Department, State FROM Yojana ORDER BY Id DESC", con);

            con.Open();
            rptYojana.DataSource = cmd.ExecuteReader();
            rptYojana.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd;
            bool isInsert = false;

            if (hfId.Value == "")
            {
                isInsert = true;

                // INSERT
                cmd = new SqlCommand(@"
INSERT INTO Yojana
(
    YojanaName,
    Department,
    Eligibility,
    Benefits,
    SchemeType,
    State,
    DocumentsRequired,
    HowToApply,
    OfficialLink,
    IsActive
)
VALUES
(
    @Name,
    @Dept,
    @Elig,
    @Benefits,
    @Type,
    @State,
    @Docs,
    @Apply,
    @Link,
    @Active
)", con);
            }
            else
            {
                // UPDATE
                cmd = new SqlCommand(@"
UPDATE Yojana SET
    YojanaName=@Name,
    Department=@Dept,
    Eligibility=@Elig,
    Benefits=@Benefits,
    SchemeType=@Type,
    State=@State,
    DocumentsRequired=@Docs,
    HowToApply=@Apply,
    OfficialLink=@Link,
    IsActive=@Active
WHERE Id=@Id", con);

                cmd.Parameters.AddWithValue("@Id", hfId.Value);
            }

            // Common Parameters
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Dept", txtDepartment.Text.Trim());
            cmd.Parameters.AddWithValue("@Elig", txtEligibility.Text.Trim());
            cmd.Parameters.AddWithValue("@Benefits", txtBenefits.Text.Trim());
            cmd.Parameters.AddWithValue("@Type", txtSchemeType.Text.Trim());
            cmd.Parameters.AddWithValue("@State", txtState.Text.Trim());
            cmd.Parameters.AddWithValue("@Docs", txtDocs.Text.Trim());
            cmd.Parameters.AddWithValue("@Apply", txtApply.Text.Trim());
            cmd.Parameters.AddWithValue("@Link", txtLink.Text.Trim());
            cmd.Parameters.AddWithValue("@Active", chkActive.Checked);

            con.Open();

            // First save in Yojana table
            cmd.ExecuteNonQuery();

            if (isInsert)
            {
                // INSERT LatestNews
                SqlCommand latestCmd = new SqlCommand(@"
INSERT INTO LatestNews
(
    Title,
    ShortDesc,
    FullNews,
    Department,
    SchemeType,
    State,
    Eligibility,
    Benefits,
    DocumentsRequired,
    HowToApply,
    OfficialLink,
    CreatedDate
)
VALUES
(
    @Title,
    @ShortDesc,
    @FullNews,
    @Department,
    @SchemeType,
    @State,
    @Eligibility,
    @Benefits,
    @DocumentsRequired,
    @HowToApply,
    @OfficialLink,
    GETDATE()
)", con);

                latestCmd.Parameters.AddWithValue("@Title", txtName.Text.Trim());
                latestCmd.Parameters.AddWithValue("@ShortDesc", txtDepartment.Text.Trim());
                latestCmd.Parameters.AddWithValue("@FullNews", "Yojana Type: " + txtSchemeType.Text.Trim());
                latestCmd.Parameters.AddWithValue("@Department", txtDepartment.Text.Trim());
                latestCmd.Parameters.AddWithValue("@SchemeType", txtSchemeType.Text.Trim());
                latestCmd.Parameters.AddWithValue("@State", txtState.Text.Trim());
                latestCmd.Parameters.AddWithValue("@Eligibility", txtEligibility.Text.Trim());
                latestCmd.Parameters.AddWithValue("@Benefits", txtBenefits.Text.Trim());
                latestCmd.Parameters.AddWithValue("@DocumentsRequired", txtDocs.Text.Trim());
                latestCmd.Parameters.AddWithValue("@HowToApply", txtApply.Text.Trim());
                latestCmd.Parameters.AddWithValue("@OfficialLink", txtLink.Text.Trim());

                latestCmd.ExecuteNonQuery();
            }
            else
            {
                // UPDATE LatestNews with OLD title match
                SqlCommand latestUpdate = new SqlCommand(@"
UPDATE LatestNews
SET
    Title = @Title,
    ShortDesc = @ShortDesc,
    FullNews = @FullNews,
    Department = @Department,
    SchemeType = @SchemeType,
    State = @State,
    Eligibility = @Eligibility,
    Benefits = @Benefits,
    DocumentsRequired = @DocumentsRequired,
    HowToApply = @HowToApply,
    OfficialLink = @OfficialLink
WHERE Title = @OldTitle", con);

                latestUpdate.Parameters.AddWithValue("@Title", txtName.Text.Trim());
                latestUpdate.Parameters.AddWithValue("@ShortDesc", txtDepartment.Text.Trim());
                latestUpdate.Parameters.AddWithValue("@FullNews", "Yojana Type: " + txtSchemeType.Text.Trim());
                latestUpdate.Parameters.AddWithValue("@Department", txtDepartment.Text.Trim());
                latestUpdate.Parameters.AddWithValue("@SchemeType", txtSchemeType.Text.Trim());
                latestUpdate.Parameters.AddWithValue("@State", txtState.Text.Trim());
                latestUpdate.Parameters.AddWithValue("@Eligibility", txtEligibility.Text.Trim());
                latestUpdate.Parameters.AddWithValue("@Benefits", txtBenefits.Text.Trim());
                latestUpdate.Parameters.AddWithValue("@DocumentsRequired", txtDocs.Text.Trim());
                latestUpdate.Parameters.AddWithValue("@HowToApply", txtApply.Text.Trim());
                latestUpdate.Parameters.AddWithValue("@OfficialLink", txtLink.Text.Trim());

                // REAL FIX
                latestUpdate.Parameters.AddWithValue("@OldTitle", hfOldTitle.Value);

                latestUpdate.ExecuteNonQuery();
            }
        }

        Response.Redirect("sarkariyojana.aspx");
    }

    void LoadForEdit(int id)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM Yojana WHERE Id=@Id", con);

            cmd.Parameters.AddWithValue("@Id", id);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                hfId.Value = id.ToString();

                // IMPORTANT FIX
                hfOldTitle.Value = dr["YojanaName"].ToString();

                txtName.Text = dr["YojanaName"].ToString();
                txtDepartment.Text = dr["Department"].ToString();
                txtEligibility.Text = dr["Eligibility"].ToString();
                txtBenefits.Text = dr["Benefits"].ToString();
                txtSchemeType.Text = dr["SchemeType"].ToString();
                txtState.Text = dr["State"].ToString();
                txtDocs.Text = dr["DocumentsRequired"].ToString();
                txtApply.Text = dr["HowToApply"].ToString();
                txtLink.Text = dr["OfficialLink"].ToString();
                chkActive.Checked = Convert.ToBoolean(dr["IsActive"]);
            }
        }
    }

    void DeleteYojana(int id)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM Yojana WHERE Id=@Id", con);

            cmd.Parameters.AddWithValue("@Id", id);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("sarkariyojana.aspx");
    }
}