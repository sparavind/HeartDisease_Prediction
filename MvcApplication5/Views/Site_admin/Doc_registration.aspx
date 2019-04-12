<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<script runat="server">

 
   
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
</script>





<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <link type="text/css" href="../../Content/startbootstrap-sb-admin-1.0.4/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
     <script src="../../Scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="../../Scripts/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#<%=TextBox1.ClientID %>').datepicker({
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

        $(function () {
            $('#<%=TextBox2.ClientID %>').datepicker({
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

        $(function () {
            $('#<%=DdobText.ClientID %>').datepicker({
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
<table style="width: 100%">
        <tr>
            <td colspan="4" style="height: 23px">
                <strong>DOCTOR REGISTRATION</strong></td>
            <td style="height: 23px">
                </td>
        </tr>
        <tr>
            <td style="width: 185px">
                &nbsp;</td>
            <td style="width: 614px">
                &nbsp;</td>
            <td style="width: 8px">
                &nbsp;</td>
            <td style="width: 437px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-decoration: underline; width: 185px">
                <strong>Personal Details</strong></td>
            <td style="width: 614px">
                &nbsp;</td>
            <td style="width: 8px">
                &nbsp;</td>
            <td style="width: 437px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-decoration: underline; width: 185px">
            </td>
            <td style="width: 614px">
                &nbsp;</td>
            <td style="width: 8px">
                &nbsp;</td>
            <td style="width: 437px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 185px">
                Name of Doctor</td>
            <td style="width: 614px">
                &nbsp;</td>
            <td style="width: 8px">
                &nbsp;</td>
            <td style="width: 437px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; height: 24px; width: 185px">
                &nbsp;</td>
            <td style="height: 24px; " colspan="4">
                <br />
                First<asp:TextBox ID="DfnameText" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Middle<asp:TextBox ID="DmnameText" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Last<asp:TextBox ID="DlnameText" runat="server" Width="145px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; height: 24px; width: 185px">
                </td>
            <td style="height: 24px; " colspan="4">
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldfname" runat="server" 
                    ErrorMessage="First Name is Mandatory!" ControlToValidate="DfnameText" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;<asp:RequiredFieldValidator 
                    ID="RequiredFieldfname0" runat="server" 
                    ErrorMessage="Last Name is Mandatory!" ControlToValidate="DlnameText" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; height: 24px; width: 185px">
                Gender</td>
            <td style="height: 24px; width: 614px">
                <asp:RadioButtonList ID="RadioButtonListGen" RepeatDirection="Horizontal" 
                    runat="server">
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldGen" runat="server" 
                    ControlToValidate="RadioButtonListGen" ErrorMessage="Select Gender!" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="height: 24px; width: 8px;">
                &nbsp;</td>
            <td style="width: 437px; height: 24px">
                &nbsp;</td>
            <td style="height: 24px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 185px; height: 40px;">
                Date of Birth</td>
            <td style="width: 614px; height: 40px;">
                <asp:TextBox ID="DdobText" runat="server"></asp:TextBox>
                </td>
            <td style="height: 40px; width: 8px">
                </td>
            <td style="width: 437px; height: 40px;">
                </td>
            <td style="height: 40px">
                </td>
        </tr>
        <tr>
            <td style="width: 185px; height: 40px;">
                Mobile Number</td>
            <td style="margin-left: 80px; height: 40px;" colspan="4">
                <asp:TextBox ID="DmobText" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionDmob" runat="server" 
                    ErrorMessage="Mobile number Is Mandatory!" 
                    ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$" 
                    ControlToValidate="DmobText" ForeColor="Red"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldMob" runat="server" 
                    ControlToValidate="DmobText" ErrorMessage="Mobile number is mandatory!" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 185px">
                Permanent Address</td>
            <td style="width: 614px; margin-left: 120px">
                <asp:TextBox ID="DaddrText" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td style="width: 8px">
                &nbsp;</td>
            <td style="width: 437px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 185px">
                Pincode</td>
            <td style="margin-left: 120px" colspan="3">
                <asp:TextBox ID="DpinText" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionpin" runat="server" 
                    ErrorMessage="Enter a proper pincode" ForeColor="Red" 
                    ValidationExpression="\d{6}" ControlToValidate="DpinText"></asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 44px; width: 185px">
                E-Mail</td>
            <td style="height: 44px; margin-left: 240px" colspan="3">
                <asp:TextBox ID="DmailText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="DmailText" ErrorMessage="Enter a proper Mail Id" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionDmail" runat="server" 
                    ControlToValidate="DmailText" ErrorMessage="Email is mandatory" ForeColor="Red" 
                    ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
            </td>
            <td style="height: 44px">
            </td>
        </tr>
        <tr>
            <td style="width: 185px">
                &nbsp;</td>
            <td style="width: 614px; margin-left: 240px">
                &nbsp;</td>
            <td style="width: 8px">
                &nbsp;</td>
            <td style="width: 437px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        
         </table> 
        <div id="qualification">
         <table id="table1" style="width: 100%">
        <tr>
            

            <td style="text-decoration: underline" colspan="2">
                <strong>Qualification Details</strong></td>
            <td>
                &nbsp;</td>
            <td style="width: 435px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 184px">
            </td>
            <td style="width: 614px; margin-left: 240px">
                <strong>School name/College</strong></td>
            <td>
                <strong>CGPA</strong></td>
            <td style="width: 435px">
                <strong>Year of passing</strong></td>
            <td>
                <strong>Board/University</strong></td>
        </tr>
        <tr>
            <td style="height: 33px; width: 184px">
                Metriculation</td>
            <td style="width: 614px; margin-left: 240px; height: 33px;">
                <asp:TextBox ID="Dschool1Text" runat="server"></asp:TextBox>
            </td>
            <td style="height: 33px">
                <asp:TextBox ID="Dcgpa1Text" runat="server"></asp:TextBox>
            </td>
            <td style="width: 435px; height: 33px;">
                <asp:TextBox ID="Dyear1Text" runat="server"></asp:TextBox>
            </td>
            <td style="height: 33px">
                <asp:TextBox ID="DBoard1Text" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 35px; width: 184px">
                HSE</td>
            <td style="width: 614px; margin-left: 240px; height: 35px;">
                <asp:TextBox ID="Dschool2Text" runat="server"></asp:TextBox>
            </td>
            <td style="height: 35px">
                <asp:TextBox ID="Dcgpa2Text" runat="server"></asp:TextBox>
            </td>
            <td style="width: 435px; margin-left: 120px; height: 35px;">
                <asp:TextBox ID="Dyear2Text" runat="server"></asp:TextBox>
            </td>
            <td style="margin-left: 120px; height: 35px;">
                <asp:TextBox ID="Dboard2Text" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 184px">
                MBBS</td>
            <td style="width: 614px; margin-left: 240px">
                <asp:TextBox ID="Dschool3Text" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="Dcgpa3Text" runat="server"></asp:TextBox>
            </td>
            <td style="width: 435px; margin-left: 120px">
                <asp:TextBox ID="Dyear3Text" runat="server"></asp:TextBox>
            </td>
            <td style="margin-left: 120px">
                <asp:TextBox ID="Dboard3Text" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 23px; width: 184px;">
                </td>
            <td style="width: 614px; margin-left: 240px; height: 23px;">
                </td>
            <td style="height: 23px">
                </td>
            <td style="width: 435px; margin-left: 120px; height: 23px;">
                </td>
            <td style="margin-left: 120px; height: 23px;">
                </td>
        </tr>
        <tr>
            <td colspan="2" style="text-decoration: underline; height: 31px">
                <strong>Experience Information</strong></td>
            <td style="height: 31px">
                </td>
            <td style="width: 435px; margin-left: 120px; height: 31px;">
                </td>
            <td style="margin-left: 120px; height: 31px;">
                </td>
        </tr>
        <tr>
            <td style="width: 184px">
                Experience(if Any)</td>
            <td style="margin-left: 240px; height: 29px;" colspan="4">
                <asp:DropDownList ID="DropDownListExper" runat="server">
                    <asp:ListItem>---Select---</asp:ListItem>
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 184px">
                Hospital Name</td>
            <td style="margin-left: 360px" colspan="4">
                <asp:TextBox ID="DhospText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldHosp" runat="server" 
                    ControlToValidate="DhospText" ErrorMessage="Hospital name is mandatory" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                Period of Service&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                &nbsp;</td>
            <td style="width: 435px; margin-left: 120px">
                &nbsp;</td>
            <td style="margin-left: 120px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 15px; width: 184px;">
                &nbsp;</td>
            <td style="height: 15px; margin-left: 360px">
                &nbsp;</td>
            <td style="height: 15px" colspan="2">
                &nbsp;</td>
            <td style="height: 15px; margin-left: 120px">
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 184px;">
                From</td>
            <td style="width: 614px; margin-left: 360px">
                <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
                &nbsp;</td>
            <td colspan="2">
                To<asp:TextBox ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td style="margin-left: 120px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 184px">
                &nbsp;</td>
            <td style="width: 614px; margin-left: 360px; height: 26px;">
                &nbsp;</td>
            <td style="height: 26px">
                </td>
            <td style="width: 435px; margin-left: 120px; height: 26px;">
                </td>
            <td style="margin-left: 120px; height: 26px;">
                </td>
        </tr>
        <tr>
            <td style="width: 184px">
                &nbsp;</td>
            <td style="height: 23px; width: 614px; margin-left: 360px">
            </td>
            <td style="height: 23px; ">
            </td>
            <td style="height: 23px; width: 435px; margin-left: 120px">
            </td>
            <td style="height: 23px; margin-left: 120px">
            </td>
        </tr>
             </table>
            <table id="tab2">
        <tr>
            <td style="width: 164px">
                &nbsp;</td>
            <td style="height: 23px; width: 614px; margin-left: 360px" colspan="4">
                <asp:Button ID="Button1" runat="server" Text="Submit" PostBackUrl="~/Site_admin/insert_doc" />
            </td>
            <td style="height: 23px; " colspan="2">
            </td>
            <td style="height: 23px; width: 437px; margin-left: 120px">
            </td>
            <td style="height: 23px; margin-left: 120px">
            </td>
        </tr>
        
    </table>
            </div>

   

</asp:Content>
