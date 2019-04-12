<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Doctor.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        PatientGrid.DataSource = Session["Result"];
        PatientGrid.DataBind(); 
        
    }


    
</script>


<%--<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	doc_patient_details
</asp:Content>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Content/startbootstrap-sb-admin-1.0.4/js/jquery.js"></script>
    <table id="t1" style="width: 100%">
        <tr>
            <td style="text-decoration: underline; text-align: left">
                <strong>MY PATIENT DETAILS</strong></td>
        </tr>
       
            </table>
        <table id="t2">
        <tr>
            <td style="text-align: left; width: 326px; height: 30px;">
                Enter Name</td>
            <td colspan="3" style="text-align: left; margin-left: 40px; height: 30px;">
                <asp:TextBox ID="nameText" runat="server" style="text-align: left"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; width: 326px; height: 23px;">
                </td>
            <td colspan="3" style="text-align: left; height: 23px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left; width: 326px; height: 30px;">
                &nbsp;</td>
            <td colspan="3" 
                style="text-align: left; height: 30px;">
                &nbsp;</td>
        </tr>
            </table>
        <table id="t3">
        <tr>
            <td style="text-align: left; width: 326px">
                &nbsp;</td>
            <td style="text-align: left; width: 229px;">

                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left; width: 326px; height: 30px;">
                </td>
            <td style="text-align: left; height: 30px; width: 229px;">

                <asp:Button ID="SearchBydateBtn" runat="server" Text="Search" 
                    BorderStyle="Solid" PostBackUrl="~/Doc_home/mypatient_detail" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 326px; height: 30px;">
                </td>
            <td style="text-align: left; width: 229px; height: 30px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="PatientGrid" runat="server" AutoGenerateColumns="False" Width="613px">
                    <Columns>
                        <asp:BoundField DataField="p_id" Visible="False" />
                        <asp:BoundField HeaderText="Patient Name" DataField="p_name" />
                        <asp:BoundField HeaderText="Mobile Number" DataField="p_mob" />
                        <asp:BoundField HeaderText="Email ID" DataField="p_email" />
                        <asp:BoundField HeaderText="Chance of Heart Desease" DataField="result" />
                        <asp:HyperLinkField DataNavigateUrlFields="p_id" DataNavigateUrlFormatString="~/Doc_home/doc_set_status/{0}" HeaderText="Status" Text="Approve" />
                    </Columns>
                </asp:GridView>
                </td>
        </tr>
    </table>
    <br />
    <table style="width: 100%">
        <tr>
            <td>0-Null Possiility</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>1-Low Possibility</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>2-Medium Possibility</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>3-High Possibility</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>4-Very High Possibility</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <%--</form>--%>

</asp:Content>
