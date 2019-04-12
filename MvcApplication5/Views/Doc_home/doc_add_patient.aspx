<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Doctor.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            
            if (Session["visiblesubmit"].ToString() == "Not")
            {
                UnameText.Text = Session["txtbx"].ToString();
                Label2.Visible = true;
                mailText.Visible = true;
                NewPatientButton.Visible = true;
            }
            Session["visiblesubmit"] = "Exist";
            
        }
        catch (Exception ae)
        {
        }
       
    }

    
</script>


<%--<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	doc_add_patient
</asp:Content>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script src="../Content/startbootstrap-sb-admin-1.0.4/js/jquery.js"></script>
<%--    <form id="form1" runat="server">--%>
    <table style="width: 100%">
        <tr>
            <td style="width: 241px; text-decoration: underline;">
                <strong>ADD NEW PATIENT</strong></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 241px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 241px; height: 36px;">
                Username</td>
            <td style="height: 36px">
                <asp:TextBox ID="UnameText" runat="server"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                    Text="Username is already exist.Try another" Visible="False"></asp:Label>
                </td>
        </tr>
        <tr>
            <td style="width: 241px; height: 37px;">
                </td>
            <td style="height: 37px">
                <asp:Button ID="Button1" runat="server" Text="Check Availability" PostBackUrl="~/Doc_home/check_user" />
            </td>
        </tr>
        <tr>
            <td style="width: 241px; height: 30px;">
                <asp:Label ID="Label2" runat="server" Text="Patient MailId" Visible="False"></asp:Label>
            </td>
            <td style="height: 30px">
                <asp:TextBox ID="mailText" runat="server" Visible="False"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="mailText" ErrorMessage="MailId is empty or False!!" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 241px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 32px; width: 241px;">
            </td>
            <td style="height: 32px">
                <asp:Button ID="NewPatientButton" runat="server" Text="Submit" BorderStyle="Solid" PostBackUrl="~/Doc_home/newpatient_reg" Visible="False" />
            </td>
        </tr>
        <tr>
            <td style="width: 241px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
   <%-- </form>--%>

</asp:Content>
