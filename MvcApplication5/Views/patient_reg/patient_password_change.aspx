<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Patient.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

   
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["visiblesec2"].ToString() == "1")
            {
                Label4.Visible = false;
                current_passText.Text = Session["cpass"].ToString();
                Label2.Visible = true;
                Label3.Visible = true;
                NewPassText.Visible = true;
                Re_entrypassText.Visible = true;
                change_passBtn.Visible = true;
            }
            else
            {
                Label4.Visible = true;
            }
            Session["visiblesec2"] = 0;
            Label4.Visible = false;
        }

        catch { }
    }
</script>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    patient_password_change
    <style type="text/css">
        .auto-style1 {
            width: 348px;
        }
        .auto-style2 {
            height: 23px;
            width: 348px;
        }
    </style>
</asp:Content>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Content/startbootstrap-sb-admin-1.0.4/js/jquery.js"></script>
       
    <%if (TempData["Pwresult"] != null)
      {
    %>
        <script>
      $(document).ready(function () {
          alert('<%: TempData["Pwresult"]%>');
      });
</script>
<%
    }
%> 
    <%--<form id="form1" runat="server">--%>
    <%--<table style="width: 100%">
        <tr>
            <td colspan="2" style="text-decoration: underline">
                Change Password</td>
        </tr>
        <tr>
            <td style="width: 328px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 328px">
                Enter Current Password</td>
            <td>
                <asp:TextBox ID="Pcurrent_passText" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldCurrPass" runat="server" 
                    ControlToValidate="Pcurrent_passText" 
                    ErrorMessage="Please enter your Current password!!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 328px">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Continue" />
            </td>
        </tr>
     </table>--%>
    <%--<table id="section2">
        <tr>
            <td style="width: 328px">
                Enter New Password</td>
            <td>
                <asp:TextBox ID="PnewPassText" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldnewPass" runat="server" 
                    ControlToValidate="PnewPassText" 
                    ErrorMessage="New password should be entered before confirmation!!" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionNewpass" runat="server" 
                    ErrorMessage="Password should contain minimum 7 characters" ForeColor="Red" 
                    ValidationExpression="^[\s\S]{7,15}$" ControlToValidate="PnewPassText"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 328px">
                Re-Enter New Password</td>
            <td>
                <asp:TextBox ID="Pre_entrypassText" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidReenter" runat="server" 
                    ControlToCompare="PnewPassText" ControlToValidate="Pre_entrypassText" 
                    ErrorMessage="Password incorrect!!" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 328px; height: 23px">
            </td>
            <td style="height: 23px">
                </td>
        </tr>
        <tr>
            <td style="width: 328px; height: 34px">
            </td>
            <td style="height: 34px">
                <asp:Button ID="change_passBtn" runat="server" Text="Submit" 
                    BorderStyle="Solid" />
            </td>
        </tr>
        <tr>
            <td style="width: 328px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>--%>
     
        
        <table style="width: 100%">
        <tr>
            <td colspan="2" style="text-decoration: underline"><strong>CHANGE PASSWORD</strong></td>
        </tr>
        <tr>
            <td class="auto-style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                Enter Current Password</td>
            <td class="auto-style9">
                <asp:TextBox ID="current_passText" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldCurrPass" runat="server" 
                    ControlToValidate="current_passText" 
                    ErrorMessage="Please enter your Current password!!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Continue" PostBackUrl="~/patient_reg/pat_currpassword"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                </td>
            <td style="height: 23px">
                <asp:Label ID="Label4" runat="server" Text="Current Password error" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        </table>
        <table id="section2">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label2" runat="server" Text="Enter New Password" Visible="False"></asp:Label>
            </td>
            <td style="height: 35px; width: 568px;">
                <asp:TextBox ID="NewPassText" runat="server" Visible="False" CausesValidation="True"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
            </td>
            <td style="height: 28px; width: 568px;">
                <asp:RequiredFieldValidator ID="RequiredFieldnewPass" runat="server"
                    ControlToValidate="NewPassText"
                    ErrorMessage="New password should be entered before confirmation!!"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
            </td>
            <td style="height: 35px; width: 568px;">
                <asp:RegularExpressionValidator ID="RegularExpressionPasscount" runat="server"
                    ControlToValidate="NewPassText"
                    ErrorMessage="Password should contain minimum 7 characters" ForeColor="Red"
                    ValidationExpression="^[\s\S]{7,15}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label3" runat="server" Text="Re-Enter New Password" Visible="False"></asp:Label>
            </td>
            <td style="width: 568px">
                <asp:TextBox ID="Re_entrypassText" runat="server" Visible="False" CausesValidation="True"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td style="width: 568px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Re_entrypassText" ErrorMessage="Re enter new password" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td style="width: 568px">
                <asp:CompareValidator ID="CompareValidReenter" runat="server" 
                    ControlToCompare="NewPassText" ControlToValidate="Re_entrypassText" 
                    ErrorMessage="Password incorrect!!" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
            </td>
            <td style="height: 23px; width: 568px;">
                </td>
        </tr>
        <tr>
            <td class="auto-style6">
            </td>
            <td style="height: 34px; width: 568px;">
                <asp:Button ID="change_passBtn" runat="server" Text="Submit" 
                    BorderStyle="Solid" PostBackUrl="~/patient_reg/pat_newpassword" Visible="False" />
&nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td style="width: 568px">
                &nbsp;</td>
        </tr>
    </table>
    <%--</form>--%>
    </asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="TitleContent">
    <style type="text/css">
        .auto-style1 {
            width: 324px;
        }
        .auto-style2 {
            height: 35px;
            width: 323px;
        }
        .auto-style3 {
            height: 28px;
            width: 323px;
        }
        .auto-style5 {
            height: 23px;
            width: 323px;
        }
        .auto-style6 {
            height: 34px;
            width: 323px;
        }
        .auto-style7 {
            width: 323px;
        }
        .auto-style8 {
            width: 324px;
            height: 41px;
        }
        .auto-style9 {
            height: 41px;
        }
    </style>
</asp:Content>

