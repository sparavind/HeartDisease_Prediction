using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.IO;



public class dnaAlg
{
	public string eNcrypt(string message)
        {

            string ACGT_STREAM = "";
            foreach (char c in message)
            {

                string cbyte = Convert.ToString(c,2).PadLeft(8,'0');
                //String k = Convert.ToString(c, 16);
                // textBox2.Text = cbyte;

                string[] sp = new string[4];
                sp[0] = cbyte.Substring(0, 2);
                sp[1] = cbyte.Substring(2, 2);
                sp[2] = cbyte.Substring(4, 2);
                sp[3] = cbyte.Substring(6, 2);

                //textBox3.Text = sp[0] + " " + sp[1] + " " + sp[2] + " " + sp[3];
                string ACGT = "";
                foreach (string el in sp)
                {
                    if (el == "00")
                    {
                        ACGT += "A";
                    }
                    else if (el == "01")
                    {
                        ACGT += "C";
                    }
                    else if (el == "10")
                    {
                        ACGT += "G";
                    }
                    else if (el == "11")
                    {
                        ACGT += "T";
                    }
                }
                ACGT_STREAM = ACGT_STREAM + ACGT;


            }
        
            return ACGT_STREAM;

        }
	public string dEcrypt(string message)
    {

		    string ou = "";
		    string ACGT=message;
                    foreach (char c in ACGT)
                    {
                        if (c.ToString() == "A")
                        {
                            ou = ou + "00";
                        }
                        else if (c.ToString() == "C")
                        {
                            ou = ou + "01";
                        }
                        else if (c.ToString() == "G")
                        {
                            ou = ou + "10";
                        }
                        else if (c.ToString() == "T")
                        {
                            ou = ou + "11";
                        }
                    }
                    ou = Encoding.ASCII.GetString(GetBytesFromBinaryString(ou));
                    return ou;
     }
    public Byte[] GetBytesFromBinaryString(String binary)
    {
        var list = new List<Byte>();
        for (int i = 0; i < binary.Length; i += 8)
        {
            String t = binary.Substring(i, 8);
            list.Add(Convert.ToByte(t, 2));

        }
        return list.ToArray();
    }

}