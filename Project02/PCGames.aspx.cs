using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBA;
using System.Configuration;
using System.Text;
using System.Data;

namespace Project02
{
    public partial class PCGames : System.Web.UI.Page
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
                LoadArticles();
            }
        }

        protected void LoadArticles()
        {
            DBA.NewArticle article = new DBA.NewArticle(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            DataTable dt = article.getData(6);
            StringBuilder strHTML = new StringBuilder();
            int cnt = dt.Rows.Count;
            if (cnt > 0)
            {
                 
                int rowcnt = cnt / 5;
                if (cnt % 5 != 0)
                {
                    rowcnt = rowcnt + 1;                    
                }
                int k = 0;

                for (int i = 1; i <= rowcnt; i++)
                {
                    strHTML.Append("<div class=\"item\">");
                    for (int j = k; j <cnt ; j++)
                    {
                        strHTML.Append("<div class=\"column\"><div class=\"inner\"><div class=\"image\">");
                        strHTML.Append("<a href=\"ArticleDetails.aspx?id=" + Common.Encrypt(dt.Rows[j]["ID"].ToString()) + "\"><img alt=\"\" src=" + dt.Rows[j]["ImgPath"] + " /></a></div>");
                        strHTML.Append("<h3><a href=\"ArticleDetails.aspx?id=" + Common.Encrypt(dt.Rows[j]["ID"].ToString()) + "\">" + dt.Rows[j]["Title"] + "</a></h3></div></div>");
                        if (i * 5 == j + 1)
                        {
                            k = j + 1;
                            break;
                        }
                    }
                    strHTML.Append("<div class=\"clear\"></div></div>");
                }

            }
            featured_slider.InnerHtml = strHTML.ToString();
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

        protected void LinkLogout_Click(Object sender, EventArgs e)
        {
            HttpContext.Current.Session.Abandon();
            HideControls();
        }
    }
}