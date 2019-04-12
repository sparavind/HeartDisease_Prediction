<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Patient.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>



<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            System.Data.DataTable dt = (System.Data.DataTable)Session["PatDetails"];
            pnameText.Text = dt.Rows[0][2].ToString();
            RadioButtonListGender.Text = dt.Rows[0][3].ToString();
            PdobText.Text = dt.Rows[0][4].ToString();
            paddressText.Text = dt.Rows[0][5].ToString();
            pcityText.Text = dt.Rows[0][6].ToString();
            pstateText.Text = dt.Rows[0][7].ToString();
            ppinText.Text = dt.Rows[0][8].ToString();
            pmobText.Text = dt.Rows[0][9].ToString();
            pmailText.Text = dt.Rows[0][10].ToString();
        }
        catch { }
    }
    
</script>



<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    patient_registration 
    

    <style type="text/css">
        .auto-style1 {
            width: 24%;
            height: 26px;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style3 {
            width: 24%;
            height: 30px;
        }
        .auto-style4 {
            height: 30px;
        }
    </style>

    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>

 </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 
    <%--<script src="../Content/startbootstrap-sb-admin-1.0.4/js/jquery.js"></script>--%>
    <link type="text/css" href="../../Content/startbootstrap-sb-admin-1.0.4/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#<%=PdobText.ClientID %>').datepicker({
                showOn: "button",
                buttonImage: "../../Content/calender.png",
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2016',
                dateFormat: "dd/mm/yy",
                buttonImageOnly: true,
                buttonText: "Select date"
            });
        });

	</script>

 

   <%--<form id="form2" runat="server"> --%> 

     <table style="width: 100%">
        <tr>
            <td style="width: 24%" class="auto-style1">
                <strong>PATIENT REGISTRATION</strong></td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 24%">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-decoration: underline; width: 24%;">
                <strong>Personal Details</strong></td>

            
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 24%">
                &nbsp;</td>
            <td colspan="2">
                
        </tr>
        <tr>
            <td style="width: 24%">
                Name</td>
            <td style="margin-left: 80px" colspan="2">
                
                <asp:TextBox ID="pnameText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldName" runat="server" 
                    ControlToValidate="pnameText" ErrorMessage="Name is mandatory!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr> 
        <tr>
            <td style="height: 50px; width: 24%;">
                Gender</td>
            <td style="margin-left: 160px; height: 50px; width: 125px;">
                <asp:RadioButtonList ID="RadioButtonListGender" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="margin-left: 160px; height: 50px; width: 59%;">
                <asp:RequiredFieldValidator ID="RequiredFieldGender" runat="server" 
                    ControlToValidate="RadioButtonListGender" ErrorMessage="Please select your Gender" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
                
            </td>
        </tr>
        <tr>
            <td style="height: 26px; width: 24%;">
                Date of Birth</td>
            <td style="margin-left: 160px; height: 26px;" colspan="2">
                <asp:TextBox ID="PdobText"  runat="server" ReadOnly="True"></asp:TextBox>
                &nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="RequiredFielddob" runat="server" ControlToValidate="PdobText" ErrorMessage="Select your DOB" ForeColor="Red"></asp:RequiredFieldValidator>
    
   



                


            &nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 24%">
                Address</td>
            <td style="margin-left: 160px" colspan="2">
                <asp:TextBox ID="paddressText" runat="server" TextMode="MultiLine" Height="32px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldAdd" runat="server" 
                    ControlToValidate="paddressText" ErrorMessage="Address is mandatory!" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 26px; width: 24%;">
                City</td>
            <td style="margin-left: 160px; height: 26px;" colspan="2">
                <asp:TextBox ID="pcityText" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                State</td>
            <td style="margin-left: 160px" colspan="2" class="auto-style2">
                <asp:TextBox ID="pstateText" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 26px; width: 24%;">
                Pincode</td>
            <td style="margin-left: 160px; height: 26px;" colspan="2">
                <asp:TextBox ID="ppinText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldPin" runat="server" 
                    ControlToValidate="ppinText" ErrorMessage="Pin code is mandatory!" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="ppinText" ErrorMessage="Enter a proper Pincode" 
                    ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 30px; width: 24%;">
                Mobile Number</td>
            <td style="margin-left: 160px; height: 30px;" colspan="2">
                <asp:TextBox ID="pmobText" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionPmob" runat="server" 
                    ControlToValidate="pmobText" ErrorMessage="Enter a valid Mail Id!" 
                    ForeColor="Red" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldPmob" runat="server" 
                    ControlToValidate="pmobText" ErrorMessage="Enter your mobile number!" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                E-Mail</td>
            <td style="margin-left: 160px" colspan="2" class="auto-style4">
                <asp:TextBox ID="pmailText" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionPmail" runat="server" 
                    ErrorMessage="RegularExpressionValidator" ForeColor="Red" 
                    ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" 
                    ControlToValidate="pmailText">Please enter proper Mail Id</asp:RegularExpressionValidator>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldPmail" runat="server" 
                    ErrorMessage="Enter your Mail Id" ForeColor="Red" 
                    ControlToValidate="pmailText"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 30px; width: 24%;">
                &nbsp;</td>
            <td style="margin-left: 160px; height: 30px;" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 26px; width: 24%;">
                &nbsp;</td>
            <td style="margin-left: 160px; height: 26px;" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 24%">
                &nbsp;</td>
            <td style="margin-left: 160px" colspan="2">
                <asp:Button ID="Button1" runat="server" BorderStyle="Solid" Text="Submit" PostBackUrl="~/patient_reg/addnew_patient"/>
               
&nbsp;</td>
        </tr>
    </table>
    <%--</form>--%>

</asp:Content>
