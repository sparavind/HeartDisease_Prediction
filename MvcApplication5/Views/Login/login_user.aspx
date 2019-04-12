<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Loginhome.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
</script>
   
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../../Scripts/jquery-1.4.1.js"></script>
    <script type="text/javascript" src="../../Scripts/jquery-ui.js"></script>
    <script src="../../Scripts/jquery-1.12.4.js"></script>

    <link rel="stylesheet" href="../../Content/jquery-ui.css">

    <script type="text/javascript">
        $(document).ready(function () {
            
           
            $("[id$=forgot_pass_link]").click(function () {
                var sel1 = $("[id$=Div1]");
                var sel = $("[id$=forgot_password]");
                sel1.hide();
                sel.show();

            });

            $("[id$=Button2]").click(function () {

                var sel = $("[id$=forgot_password]");
                sel.hide();

            });
        });

</script>
    

    <%
    if (TempData["Result"] != null){
%>
  <script>
      $(document).ready(function () {
          alert('<%: TempData["Result"]%>');
  });
</script>
<%
    }
%>



    <%
        if (TempData["failedlogin"] != null)
        {
    %>
        <script>
        $(document).ready(function () {
        alert('<%: TempData["failedlogin"]%>');
        });
        </script>
    <%
        }
    %>


    <style type="text/css">
        .auto-style3 {}
        </style>
    <style type="text/css">
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            text-align: left;
            height: 23px;
        }
        .auto-style5 {
            text-align: left;
            height: 34px;
        }
        .auto-style6 {
            text-align: left;
            height: 26px;
        }
        .auto-style8 {
            text-align: left;
            height: 30px;
        }
        .auto-style9 {
            text-align: left;
            height: 23px;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   
         <div id="Div1">
  
    <table style="width: 100%">
        <tr>
            <td class="auto-style2">
                <strong style="font-size: x-large; text-align: left;">LOGIN
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style2">
                <strong>Username:</strong><asp:TextBox ID="uname_text" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="uname_text" ErrorMessage="Username is mandatory for Login!" 
                    ForeColor="Red" ValidationGroup="nnn"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <strong>Password:</strong><asp:TextBox ID="pass_text" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="pass_text" ErrorMessage="Password is mandatory for Login!" 
                    ForeColor="Red" ValidationGroup="nnn"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Button ID="Button1" runat="server" Text="Submit" BorderStyle="Solid" PostBackUrl="~/Login/login_check" ValidationGroup="nnn"/>
                &nbsp;</td>
            
            

        </tr>
        <tr>
            <td class="auto-style9">
                <asp:LinkButton ID="forgot_pass_link" runat="server" ValidationGroup="nnn" ForeColor="#006699" style="font-weight: 700">I Forgot my Password!!</asp:LinkButton>

            </td>
        </tr>
        </table></div>

<%--//new division//--%>
        <div id="forgot_password" hidden="hidden">
            <table style="width: 100%" >
 

        <tr>
            <td class="auto-style6">
                <strong style="font-size: x-large; text-align: left;">PASSWORD RECOVERY</strong></td>
        </tr>
 

        <tr>
            <td class="auto-style8">
                <strong>
                <asp:Label ID="dob_label" runat="server" Text="Your date of birth"></asp:Label>
                   </strong>&nbsp;<strong>:</strong><asp:TextBox ID="dob_text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldDob" runat="server" 
                    ControlToValidate="dob_text" ErrorMessage="DOB os mandatory!" 
                    ForeColor="Red" ValidationGroup="mm"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="mobile_label" runat="server" Text="Your Mobile number" style="font-weight: 700"></asp:Label>
                <strong>:</strong><asp:TextBox ID="mobile_text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldMob" runat="server" 
                    ControlToValidate="mobile_text" ErrorMessage="Mobile number is mandatory!" 
                    ForeColor="Red" ValidationGroup="mm"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="fsubmit_btn" runat="server" Text="Submit" BorderStyle="Solid" PostBackUrl="~/Login/forgot_password" ValidationGroup="mm" />
                &nbsp;<asp:Button ID="Button2" runat="server" Text="Back" CausesValidation="False" BorderStyle="Solid"/>
                <br />
            </td>
        </tr>
        </table>
            </div>
    

</asp:Content>
