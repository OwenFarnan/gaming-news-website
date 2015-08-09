using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DBA
{
    public class User
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter dap;

        int _userid;
        int _role;
        string _userName;
        string _password;
        int _roleFId;
        string _displayName;

        public int Userid
        {
            get { return _userid; }
            set { _userid = value; }
        }
        

        public string UserName
        {
            get { return _userName; }
            set { _userName = value; }
        }
       

        public string Password
        {
            get { return _password; }
            set { _password = value; }
        }
       

        public int RoleFId
        {
            get { return _roleFId; }
            set { _roleFId = value; }
        }

        

        public string DisplayName
        {
            get { return _displayName; }
            set { _displayName = value; }
        }
 

        public int Role
        {
            get { return _role; }
            set { _role = value; }
        }

       

        public User(string conStr)
        {
            con = new SqlConnection(conStr);

            Userid=-1;
            UserName="";
            Password="";
            RoleFId = -1;          
            DisplayName = "";            
            Role = -1;
        }


        public DataTable Authenticate(int task)
        {
            createCmd(task);
            DataTable dt = new DataTable();
            dap.Fill(dt);
            return dt;
        }


        public DataTable getUsers(int task)
        {
            createCmd(task);
            DataTable dt = new DataTable();
            dap = new SqlDataAdapter(cmd);
            dap.Fill(dt);
            return dt;
        }

        public bool deleteUser(int task)
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



        public bool insertUser(int task)
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


        public bool validateUser(int task)
        {
            con.Open();
            createCmd(task);
            int cnt =int.Parse(cmd.ExecuteScalar().ToString());
            con.Close();
            if (cnt > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public void createCmd(int task)
        {
            cmd = new SqlCommand("[manipulateUser]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Userid", Common.intToDBNull(Userid));
            cmd.Parameters.Add("@Username", Common.stingToDbNull(UserName));
            cmd.Parameters.Add("@UserPassword", Common.stingToDbNull(Password));
            cmd.Parameters.Add("@DisplayName", Common.stingToDbNull(DisplayName)); 
            cmd.Parameters.Add("@task", task);
            dap = new SqlDataAdapter(cmd);
        }
    }
}
