using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

public partial class Admin_ContactMessages : AdminBasePage
{


    string cs = ConfigurationManager.ConnectionStrings["SarkariManzilDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMessages();
        }
    }

    void LoadMessages()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT * FROM ContactMessages ORDER BY CreatedDate DESC", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptContact.DataSource = dt;
            rptContact.DataBind();
        }
    }

    protected void rptContact_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM ContactMessages WHERE Id=@Id", con);
                cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadMessages();
        }

        if (e.CommandName == "reply")
        {
            string[] data = e.CommandArgument.ToString().Split('|');

            hfReplyId.Value = data[0];
            lblReplyEmail.Text = "Reply to: " + data[1];
            txtReply.Text = "";
            pnlReply.Visible = true;
        }
    }

    protected void btnSendReply_Click(object sender, EventArgs e)
    {
        string toEmail = lblReplyEmail.Text.Replace("Reply to:", "").Trim();

        if (txtReply.Text == "") return;

        MailMessage mail = new MailMessage();
        mail.From = new MailAddress("sarkarimanzil25@gmail.com", "Sarkari Manzil");
        mail.To.Add(toEmail);
        mail.Subject = "Reply from Sarkari Manzil";
        mail.Body = txtReply.Text;

        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.Credentials = new NetworkCredential(
            "sarkarimanzil25@gmail.com",
            "YOUR_APP_PASSWORD"
        );
        smtp.EnableSsl = true;
        smtp.Send(mail);

        pnlReply.Visible = false;
        txtReply.Text = "";
    }
}
