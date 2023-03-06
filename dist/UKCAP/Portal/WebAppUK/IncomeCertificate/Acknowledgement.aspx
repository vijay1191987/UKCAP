<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebAppUK.IncomeCertificate.Acknowledgement" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function CallPrint(strid) {
            debugger;
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=800,height=700,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box-body box-body-open">
            <asp:Panel ID="Panel2" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                <div id="divPrint" style="margin: 0 auto; height: 1095px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; height: 1091px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                        <%---------Start Header section --------%>
                        <div style="height: 115px; width: 785px; border-bottom: 1px solid #999;">
                             <div style="width: 165px; float: left; height: 115px;">
                                  <img alt="logo" src="../img/uttarakhand_state_logo.png" style="width: 100px; margin: 5px 0px 0px 33px;" />
                            </div>
                            <div style="height: 47px; width: 283px; float: right; margin: 45px 31px 0 0; display: none;">
                                <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-bottom: none; border-right: none;">
                                    Trans. No.
                                </div>
                                <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999; border-bottom: none;">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>
                                </div>
                                <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-right: none;">
                                    Trans. Date
                                </div>
                                <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999;">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True"></asp:Label>
                                </div>
                            </div>
                            <div style="height: 47px; float: right; margin: 5px 31px 0 0;">
                                <%--<img src="../Images/QRCode.png" style="width: 100px" />--%>
                                <uc1:QRCode runat="server" ID="QRCode1" />
                            </div>
                        </div>
                        <%----------End Header section ---------%>
                        <%---------Start Title section --------%>
                        <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                            <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; font-weight: bolder; text-transform: uppercase;">Acknowledgement (Income)</asp:Label>
                            <br />
                            <span id="lblDeptName" runat="server" style="font-size: 15px">Revenue Department</span>

                        </div>
                        <%----------End title section ---------%>
                        <%---------Start Applicant Section --------%>
                        <div style="margin: 10px auto; width: 708px; font-size: 13px;">

                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; background-color:#e4e4e4;" colspan="4">
                                        <b>Beneficiary Details</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">
                                        <asp:Label ID="Child" runat="server"><b>Beneficiary Full Name</b></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="lblChild" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight:bold;"><b>Father/Husband Name</b>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="lblFatherHusbandName" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;"><b>Mother Name</b>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblMother" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight:bold;"><b>Gender</b>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblGender" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;"><b>Mobile</b>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight:bold;">
                                        <asp:Label ID="EmailID" runat="server"><b>Email ID</b></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblEmailID" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;"><b>Occupation</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblOccupation" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;"><b>Monthly Income in Number</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblMonthlyIncome" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;"><b>Monthly Income in Words</b>

                                    </td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; ">
                                        <asp:Label ID="lblIncomeinWords" runat="server"></asp:Label>
                                    </td>

                                </tr>

                            </table>
                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">

                                <tr>
                                    <td colspan="5" style="border-style: solid solid  solid; border-width: 1px; border-color: #999; border-bottom: 1px solid #999; padding: 5px; text-align: left; width: 135px; background-color:#e4e4e4;"><b>Beneficiary Address Details;</b></td>
                                </tr>
                                
                                <tr>
                                    <td style="border-style: solid solid solid solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                        <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Beneficiary Address"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <asp:Label ID="lblBeneficiaryAddress" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-style: none solid solid solid; border-width: 1px; border-color: #999; padding: 5px; font-size: 12px; line-height: 11.5px; text-align: left; width: 135px; vertical-align: top;" rowspan="3">
                                        <asp:Label ID="Label5" Font-Bold="true" runat="server" Text="House / Apartment No.&lt;br/&gt;No. / Name of Building &lt;br/&gt;Locality / Landmark&lt;br/&gt;Road / Street Name "></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="Label6" runat="server"><b>State</b></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                        <asp:Label ID="lblstate" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="Label8" runat="server"><b>District</b></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                        <asp:Label ID="lbldistrict" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="Label11" runat="server"><b>Block</b></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblblock" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="Label7" runat="server"><b>Village/Gram/Panchayat</b></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblvillage" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    

                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="Label15" runat="server"><b>Pincode</b></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="lblpincode" runat="server"></asp:Label>
                                    </td>
                                  
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            </td>
                                    
                                   
                                </tr>
                            </table>
                            <br />
                            <table cellpadding="0" cellspacing="0" width="100%" style="">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none; background-color:#e4e4e4;" colspan="3"><b>List of essential documents (enclosed with the application)</b></td>
                                </tr>
                            </table>

                            <asp:GridView ID="grdView" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0;" ClientIDMode="Static" Width="100%">
                            </asp:GridView>


                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; background-color:#e4e4e4;" colspan="4"><b>Payment Details<asp:Label ID="AppName" runat="server" CssClass="lbl_value" Style="white-space: normal !important;"></asp:Label>
                                    </b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">
                                        <asp:Label ID="Label26" runat="server" CssClass="lbl_property" Font-Bold="true" Text="Reference ID"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                        <asp:Label ID="lblAppID" runat="server" CssClass="lbl_value"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">
                                        <asp:Label ID="Label31" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                        <asp:Label ID="AppDate" runat="server" CssClass="lbl_value"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">Transaction ID</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                        <span id="lblTrnsID" runat="server" style="font-weight: bold;">16505101000000000085</span></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">Transaction Date</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                        <span id="lblTrnsDate" runat="server" style="font-weight: bold;">31/05/2016</span></td>
                                </tr>
                                <tr style="display: none;">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold; display: none">Transaction Amount</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px; display: none"><i class="fa fa-rupee"></i>
                                        <asp:Label ID="lblAppFee" runat="server"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold; white-space: nowrap; display: none">Portal Fee + Service Tax</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px; display: none;"><i class="fa fa-rupee"></i>
                                        <asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>
                                        + <i class="fa fa-rupee"></i>
                                        <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">Total Amount</td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                        <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                        &nbsp;(<asp:Label ID="lblAmt" runat="server" Font-Bold="True"></asp:Label>)</td>
                                </tr>
                            </table>

                            <br />
                  
                        </div>
                        <%----------End Document Section ---------%>
                                           </div>
                </div>
            </asp:Panel>
        </div>
        <div style="text-align: center; margin: 10px auto;">
            <input type="button" id="btnSubmit" class="btn btn-info" style="color: #fff; background-color: #337ab7; border-color: #2e6da4; border:none; border-radius:2px; padding:8px; min-width:120px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
            <input type="submit" name="Cancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
        </div>
    </form>
</body>
</html>
