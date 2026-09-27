using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_ResultManage : System.Web.UI.Page
{
    string cs = ConfigurationManager
        .ConnectionStrings["SarkariManzilDB"]
        .ConnectionString;

    // Edit ID
    protected int EditId
    {
        get
        {
            return ViewState["EditId"] != null
                ? Convert.ToInt32(ViewState["EditId"])
                : 0;
        }
        set
        {
            ViewState["EditId"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }

    void LoadData()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT Id, Title, LinkUrl FROM ResultUpdates ORDER BY Id DESC", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            gvResult.DataSource = dt;
            gvResult.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // INSERT MODE
            if (EditId == 0)
            {
                // ResultUpdates insert
                SqlCommand cmd1 = new SqlCommand(
                    @"INSERT INTO ResultUpdates
                    (Title, LinkUrl, IsActive)
                    VALUES
                    (@Title, @LinkUrl, 1)", con);

                cmd1.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                cmd1.Parameters.AddWithValue("@LinkUrl", txtLink.Text.Trim());
                cmd1.ExecuteNonQuery();

                // LatestNews insert
                SqlCommand cmd2 = new SqlCommand(
                    @"INSERT INTO LatestNews
                    (Title, ShortDesc, FullNews, OfficialLink)
                    VALUES
                    (@Title, @ShortDesc, @FullNews, @OfficialLink)", con);

                cmd2.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                cmd2.Parameters.AddWithValue("@ShortDesc", "RESULTTYPE");
                cmd2.Parameters.AddWithValue("@FullNews", "Result Update Added");
                cmd2.Parameters.AddWithValue("@OfficialLink", txtLink.Text.Trim());

                cmd2.ExecuteNonQuery();
            }
            else
            {
                // UPDATE MODE
                SqlCommand cmd = new SqlCommand(
                    @"UPDATE ResultUpdates
                    SET Title=@Title, LinkUrl=@LinkUrl
                    WHERE Id=@Id", con);

                cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@LinkUrl", txtLink.Text.Trim());
                cmd.Parameters.AddWithValue("@Id", EditId);

                cmd.ExecuteNonQuery();

                EditId = 0;
                btnSave.Text = "Save Result";
            }

            con.Close();
        }

        txtTitle.Text = "";
        txtLink.Text = "";

        LoadData();
    }

    protected void gvResult_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvResult.DataKeys[e.RowIndex].Value);

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "DELETE FROM ResultUpdates WHERE Id=@Id", con);

            cmd.Parameters.AddWithValue("@Id", id);
            cmd.ExecuteNonQuery();

            con.Close();
        }

        LoadData();
    }

    // EDIT BUTTON
    protected void gvResult_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditRow")
        {
            int id = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM ResultUpdates WHERE Id=@Id", con);

                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtTitle.Text = dr["Title"].ToString();
                    txtLink.Text = dr["LinkUrl"].ToString();

                    EditId = id;
                    btnSave.Text = "Update Result";
                }

                con.Close();
            }
        }
    }
}