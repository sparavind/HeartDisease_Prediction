<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Doctor.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        System.Data.DataTable dt = (System.Data.DataTable)Session["DocDetails"];
        fnameText.Text = dt.Rows[0][1].ToString();
        mnameText.Text = dt.Rows[0][2].ToString();
        lnameText.Text = dt.Rows[0][3].ToString();
        if (dt.Rows[0][4] == "0")
        {
            RadioButtonListGender.Text= "Male";
        }
        else
        {
            RadioButtonListGender.Text = "Female";
        }
        dobText.Text = dt.Rows[0][5].ToString();
        mobText.Text = dt.Rows[0][6].ToString();
        addText.Text = dt.Rows[0][7].ToString();
        pinText.Text = dt.Rows[0][8].ToString();
        mailText.Text = dt.Rows[0][9].ToString();
        
        school1Text.Text = dt.Rows[0][10].ToString();
        cgpa1Text.Text = dt.Rows[0][11].ToString();
        board1Text.Text = dt.Rows[0][13].ToString();
        year1Text.Text = dt.Rows[0][12].ToString();

        school2Text.Text = dt.Rows[0][14].ToString();
        cgpa2Text.Text = dt.Rows[0][15].ToString();
        board2Text.Text = dt.Rows[0][17].ToString();
        year2Text.Text = dt.Rows[0][16].ToString();

        collegeText.Text = dt.Rows[0][18].ToString();
        cgpa3Text.Text = dt.Rows[0][19].ToString();
        board3Text.Text = dt.Rows[0][21].ToString();
        year3Text.Text = dt.Rows[0][20].ToString();

        hospitalText.Text = dt.Rows[0][22].ToString();
        //expyearText.Text = dt.Rows[0][23].ToString();
        //FileUploadResume.u
        //DoctorImage.ImageUrl = dt.Rows[0][25].ToString();
       

    }

</script>


