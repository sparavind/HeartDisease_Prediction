using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace MvcApplication5.Models
{
    
    public class dboperation
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Aravind\Desktop\Heart_desease\Heart_desease.mdf;Integrated Security=True;Connect Timeout=30");

        public void execute(SqlCommand cmd)
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                e.ToString();
            }
            finally
            {
                con.Close();
            }
        }

        public DataTable getdata(SqlCommand cmd)
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            return ds.Tables[0];
        }

        public int maxid(SqlCommand cmd)
        {
            int i;
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                i = Convert.ToInt32(cmd.ExecuteScalar()) + 1;

            }
            catch (Exception e)
            {
                i = 1;
            }
            con.Close();
            return i;
        }

        public int getcount(SqlCommand cmd)
        {
            int i;
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                i = Convert.ToInt32(cmd.ExecuteScalar());

            }
            catch (Exception e)
            {
                i = 0;
            }
            con.Close();
            return i;
        }
    }
}