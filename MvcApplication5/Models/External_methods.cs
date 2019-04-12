using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace MvcApplication5.Models
{
    public class External_methods
    {
        int uexist;
        dboperation db=new dboperation();
        public int chk(string name)
        {

            SqlCommand con1 = new SqlCommand();
            con1.CommandText = "if_user_exist";
            con1.Parameters.AddWithValue("@username", name);

            DataTable dt = db.getdata(con1);
            int u = Convert.ToInt16(dt.Rows[0][0]);
            if (u >= 1)
            {
                uexist = 1;

            }
            else
            {
                uexist = 0;

            }
            return uexist;
        }

        public string Naive_bayers(Predict_variables pv)
        {
            SqlCommand con1 = new SqlCommand();
            con1.CommandText = "algo_totalrow";
            decimal trowcount=db.getcount(con1);
          

            SqlCommand con2 = new SqlCommand();
            con2.CommandText = "algo_result0";
            decimal tresult0 = db.getcount(con2);

            SqlCommand con3 = new SqlCommand();
            con3.CommandText = "algo_result1";
            decimal tresult1 = db.getcount(con3);

            SqlCommand con4 = new SqlCommand();
            con4.CommandText = "algo_result2";
            decimal tresult2 = db.getcount(con4);

            SqlCommand con5 = new SqlCommand();
            con5.CommandText = "algo_result3";
            decimal tresult3 = db.getcount(con5);

            SqlCommand con6 = new SqlCommand();
            con6.CommandText = "algo_result4";
            decimal tresult4 = db.getcount(con6);

            decimal prob_result0 = tresult0 / trowcount;
            decimal prob_result1 = tresult1 / trowcount;
            decimal prob_result2 = tresult2 / trowcount;
            decimal prob_result3 = tresult3 / trowcount;
            decimal prob_result4 = tresult4 / trowcount;


            //QUESTION 1-AGE RESULT CALCULATION//
            int ulimit;
            int llimit;
            if (pv.age < 20)
            {
                 ulimit = 20;
                 llimit = 0;
            }
            else if(pv.age>=20&&pv.age<40)
            {
                 ulimit = 40;
                 llimit = 21;
            }
            else if (pv.age >= 40&&pv.age <=60)
            {
                 ulimit = 60;
                 llimit = 41;
            }
            else
            {
                 ulimit = 200;
                 llimit =61 ;
            }
            SqlCommand con7 = new SqlCommand();
            con7.CommandText = "algo_q1result";
            con7.Parameters.AddWithValue("@ageupper",ulimit);
            con7.Parameters.AddWithValue("@agelower",llimit);
            con7.Parameters.AddWithValue("@result","0");
            decimal q1result0 = db.getcount(con7);
            decimal prob_q1result0 = q1result0 / tresult0;

            SqlCommand con8 = new SqlCommand();
            con8.CommandText = "algo_q1result";
            con8.Parameters.AddWithValue("@ageupper", ulimit);
            con8.Parameters.AddWithValue("@agelower", llimit);
            con8.Parameters.AddWithValue("@result", "1");
            decimal q1result1 = db.getcount(con8);
            decimal prob_q1result1 = q1result1 / tresult1;
           
            SqlCommand con9 = new SqlCommand();
            con9.CommandText = "algo_q1result";
            con9.Parameters.AddWithValue("@ageupper", ulimit);
            con9.Parameters.AddWithValue("@agelower", llimit);
            con9.Parameters.AddWithValue("@result", "2");
            decimal q1result2 = db.getcount(con9);
            decimal prob_q1result2 = q1result2 / tresult2;

            SqlCommand con10 = new SqlCommand();
            con10.CommandText = "algo_q1result";
            con10.Parameters.AddWithValue("@ageupper", ulimit);
            con10.Parameters.AddWithValue("@agelower", llimit);
            con10.Parameters.AddWithValue("@result","3");
            decimal q1result3 = db.getcount(con10);
            decimal prob_q1result3 = q1result3 / tresult3;

            SqlCommand con11 = new SqlCommand();
            con11.CommandText = "algo_q1result";
            con11.Parameters.AddWithValue("@ageupper", ulimit);
            con11.Parameters.AddWithValue("@agelower", llimit);
            con11.Parameters.AddWithValue("@result", "4");
            decimal q1result4 = db.getcount(con11);
            decimal prob_q1result4 = q1result4 / tresult4;


            //QUESTION 2-GENDER RESULT CALCULATION//
            SqlCommand con12 = new SqlCommand();
            con12.CommandText = "algo_q2result";
            con12.Parameters.AddWithValue("@gender", pv.gender);
            con12.Parameters.AddWithValue("@result","0");
            decimal q2result0 = db.getcount(con12);
            decimal prob_q2result0 = q2result0 / tresult0;

            SqlCommand con13 = new SqlCommand();
            con13.CommandText = "algo_q2result";
            con13.Parameters.AddWithValue("@gender", pv.gender);
            con13.Parameters.AddWithValue("@result", "1");
            decimal q2result1 = db.getcount(con13);
            decimal prob_q2result1 = q2result1 / tresult1;

            SqlCommand con14 = new SqlCommand();
            con14.CommandText = "algo_q2result";
            con14.Parameters.AddWithValue("@gender", pv.gender);
            con14.Parameters.AddWithValue("@result", "2");
            decimal q2result2 = db.getcount(con14);
            decimal prob_q2result2 = q2result2 / tresult2;

            SqlCommand con15 = new SqlCommand();
            con15.CommandText = "algo_q2result";
            con15.Parameters.AddWithValue("@gender", pv.gender);
            con15.Parameters.AddWithValue("@result", "3");
            decimal q2result3 = db.getcount(con15);
            decimal prob_q2result3 = q2result3 / tresult3;

            SqlCommand con16 = new SqlCommand();
            con16.CommandText = "algo_q2result";
            con16.Parameters.AddWithValue("@gender", pv.gender);
            con16.Parameters.AddWithValue("@result", "4");
            decimal q2result4 = db.getcount(con16);
            decimal prob_q2result4 = q2result4 / tresult4;


            //QUESTION 3-CHEST PAIN RESULT CALCULATION//
            SqlCommand con17 = new SqlCommand();
            con17.CommandText = "algo_q3result";
            con17.Parameters.AddWithValue("@chestpain", pv.chestpain);
            con17.Parameters.AddWithValue("@result", "0");
            decimal q3result0 = db.getcount(con17);
            decimal prob_q3result0 = q3result0 / tresult0;

            SqlCommand con18 = new SqlCommand();
            con18.CommandText = "algo_q3result";
            con18.Parameters.AddWithValue("@chestpain", pv.chestpain);
            con18.Parameters.AddWithValue("@result", "1");
            decimal q3result1 = db.getcount(con18);
            decimal prob_q3result1 = q3result1 / tresult1;

            SqlCommand con19 = new SqlCommand();
            con19.CommandText = "algo_q3result";
            con19.Parameters.AddWithValue("@chestpain", pv.chestpain);
            con19.Parameters.AddWithValue("@result", "2");
            decimal q3result2 = db.getcount(con19);
            decimal prob_q3result2 = q3result2 / tresult2;

            SqlCommand con20 = new SqlCommand();
            con20.CommandText = "algo_q3result";
            con20.Parameters.AddWithValue("@chestpain", pv.chestpain);
            con20.Parameters.AddWithValue("@result", "3");
            decimal q3result3 = db.getcount(con20);
            decimal prob_q3result3 = q3result3 / tresult3;

            SqlCommand con21 = new SqlCommand();
            con21.CommandText = "algo_q3result";
            con21.Parameters.AddWithValue("@chestpain", pv.chestpain);
            con21.Parameters.AddWithValue("@result", "4");
            decimal q3result4 = db.getcount(con21);
            decimal prob_q3result4 = q3result4 / tresult4;

            //QUESTION 4-REST BP RESULT CALCULATION//
            int bp_ulimit=0;
            int bp_llimit=0;
            //int result;
            if (pv.restsbp >= 94 && pv.restsbp<=120)
            {
                bp_llimit = 94;
                bp_ulimit = 120;
            }
            else if (pv.restsbp >=121 && pv.restsbp <= 150)
            {
                bp_llimit = 121;
                bp_ulimit = 150; 
            }
            else if (pv.restsbp >= 151 && pv.restsbp <= 200)
            {
                bp_llimit = 151;
                bp_ulimit = 200;
            }
           
            SqlCommand con22 = new SqlCommand();
            con22.CommandText = "algo_q4result";
            con22.Parameters.AddWithValue("@llimit_bp", bp_llimit);
            con22.Parameters.AddWithValue("@ulimit_bp", bp_ulimit);
            con22.Parameters.AddWithValue("@result", "0");
            decimal q4result0 = db.getcount(con22);
            decimal prob_q4result0 = q4result0 / tresult0;

            SqlCommand con23 = new SqlCommand();
            con23.CommandText = "algo_q4result";
            con23.Parameters.AddWithValue("@llimit_bp", bp_llimit);
            con23.Parameters.AddWithValue("@ulimit_bp", bp_ulimit);
            con23.Parameters.AddWithValue("@result", "1");
            decimal q4result1 = db.getcount(con23);
            decimal prob_q4result1 = q4result1 / tresult1;

            SqlCommand con24 = new SqlCommand();
            con24.CommandText = "algo_q4result";
            con24.Parameters.AddWithValue("@llimit_bp", bp_llimit);
            con24.Parameters.AddWithValue("@ulimit_bp", bp_ulimit);
            con24.Parameters.AddWithValue("@result", "2");
            decimal q4result2 = db.getcount(con24);
            decimal prob_q4result2 = q4result2 / tresult2;

            SqlCommand con25 = new SqlCommand();
            con25.CommandText = "algo_q4result";
            con25.Parameters.AddWithValue("@llimit_bp", bp_llimit);
            con25.Parameters.AddWithValue("@ulimit_bp", bp_ulimit);
            con25.Parameters.AddWithValue("@result", "3");
            decimal q4result3 = db.getcount(con25);
            decimal prob_q4result3 = q4result3 / tresult3;

            SqlCommand con26 = new SqlCommand();
            con26.CommandText = "algo_q4result";
            con26.Parameters.AddWithValue("@llimit_bp", bp_llimit);
            con26.Parameters.AddWithValue("@ulimit_bp", bp_ulimit);
            con26.Parameters.AddWithValue("@result", "4");
            decimal q4result4 = db.getcount(con26);
            decimal prob_q4result4 = q4result4 / tresult4;


            //QUESTION 5-CHOLESTROL LEVEL RESULT CALCULATION//
            int ch_ulimit=0;
            int ch_llimit=0;
            if (pv.cholestrol >= 126 && pv.cholestrol <= 200)
            {
                ch_llimit = 126;
                ch_ulimit = 200;
            }
            else if (pv.cholestrol >= 201 && pv.cholestrol <= 239)
            {
                ch_llimit = 201;
                ch_ulimit = 239;
            }
            else if (pv.cholestrol >= 240 && pv.cholestrol <= 564)
            {
                ch_llimit = 240;
                ch_ulimit = 564;
            }
            SqlCommand con27 = new SqlCommand();
            con27.CommandText = "algo_q5result";
            con27.Parameters.AddWithValue("@ch_llimit", ch_llimit);
            con27.Parameters.AddWithValue("@ch_ulimit", ch_ulimit);
            con27.Parameters.AddWithValue("@result", "0");
            decimal q5result0 = db.getcount(con27);
            decimal prob_q5result0 = q5result0 / tresult0;

            SqlCommand con28 = new SqlCommand();
            con28.CommandText = "algo_q5result";
            con28.Parameters.AddWithValue("@ch_llimit", ch_llimit);
            con28.Parameters.AddWithValue("@ch_ulimit", ch_ulimit);
            con28.Parameters.AddWithValue("@result", "1");
            decimal q5result1 = db.getcount(con28);
            decimal prob_q5result1 = q5result1 / tresult1;

            SqlCommand con29 = new SqlCommand();
            con29.CommandText = "algo_q5result";
            con29.Parameters.AddWithValue("@ch_llimit", ch_llimit);
            con29.Parameters.AddWithValue("@ch_ulimit", ch_ulimit);
            con29.Parameters.AddWithValue("@result", "2");
            decimal q5result2 = db.getcount(con29);
            decimal prob_q5result2 = q5result2 / tresult2;

            SqlCommand con30 = new SqlCommand();
            con30.CommandText = "algo_q5result";
            con30.Parameters.AddWithValue("@ch_llimit", ch_llimit);
            con30.Parameters.AddWithValue("@ch_ulimit", ch_ulimit);
            con30.Parameters.AddWithValue("@result", "3");
            decimal q5result3 = db.getcount(con30);
            decimal prob_q5result3 = q5result3 / tresult3;

            SqlCommand con31 = new SqlCommand();
            con31.CommandText = "algo_q5result";
            con31.Parameters.AddWithValue("@ch_llimit", ch_llimit);
            con31.Parameters.AddWithValue("@ch_ulimit", ch_ulimit);
            con31.Parameters.AddWithValue("@result", "4");
            decimal q5result4 = db.getcount(con31);
            decimal prob_q5result4 = q5result4 / tresult4;

            //QUESTION 6-FASTING BLOOD SUGAR LEVEL RESULT CALCULATION//
            SqlCommand con32 = new SqlCommand();
            con32.CommandText = "algo_q6result";
            con32.Parameters.AddWithValue("@fastbs", pv.fastbs);
            con32.Parameters.AddWithValue("@result", "0");
            decimal q6result0 = db.getcount(con32);
            decimal prob_q6result0 = q6result0 / tresult0;

            SqlCommand con33 = new SqlCommand();
            con33.CommandText = "algo_q6result";
            con33.Parameters.AddWithValue("@fastbs", pv.fastbs);
            con33.Parameters.AddWithValue("@result", "1");
            decimal q6result1 = db.getcount(con33);
            decimal prob_q6result1 = q6result1 / tresult1;

            SqlCommand con34 = new SqlCommand();
            con34.CommandText = "algo_q6result";
            con34.Parameters.AddWithValue("@fastbs", pv.fastbs);
            con34.Parameters.AddWithValue("@result", "2");
            decimal q6result2 = db.getcount(con34);
            decimal prob_q6result2 = q6result2 / tresult2;

            SqlCommand con35 = new SqlCommand();
            con35.CommandText = "algo_q6result";
            con35.Parameters.AddWithValue("@fastbs", pv.fastbs);
            con35.Parameters.AddWithValue("@result", "3");
            decimal q6result3 = db.getcount(con35);
            decimal prob_q6result3 = q6result3 / tresult3;

            SqlCommand con36 = new SqlCommand();
            con36.CommandText = "algo_q6result";
            con36.Parameters.AddWithValue("@fastbs", pv.fastbs);
            con36.Parameters.AddWithValue("@result", "4");
            decimal q6result4 = db.getcount(con36);
            decimal prob_q6result4 = q6result4 / tresult4;


            //QUESTION -7 RESTING ECG RESULT CALCULATION//
            SqlCommand con37 = new SqlCommand();
            con37.CommandText = "algo_q7result";
            con37.Parameters.AddWithValue("@restecg", pv.restecg);
            con37.Parameters.AddWithValue("@result", "0");
            decimal q7result0 = db.getcount(con37);
            decimal prob_q7result0 = q7result0 / tresult0;

            SqlCommand con38 = new SqlCommand();
            con38.CommandText = "algo_q7result";
            con38.Parameters.AddWithValue("@restecg", pv.restecg);
            con38.Parameters.AddWithValue("@result", "1");
            decimal q7result1 = db.getcount(con38);
            decimal prob_q7result1 = q7result1 / tresult1;

            SqlCommand con39 = new SqlCommand();
            con39.CommandText = "algo_q7result";
            con39.Parameters.AddWithValue("@restecg", pv.restecg);
            con39.Parameters.AddWithValue("@result", "2");
            decimal q7result2 = db.getcount(con39);
            decimal prob_q7result2 = q7result2 / tresult2;
            
            SqlCommand con40 = new SqlCommand();
            con40.CommandText = "algo_q7result";
            con40.Parameters.AddWithValue("@restecg", pv.restecg);
            con40.Parameters.AddWithValue("@result", "3");
            decimal q7result3 = db.getcount(con40);
            decimal prob_q7result3 = q7result3 / tresult3;

            SqlCommand con41 = new SqlCommand();
            con41.CommandText = "algo_q7result";
            con41.Parameters.AddWithValue("@restecg", pv.restecg);
            con41.Parameters.AddWithValue("@result", "4");
            decimal q7result4 = db.getcount(con41);
            decimal prob_q7result4 = q7result4 / tresult4;

            //QUESTION -8 THALACH(MAX HEART RATE)[71.0-202.0] LEVEL RESULT CALCULATION--VALUE INCORRECT//
            int mhr_ulimit = 0;
            int mhr_llimit = 0;
            if (pv.maxheart >= 66 && pv.maxheart <=77)
            {
                mhr_llimit = 66;
                mhr_ulimit = 77;
            }
            else
            {
                mhr_llimit = 78;
                mhr_ulimit = 202;
            }

            SqlCommand con42 = new SqlCommand();
            con42.CommandText = "algo_q8result";
            con42.Parameters.AddWithValue("@mhr_llimit", mhr_llimit);
            con42.Parameters.AddWithValue("@mhr_ulimit", mhr_ulimit);
            con42.Parameters.AddWithValue("@result", "0");
            decimal q8result0 = db.getcount(con42);
            decimal prob_q8result0 = q8result0 / tresult0;

            SqlCommand con43 = new SqlCommand();
            con43.CommandText = "algo_q8result";
            con43.Parameters.AddWithValue("@mhr_llimit", mhr_llimit);
            con43.Parameters.AddWithValue("@mhr_ulimit", mhr_ulimit);
            con43.Parameters.AddWithValue("@result", "1");
            decimal q8result1 = db.getcount(con43);
            decimal prob_q8result1 = q8result1 / tresult1;

            SqlCommand con44 = new SqlCommand();
            con44.CommandText = "algo_q8result";
            con44.Parameters.AddWithValue("@mhr_llimit", mhr_llimit);
            con44.Parameters.AddWithValue("@mhr_ulimit", mhr_ulimit);
            con44.Parameters.AddWithValue("@result", "2");
            decimal q8result2 = db.getcount(con44);
            decimal prob_q8result2 = q8result2 / tresult2;

            SqlCommand con45 = new SqlCommand();
            con45.CommandText = "algo_q8result";
            con45.Parameters.AddWithValue("@mhr_llimit", mhr_llimit);
            con45.Parameters.AddWithValue("@mhr_ulimit", mhr_ulimit);
            con45.Parameters.AddWithValue("@result", "3");
            decimal q8result3 = db.getcount(con45);
            decimal prob_q8result3 = q8result3 / tresult3;

            SqlCommand con46 = new SqlCommand();
            con46.CommandText = "algo_q8result";
            con46.Parameters.AddWithValue("@mhr_llimit", mhr_llimit);
            con46.Parameters.AddWithValue("@mhr_ulimit", mhr_ulimit);
            con46.Parameters.AddWithValue("@result", "4");
            decimal q8result4 = db.getcount(con46);
            decimal prob_q8result4 = q8result4 / tresult4;

            //QUESTION -9 EXERCISE ANGINA LEVEL RESULT CALCULATION/
            SqlCommand con47 = new SqlCommand();
            con47.CommandText = "algo_q9result";
            con47.Parameters.AddWithValue("@exang", pv.exangina);
            con47.Parameters.AddWithValue("@result", "0");
            decimal q9result0 = db.getcount(con47);
            decimal prob_q9result0 = q9result0 / tresult0;

            SqlCommand con48 = new SqlCommand();
            con48.CommandText = "algo_q9result";
            con48.Parameters.AddWithValue("@exang", pv.exangina);
            con48.Parameters.AddWithValue("@result", "1");
            decimal q9result1 = db.getcount(con48);
            decimal prob_q9result1 = q9result1 / tresult1;

            SqlCommand con49 = new SqlCommand();
            con49.CommandText = "algo_q9result";
            con49.Parameters.AddWithValue("@exang", pv.exangina);
            con49.Parameters.AddWithValue("@result", "2");
            decimal q9result2 = db.getcount(con49);
            decimal prob_q9result2 = q9result2 / tresult2;

            SqlCommand con50 = new SqlCommand();
            con50.CommandText = "algo_q9result";
            con50.Parameters.AddWithValue("@exang", pv.exangina);
            con50.Parameters.AddWithValue("@result", "3");
            decimal q9result3 = db.getcount(con50);
            decimal prob_q9result3 = q9result3 / tresult3;

            SqlCommand con51 = new SqlCommand();
            con51.CommandText = "algo_q9result";
            con51.Parameters.AddWithValue("@exang", pv.exangina);
            con51.Parameters.AddWithValue("@result", "4");
            decimal q9result4 = db.getcount(con51);
            decimal prob_q9result4 = q9result4 / tresult4;

            //QUESTION -10 OLDPEAK LEVEL[0.0-6.2] RESULT CALCULATION---VALUE INCORRECT//
            double oldp_ulimit = 0;
            double oldp_llimit = 0;
            if (pv.oldpeak >= 0 && pv.oldpeak<=1)
            {
                oldp_llimit = 0;
                oldp_ulimit = 1;
            }
            else 
            {
                oldp_llimit = 1.1;
                oldp_ulimit = 8;
            }
            SqlCommand con52 = new SqlCommand();
            con52.CommandText = "algo_q10result";
            con52.Parameters.AddWithValue("@old_llimit", oldp_llimit);
            con52.Parameters.AddWithValue("@old_ulimit", oldp_ulimit);
            con52.Parameters.AddWithValue("@result", "0");
            decimal q10result0 = db.getcount(con52);
            decimal prob_q10result0 = q10result0 / tresult0;

            SqlCommand con53 = new SqlCommand();
            con53.CommandText = "algo_q10result";
            con53.Parameters.AddWithValue("@old_llimit", oldp_llimit);
            con53.Parameters.AddWithValue("@old_ulimit", oldp_ulimit);
            con53.Parameters.AddWithValue("@result", "1");
            decimal q10result1 = db.getcount(con53);
            decimal prob_q10result1 = q10result1 / tresult1;

            SqlCommand con54 = new SqlCommand();
            con54.CommandText = "algo_q10result";
            con54.Parameters.AddWithValue("@old_llimit", oldp_llimit);
            con54.Parameters.AddWithValue("@old_ulimit", oldp_ulimit);
            con54.Parameters.AddWithValue("@result", "2");
            decimal q10result2 = db.getcount(con54);
            decimal prob_q10result2 = q10result2 / tresult2;

            SqlCommand con55 = new SqlCommand();
            con55.CommandText = "algo_q10result";
            con55.Parameters.AddWithValue("@old_llimit", oldp_llimit);
            con55.Parameters.AddWithValue("@old_ulimit", oldp_ulimit);
            con55.Parameters.AddWithValue("@result", "3");
            decimal q10result3 = db.getcount(con55);
            decimal prob_q10result3 = q10result3 / tresult3;

            SqlCommand con56 = new SqlCommand();
            con56.CommandText = "algo_q10result";
            con56.Parameters.AddWithValue("@old_llimit", oldp_llimit);
            con56.Parameters.AddWithValue("@old_ulimit", oldp_ulimit);
            con56.Parameters.AddWithValue("@result", "4");
            decimal q10result4 = db.getcount(con56);
            decimal prob_q10result4 = q10result4 / tresult4;

            //QUESTION -11 SLOPE[0.0-6.2] RESULT CALCULATION//

            SqlCommand con57 = new SqlCommand();
            con57.CommandText = "algo_q11result";
            con57.Parameters.AddWithValue("@slope", pv.slop);
            con57.Parameters.AddWithValue("@result", "0");
            decimal q11result0 = db.getcount(con57);
            decimal prob_q11result0 = q11result0 / tresult0;

            SqlCommand con58 = new SqlCommand();
            con58.CommandText = "algo_q11result";
            con58.Parameters.AddWithValue("@slope", pv.slop);
            con58.Parameters.AddWithValue("@result", "1");
            decimal q11result1 = db.getcount(con58);
            decimal prob_q11result1 = q11result1 / tresult1;

            SqlCommand con59 = new SqlCommand();
            con59.CommandText = "algo_q11result";
            con59.Parameters.AddWithValue("@slope", pv.slop);
            con59.Parameters.AddWithValue("@result", "2");
            decimal q11result2 = db.getcount(con59);
            decimal prob_q11result2 = q11result2 / tresult2;

            SqlCommand con60 = new SqlCommand();
            con60.CommandText = "algo_q11result";
            con60.Parameters.AddWithValue("@slope", pv.slop);
            con60.Parameters.AddWithValue("@result", "3");
            decimal q11result3 = db.getcount(con60);
            decimal prob_q11result3 = q11result3 / tresult3;

            SqlCommand con61 = new SqlCommand();
            con61.CommandText = "algo_q11result";
            con61.Parameters.AddWithValue("@slope", pv.slop);
            con61.Parameters.AddWithValue("@result", "4");
            decimal q11result4 = db.getcount(con61);
            decimal prob_q11result4 = q11result4 / tresult4;

            //QUESTION -12 NUMBER OF VESSELS RESULT CALCULATION//
            SqlCommand con62 = new SqlCommand();
            con62.CommandText = "algo_q12result";
            con62.Parameters.AddWithValue("@vessel", pv.numvessel);
            con62.Parameters.AddWithValue("@result", "0");
            decimal q12result0 = db.getcount(con62);
            decimal prob_q12result0 = q12result0 / tresult0;

            SqlCommand con63 = new SqlCommand();
            con63.CommandText = "algo_q12result";
            con63.Parameters.AddWithValue("@vessel", pv.numvessel);
            con63.Parameters.AddWithValue("@result", "1");
            decimal q12result1 = db.getcount(con63);
            decimal prob_q12result1 = q12result1 / tresult1;

            SqlCommand con64 = new SqlCommand();
            con64.CommandText = "algo_q12result";
            con64.Parameters.AddWithValue("@vessel", pv.numvessel);
            con64.Parameters.AddWithValue("@result", "2");
            decimal q12result2 = db.getcount(con64);
            decimal prob_q12result2 = q12result2 / tresult2;

            SqlCommand con65 = new SqlCommand();
            con65.CommandText = "algo_q12result";
            con65.Parameters.AddWithValue("@vessel", pv.numvessel);
            con65.Parameters.AddWithValue("@result", "3");
            decimal q12result3 = db.getcount(con65);
            decimal prob_q12result3 = q12result3 / tresult3;

            SqlCommand con66 = new SqlCommand();
            con66.CommandText = "algo_q12result";
            con66.Parameters.AddWithValue("@vessel", pv.numvessel);
            con66.Parameters.AddWithValue("@result", "4");
            decimal q12result4 = db.getcount(con66);
            decimal prob_q12result4 = q12result4 / tresult4;

            //QUESTION -13 THAL RESULT CALCULATION//
            SqlCommand con67 = new SqlCommand();
            con67.CommandText = "algo_q13result";
            con67.Parameters.AddWithValue("@thal", pv.thal);
            con67.Parameters.AddWithValue("@result", "0");
            decimal q13result0 = db.getcount(con67);
            decimal prob_q13result0 = q13result0 / tresult0;

            SqlCommand con68 = new SqlCommand();
            con68.CommandText = "algo_q13result";
            con68.Parameters.AddWithValue("@thal", pv.thal);
            con68.Parameters.AddWithValue("@result", "1");
            decimal q13result1 = db.getcount(con68);
            decimal prob_q13result1 = q13result1 / tresult1;

            SqlCommand con69 = new SqlCommand();
            con69.CommandText = "algo_q13result";
            con69.Parameters.AddWithValue("@thal", pv.thal);
            con69.Parameters.AddWithValue("@result", "2");
            decimal q13result2 = db.getcount(con69);
            decimal prob_q13result2 = q13result2/ tresult2;

            SqlCommand con70 = new SqlCommand();
            con70.CommandText = "algo_q13result";
            con70.Parameters.AddWithValue("@thal", pv.thal);
            con70.Parameters.AddWithValue("@result", "3");
            decimal q13result3 = db.getcount(con70);
            decimal prob_q13result3 = q13result3 / tresult3;

            SqlCommand con71 = new SqlCommand();
            con71.CommandText = "algo_q13result";
            con71.Parameters.AddWithValue("@thal", pv.thal);
            con71.Parameters.AddWithValue("@result", "4");
            decimal q13result4 = db.getcount(con71);
            decimal prob_q13result4 = q13result4 / tresult4;

            decimal tprob_result0 = (prob_q1result0 * prob_q2result0 * prob_q3result0 * prob_q4result0 * prob_q5result0 * prob_q6result0 * prob_q7result0 * prob_q8result0 * prob_q9result0 * prob_q10result0 * prob_q11result0 * prob_q12result0 * prob_q13result0) * prob_result0;
            decimal tprob_result1 = (prob_q1result1 * prob_q2result1 * prob_q3result1 * prob_q4result1 * prob_q5result1 * prob_q6result1 * prob_q7result1 * prob_q8result1 * prob_q9result1 * prob_q10result1 * prob_q11result1 * prob_q12result1 * prob_q13result1) * prob_result1;
            decimal tprob_result2 = (prob_q1result2 * prob_q2result2 * prob_q3result2 * prob_q4result2 * prob_q5result2 * prob_q6result2 * prob_q7result2 * prob_q8result2 * prob_q9result2 * prob_q10result2 * prob_q11result2 * prob_q12result2 * prob_q13result2) * prob_result2;
            decimal tprob_result3 = (prob_q1result3 * prob_q2result3 * prob_q3result3 * prob_q4result3 * prob_q5result3 * prob_q6result3 * prob_q7result3 * prob_q8result3 * prob_q9result3 * prob_q10result3 * prob_q11result3 * prob_q12result3 * prob_q13result3) * prob_result3;
            decimal tprob_result4 = (prob_q1result4 * prob_q2result4 * prob_q3result4 * prob_q4result4 * prob_q5result4 * prob_q6result4 * prob_q7result4 * prob_q8result4 * prob_q9result4 * prob_q10result4 * prob_q11result4 * prob_q12result4 * prob_q13result4) * prob_result4;

            string fresult;
            if (tprob_result0 > tprob_result1 && tprob_result0 > tprob_result2&&tprob_result0 > tprob_result3&&tprob_result0 > tprob_result4)
            {
                fresult = "0";
            }
            else if (tprob_result1 > tprob_result2 && tprob_result1 > tprob_result3 && tprob_result1 > tprob_result4)
            {
                
                fresult = "1";
            }
            else if (tprob_result2 > tprob_result3 && tprob_result2 > tprob_result4)
            {
                
               fresult = "2";
            }
            else if (tprob_result3 > tprob_result4)
            {
                
                fresult = "3";
            }
            else
            {
                
                fresult = "4";
            }
            return fresult ;
        }
    
    }
}