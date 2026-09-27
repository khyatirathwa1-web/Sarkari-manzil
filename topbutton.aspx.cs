using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_JobDetail : AdminBasePage
{
    string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
            Response.Redirect("Login.aspx");

        if (!IsPostBack)
        {
            LoadJobs();

            if (Request.QueryString["edit"] != null)
                LoadJobForEdit(Convert.ToInt32(Request.QueryString["edit"]));

            if (Request.QueryString["delete"] != null)
                DeleteJob(Convert.ToInt32(Request.QueryString["delete"]));
        }
    }

    void LoadJobs()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT Id, JobTitle, Category, IsActive FROM Jobs ORDER BY Id DESC", con);

            con.Open();
            rptJobs.DataSource = cmd.ExecuteReader();
            rptJobs.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd;

            if (hfId.Value == "")
            {
                cmd = new SqlCommand(@"
                INSERT INTO Jobs
                (Category, JobTitle, Department, PostName, Qualification, Salary,
                 RecruitmentType, JobLocation, ShortDescription, FullDescription,
                 OfficialLink, ApplyLink, IsActive)
                VALUES
                (@Category,@Title,@Dept,@Post,@Qual,@Salary,
                 @Recruit,@Location,@Short,@Full,
                 @Link,@Apply,@Active)", con);
            }
            else
            {
                cmd = new SqlCommand(@"
                UPDATE Jobs SET
                    Category=@Category,
                    JobTitle=@Title,
                    Department=@Dept,
                    PostName=@Post,
                    Qualification=@Qual,
                    Salary=@Salary,
                    RecruitmentType=@Recruit,
                    JobLocation=@Location,
                    ShortDescription=@Short,
                    FullDescription=@Full,
                    OfficialLink=@Link,
                    ApplyLink=@Apply,
                    IsActive=@Active
                WHERE Id=@Id", con);

                cmd.Parameters.AddWithValue("@Id", hfId.Value);
            }

            cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@Dept", txtDepartment.Text);
            cmd.Parameters.AddWithValue("@Post", txtPostName.Text);
            cmd.Parameters.AddWithValue("@Qual", txtQualification.Text);
            cmd.Parameters.AddWithValue("@Salary", txtSalary.Text);
            cmd.Parameters.AddWithValue("@Recruit", txtRecruitment.Text);
            cmd.Parameters.AddWithValue("@Location", txtLocation.Text);
            cmd.Parameters.AddWithValue("@Short", txtShort.Text);
            cmd.Parameters.AddWithValue("@Full", txtFull.Text);
            cmd.Parameters.AddWithValue("@Link", txtLink.Text);
            cmd.Parameters.AddWithValue("@Apply", txtApplyLink.Text);
            cmd.Parameters.AddWithValue("@Active", chkActive.Checked);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("topbutton.aspx");
    }

    void LoadJobForEdit(int id)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM Jobs WHERE Id=@Id", con);

            cmd.Parameters.AddWithValue("@Id", id);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                hfId.Value = id.ToString();
                ddlCategory.SelectedValue = dr["Category"].ToString();
                txtTitle.Text = dr["JobTitle"].ToString();
                txtDepartment.Text = dr["Department"].ToString();
                txtPostName.Text = dr["PostName"].ToString();
                txtQualification.Text = dr["Qualification"].ToString();
                txtSalary.Text = dr["Salary"].ToString();
                txtRecruitment.Text = dr["RecruitmentType"].ToString();
                txtLocation.Text = dr["JobLocation"].ToString();
                txtShort.Text = dr["ShortDescription"].ToString();
                txtFull.Text = dr["FullDescription"].ToString();
                txtLink.Text = dr["OfficialLink"].ToString();
                txtApplyLink.Text = dr["ApplyLink"].ToString();
                chkActive.Checked = Convert.ToBoolean(dr["IsActive"]);
            }
        }
    }

    void DeleteJob(int id)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM Jobs WHERE Id=@Id", con);

            cmd.Parameters.AddWithValue("@Id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("topbutton.aspx");
    }
}
