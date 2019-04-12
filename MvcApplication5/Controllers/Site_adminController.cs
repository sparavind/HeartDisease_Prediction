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
    public class Site_adminController : Controller
    {
        Doc_reg_class dr = new Doc_reg_class();
        User_login_class ulc = new User_login_class();
        dboperation db = new dboperation();
        External_methods ext = new External_methods();

        public ActionResult Doc_registration()
        {
            return View();
        }
        
        public ActionResult Admin_add_doctor()
        {
            return View();
        }
        
        public ActionResult insert_doc(FormCollection f)
        {
            SqlCommand cm = new SqlCommand();
            cm.CommandText = "maxid_in_login";
            int id = db.maxid(cm);
            Random rd = new Random();
            ulc.passd = rd.Next(000000, 999999).ToString() + Session["logid"].ToString();
            
            dr.d_fname = f["ctl00$MainContent$DfnameText"];
            dr.d_mname = f["ctl00$MainContent$DmnameText"];
            dr.d_lname = f["ctl00$MainContent$DlnameText"];
            dr.d_gender = f["ctl00$MainContent$RadioButtonListGen"];
            dr.d_dob = f["ctl00$MainContent$DdobText"];
            dr.d_mob = f["ctl00$MainContent$DmobText"];
            dr.d_add = f["ctl00$MainContent$DaddrText"];
            dr.d_pin = f["ctl00$MainContent$DpinText"];
            dr.d_email = f["ctl00$MainContent$DmailText"];
            dr.d_school1 = f["ctl00$MainContent$Dschool1Text"];
            dr.d_school2 = f["ctl00$MainContent$Dschool2Text"];
            dr.d_school3 = f["ctl00$MainContent$Dschool3Text"];
            dr.d_cgpa1 = f["ctl00$MainContent$Dcgpa1Text"];
            dr.d_cgpa2 = f["ctl00$MainContent$Dcgpa2Text"];
            dr.d_cgpa3 = f["ctl00$MainContent$Dcgpa3Text"];
            dr.d_year1 = Convert.ToInt32(f["ctl00$MainContent$Dyear1Text"]);
            dr.d_year2 = Convert.ToInt32(f["ctl00$MainContent$Dyear2Text"]);
            dr.d_year3 = Convert.ToInt32(f["ctl00$MainContent$Dyear3Text"]);
            dr.d_board1 = f["ctl00$MainContent$DBoard1Text"];
            dr.d_board2 = f["ctl00$MainContent$Dboard2Text"];
            dr.d_board3 = f["ctl00$MainContent$Dboard3Text"];
            dr.d_hosp = f["ctl00$MainContent$DhospText"];
            DateTime StartDate = Convert.ToDateTime(f["ctl00$MainContent$TextBox1"]);
            DateTime EndDate = Convert.ToDateTime(f["ctl00$MainContent$TextBox2"]);

            DateTime zeroTime = new DateTime(1, 1, 1);
            TimeSpan span = EndDate - StartDate;
            int years = (zeroTime + span).Year - 1;

            dr.d_exper = years.ToString();
            
            dr.d_resume_path = f["ctl00$MainContent$FileUploadResume"];
            dr.d_photo_path = f["ctl00$MainContent$FileUploadResume"];

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "insert_doctor";
                cmd.Parameters.AddWithValue("@did", id);
                cmd.Parameters.AddWithValue("@fname", dr.d_fname);
                cmd.Parameters.AddWithValue("@mname", dr.d_mname);
                cmd.Parameters.AddWithValue("@lname", dr.d_lname);
                cmd.Parameters.AddWithValue("@gender", dr.d_gender);
                cmd.Parameters.AddWithValue("@dob", dr.d_dob);
                cmd.Parameters.AddWithValue("@mob", dr.d_mob);
                cmd.Parameters.AddWithValue("@add", dr.d_add);
                cmd.Parameters.AddWithValue("@pin", dr.d_pin);
                cmd.Parameters.AddWithValue("@email", dr.d_email);
                cmd.Parameters.AddWithValue("@school1", dr.d_school1);
                cmd.Parameters.AddWithValue("@school2", dr.d_school2);
                cmd.Parameters.AddWithValue("@school3", dr.d_school3);
                cmd.Parameters.AddWithValue("@cgpa1", dr.d_cgpa1);
                cmd.Parameters.AddWithValue("@cgpa2", dr.d_cgpa2);
                cmd.Parameters.AddWithValue("@cgpa3", dr.d_cgpa3);
                cmd.Parameters.AddWithValue("@year1", dr.d_year1);
                cmd.Parameters.AddWithValue("@year2", dr.d_year2);
                cmd.Parameters.AddWithValue("@year3", dr.d_year3);
                cmd.Parameters.AddWithValue("@board1", dr.d_board1);
                cmd.Parameters.AddWithValue("@board2", dr.d_board2);
                cmd.Parameters.AddWithValue("@board3", dr.d_board3);
                cmd.Parameters.AddWithValue("@hosp", dr.d_hosp);
                cmd.Parameters.AddWithValue("@exper", dr.d_exper);
                cmd.Parameters.AddWithValue("@resume", "1");
                cmd.Parameters.AddWithValue("@photo", "1");

                cmd.Parameters.AddWithValue("@uid", id);
                cmd.Parameters.AddWithValue("@uname", Session["newdoc_uname"].ToString());
                cmd.Parameters.AddWithValue("@passw",ulc.passd);
                cmd.Parameters.AddWithValue("@utype", "Doctor");
                db.execute(cmd);
            
            return RedirectToAction("Doc_registration");
        }
        
        public ActionResult check_user(FormCollection fm)
        {
            Session["newdoc_uname"] = fm["ctl00$MainContent$DuserText"];
            Session["txtbx"] = Session["newdoc_uname"].ToString();
            int i = ext.chk(Session["newdoc_uname"].ToString());
            if (i == 1)
            {
                Session["visiblesubmit"] = "Exist";
            }
            else
            {
                Session["visiblesubmit"] = "Not";
            }


            return RedirectToAction("Admin_add_doctor");
        }
        
        public ActionResult logout()
        {
            return RedirectToAction("login_user","Login");
        }
        
        public ActionResult Admin_add_doctortoLogin(FormCollection fm)
        {
            dr.d_uname = fm["ctl00$MainContent$DuserText"];
            return RedirectToAction("Doc_registration");
        }
        
    }
}
