<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DuserText.Text = Session["txtbx"].ToString();
            if (Session["visiblesubmit"].ToString() == "Not")
            {

                Button1.Visible = true;
            }
            Session["visiblesubmit"] = "Exist";
        }
        catch (Exception ae)
        {
        }
        
    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Admin_add_doctor
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script src="../Content/startbootstrap-sb-admin-1.0.4/js/jquery.js"></script>
<script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
<script src="../../Scripts/calendar-en.min.js" type="text/javascript"></script>
<link href="../../Content/calendar-blue.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    $(document).ready(function () {
        $("[id$=TextBox1]").dynDateTime({
            showsTime: false,
            ifFormat: "%Y/%m/%d ",
            daFormat: "%l;%M %p, %e ",
            align: "BR",
            electric: false,
            singleClick: false,
            displayArea: ".siblings('.dtcDisplayArea')",
            button: ".next()"
        });
    });
</script>
  
<table>
    <tr>
            <td style="width: 164px">
                Username</td>
            <td style="margin-left: 360px; height: 55px;" colspan="7">
                <asp:TextBox ID="DuserText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="DuserText" ErrorMessage="It is mandatory!" ForeColor="Red" 
                    ToolTip="Without this username Doctor can not Login!!"></asp:RequiredFieldValidator>
                <br />
            </td>
            <td style="margin-left: 120px; height: 55px;">
                </td>
        </tr>
        <tr>
            <td style="width: 164px">
                </td>
            <td style="width: 614px; margin-left: 400px; height: 24px;" colspan="4">
                <asp:Button ID="Button3" runat="server" CausesValidation="False" PostBackUrl="~/Site_admin/check_user" Text="Check Availability" />
            </td>
            <td colspan="2" style="height: 24px">
                </td>
            <td style="width: 437px; margin-left: 120px; height: 24px;">
                &nbsp;</td>
            <td style="margin-left: 120px; height: 24px;">
                </td>
        </tr>
        <tr>
            <td style="width: 164px; height: 23px;">
                </td>
            <td style="width: 614px; margin-left: 360px; height: 23px;" colspan="4">
                </td>
            <td colspan="2" style="height: 23px">
                </td>
            <td style="width: 437px; margin-left: 120px; height: 23px;">
                </td>
            <td style="margin-left: 120px; height: 23px;">
                </td>
        </tr>
        <tr>
            <td style="width: 164px">
                &nbsp;</td>
            <td style="width: 614px; margin-left: 360px" colspan="4">
                <asp:Button ID="Button1" runat="server" BorderStyle="Solid" Text="Submit"
                    ToolTip="Submission fails if mandatory fields are empty" PostBackUrl="~/Site_admin/Admin_add_doctortoLogin" Visible="False" />
            </td>
            <td colspan="2">
                &nbsp;</td>
            <td style="width: 437px; margin-left: 120px">
                &nbsp;</td>
            <td style="margin-left: 120px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 164px">
                &nbsp;</td>
            <td style="width: 614px; margin-left: 360px" colspan="4">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td style="width: 437px; margin-left: 120px">
                &nbsp;</td>
            <td style="margin-left: 120px">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
