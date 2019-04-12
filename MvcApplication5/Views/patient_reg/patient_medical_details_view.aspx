<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Patient.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            dnaAlg dna = new dnaAlg();
            System.Data.DataTable dt1 = (System.Data.DataTable)Session["PatMedDetails"];
            ChestpainLabel.Text = dna.dEcrypt(dt1.Rows[0][2].ToString());
            RestbpsLabel.Text = dna.dEcrypt(dt1.Rows[0][3].ToString());
            cholLabel.Text = dna.dEcrypt(dt1.Rows[0][4].ToString());
            FastbsLabel.Text = dna.dEcrypt(dt1.Rows[0][5].ToString());
            EcgLabel.Text = dna.dEcrypt(dt1.Rows[0][6].ToString());
            ThalachLabel.Text = dna.dEcrypt(dt1.Rows[0][7].ToString());
            ExerLabel.Text = dna.dEcrypt(dt1.Rows[0][8].ToString());
            OldpLabel.Text = dna.dEcrypt(dt1.Rows[0][9].ToString());
            SlopeLabel.Text = dna.dEcrypt(dt1.Rows[0][10].ToString());
            VesselLabel.Text = dna.dEcrypt(dt1.Rows[0][11].ToString());
            ThalLabel.Text = dna.dEcrypt(dt1.Rows[0][12].ToString());
        }
        catch
        {
        }
       
    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    patient_medical_details_view
    <style type="text/css">
        .auto-style1 {
            width: 379px;
            height: 28px;
        }
        .auto-style2 {
            height: 28px;
        }
        .auto-style3 {
            width: 379px;
            height: 29px;
        }
        .auto-style4 {
            height: 29px;
        }
        .auto-style5 {
            width: 379px;
            height: 31px;
        }
        .auto-style6 {
            height: 31px;
        }
        .auto-style7 {
            width: 379px;
            height: 33px;
        }
        .auto-style8 {
            height: 33px;
        }
        .auto-style9 {
            width: 379px;
            height: 38px;
        }
        .auto-style10 {
            height: 38px;
        }
        .auto-style11 {
            width: 379px;
            height: 30px;
        }
        .auto-style12 {
            height: 30px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Content/startbootstrap-sb-admin-1.0.4/js/jquery.js"></script>
    <%--<form id="form1" runat="server">--%>
    <table style="width: 100%">
        <tr>
            <td colspan="2" style="text-decoration: underline; font-weight: 700;">
                MEDICAL REPORT</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                <b>Chest Pain type</b></td>
            <td class="auto-style2">
                <asp:Label ID="ChestpainLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <b>Resting Blood pressure</b></td>
            <td class="auto-style2">
                </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                Systolic</b></td>
            <td class="auto-style4">
                <asp:Label ID="RestbpsLabel" runat="server" Text="Label"></asp:Label>
                &nbsp;mm/Hg on admission to the Hospital</td>
           </tr>
        <tr>
            <td class="auto-style5">
                <b>Cholesterol</b></td>
            <td class="auto-style6">
                <asp:Label ID="cholLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <b>Fasting Blood Sugar</b></td>
            <td class="auto-style4">
                <asp:Label ID="FastbsLabel" runat="server" Text="Label"></asp:Label>
                mg/dl</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <b>Resting ECG Results</b></td>
            <td class="auto-style4">
                <asp:Label ID="EcgLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <b>Thalach-Maximum heart rate Achieved</b></td>
            <td class="auto-style8">
                <asp:Label ID="ThalachLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                <b>Excercise induced angina</b></td>
            <td class="auto-style10">
                <asp:Label ID="ExerLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <b>Old Peak</b></td>
            <td class="auto-style2">
                <asp:Label ID="OldpLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">
                <b>Slope of the peak exercise ST segment</b></td>
            <td class="auto-style12">
                <asp:Label ID="SlopeLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <b>Number of major vessels</b></td>
            <td class="auto-style6">
                <asp:Label ID="VesselLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 379px; height: 26px;">
                <b>Thal</b></td>
            <td style="height: 26px">
                <asp:Label ID="ThalLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 379px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 379px; height: 34px;">
                </td>
            <td style="height: 34px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 379px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 379px; height: 23px;">
                &nbsp;</td>
            <td style="height: 23px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 379px; height: 23px;">
                &nbsp;</td>
            <td style="height: 23px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 379px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <%--</form>--%>

<h2>&nbsp;</h2>

</asp:Content>
