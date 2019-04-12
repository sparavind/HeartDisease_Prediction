<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Patient.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        System.Data.DataTable dt1 = (System.Data.DataTable)Session["PatMedDetails"];
        dnaAlg dna = new dnaAlg();
        if (Session["Buttontext"].ToString() == "0")
        {

        }
        else
        {
            psubmitBtn.Text = "Update";
        }
        try
        {
            if (dt1.Rows.Count != 0)
            {
                DropDownPaintype.SelectedItem.Text= dna.dEcrypt(dt1.Rows[0][2].ToString());
                bpsText.Text= dna.dEcrypt(dt1.Rows[0][3].ToString());
                cholText.Text= dna.dEcrypt(dt1.Rows[0][4].ToString());
                fsugarText.Text= dna.dEcrypt(dt1.Rows[0][5].ToString()); 
                DropDownRestecg.SelectedItem.Text= dna.dEcrypt(dt1.Rows[0][6].ToString());
                heartrateText.Text= dna.dEcrypt(dt1.Rows[0][7].ToString());
                DropDownExercisAn.SelectedItem.Text = dna.dEcrypt(dt1.Rows[0][8].ToString());
                peakText.Text= dna.dEcrypt(dt1.Rows[0][9].ToString());
                DropDownSlope.SelectedItem.Text = dna.dEcrypt(dt1.Rows[0][10].ToString());
                DropDownVessels.SelectedItem.Text= dna.dEcrypt(dt1.Rows[0][11].ToString());
                DropDownThal.SelectedItem.Text = dna.dEcrypt(dt1.Rows[0][12].ToString());
                PredictBtn.Visible = false;
                Label2.Visible = false;
                statusLabel.Visible = false;
                statusLabel2.Visible = false;
                
            }
           
            if (Session["visible_predict"].ToString() == "1")
            {
                
                PredictBtn.Visible = true;
                
                
                if (Session["dstatus"].ToString() == "0")
                {
                    Label2.Visible = true;
                    statusLabel.Visible = true;
                    statusLabel2.Visible = true;
                    statusLabel.Text = "Very low Possibilty for getting heart desease!!";
                    statusLabel2.Text = "Have healthy food and exercise regularly";
                    
                }
                else if (Session["dstatus"].ToString() == "1")
                {
                    Label2.Visible = true;
                    statusLabel.Visible = true;
                    statusLabel2.Visible = true;
                    statusLabel.Text = "Low Possibilty for getting heart desease!!";
                    statusLabel2.Text = "Even if it is low chance a mild possibility is there ";

                }
                else if (Session["dstatus"].ToString() == "2")
                {
                    Label2.Visible = true;
                    statusLabel.Visible = true;
                    statusLabel2.Visible = true;
                    statusLabel.Text = "Medium Possibilty for getting heart desease!!";
                    statusLabel2.Text = "You need to control your sugar colestrol levels,Please consult your doctor";

                }
                else if (Session["dstatus"].ToString() == "3")
                {
                    Label2.Visible = true;
                    statusLabel.Visible = true;
                    statusLabel2.Visible = true;
                    statusLabel.Text = "High Possibilty for getting heart desease!!";
                    statusLabel2.Text = "You should consult your doctor as soon as possible";

                }
                else
                {
                    Label2.Visible = true;
                    statusLabel.Visible = true;
                    statusLabel2.Visible = true;
                    statusLabel.Text = "Very High Possibilty for getting heart desease!!";
                    statusLabel2.Text = "The result seem to be severe,consult your doctor NOW!!";

                }

                
                

            }
            Session["visible_predict"] = 0;
        }
        catch
        {
        }
        
        
    }

