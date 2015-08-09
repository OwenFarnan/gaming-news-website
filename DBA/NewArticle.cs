using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DBA
{
   public class NewArticle
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter dap;

        int _atricleId;       
        int _categoryFId;        
        int _userFId;       
        bool _isApproved;
        bool _isDeleted;      
        string _title;       
        string _description;       
        string imgPath;

        public int ArticleId
        {
            get { return _atricleId; }
            set { _atricleId = value; }
        }
        public int CategoryFId
        {
            get { return _categoryFId; }
            set { _categoryFId = value; }
        }
        public int UserFId
        {
            get { return _userFId; }
            set { _userFId = value; }
        }
        public bool IsApproved
        {
            get { return _isApproved; }
            set { _isApproved = value; }
        }
        public string Title
        {
            get { return _title; }
            set { _title = value; }
        }
        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }
        public string ImgPath
        {
            get { return imgPath; }
            set { imgPath = value; }
        }

        public bool IsDeleted
        {
            get { return _isDeleted; }
            set { _isDeleted = value; }
        }

        public NewArticle(string conStr)
        {
            con = new SqlConnection(conStr);
            ArticleId = -1;
            CategoryFId = -1;
            UserFId = -1;
            IsApproved = false;
            IsDeleted = false;
            Title = "";
            Description = "";
            ImgPath = "";
        }

        public DataTable getData(int task)
        {
            createCmd(task);
            DataTable dt = new DataTable();
            dap = new SqlDataAdapter(cmd);
            dap.Fill(dt);
            return dt;
        }

        public bool insertArticle(int task)
        {
            con.Open();
            createCmd(task);
            int cnt = cmd.ExecuteNonQuery();
            con.Close();
            if (cnt > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public void createCmd(int task)
        {
            cmd = new SqlCommand("[manipulateArticle]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Articleid", Common.intToDBNull(ArticleId));
            cmd.Parameters.Add("@Userid", Common.intToDBNull(UserFId));
            cmd.Parameters.Add("@Title", Common.stingToDbNull(Title));
            cmd.Parameters.Add("@Description", Common.stingToDbNull(Description));
            cmd.Parameters.Add("@ImgPath", Common.stingToDbNull(ImgPath));
            cmd.Parameters.Add("@CategoryFId", Common.intToDBNull(CategoryFId));
            cmd.Parameters.Add("@IsApproved", Common.boolToDbNull(IsApproved));
            cmd.Parameters.Add("@IsDeleted", Common.boolToDbNull(IsDeleted));
            cmd.Parameters.Add("@task", task);
            dap = new SqlDataAdapter(cmd);
        }

        
    }
}
