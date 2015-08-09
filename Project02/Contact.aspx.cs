using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using DBA;
using System.Data;
using System.Net.Mail;
using System.Net;

namespace Project02
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserID"] != null)
            {
                VisibleControls();
            }
            else
            {
                HideControls();
            }

        }


        protected void BtnSubmit_Click(Object sender, EventArgs e)
        {
            if (InsertEnquiry())
            {
                Response.Write("<script>alert('Message sent successfully...');</script>");
            }
            else
            {
                Response.Write("<script>alert('Error in message sending...');</script>");
            }
        }

        bool SendMail()
        {
            DBA.Contact contact = new DBA.Contact(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            DataTable dt = contact.getData(1);
            if (dt.Rows.Count > 0)
            {
                try
                {
                    var fromAddress = new MailAddress(dt.Rows[0]["Email"].ToString(), dt.Rows[0]["MailName"].ToString());
                    var toAddress = new MailAddress(email.Text.Trim());
                    string fromPassword = dt.Rows[0]["Password"].ToString();
                    string subject = "Enquiry";
                    string body = commentsText.Text.Trim();

                    var smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                    };
                    using (var message = new MailMessage(fromAddress, toAddress)
                    {
                        Subject = subject,
                        Body = body
                    })
                    {
                        smtp.Send(message);
                    }
                    return true;
                }
                catch { }

            }
            return false;
        }

        bool InsertEnquiry()
        {
            if (SendMail())
            {
                DBA.Contact contact = new DBA.Contact(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
                contact.Name = contactName.Text.Trim();
                contact.Email = email.Text.Trim();
                contact.Website = eurl.Text.Trim();
                contact.Message = commentsText.Text.Trim();
                if (contact.insertEnquiry(11))
                {
                    return true;
                }
            }
            return false;
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            DBA.CheckUser chk = new CheckUser();
            if (chk.loggedIn(txtUsername.Text.Trim(), txtPassword.Text.Trim()))
            {
                VisibleControls();
            }
            else
            {
                HideControls();
            }
        }

        protected void VisibleControls()
        {
            AnchorLogin.Visible = false;
            LinkLogout.Visible = true;
            LinkLogout.Enabled = true;

            if (Session["Role"].ToString() == "0")
            {
                anchorEditor.Visible = false;
                anchorAdmin.Visible = true;
            }
            else if (Session["Role"].ToString() == "10")
            {
                anchorEditor.Visible = true;
                anchorAdmin.Visible = false;
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void HideControls()
        {
            AnchorLogin.Visible = true;
            LinkLogout.Visible = false;
            LinkLogout.Enabled = false;
            anchorEditor.Visible = false;
            anchorAdmin.Visible = false;
        }

        protected void LinkLogout_Click(Object sender, EventArgs e)
        {
            HttpContext.Current.Session.Abandon();
            HideControls();
        }

    }
}