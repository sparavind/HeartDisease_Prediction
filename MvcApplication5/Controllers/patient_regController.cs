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
    public class patient_regController : Controller
    {
        Patient_reg_class prc = new Patient_reg_class();
        User_login_class uc = new User_login_class();
        dboperation d = new dboperation();
        Patient_med_details pmed = new Patient_med_details();
        Random RD = new Random();
        Predict_variables pv = new Predict_variables();
        External_methods em = new External_methods();
        dnaAlg dna = new dnaAlg();

        public ActionResult patient_registration()
        {
            return View();

            //string s="19/06/2006";
            //TimeSpan ts = new TimeSpan();
            //DateTime d = (DateTime)s;
        }

        public ActionResult patient_medical_details()
        {
            int id = Convert.ToInt32(Session["logid"]);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "get_patient_med_details";
            cmd.Parameters.AddWithValue("@pid", id);
            DataTable dt = d.getdata(cmd);
            Session["PatMedDetails"] = dt;
            if (dt.Rows.Count == 0)
            {
                Session["Buttontext"] = 0;
            }
            else
            {
                Session["Buttontext"] = 1;
            }
            return View();
        }

        public ActionResult patient_password_change()
        {
            return View();
        }

        public ActionResult patient_portfolio_show()
        {
            int id = Convert.ToInt32(Session["logid"]);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "get_patient_med_details";
            cmd.Parameters.AddWithValue("@pid", id);
            DataTable dt = d.getdata(cmd);
            Session["PatMedDetails"] = dt;

            //int id = Convert.ToInt32(Session["logid"]);
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = "get_patdetails";
            cmd1.Parameters.AddWithValue("@pid", id);
            DataTable dt1 = d.getdata(cmd1);
            Session["PatDetails"] = dt1;
            return View();
        }
        
        public ActionResult patient_medical_details_view()
        {
            int id = Convert.ToInt32(Session["logid"]);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "get_patient_med_details";
            cmd.Parameters.AddWithValue("@pid", id);
            DataTable dt = d.getdata(cmd);
            Session["PatMedDetails"] = dt;
            return View();
        }
        
        public ActionResult patient_medical_details_edit(FormCollection fm)
        {
            int id = Convert.ToInt32(Session["logid"]);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "get_patient_med_details";
            DataTable dt = d.getdata(cmd);
            Session["PatMedPrevDetails"] = dt;
            return RedirectToAction("patient_medical_details_view");
        }
        
        public ActionResult addnew_patient(FormCollection fm)
        {
           
            prc.p_name = fm["ctl00$MainContent$pnameText"];
            prc.p_gender = fm["ctl00$MainContent$RadioButtonListGender"];
            prc.p_dob = fm["ctl00$MainContent$PdobText"];
            prc.p_address = fm["ctl00$MainContent$paddressText"];
            prc.p_city = fm["ctl00$MainContent$pcityText"];
            prc.p_state = fm["ctl00$MainContent$pstateText"];
            prc.p_pin = fm["ctl00$MainContent$ppinText"];
            prc.p_mobile = fm["ctl00$MainContent$pmobText"];
            prc.p_email = fm["ctl00$MainContent$pmailText"];
            prc.pid = Convert.ToInt32(Session["logid"]);

            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = "insert_patient";
            //ENCRYPTED INSERTION//
            cmd1.Parameters.AddWithValue("@pid",prc.pid);
            cmd1.Parameters.AddWithValue("@pname",prc.p_name);
            cmd1.Parameters.AddWithValue("@gender",prc.p_gender);
            cmd1.Parameters.AddWithValue("@dob",prc.p_dob);
            cmd1.Parameters.AddWithValue("@address",prc.p_address);
            cmd1.Parameters.AddWithValue("@city",prc.p_city);
            cmd1.Parameters.AddWithValue("@state", prc.p_state);
            cmd1.Parameters.AddWithValue("@pincode", prc.p_pin);
            cmd1.Parameters.AddWithValue("@mobile", prc.p_mobile);
            cmd1.Parameters.AddWithValue("@email",prc.p_email);
            d.execute(cmd1);

            //TempData["notice"] = "successfully registered";

            //string message = "Successfully submitted";
            //System.Text.StringBuilder sb = new System.Text.StringBuilder();
            //sb.Append("<script type = 'text/javascript'>");
            //sb.Append("window.onload=function(){");
            //sb.Append("alert('");
            //sb.Append(message);
            //sb.Append("')};");
            //sb.Append("</script>");
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            return RedirectToAction("patient_portfolio_show");
        }

        public ActionResult pat_currpassword(FormCollection fm)
        {

            uc.passd = fm["ctl00$MainContent$current_passText"];
            uc.uid = Convert.ToInt32(Session["logid"]);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "get_curpassword";
            cmd.Parameters.AddWithValue("@uid", uc.uid);
            DataTable dt = d.getdata(cmd);
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

            return RedirectToAction("patient_password_change");
        }

        public ActionResult pat_newpassword(FormCollection fm)
        {
            uc.passd = fm["ctl00$MainContent$NewPassText"];
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "set_newpassword";
            cmd.Parameters.AddWithValue("@uid", Convert.ToInt32(Session["logid"]));
            cmd.Parameters.AddWithValue("@pass", uc.passd);
            d.execute(cmd);
            TempData["Pwresult"] = "Password Changed Successfully";
            return RedirectToAction("patient_password_change");
        }

        
        public ActionResult patient_medical_details_insert(FormCollection fm)
        {
            pmed.chestpain = fm["ctl00$MainContent$DropDownPaintype"];
            pmed.restsbp = fm["ctl00$MainContent$bpsText"];
            pmed.restdbp = fm["ctl00$MainContent$bpdText"];
            pmed.cholestrol = fm["ctl00$MainContent$cholText"];
            pmed.fastbs = fm["ctl00$MainContent$fsugarText"];
            pmed.restecg = fm["ctl00$MainContent$DropDownRestecg"];
            pmed.maxheart= fm["ctl00$MainContent$heartrateText"];
            pmed.exangina = fm["ctl00$MainContent$DropDownExercisAn"];
            pmed.oldpeak = fm["ctl00$MainContent$peakText"];
            pmed.slop = fm["ctl00$MainContent$DropDownSlope"];
            pmed.numvessel = fm["ctl00$MainContent$DropDownVessels"];
            pmed.thal = fm["ctl00$MainContent$DropDownThal"];
            pmed.pid= Convert.ToInt32(Session["logid"]);

            SqlCommand cm = new SqlCommand();
            cm.CommandText = "maxmid_in_patmed";
            int id = d.maxid(cm);
            
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "set_patient_med_details";
            cmd.Parameters.AddWithValue("@mid",(id));
            cmd.Parameters.AddWithValue("@pid",(pmed.pid));
            cmd.Parameters.AddWithValue("@chestpain",dna.eNcrypt( pmed.chestpain));
            cmd.Parameters.AddWithValue("@restsbp", dna.eNcrypt(pmed.restsbp));
            cmd.Parameters.AddWithValue("@chol",dna.eNcrypt(pmed.cholestrol));
            cmd.Parameters.AddWithValue("@fastbs",dna.eNcrypt(pmed.fastbs));
            cmd.Parameters.AddWithValue("@restecg",dna.eNcrypt(pmed.restecg));
            cmd.Parameters.AddWithValue("@maxh",dna.eNcrypt(pmed.maxheart));
            cmd.Parameters.AddWithValue("@exang",dna.eNcrypt(pmed.exangina));
            cmd.Parameters.AddWithValue("@oldp",dna.eNcrypt(pmed.oldpeak));
            cmd.Parameters.AddWithValue("@slop",dna.eNcrypt(pmed.slop));
            cmd.Parameters.AddWithValue("@numv",dna.eNcrypt(pmed.numvessel));
            cmd.Parameters.AddWithValue("@thal",dna.eNcrypt(pmed.thal));
            d.execute(cmd);
            Session["visible_predict"] = 1;
            return RedirectToAction("patient_medical_details");
        }
        
        public ActionResult apply_naive_bayers(FormCollection fm)
        {
            int id = Convert.ToInt32(Session["logid"]);
            
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "get_patdetails";
            cmd.Parameters.AddWithValue("@pid", id);
            DataTable dt= d.getdata(cmd);
            
            //SET AGE//
            string dob= dt.Rows[0][4].ToString();

            DateTime birthday=new DateTime();
            birthday=Convert.ToDateTime(dob);
            DateTime today=DateTime.Today;
            pv.age=today.Year-birthday.Year;
            if(birthday>today.AddYears(-pv.age))
            {
                pv.age--;
            }
            //SET GENDER//
            if (dt.Rows[0][3].ToString() == "Male")
            {
                pv.gender = 1;
            }
            else if (dt.Rows[0][3].ToString() == "Female")
            {
                pv.gender = 0;
            }

            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = "get_patient_med_details";
            cmd1.Parameters.AddWithValue("@pid", id);
            DataTable dt1 = d.getdata(cmd1);

            //SET CHEST PAIN//
            if(dna.dEcrypt(dt1.Rows[0][2].ToString())=="Typical Angina")
            {
                pv.chestpain = 1;
            }
            else if (dna.dEcrypt(dt1.Rows[0][2].ToString()) == "Atypical Angina")
            {
                pv.chestpain = 2;
            }
            else if (dna.dEcrypt(dt1.Rows[0][2].ToString()) == "Non Anginal Pain")
            {
                pv.chestpain = 3;
            }
            else if (dna.dEcrypt(dt1.Rows[0][2].ToString()) == "Asymptomatic")
            {
                pv.chestpain = 4;
            }
            //SET REST BP//
            pv.restsbp = Convert.ToInt32(dna.dEcrypt(dt1.Rows[0][3].ToString()));
            //SET CHOLESTROL//
            pv.cholestrol = Convert.ToInt32(dna.dEcrypt(dt1.Rows[0][4].ToString()));

            //SET FASTING BLOOD SUGAR//
            if (Convert.ToInt32(dna.dEcrypt(dt1.Rows[0][5].ToString())) > 120)
            {
                pv.fastbs = 1;
            }
            else
            {
                pv.fastbs = 0;
            }
            //SET REST ECG//
            if (dna.dEcrypt(dt1.Rows[0][6].ToString()) == "Normal")
            {
                pv.restecg = 0;
            }
            else if (dna.dEcrypt(dt1.Rows[0][6].ToString()) == "Having ST-T wave abnormality")
            {
                pv.restecg = 1;
            }
            else if (dna.dEcrypt(dt1.Rows[0][6].ToString()) == "Definite left ventricularHypertrophy")
            {
                pv.restecg = 2;
            }
            //SET THALACH MAX HEART RATE//
            pv.maxheart = Convert.ToInt32(dna.dEcrypt(dt1.Rows[0][7].ToString()));
            //SET EXERCISE ANGINA//
            if (dna.dEcrypt(dt1.Rows[0][8].ToString()) == "Yes")
            {
                pv.exangina = 1;
            }
            else if (dna.dEcrypt(dt1.Rows[0][8].ToString()) == "No")
            {
                pv.exangina = 0;
            }
            //SET OLD PEAK//
            pv.oldpeak = float.Parse(dna.dEcrypt(dt1.Rows[0][9].ToString()));
            //SET SLOPE OF SEGMENT//
            if (dna.dEcrypt(dt1.Rows[0][10].ToString()) == "Upsloping")
            {
                pv.slop = 1;
            }
            else if (dna.dEcrypt(dt1.Rows[0][10].ToString()) == "Flat")
            {
                pv.slop = 2;
            }
            else if (dna.dEcrypt(dt1.Rows[0][10].ToString()) == "Down sloping")
            {
                pv.slop = 3;
            }
            //SET NUMBER OF VESSELS//
            pv.numvessel = Convert.ToInt32(dna.dEcrypt(dt1.Rows[0][11].ToString()));
            //SET NUMBER OF THAL//
            if (dna.dEcrypt(dt1.Rows[0][12].ToString()) == "Normal")
            {
                pv.thal = 3;
            }
            else if (dna.dEcrypt(dt1.Rows[0][12].ToString()) == "Fixed defect")
            {
                pv.thal = 6;
            }
            else if (dna.dEcrypt(dt1.Rows[0][12].ToString()) == "Reversible defect")
            {
                pv.thal = 7;
            }

            Session["dstatus"]= em.Naive_bayers(pv);

            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "maxdsetid";
            int dsid = d.maxid(cmd3);

            SqlCommand cmd2 = new SqlCommand();
            
            cmd2.CommandText = "set_dataset";
            cmd2.Parameters.AddWithValue("@id", dsid);
            cmd2.Parameters.AddWithValue("@pid", id);
            cmd2.Parameters.AddWithValue("@age",pv.age);
            cmd2.Parameters.AddWithValue("@gender",pv.gender);
            cmd2.Parameters.AddWithValue("@chestp",pv.chestpain);
            cmd2.Parameters.AddWithValue("@rbp",pv.restsbp);
            cmd2.Parameters.AddWithValue("@chol", pv.cholestrol);
            cmd2.Parameters.AddWithValue("@fastbs", pv.fastbs);
            cmd2.Parameters.AddWithValue("@restecg", pv.restecg);
            cmd2.Parameters.AddWithValue("@mhr", pv.maxheart);
            cmd2.Parameters.AddWithValue("@exang", pv.exangina);
            cmd2.Parameters.AddWithValue("@oldp", pv.oldpeak);
            cmd2.Parameters.AddWithValue("@slope", pv.slop);
            cmd2.Parameters.AddWithValue("@canumves", pv.numvessel);
            cmd2.Parameters.AddWithValue("@thal", pv.thal);
            cmd2.Parameters.AddWithValue("@res", Session["dstatus"]);
            cmd2.Parameters.AddWithValue("@status", "Pending");
            d.execute(cmd2);
           
            return RedirectToAction("patient_medical_details");
        }
        
        public ActionResult logout()
        {
            return RedirectToAction("login_user", "Login");
        }
        
    }
}
