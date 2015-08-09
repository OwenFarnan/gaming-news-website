using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DBA
{
   public  class Contact
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter dap;

        string _name;
        string _email;
        string _website;
        string _message;

        public string Message
        {
            get { return _message; }
            set { _message = value; }
        }

        public string Website
        {
            get { return _website; }
            set { _website = value; }
        }

        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        public Contact(string conStr)
        {
            con = new SqlConnection(conStr);
            Name = "";
            Email = ""; 
            Website = "";
            Message = "";
        }

        public DataTable getData(int task)
        {
            createCmd(task);
            DataTable dt = new DataTable();
            dap = new SqlDataAdapter(cmd);
            dap.Fill(dt);
            return dt;
        }

        public bool insertEnquiry(int task)
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
            cmd = new SqlCommand("[manipulateContact]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Name", Common.stingToDbNull(Name));
            cmd.Parameters.Add("@Email", Common.stingToDbNull(Email));
            cmd.Parameters.Add("@Website", Common.stingToDbNull(Website));
            cmd.Parameters.Add("@Message", Common.stingToDbNull(Message));
            cmd.Parameters.Add("@task", task);
            dap = new SqlDataAdapter(cmd);
        }

       
    }
}
