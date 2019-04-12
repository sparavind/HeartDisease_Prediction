<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Doctor.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        System.Data.DataTable dt = (System.Data.DataTable)Session["DocDetails"];
        Session["dname"] = "Dr."+dt.Rows[0][1].ToString();
        dfnameLabel.Text= dt.Rows[0][1].ToString();
        dmLabel.Text=dt.Rows[0][2].ToString();
        dlLabel.Text = dt.Rows[0][3].ToString();
        dgenderLabel.Text = dt.Rows[0][4].ToString();
        ddobLabel.Text = dt.Rows[0][5].ToString();
        dmobLabel.Text = dt.Rows[0][6].ToString();
        daddrLabel.Text = dt.Rows[0][7].ToString();
        dpinLabel.Text = dt.Rows[0][8].ToString();
        dmailLabel.Text = dt.Rows[0][9].ToString();
        dschool1Label.Text = dt.Rows[0][10].ToString();
        cgpa1Label.Text = dt.Rows[0][11].ToString();
        Year1Label.Text = dt.Rows[0][12].ToString();
        dboard1Label.Text = dt.Rows[0][13].ToString();
        dschool2Label.Text = dt.Rows[0][14].ToString();
        cgpa2Label.Text = dt.Rows[0][15].ToString();
        Year2Label.Text = dt.Rows[0][16].ToString();
        dboard2Label.Text = dt.Rows[0][17].ToString();
        dschool3Label.Text = dt.Rows[0][18].ToString();
        cgpa3Label.Text = dt.Rows[0][19].ToString();
        Year3Label.Text = dt.Rows[0][20].ToString();
        dboard3Label.Text = dt.Rows[0][21].ToString();
        HospLabel.Text = dt.Rows[0][22].ToString();
        expyearLabel.Text = dt.Rows[0][23].ToString();
        //DoctorImage.ImageUrl = dt.Rows[0][25].ToString();
       
    }
