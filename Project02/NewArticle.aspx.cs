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
    public partial class NewArticle : System.Web.UI.Page
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
                BindCategory();
                if (Request.QueryString["Artid"] != null)
                {
                    int ArticleID = int.Parse(Common.Decrypt(Request.QueryString["Artid"]));
                    ViewState["Artid"] = ArticleID;
                    AssignValues(ArticleID);
                }
            }


        }

        protected void AssignValues(int ArticleID)
        {
            DBA.NewArticle newArticle = new DBA.NewArticle(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            newArticle.ArticleId = ArticleID;
            DataTable dt = newArticle.getData(3);
            ddlCategory.DataSource = dt;
            if (dt.Rows.Count > 0)
            {
                txtTitle.Text = dt.Rows[0]["Title"].ToString();
                txtDescription.Text = dt.Rows[0]["Description"].ToString();
                ViewState["ImgPath"] = dt.Rows[0]["ImgPath"].ToString();
                ddlCategory.SelectedValue = dt.Rows[0]["CategoryFId"].ToString();
                BtnSubmit.Text = "Update";
                UpdatePanel1.Update();
            }
        }

        protected void BtnSubmit_Click(Object sender, EventArgs e)
        {
            if (InsertArticle())
            {
                ClearData();
                Response.Redirect("AllArticles.aspx");
            }
        }

        protected void BindCategory()
        {
            DBA.NewArticle newArticle = new DBA.NewArticle(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            DataTable dt = newArticle.getData(1);
            ddlCategory.DataSource = dt;
            ddlCategory.DataValueField = "ID";
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataBind();
        }

        protected bool InsertArticle()
        {
            int task = 0;
            DBA.NewArticle newArticle = new DBA.NewArticle(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            if (BtnSubmit.Text == "Submit")
            {
                task = 10;
            }
            else if (BtnSubmit.Text == "Update")
            {
                task = 21;
                newArticle.ArticleId = int.Parse(ViewState["Artid"].ToString());
            }

            newArticle.UserFId = int.Parse(Session["UserID"].ToString());
            newArticle.Title = txtTitle.Text.Trim();
            newArticle.Description = txtDescription.Text.Trim();
            if (ddlCategory.SelectedIndex > 0)
            {
                newArticle.CategoryFId = int.Parse(ddlCategory.SelectedValue);
            }
            if (UploadImge.HasFile)
            {
                newArticle.ImgPath = "ArticleImages/" + Guid.NewGuid() + ".jpg";
                string mappedPath = Server.MapPath(newArticle.ImgPath);
                UploadImge.SaveAs(mappedPath);
            }
            else
            {
                if (task == 21)
                {
                    newArticle.ImgPath = ViewState["ImgPath"].ToString();
                }
            }
            if (newArticle.insertArticle(task))
            {
                return true;
            }
            return false;
        }

        protected void ClearData()
        {
            txtTitle.Text = "";
            txtDescription.Text = "";
            ddlCategory.SelectedIndex = -1;
            BtnSubmit.Text = "Submit";
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

        protected void BtnCancel_Click(Object sender, EventArgs e)
        {
            Response.Redirect("AllArticles.aspx");
        }

        protected void LinkLogout_Click(Object sender, EventArgs e)
        {
           HttpContext.Current.Session.Abandon();
            HideControls();
        }
    }
}