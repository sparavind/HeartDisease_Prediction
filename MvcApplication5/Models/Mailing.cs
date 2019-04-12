using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace MvcApplication5.Models
{
    public class Mailing
    {
        public string sentmail(string uname, string pass, string mailid)
        {
            string a="";
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("aravindsp123@gmail.com");
                mail.To.Add(mailid);
                mail.Subject = "HEARTPOINT-User Password Recovery";
                mail.Body = "Your Username is :   " + uname + "   Password is :   " + pass;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("aravindsp123@gmail.com", "8089112818");
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
                 a = "Password has been forwarded successfully";
                //Response.Write("<Script>alert('Send Username & password to Mail Succesfully...') </script>");
            }

            catch (Exception ex)
            {
                //  ex.ToString();
                a = "Password Recovery/Forwarding Failed! Check your Internet Connection";
                //Response.Write("<Script>alert(' Login details Not Sent to Mail Beacouse of Network Error or Other') </script>");
            }
            return a;
            //IF USER NOT AVAILABLE PUT A MESSAGE//
        }
    }
}