</script>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Content/startbootstrap-sb-admin-1.0.4/js/jquery.js"></script>
    <%--<form id="form1" runat="server">--%>

   <table style="width: 100%">
        <tr>
            <td colspan="3" style="text-decoration: underline;">
                <strong>MY PORTFOLIO</strong></td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 14%">
                &nbsp;</td>
            <td style="width: 18%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="7">
                &nbsp;</td>
            <td width="1000">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="7" style="text-decoration: underline; height: 23px;">
                <strong>Personal Info</strong></td>
            <td style="text-decoration: underline; height: 23px;" width="1000">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 52px; width: 164px">
                &nbsp;</td>
            <td style="width: 13%; height: 52px;">
                <asp:Label ID="dfnameLabel" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="width: 5%; height: 52px;">
                <asp:Label ID="dmLabel" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="height: 52px;" colspan="3">
                <asp:Label ID="dlLabel" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="height: 52px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 1642px">
                &nbsp;</td>
            <td colspan="2">
                <asp:Label ID="dgenderLabel" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 14%">
                &nbsp;</td>
            <td style="width: 18%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 13px; width: 164px;">
                &nbsp;</td>
            <td style="height: 13px; width: 13%">
                </td>
            <td style="height: 13px; width: 5%">
                &nbsp;</td>
            <td style="height: 13px; width: 5%">
                </td>
            <td style="height: 13px; width: 14%">
                </td>
            <td style="height: 13px; width: 18%">
            </td>
            <td style="height: 13px; width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                <asp:Label ID="ddobLabel" runat="server" Text="Label"></asp:Label>
            </td>
            <td colspan="4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 30px; width: 164px;">
                &nbsp;</td>
            <td style="height: 30px; width: 13%;">
                <asp:Label ID="dmobLabel" runat="server" Text="Label"></asp:Label>
            </td>
            <td colspan="4" style="height: 30px">
                &nbsp;</td>
            <td style="height: 30px">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                <asp:Label ID="daddrLabel" runat="server" Text="Label"></asp:Label>
            </td>
            <td colspan="4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px; height: 23px;">
                </td>
            <td style="width: 13%; height: 23px;">
                <asp:Label ID="dpinLabel" runat="server" Text="Label"></asp:Label>
            </td>
            <td colspan="4" style="height: 23px">
                </td>
            <td style="height: 23px">
                </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 30px; width: 164px;">
                &nbsp;</td>
            <td style="height: 30px; width: 13%;">
                <asp:Label ID="dmailLabel" runat="server" Text="Label"></asp:Label>
            </td>
            <td colspan="4" style="height: 30px">
                &nbsp;</td>
            <td style="height: 30px">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 14%">
                &nbsp;</td>
            <td style="width: 18%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="text-decoration: underline; ">
                <strong>Qualification Info</strong></td>
            <td style="text-decoration: underline; width: 5%">
            </td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 14%">
                &nbsp;</td>
            <td style="width: 18%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px; height: 23px;">
                </td>
            <td style="width: 13%; height: 23px;">
                </td>
            <td style="width: 5%; height: 23px;">
                </td>
            <td style="width: 5%; height: 23px;">
                </td>
            <td style="width: 14%; height: 23px;">
                </td>
            <td style="width: 18%; height: 23px;">
                </td>
            <td style="width: 31%; height: 23px;">
                </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                <strong>Metriculation</strong></td>
            <td style="width: 13%">
                &nbsp;</td>
            <td colspan="5">
                <asp:Label ID="dschool1Label" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td colspan="5">
                <asp:Label ID="cgpa1Label" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px; height: 23px">
                &nbsp;</td>
            <td style="width: 13%; height: 23px;">
                </td>
            <td style="height: 23px;" colspan="5">
                <asp:Label ID="Year1Label" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td colspan="5">
                <asp:Label ID="dboard1Label" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 14%">
                &nbsp;</td>
            <td style="width: 18%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                <strong>HSE</strong></td>
            <td style="width: 13%">
                &nbsp;</td>
            <td colspan="5">
                <asp:Label ID="dschool2Label" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td colspan="5">
                <asp:Label ID="cgpa2Label" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td colspan="5">
                <asp:Label ID="Year2Label" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td colspan="5">
                <asp:Label ID="dboard2Label" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 14%">
                &nbsp;</td>
            <td style="width: 18%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                <strong>MBBS</strong></td>
            <td style="width: 13%">
                &nbsp;</td>
            <td colspan="5">
                <asp:Label ID="dschool3Label" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td colspan="5">
                <asp:Label ID="cgpa3Label" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td colspan="5">
                <asp:Label ID="Year3Label" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td colspan="5">
                <asp:Label ID="dboard3Label" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 14%">
                &nbsp;</td>
            <td style="width: 18%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="text-decoration: underline; height: 23px;">
                <strong>Experience Info</strong></td>
            <td style="width: 5%; height: 23px;">
                </td>
            <td style="width: 5%; height: 23px;">
                </td>
            <td style="width: 14%; height: 23px;">
                </td>
            <td style="width: 18%; height: 23px;">
                </td>
            <td style="width: 31%; height: 23px;">
                </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 14%">
                &nbsp;</td>
            <td style="width: 18%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="height: 23px; ">
                <b>Hospital Name</b></td>
            <td style="height: 23px; " colspan="4">
                <asp:Label ID="HospLabel" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="height: 23px; ">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="height: 23px; text-align: left; ">
                <b>Period of service</b></td>
            <td colspan="2">
                <asp:Label ID="expyearLabel" runat="server" Text="Label"></asp:Label>
&nbsp;Years</td>
            <td style="height: 23px; width: 14%">
                &nbsp;</td>
            <td style="height: 23px; width: 18%">
                &nbsp;</td>
            <td style="height: 23px; width: 36%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 14%">
                &nbsp;</td>
            <td style="width: 18%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 23px; width: 164px;">
                </td>
            <td style="width: 13%; height: 23px;">
                &nbsp;</td>
            <td style="width: 5%; height: 23px;">
                <asp:Button ID="editBtn" runat="server" Text="Edit" PostBackUrl="~/Doc_home/doc_profile"/>
                </td>
            <td style="width: 5%; height: 23px;">
                &nbsp;</td>
            <td style="width: 14%; height: 23px;">
                </td>
            <td style="width: 18%; height: 23px;">
                </td>
            <td style="width: 31%; height: 23px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 164px">
                &nbsp;</td>
            <td style="width: 13%">
                &nbsp;</td>
            <td style="width: 5%">
&nbsp;&nbsp;&nbsp;
                </td>
            <td style="width: 5%">
                &nbsp;</td>
            <td style="width: 14%">
                &nbsp;</td>
            <td style="width: 18%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
    </table>

    <%--</form>--%>

</asp:Content>
