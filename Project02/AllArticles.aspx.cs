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
    public partial class AllArticles : System.Web.UI.Page
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
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void BindGrid()
        {
            DBA.NewArticle article = new DBA.NewArticle(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            article.UserFId = int.Parse(Session["UserID"].ToString());
            DataTable dt = article.getData(2);
            grdArticles.DataSource = dt;
            grdArticles.DataBind();
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

        protected void grdArticles_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            DBA.NewArticle article = new DBA.NewArticle(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            string[] str = e.CommandArgument.ToString().Split(',');
            article.ArticleId = int.Parse(str[0]);
            if (e.CommandName == "Del")
            {
                if (article.insertArticle(20))
                {
                    if (!string.IsNullOrEmpty(str[1]))
                    {
                        System.IO.File.Delete(Server.MapPath(str[1]));
                    }
                    BindGrid();
                }
            }
            else if (e.CommandName == "Ed")
            {
                string strURL = "NewArticle.aspx?Artid=";

                if (HttpContext.Current != null)
                {
                    HttpContext.Current.Response.Redirect(strURL + Server.UrlEncode(Common.Encrypt(e.CommandArgument.ToString())));
                }

            }
        }

        protected void grdArticles_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            BindGrid();
        }

        protected void grdArticles_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            BindGrid();
        }

        protected void grdArticles_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindGrid();
        }

        protected void BtnNewArticle_Click(Object sender, EventArgs e)
        {
            Response.Redirect("NewArticle.aspx");
        }

        protected void LinkLogout_Click(Object sender, EventArgs e)
        {
            HttpContext.Current.Session.Abandon();
            HideControls();
            Response.Redirect("Default.aspx"); 
        }
    }
}