</script>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    patient_medical_details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Content/startbootstrap-sb-admin-1.0.4/js/jquery.js"></script>
    <%--<form id="form1" runat="server">--%>
    <table style="width: 100%">
        <tr>
            <td colspan="2" style="text-decoration: underline; height: 23px;">
                <strong>MEDICAL</strong> <strong>DETAILS</strong></td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 358px">
                Chest Pain type</td>
            <td>
                <asp:DropDownList ID="DropDownPaintype" runat="server" CausesValidation="True">
                    <%--<asp:ListItem>---select---</asp:ListItem>
                   --%> 
                    <asp:ListItem Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Typical Angina">Typical Angina</asp:ListItem>
                    <asp:ListItem Value="Atypical Angina">Atypical Angina</asp:ListItem>
                    <asp:ListItem Value="Non Anginal Pain">Non Anginal Pain</asp:ListItem>
                    <asp:ListItem Value="Asymptomatic">Asymptomatic</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldPaintype" runat="server" 
                    ControlToValidate="DropDownPaintype" ErrorMessage="Pain type is mandatory" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 358px">
                Resting Blood pressure-Systolic</td>
            <td>
                <asp:TextBox ID="bpsText" runat="server" 
                    ToolTip="If the test is not done enter normal value" CausesValidation="True"></asp:TextBox>
                in mm/Hg on admission to the Hospital<asp:RequiredFieldValidator ID="RequiredFieldRestbp" 
                    runat="server" ControlToValidate="bpsText" ErrorMessage="Systolic BP is mandatory" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 358px; height: 13px;">
                Cholesterol</td>
            <td style="height: 13px">
                <asp:TextBox ID="cholText" runat="server" 
                    ToolTip="If the test is not done enter normal value" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldChol" runat="server" 
                    ControlToValidate="cholText" ErrorMessage="Cholestrol value is mandatory" 
                    ForeColor="Red" ToolTip="If test is not done enter normal value"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 358px; height: 30px;">
                Fasting Blood Sugar</td>
            <td style="height: 30px">
                <asp:TextBox ID="fsugarText" runat="server" 
                    ToolTip="If the test is not done enter normal value" CausesValidation="True"></asp:TextBox>
                mg/dl<asp:RequiredFieldValidator ID="RequiredFieldFbs" runat="server" 
                    ControlToValidate="fsugarText" ErrorMessage="Fasting BP value is mandatory" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 358px">
                Resting ECG Results</td>
            <td>
                <asp:DropDownList ID="DropDownRestecg" runat="server" 
                    ToolTip="If the test is not done select normal" CausesValidation="True">
                    <asp:ListItem Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Normal">Normal</asp:ListItem>
                    <asp:ListItem Value="Having ST-T wave abnormality">Having ST-T wave abnormality</asp:ListItem>
                    <asp:ListItem Value="Definite left ventricularHypertrophy">Definite left ventricularHypertrophy</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldRestecg" runat="server" 
                    ControlToValidate="DropDownRestecg" ErrorMessage="Select ECG result" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 358px; height: 26px;">
                Thalach-Maximum heart rate Achieved</td>
            <td style="height: 26px">
                <asp:TextBox ID="heartrateText" runat="server" 
                    ToolTip="Value can be found from ECG re" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldMaxhrate" runat="server" 
                    ControlToValidate="heartrateText" ErrorMessage="Enter maximum heart rate" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 358px; height: 30px;">
                Excercise induced angina</td>
            <td style="height: 30px">
                <asp:DropDownList ID="DropDownExercisAn" runat="server" CausesValidation="True">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                    <asp:ListItem Value="No">No</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldExerAngina" runat="server" 
                    ControlToValidate="DropDownExercisAn" ErrorMessage="Select Yes or No!" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 358px">
                Old Peak</td>
            <td>
                <asp:TextBox ID="peakText" runat="server"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td style="width: 358px">
                Slope of the peak exercise ST segment</td>
            <td>
                <asp:DropDownList ID="DropDownSlope" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Upsloping">Upsloping</asp:ListItem>
                    <asp:ListItem Value="Flat">Flat</asp:ListItem>
                    <asp:ListItem Value="Down sloping">Down sloping</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldSlope" runat="server" 
                    ControlToValidate="DropDownSlope" ErrorMessage="Select a slope type" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 358px">
                Number of major vessels</td>
            <td>
                <asp:DropDownList ID="DropDownVessels" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldVessel" runat="server" 
                    ControlToValidate="DropDownVessels" ErrorMessage="Select vessel count!" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 358px; height: 26px;">
                Thal</td>
            <td style="height: 26px">
                <asp:DropDownList ID="DropDownThal" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Normal">Normal</asp:ListItem>
                    <asp:ListItem Value="Fixed defect">Fixed defect</asp:ListItem>
                    <asp:ListItem Value="Reversible defect">Reversible defect</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldThal" runat="server" 
                    ControlToValidate="DropDownThal" ErrorMessage="Choose one!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 358px; height: 30px;">
                &nbsp;</td>
            <td style="height: 30px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 358px; height: 34px;">
                </td>
            <td style="height: 34px">
                <asp:Button ID="psubmitBtn" runat="server" BorderStyle="Solid" Text="Submit" PostBackUrl="~/patient_reg/patient_medical_details_insert" />
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 358px; height: 23px;">
                </td>
            <td style="height: 23px">
                </td>
        </tr>
        <tr>
            <td style="width: 358px; height: 23px;">
                &nbsp;</td>
            <td style="height: 23px">
                <asp:Button ID="PredictBtn" runat="server" Text="Predict" PostBackUrl="~/patient_reg/apply_naive_bayers" Visible="False" CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td style="width: 358px; height: 23px;">
                &nbsp;</td>
            <td style="height: 23px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 358px">
                <asp:Label ID="Label2" runat="server" Text="Chance of getting desease" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:Label ID="statusLabel" runat="server" Text="Label" Visible="False" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 358px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 358px">
                &nbsp;</td>
            <td>
                <asp:Label ID="statusLabel2" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 358px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 358px; height: 23px;">
                &nbsp;</td>
            <td style="height: 23px">
            </td>
        </tr>
        <tr>
            <td style="width: 358px; height: 23px;">
                &nbsp;</td>
            <td style="height: 23px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 358px; height: 23px;">
                &nbsp;</td>
            <td style="height: 23px">
                &nbsp;</td>
        </tr>
        </table>
  <%--  </form>--%>

</asp:Content>
