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
    public class Doc_homeController : Controller
    {
        User_login_class uc = new User_login_class();
        dboperation db = new dboperation();
        Patient_reg_class pa = new Patient_reg_class();
        Doc_reg_class drc = new Doc_reg_class();
        Mailing mg = new Mailing();
        External_methods ext = new External_methods();

        public ActionResult doc_profile()
        {
            return View();
        }

        public ActionResult doc_patient_details()
        {

            return View();
        }

        public ActionResult doc_change_password()
        {

            return View();
        }

        public ActionResult doc_portfolio_show()
        {
            int id = Convert.ToInt32(Session["logid"]);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "get_docs_details";
            cmd.Parameters.AddWithValue("@did",id);
            DataTable dt = db.getdata(cmd);
            Session["DocDetails"] = dt;
            return View();
        }

        public ActionResult doc_add_patient()
        {         
            
            return View();
        }
        
        public ActionResult newpatient_reg(FormCollection fm)
        {   //RANDOM PASSWORD//
            Random rd = new Random();
            string ps = rd.Next(000000,999999).ToString() + Session["logid"].ToString();

            uc.usern = fm["ctl00$ContentPlaceHolder1$UnameText"];
            string mail = fm["ctl00$ContentPlaceHolder1$mailText"];
            uc.passd = ps;
            uc.usertype = "Patient";


            SqlCommand cmd2=new SqlCommand();
            cmd2.CommandText = "maxid_in_login";
            db.maxid(cmd2);

            pa.did = Convert.ToInt32(Session["logid"]);
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = "add_patient";
            cmd1.Parameters.AddWithValue("@uid", db.maxid(cmd2));
            cmd1.Parameters.AddWithValue("@uname",uc.usern);
            cmd1.Parameters.AddWithValue("@passw",uc.passd);
            cmd1.Parameters.AddWithValue("@utype",uc.usertype);
            cmd1.Parameters.AddWithValue("@did", pa.did);
            cmd1.Parameters.AddWithValue("@date", System.DateTime.Now);
            db.execute(cmd1);

            //FORWARD PASSWORD TO PATIENT//

            string s = mg.sentmail(uc.usern, uc.passd, mail);
            
            
            return RedirectToAction("doc_add_patient");//show succes or failure along//
        }

        public ActionResult doc_currpassword(FormCollection fm)
        {

            uc.passd = fm["ctl00$ContentPlaceHolder1$current_passText"];
            uc.uid=Convert.ToInt32(Session["logid"]);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "get_curpassword";
            cmd.Parameters.AddWithValue("@uid", uc.uid);
            DataTable dt = db.getdata(cmd);
            dt.Rows[0][0].ToString();
            if (dt.Rows[0][0].ToString() == uc.passd)
            {
                Session["visiblesec2"] = 1;
                Session["cpass"] = uc.passd;
            }
            else
            {
                Session["visiblesec2"] = 0;
            }

            return RedirectToAction("doc_change_password");
        }

        public ActionResult doc_newpassword(FormCollection fm)
        {
            uc.passd = fm["ctl00$ContentPlaceHolder1$NewPassText"];
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "set_newpassword";
            cmd.Parameters.AddWithValue("@uid",Convert.ToInt32(Session["logid"]));
            cmd.Parameters.AddWithValue("@pass", uc.passd);
            db.execute(cmd);
            TempData["Presult"] = "Password Changed Successfully";
            return RedirectToAction("doc_change_password");
        }

        public ActionResult mypatient_detail(FormCollection fm)
        {

            pa.p_name = fm["ctl00$ContentPlaceHolder1$nameText"];
            pa.did=Convert.ToInt32(Session["logid"]);
            
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "get_mypatientlist";
            cmd.Parameters.AddWithValue("@name", pa.p_name);
            cmd.Parameters.AddWithValue("@did", pa.did);
            DataTable dt= db.getdata(cmd);
            
             Session["Result"]= dt;

            return RedirectToAction("doc_patient_details");
            
            
        }

        public ActionResult mypatient_Medicaldetail(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "get_patient_med_details";
           // get_patientdetails
            cmd.Parameters.AddWithValue("@pid",id);
            db.getdata(cmd);
            DataTable dt = db.getdata(cmd);
            Session["PatMedDetails"] = dt;
            return RedirectToAction("patient_medical_details", "patient_reg");

        }

        public ActionResult doc_mydetails_update(FormCollection fm)
        {
            int did=Convert.ToInt32(Session["logid"]);
            drc.d_fname = fm["ctl00$ContentPlaceHolder1$fnameText"];
            drc.d_mname = fm["ctl00$ContentPlaceHolder1$mnameText"];
            drc.d_lname = fm["ctl00$ContentPlaceHolder1$lnameText"];
            drc.d_gender = fm["ctl00$ContentPlaceHolder1$RadioButtonListGender"];
            drc.d_dob = fm["ctl00$ContentPlaceHolder1$dobText"];
            drc.d_mob = fm["ctl00$ContentPlaceHolder1$mobText"];
            drc.d_add = fm["ctl00$ContentPlaceHolder1$addText"];
            drc.d_pin = fm["ctl00$ContentPlaceHolder1$pinText"];
            drc.d_email = fm["ctl00$ContentPlaceHolder1$mailText"];

            drc.d_school1 = fm["ctl00$ContentPlaceHolder1$school1Text"];
            drc.d_cgpa1 = fm["ctl00$ContentPlaceHolder1$cgpa1Text"];
            drc.d_board1 = fm["ctl00$ContentPlaceHolder1$board1Text"];
            drc.d_year1 = Convert.ToInt32(fm["ctl00$ContentPlaceHolder1$year1Text"]);

            drc.d_school2 = fm["ctl00$ContentPlaceHolder1$school2Text"];
            drc.d_cgpa2 = fm["ctl00$ContentPlaceHolder1$cgpa2Text"];
            drc.d_board2 = fm["ctl00$ContentPlaceHolder1$board2Text"];
            drc.d_year2 = Convert.ToInt32(fm["ctl00$ContentPlaceHolder1$year2Text"]);

            drc.d_school3 = fm["ctl00$ContentPlaceHolder1$collegeText"];
            drc.d_cgpa3 = fm["ctl00$ContentPlaceHolder1$cgpa3Text"];
            drc.d_board3 = fm["ctl00$ContentPlaceHolder1$board3Text"];
            drc.d_year3 = Convert.ToInt32(fm["ctl00$ContentPlaceHolder1$year3Text"]);

            drc.d_hosp = fm["ctl00$ContentPlaceHolder1$hospitalText"];

            DateTime StartDate = Convert.ToDateTime(fm["ctl00$ContentPlaceHolder1$expyearText"]);
            DateTime EndDate = Convert.ToDateTime(fm["ctl00$ContentPlaceHolder1$expyearText0"]);

            DateTime zeroTime = new DateTime(1, 1, 1);
            TimeSpan span = EndDate - StartDate;
            int years = (zeroTime + span).Year - 1;

            drc.d_exper = years.ToString();
           
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "update_doctor";
           
            cmd.Parameters.AddWithValue("@did", did);
            cmd.Parameters.AddWithValue("@fname", drc.d_fname);
            cmd.Parameters.AddWithValue("@mname", drc.d_mname);
            cmd.Parameters.AddWithValue("@lname", drc.d_lname);
            cmd.Parameters.AddWithValue("@gender", drc.d_gender);
            cmd.Parameters.AddWithValue("@dob", drc.d_dob);
            cmd.Parameters.AddWithValue("@mob", drc.d_mob);
            cmd.Parameters.AddWithValue("@add", drc.d_add);
            cmd.Parameters.AddWithValue("@pin", drc.d_pin);
            cmd.Parameters.AddWithValue("@email", drc.d_email);
            cmd.Parameters.AddWithValue("@school1", drc.d_school1);
            cmd.Parameters.AddWithValue("@school2", drc.d_school2);
            cmd.Parameters.AddWithValue("@school3", drc.d_school3);
            cmd.Parameters.AddWithValue("@cgpa1", drc.d_cgpa1);
            cmd.Parameters.AddWithValue("@cgpa2", drc.d_cgpa2);
            cmd.Parameters.AddWithValue("@cgpa3", drc.d_cgpa3);
            cmd.Parameters.AddWithValue("@year1", drc.d_year1);
            cmd.Parameters.AddWithValue("@year2", drc.d_year2);
            cmd.Parameters.AddWithValue("@year3", drc.d_year3);
            cmd.Parameters.AddWithValue("@board1", drc.d_board1);
            cmd.Parameters.AddWithValue("@board2", drc.d_board2);
            cmd.Parameters.AddWithValue("@board3", drc.d_board3);
            cmd.Parameters.AddWithValue("@hosp", drc.d_hosp);
            cmd.Parameters.AddWithValue("@exper", drc.d_exper);
            cmd.Parameters.AddWithValue("@resume", "2");
            cmd.Parameters.AddWithValue("@photo", "2");
            
            db.execute(cmd);
            return RedirectToAction("doc_portfolio_show");
            
        }

        public ActionResult check_user(FormCollection fm)
        {
            uc.usern = fm["ctl00$ContentPlaceHolder1$UnameText"];
            Session["txtbx"] = uc.usern;
            int i = ext.chk(uc.usern);
            if (i == 1)
            {
                Session["visiblesubmit"] = "Exist";
            }
            else
            {
                Session["visiblesubmit"] = "Not";
            }
            //fm["ctl00$ContentPlaceHolder1$UnameText"] = uc.passd;

            return RedirectToAction("doc_add_patient");
        }

        public ActionResult doc_set_status(int id)
         {
             SqlCommand cmd = new SqlCommand();
             cmd.CommandText = "set_approval";
             cmd.Parameters.AddWithValue("@pid", id);
             cmd.Parameters.AddWithValue("@newstatus", "Approved");
             db.execute(cmd);
             return RedirectToAction("doc_patient_details");
         }

        public ActionResult logout()
         {
             return RedirectToAction("login_user", "Login");
         }
    }
}
