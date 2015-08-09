using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using DBA;

namespace Project02
{
    public partial class Administrator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null)
            {
                HideControls();
                Response.Redirect("Default.aspx");
            }

            if (Session["Role"].ToString() == "0")
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
            anchorEditor.Visible = false;
            anchorAdmin.Visible = true;
           
        }

        protected void HideControls()
        {
            AnchorLogin.Visible = true;
            LinkLogout.Visible = false;
            LinkLogout.Enabled = false;
            anchorEditor.Visible = false;
            anchorAdmin.Visible = false;
        }

        protected void BindGrid()
        {
            DBA.NewArticle article = new DBA.NewArticle(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());          
            DataTable dt = article.getData(4);
            grdArticles.DataSource = dt;
            grdArticles.DataBind();
        }

        protected void grdArticles_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            DBA.NewArticle article = new DBA.NewArticle(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            string[] str = e.CommandArgument.ToString().Split(',');
            article.ArticleId = int.Parse(str[0]);
            if (e.CommandName == "Ed")
            {
                if (article.insertArticle(22))
                {
                    BindGrid();
                }
            }
            else if (e.CommandName == "Del")
            {
                if (article.insertArticle(23))
                {
                    //if (!string.IsNullOrEmpty(str[1]))
                    //{
                    //    System.IO.File.Delete(Server.MapPath(str[1]));
                    //}
                    BindGrid();
                }
            }
        }

        protected void grdArticles_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindGrid();
        }

        protected void grdArticles_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            BindGrid();
        }

        protected void grdArticles_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            BindGrid();
        }

        protected void LinkLogout_Click(Object sender, EventArgs e)
        {
            Session.Abandon();
            HideControls();
            Response.Redirect("Default.aspx"); 
        }
    }
}