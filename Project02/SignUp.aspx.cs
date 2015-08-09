using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBA;
using System.Configuration;

namespace Project02
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void BtnSubmit_Click(Object sender, EventArgs e)
        {
            if (InsertUser())
            {
                ClearData();
                Response.Write("<script>alert('New user created successfully');</script>");
                Response.Redirect("Default.aspx");
            }
        }

        protected bool InsertUser()
        {
            if (ValidateUser())
            {
                DBA.User user = new DBA.User(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
                user.UserName = txtNewUsername.Text.Trim();
                user.DisplayName = txtDspName.Text.Trim();
                user.Password = txtRePassword.Text.Trim();
                if (user.insertUser(11))
                {
                    return true;
                }
            }
            return false;
        }

        bool ValidateUser()
        {
            DBA.User user = new DBA.User(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            user.UserName = txtNewUsername.Text;
            if (user.validateUser(2))
            {

                return true;
            }
            else
            {
                Response.Write("<script>alert('The User Name is already taken. Please enter diffrent User Name');</script>");
                Response.Redirect("SignUp.aspx");
                return false;
            }
        }

        protected void ClearData()
        {
            txtUsername.Text = "";
            txtDspName.Text = "";
            txtPassword.Text = "";
            txtRePassword.Text = "";
        }

        protected void LinkLogout_Click(Object sender, EventArgs e)
        {
            HttpContext.Current.Session.Abandon();
            HideControls();
        }

        protected void VisibleControls()
        {
            AnchorLogin.Visible = false;
            LinkLogout.Visible = true;
            LinkLogout.Enabled = true;
        }

        protected void HideControls()
        {
            AnchorLogin.Visible = true;
            LinkLogout.Visible = false;
            LinkLogout.Enabled = false;
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

        protected void BtnCancel_Click(Object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}