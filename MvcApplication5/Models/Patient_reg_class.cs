using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication5.Models
{
    public class Patient_reg_class
    {
        public int pid { get; set; }
        public int did { get; set; }
        public string p_name { get; set; }
        public string p_gender { get; set; }
        //public string p_age { get; set; }
        public string p_dob { get; set; }
        public string p_address { get; set; }
        public string p_city { get; set; }
        public string p_state { get; set; }
        public string p_pin { get; set; }
        public string p_mobile { get; set; }
        public string p_email { get; set; }
    }
}