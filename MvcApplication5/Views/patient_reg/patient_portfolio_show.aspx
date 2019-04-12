<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Patient.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        System.Data.DataTable dt = (System.Data.DataTable)Session["PatDetails"];
        PnameLabel.Text = dt.Rows[0][2].ToString();
        PgenderLabel.Text = dt.Rows[0][3].ToString();
        PdobLabel.Text = dt.Rows[0][4].ToString();
        PaddressLabel.Text = dt.Rows[0][5].ToString();
        PcityLabel.Text = dt.Rows[0][6].ToString();
        PstateLabel.Text = dt.Rows[0][7].ToString();
        PpincodeLabel.Text = dt.Rows[0][8].ToString();
        PmobLabel.Text = dt.Rows[0][9].ToString();
        PemailLabel.Text = dt.Rows[0][10].ToString();
        
      
    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    patient_portfolio_show
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Content/startbootstrap-sb-admin-1.0.4/js/jquery.js"></script>
    <%--<form id="form1" runat="server">--%>
    <table style="width: 100%">
        <tr>
            <td colspan="3">
                <strong>MY PORTFOLIO</strong></td>
        </tr>
        <tr>
            <td style="width: 5px">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-decoration: underline; " colspan="3">
                <strong>Personal Info</strong></td>
        </tr>
        <tr>
            <td style="height: 23px;" colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 5px">
                &nbsp;</td>
            <td style="text-align: right; width: 114px">
                <b>Name</b></td>
            <td>
                &nbsp;&nbsp;
                <asp:Label ID="PnameLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 5px">
                &nbsp;</td>
            <td style="text-align: right; width: 114px">
                <b>Gender</b></td>
            <td>
                &nbsp;&nbsp;
                <asp:Label ID="PgenderLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 23px; width: 5px">
                &nbsp;</td>
            <td style="height: 23px; text-align: right; width: 114px;">
                <b>Date of Birth</b></td>
            <td style="height: 23px">
                &nbsp;&nbsp;
                <asp:Label ID="PdobLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 5px; height: 23px;">
                </td>
            <td style="text-align: right; width: 114px; height: 23px">
                <b>Address</b></td>
            <td style="height: 23px">
                &nbsp;&nbsp;
                <asp:Label ID="PaddressLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 5px">
                &nbsp;</td>
            <td style="text-align: right; width: 114px">
                <b>City</b></td>
            <td>
                &nbsp;&nbsp;
                <asp:Label ID="PcityLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 5px">
                &nbsp;</td>
            <td style="text-align: right; width: 114px">
                <b>State</b></td>
            <td>
                &nbsp;&nbsp;
                <asp:Label ID="PstateLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 5px; height: 23px">
            </td>
            <td style="height: 23px; text-align: right; width: 114px;">
                <b>Pincode</b></td>
            <td style="height: 23px">
                &nbsp;&nbsp;
                <asp:Label ID="PpincodeLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 5px">
                &nbsp;</td>
            <td style="text-align: right; width: 114px">
                <b>Mobile number</b></td>
            <td>
                &nbsp;&nbsp;
                <asp:Label ID="PmobLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 5px">
                &nbsp;</td>
            <td style="text-align: right; width: 114px">
                <b>E-mail</b></td>
            <td>
                &nbsp;&nbsp;
                <asp:Label ID="PemailLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 5px">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 5px">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
    <%--</form>--%>

</asp:Content>
