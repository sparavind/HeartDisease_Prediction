using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication5.Models
{
    public class Predict_variables
    {
        public int gender { get; set; }
        public int age { get; set; }
        public int chestpain { get; set; }
        public int restsbp { get; set; }
        public int cholestrol { get; set; }
        public int fastbs { get; set; }
        public int restecg { get; set; }
        public int maxheart { get; set; }
        public int exangina { get; set; }
        public float oldpeak { get; set; }
        public int slop { get; set; }
        public int numvessel { get; set; }
        public int thal { get; set; }

        public decimal prob { get; set; }
        public string rslt { get; set; }
    }
}