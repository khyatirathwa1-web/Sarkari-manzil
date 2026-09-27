using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Contact : System.Web.UI.Page
{
    protected void btnSend_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager
            .ConnectionStrings["SarkariManzilDB"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                @"INSERT INTO ContactMessages (Name, Email, Message)
                  VALUES (@Name, @Email, @Message)", con);

            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Message", txtMsg.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
        }

        // clear form
        txtName.Text = "";
        txtEmail.Text = "";
        txtMsg.Text = "";

        // optional success message
        ClientScript.RegisterStartupScript(
            this.GetType(),
            "alert",
            "alert('Message sent successfully!');",
            true
        );
    }
}
