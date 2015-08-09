using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data;
using System.Web.SessionState;
using System.Web;

namespace DBA
{
   public class CheckUser:IRequiresSessionState
    {
       
      
       public Boolean loggedIn(string UserName,String Password)
       {
           DBA.User user = new User(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
           user.UserName = UserName;
           user.Password = Password;
           DataTable dt = user.getUsers(1);
           if (dt.Rows.Count > 0)
           {               
               HttpContext.Current.Session["UserID"] = dt.Rows[0]["ID"].ToString();
               HttpContext.Current.Session["DispName"] = dt.Rows[0]["DisplayName"].ToString();
               HttpContext.Current.Session["Role"] = dt.Rows[0]["Role"].ToString();
               return true;
           }
           else
           {
               return false;
           }
       }
    }
}
