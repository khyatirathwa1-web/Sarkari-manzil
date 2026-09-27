using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_NewsUpdatesManage : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

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
                "SELECT Id, ShortText, LinkUrl FROM NewsUpdates ORDER BY Id DESC", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            gvNews.DataSource = dt;
            gvNews.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtShortText.Text) ||
            string.IsNullOrWhiteSpace(txtLinkUrl.Text))
        {
            return;
        }

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // INSERT MODE
            if (EditId == 0)
            {
                SqlCommand cmd = new SqlCommand(
                    @"INSERT INTO NewsUpdates
                    (ShortText, LinkUrl)
                    VALUES
                    (@ShortText, @LinkUrl)", con);

                cmd.Parameters.AddWithValue("@ShortText", txtShortText.Text.Trim());
                cmd.Parameters.AddWithValue("@LinkUrl", txtLinkUrl.Text.Trim());

                cmd.ExecuteNonQuery();
            }
            else
            {
                // UPDATE MODE
                SqlCommand cmd = new SqlCommand(
                    @"UPDATE NewsUpdates
                    SET ShortText=@ShortText, LinkUrl=@LinkUrl
                    WHERE Id=@Id", con);

                cmd.Parameters.AddWithValue("@ShortText", txtShortText.Text.Trim());
                cmd.Parameters.AddWithValue("@LinkUrl", txtLinkUrl.Text.Trim());
                cmd.Parameters.AddWithValue("@Id", EditId);

                cmd.ExecuteNonQuery();

                EditId = 0;
                btnSave.Text = "Save News";
            }

            con.Close();
        }

        txtShortText.Text = "";
        txtLinkUrl.Text = "";

        LoadData();
    }

    protected void gvNews_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvNews.DataKeys[e.RowIndex].Value);

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "DELETE FROM NewsUpdates WHERE Id=@Id", con);

            cmd.Parameters.AddWithValue("@Id", id);
            cmd.ExecuteNonQuery();

            con.Close();
        }

        LoadData();
    }

    // EDIT BUTTON
    protected void gvNews_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditRow")
        {
            int id = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM NewsUpdates WHERE Id=@Id", con);

                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtShortText.Text = dr["ShortText"].ToString();
                    txtLinkUrl.Text = dr["LinkUrl"].ToString();

                    EditId = id;
                    btnSave.Text = "Update News";
                }

                con.Close();
            }
        }
    }
}