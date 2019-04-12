<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Doctor.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

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




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Content/startbootstrap-sb-admin-1.0.4/js/jquery.js"></script>
  <%
      if (TempData["Presult"] != null)
      {
%>
  <script>
      $(document).ready(function () {
          alert('<%: TempData["Presult"]%>');
      });
</script>
<%
    }
%> 

    
    <table style="width: 100%">
        <tr>
            <td colspan="2" style="text-decoration: underline"><strong>CHANGE PASSWORD</strong></td>
        </tr>
        <tr>
            <td style="width: 367px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 367px">
                Enter Current Password</td>
            <td>
                <asp:TextBox ID="current_passText" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldCurrPass" runat="server" 
                    ControlToValidate="current_passText" 
                    ErrorMessage="Please enter your Current password!!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 367px">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Continue" PostBackUrl="~/Doc_home/doc_currpassword"/>
            </td>
        </tr>
        <tr>
            <td style="width: 367px; height: 23px;">
                </td>
            <td style="height: 23px">
                <asp:Label ID="Label4" runat="server" Text="Current Password error" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        </table>
        <table id="section2">
        <tr>
            <td style="width: 378px; height: 35px;">
                <asp:Label ID="Label2" runat="server" Text="Enter New Password" Visible="False"></asp:Label>
            </td>
            <td style="height: 35px; width: 568px;">
                <asp:TextBox ID="NewPassText" runat="server" Visible="False" CausesValidation="True"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 378px; height: 28px;">
            </td>
            <td style="height: 28px; width: 568px;">
                <asp:RequiredFieldValidator ID="RequiredFieldnewPass" runat="server"
                    ControlToValidate="NewPassText"
                    ErrorMessage="New password should be entered before confirmation!!"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 378px; height: 35px;">
            </td>
            <td style="height: 35px; width: 568px;">
                <asp:RegularExpressionValidator ID="RegularExpressionPasscount" runat="server"
                    ControlToValidate="NewPassText"
                    ErrorMessage="Password should contain minimum 7 characters" ForeColor="Red"
                    ValidationExpression="^[\s\S]{7,15}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 378px">
                <asp:Label ID="Label3" runat="server" Text="Re-Enter New Password" Visible="False"></asp:Label>
            </td>
            <td style="width: 568px">
                <asp:TextBox ID="Re_entrypassText" runat="server" Visible="False" CausesValidation="True"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 378px">
                &nbsp;</td>
            <td style="width: 568px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Re_entrypassText" ErrorMessage="Re enter new password" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 378px">
                &nbsp;</td>
            <td style="width: 568px">
                <asp:CompareValidator ID="CompareValidReenter" runat="server" 
                    ControlToCompare="NewPassText" ControlToValidate="Re_entrypassText" 
                    ErrorMessage="Password incorrect!!" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 378px; height: 23px">
            </td>
            <td style="height: 23px; width: 568px;">
                </td>
        </tr>
        <tr>
            <td style="width: 378px; height: 34px">
            </td>
            <td style="height: 34px; width: 568px;">
                <asp:Button ID="change_passBtn" runat="server" Text="Submit" 
                    BorderStyle="Solid" PostBackUrl="~/Doc_home/doc_newpassword" Visible="False" />
&nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td style="width: 378px">
                &nbsp;</td>
            <td style="width: 568px">
                &nbsp;</td>
        </tr>
    </table>

  

</asp:Content>
