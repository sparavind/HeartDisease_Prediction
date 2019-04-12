<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Loginhome.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <table class="auto-style1">
    <tr>
        <td>
   
         
   
    <table style="width: 100%">
        <tr>
            <td>
                <strong>LOGIN</strong></td>
            <td>
               
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Username</td>
            <td>
                <asp:TextBox ID="uname_text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="uname_text" ErrorMessage="Username is mandatory for Login" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 30px">
                Password</td>
            <td style="height: 30px">
                <asp:TextBox ID="pass_text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="pass_text" ErrorMessage="Password is mandatory for Login" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 23px">
            </td>
            <td style="height: 23px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 34px">
            </td>
            <td style="height: 34px">
                <asp:Button ID="Button1" runat="server" Text="Submit" BorderStyle="Solid" PostBackUrl="~/Login/login_check" CausesValidation="False"/>
                &nbsp;<asp:Button ID="Login_clr_btn" runat="server" Text="Clear" 
                    BorderStyle="Solid" PostBackUrl="~/Login/temp"/>
            </td>
        </tr>
        <tr>
            <td style="height: 34px">
                &nbsp;</td>
            <td style="height: 34px">
                <asp:LinkButton ID="forgot_pass_link" runat="server" CausesValidation="False">Forgot my Password!!</asp:LinkButton>
            </td>
        </tr>
        </table>

<%--//new division//--%>
        <div id="forgot_password">
            <table style="width: 100%">
 

        <tr>
            <td style="height: 26px; width: 165px;">
                <asp:Label ID="dob_label" runat="server" Text="Your date of birth"></asp:Label>
                   </td>
            <td style="height: 26px; margin-left: 80px; width: 732px;">
                <asp:TextBox ID="dob_text" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 30px; width: 165px;">
                <asp:Label ID="mobile_label" runat="server" Text="Your Mobile number"></asp:Label>
            </td>
            <td style="margin-left: 80px; height: 30px; width: 732px;">
                <asp:TextBox ID="mobile_text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldMob" runat="server" 
                    ControlToValidate="mobile_text" ErrorMessage="Mobile number is mandatory" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 23px; width: 165px;">
                </td>
            <td style="margin-left: 80px; height: 23px; width: 732px;">
                </td>
        </tr>
        <tr>
            <td style="height: 27px; width: 165px;">
                </td>
            <td style="margin-left: 80px; height: 27px; width: 732px;">
                <asp:Button ID="fsubmit_btn" runat="server" Text="Submit" 
                    BorderStyle="Solid" PostBackUrl="~/Login/forgot_password" />
                &nbsp;<asp:Button ID="fclear_btn" runat="server" Text="Clear" 
                    BorderStyle="Solid"  PostBackUrl="~/Login/dnareslt"/>
                <br />
            </td>
        </tr>
        <tr>
            <td style="height: 23px; width: 165px;">
                </td>
            <td style="margin-left: 80px; height: 23px; width: 732px;">
                //if true-            <asp:Label ID="replay_label" runat="server" 
                    Text="Your Password has been forwarded to Mailbox" Visible="False" 
                    ForeColor="#009933"></asp:Label>
            <td style="margin-left: 80px; height: 23px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 165px">
                &nbsp;</td>
            <td style="margin-left: 80px; width: 732px;">
                false -show message box</td>
        </tr>
    </table>
            </div>
    

        </td>
    </tr>
</table>



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">


    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
</style>


</asp:Content>