<%--<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	doc_profile
</asp:Content>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../Content/startbootstrap-sb-admin-1.0.4/js/jquery.js"></script>
    <link type="text/css" href="../../Content/startbootstrap-sb-admin-1.0.4/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
     <script src="../../Scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="../../Scripts/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#<%=expyearText.ClientID %>').datepicker({
                showOn: "button",
                buttonImage: "../../Content/calender.png",
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2016',
                dateFormat: "dd/mm/yy",
                buttonImageOnly: true,
                buttonText: "Select date"
            });
        });

        $(function () {
            $('#<%=expyearText0.ClientID %>').datepicker({
                 showOn: "button",
                 buttonImage: "../../Content/calender.png",
                 changeMonth: true,
                 changeYear: true,
                 yearRange: '1950:2016',
                 dateFormat: "dd/mm/yy",
                 buttonImageOnly: true,
                 buttonText: "Select date"
             });
        });

        $(function () {
            $('#<%=dobText.ClientID %>').datepicker({
                 showOn: "button",
                 buttonImage: "../../Content/calender.png",
                 changeMonth: true,
                 changeYear: true,
                 yearRange: '1950:2016',
                 dateFormat: "dd/mm/yy",
                 buttonImageOnly: true,
                 buttonText: "Select date"
             });
         });

	</script>
    <%--<form id="form1" runat="server">--%>
    <table style="width: 100%">
        <tr>
            <td colspan="8" width="1000" style="text-decoration: underline"><strong>UPDATE MY PORTFOLIO</strong></td>
        </tr>
        <tr>
            <td colspan="8" width="1000">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="8" style="text-decoration: underline" width="1000">
                <strong>Personal Info</strong></td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                Name</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 1725px">
                First</td>
            <td colspan="6">
                <asp:TextBox ID="fnameText" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Middle <asp:TextBox ID="mnameText" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Last&nbsp; <asp:TextBox ID="lnameText" runat="server"></asp:TextBox>
            </td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 1725px">
                &nbsp;</td>
            <td colspan="3">
                <asp:RequiredFieldValidator ID="RequiredFieldfname" runat="server" 
                    ErrorMessage="First name is mandatory" ForeColor="Red" 
                    ControlToValidate="fnameText"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                &nbsp;</td>
            <td style="width: 31%">
                <asp:RequiredFieldValidator ID="RequiredFieldlname" runat="server" 
                    ErrorMessage="Last name is mandatory" ForeColor="Red" 
                    ControlToValidate="lnameText"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 13px; width: 252px;">
                Gender</td>
            <td style="height: 13px; width: 16%">
                </td>
            <td style="height: 13px; width: 9%">
                <asp:RadioButtonList ID="RadioButtonListGender" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="height: 13px; width: 9%">
                </td>
            <td style="height: 13px; width: 36%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonListGender" ErrorMessage="Gender is mandatory" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            <td style="height: 13px; width: 31%">
                &nbsp;</td>
            <td style="height: 13px; width: 31%">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                Date of birth</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td colspan="5">
                <asp:TextBox ID="dobText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldDob" runat="server" 
                    ErrorMessage="Date of Birth is Mandatory" ForeColor="Red" 
                    ControlToValidate="dobText"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 30px; width: 252px;">
                Mobile Number</td>
            <td style="height: 30px; width: 16%;">
                &nbsp;</td>
            <td colspan="5" style="height: 30px">
                <asp:TextBox ID="mobText" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionMobile" runat="server" 
                    ControlToValidate="mobText" ErrorMessage="Enter a Valid Mobile Number" 
                    ForeColor="Red" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldMob" runat="server" 
                    ErrorMessage="Mobile number is Mandatory" ForeColor="Red" 
                    ControlToValidate="mobText"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                Permanent Address</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td colspan="5">
                <asp:TextBox ID="addText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldAdd" runat="server" 
                    ErrorMessage="Address is Mandatory" ForeColor="Red" 
                    ControlToValidate="addText"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px; height: 30px;">
                Pin code</td>
            <td style="width: 16%; height: 30px;">
                </td>
            <td colspan="5" style="height: 30px">
                <asp:TextBox ID="pinText" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="pin" runat="server" 
                    ErrorMessage="Pincode is invalid" ForeColor="Red" ValidationExpression="\d{6}" ControlToValidate="pinText"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 30px; width: 252px;">
                E-Mail</td>
            <td style="height: 30px; width: 16%;">
                &nbsp;</td>
            <td colspan="5" style="height: 30px">
                <asp:TextBox ID="mailText" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionMail" runat="server" 
                    ControlToValidate="mailText" ErrorMessage="Enter a Valid Mail Id" 
                    ForeColor="Red" 
                    ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldDmail" runat="server" 
                    ControlToValidate="mailText" ErrorMessage="Email is mandatory" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                &nbsp;</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-decoration: underline; height: 23px; ">
                <strong>Qualification Info</strong></td>
            <td style="width: 9%; height: 23px;">
                </td>
            <td style="width: 36%; height: 23px;">
                </td>
            <td style="width: 31%; height: 23px;">
                </td>
            <td style="width: 31%; height: 23px;">
                </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                &nbsp;</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                &nbsp;</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td style="width: 9%">
                School/College</td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                CGPA</td>
            <td style="width: 31%">
                Board/University</td>
            <td style="width: 31%">
                Year of Passing</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                Metriculation</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td style="width: 9%">
                <asp:TextBox ID="school1Text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldschool1" runat="server" 
                    ErrorMessage="School name is mandatory" ControlToValidate="school1Text" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                <asp:TextBox ID="cgpa1Text" runat="server" 
                    ToolTip="It should be calculated in 10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldcgpa1" runat="server" 
                    ControlToValidate="cgpa1Text" ErrorMessage="cgpa is mandatory" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 31%">
                <asp:TextBox ID="board1Text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldBoard1" runat="server" 
                    ControlToValidate="board1Text" ErrorMessage="Board is Mandatory" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 31%">
                <asp:TextBox ID="year1Text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldYear1" runat="server" 
                    ControlToValidate="year1Text" ErrorMessage="Year of passing is mandatory" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                HSE</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td style="width: 9%">
                <asp:TextBox ID="school2Text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldSchool2" runat="server" 
                    ControlToValidate="school2Text" ErrorMessage="School name is mandatory" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                <asp:TextBox ID="cgpa2Text" runat="server" 
                    ToolTip="It should be calculated in 10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldcgpa2" runat="server" 
                    ControlToValidate="cgpa2Text" ErrorMessage="cgpa is mandatory" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 31%">
                <asp:TextBox ID="board2Text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="board2" runat="server" 
                    ControlToValidate="board2Text" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 31%">
                <asp:TextBox ID="year2Text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldYear2" runat="server" 
                    ControlToValidate="year2Text" ErrorMessage="Year of passing is mandatory" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                MBBS</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td style="width: 9%">
                <asp:TextBox ID="collegeText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldCollege" runat="server" 
                    ControlToValidate="collegeText" ErrorMessage="School name is mandatory" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                <asp:TextBox ID="cgpa3Text" runat="server" 
                    ToolTip="It should be calculated in 10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldcgpa3" runat="server" 
                    ControlToValidate="cgpa3Text" ErrorMessage="cgpa is mandatory" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 31%">
                <asp:TextBox ID="board3Text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldBoard3" runat="server" 
                    ControlToValidate="board3Text" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 31%">
                <asp:TextBox ID="year3Text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldYear3" runat="server" 
                    ControlToValidate="year3Text" ErrorMessage="Year of passing is mandatory" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                &nbsp;</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-decoration: underline; ">
                <strong>Experience Info</strong></td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                Do you have experience</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td style="width: 9%">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>---Select---</asp:ListItem>
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 23px; width: 252px;">
                Hospital Name</td>
            <td style="height: 23px; width: 16%">
                &nbsp;</td>
            <td style="height: 23px; " colspan="5">
                <asp:TextBox ID="hospitalText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldExpHosp" runat="server" 
                    ErrorMessage="Enter the Hospital Name" ForeColor="Red" 
                    ControlToValidate="hospitalText"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 23px; width: 252px;">
                &nbsp;</td>
            <td style="height: 23px; width: 16%">
                &nbsp;</td>
            <td style="height: 23px; " colspan="5">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 23px; text-align: left; width: 252px;">
                Period of service</td>
            <td style="height: 23px;" colspan="3">
                From<asp:TextBox ID="expyearText" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td style="height: 23px; " colspan="2">
                To<asp:TextBox ID="expyearText0" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td style="height: 23px; width: 36%">
                </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                &nbsp;</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 23px; width: 252px;">
                &nbsp;</td>
            <td style="width: 16%; height: 23px;">
                &nbsp;</td>
            <td style="width: 9%; height: 23px;">
                &nbsp;</td>
            <td style="width: 9%; height: 23px;">
                &nbsp;</td>
            <td style="width: 36%; height: 23px;">
                </td>
            <td style="width: 31%; height: 23px;">
                &nbsp;</td>
            <td style="width: 31%; height: 23px;">
                </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 252px">
                &nbsp;</td>
            <td style="width: 16%">
                &nbsp;</td>
            <td style="width: 9%">
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" BorderStyle="Solid" Text="Update" PostBackUrl="~/Doc_home/doc_mydetails_update" />
            </td>
            <td style="width: 9%">
                &nbsp;</td>
            <td style="width: 36%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
            <td style="width: 31%">
                &nbsp;</td>
        </tr>
    </table>
   <%-- </form>--%>

</asp:Content>
