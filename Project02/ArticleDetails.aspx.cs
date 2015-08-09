using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBA;
using System.Configuration;
using System.Data;

namespace Project02
{
    public partial class ArticleDetails : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    try
                    {
                        int ArtID = int.Parse(Common.Decrypt((Request.QueryString["ID"].ToString())));
                        LoadArticle(ArtID);
                    }
                    catch 
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
            }
        }

        protected void LoadArticle(int ID)
        {
            DBA.NewArticle article = new DBA.NewArticle(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            article.ArticleId = ID;
            DataTable dt = article.getData(3);
            if (dt.Rows.Count > 0)
            {
                lblTitle.InnerText = dt.Rows[0]["Title"].ToString();
                lblPostedBy.InnerText = dt.Rows[0]["DisplayName"].ToString();
                lblCreatedDate.InnerText = DateTime.Parse(dt.Rows[0]["CreatedDate"].ToString()).ToString("MMMM,dd yyyy");
                lblCategory.InnerText = dt.Rows[0]["CategoryName"].ToString();
                description.InnerText = dt.Rows[0]["Description"].ToString();
                articleImg.Src = dt.Rows[0]["ImgPath"].ToString();
            }
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