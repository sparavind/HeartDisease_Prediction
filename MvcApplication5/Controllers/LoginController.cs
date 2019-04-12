using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcApplication5.Models;
using System.Data;
using System.Data.SqlClient;


namespace MvcApplication5.Controllers
{
    public class LoginController : Controller
    {
        User_login_class lc = new User_login_class();
        dboperation db = new dboperation();
        Doc_reg_class dr = new Doc_reg_class();
        Mailing m = new Mailing();
        dnaAlg dna = new dnaAlg();
 
        public ActionResult login_user()
        {
            return View();
        }

        public ActionResult login()
        {
            return View();
        }
        
        public ActionResult login_check(FormCollection fm)
        {

            string type="",page="";
            lc.usern = fm["ctl00$ContentPlaceHolder1$uname_text"];
            lc.passd = fm["ctl00$ContentPlaceHolder1$pass_text"];
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "login_user";
            cmd.Parameters.AddWithValue("@username",lc.usern);
            cmd.Parameters.AddWithValue("@password",lc.passd);
            
            DataTable dt=db.getdata(cmd);
            if (dt.Rows.Count > 0)
            {
                Session["logid"] = dt.Rows[0][0].ToString();
                if (dt.Rows[0][1].ToString() == "Patient")
                {
                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.CommandText = "get_patdetails";
                    cmd1.Parameters.AddWithValue("@pid", Session["logid"]);
                    DataTable dt1 = db.getdata(cmd1);
                    
                    if (dt1.Rows[0][2].ToString() == "")//new patient
                    {
                        type = "patient_reg";
                        page = "patient_registration";
                        Session["pname"] = lc.usern;
                    }
                    else
                    {
                        type = "patient_reg";
                        page = "patient_portfolio_show";
                        Session["pname"] = dt1.Rows[0][2].ToString();
                    }

                    //return RedirectToAction("patient_portfolio_show", "patient_reg");
                }
                else if (dt.Rows[0][1].ToString() == "Doctor")
                {
                    type = "Doc_home";
                    page = "doc_portfolio_show";
                    
                    
                }
                else if (dt.Rows[0][1].ToString() == "Admin")
                {
                    type = "Site_admin";
                    page = "Admin_add_doctor";
                    //return RedirectToAction("Doc_registration", "Site_admin");

                }
                

                
            }
            else
            {
                type = "Login";
                page = "login_user";

                TempData["failedlogin"] = "User doesnot exist Check your Username and Password";
            }

            return RedirectToAction(page,type);


        }
        
        public ActionResult forgot_password(FormCollection fm)
        {
            dr.d_dob = fm["ctl00$ContentPlaceHolder1$dob_text"];
            dr.d_mob = fm["ctl00$ContentPlaceHolder1$mobile_text"];
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "recover_password";
            cmd.Parameters.AddWithValue("@mob", dr.d_mob);
            cmd.Parameters.AddWithValue("@dob", dr.d_dob);
            DataTable dt = db.getdata(cmd);
            TempData["Result"] = "Recovery Failed! Check your Date of birth and Mobile number";
            if (dt.Rows.Count > 0)
            {
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = "get_user_mailid";
                cmd1.Parameters.AddWithValue("@id", dt.Rows[0][0].ToString());
                DataTable dt1 = db.getdata(cmd1);
                TempData["Result"] = m.sentmail(dt.Rows[0][1].ToString(), dt.Rows[0][2].ToString(), dt1.Rows[0][0].ToString());
                
                 
            }
            return RedirectToAction("login_user");
            

        }
        
        
      
       
    }
}