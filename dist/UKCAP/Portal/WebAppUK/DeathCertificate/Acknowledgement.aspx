<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebAppUK.DeathCertificate.Acknowledgement" %>

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
    <script type="text/javascript">
        function btnOutput(langID) {
            var lang = langID;
            var qs = getQueryStrings();
            var uid = qs["UID"];
            var svcid = qs["SvcID"];
            var Appid = qs["AppID"];
            window.location.href = "/WebAppUK/DeathCertificate/Certificate.aspx?UID=" + uid + "&SvcID=" + svcid + "&AppId=" + Appid + "&LangId=" + lang;
           
        }

        function getQueryStrings() {
            var assoc = {};
            var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
            var queryString = location.search.substring(1);
            var keyValues = queryString.split('&');

            for (var i in keyValues) {
                var key = keyValues[i].split('=');
                if (key.length > 1) {
                    assoc[decode(key[0])] = decode(key[1]);
                }
            }
            return assoc;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="box-body box-body-open">
            <asp:Panel ID="Panel2" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                <div id="divPrint" style="margin: 0 auto; height: 1220px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; height: 1215px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                        <%------Start Header section --------%>
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
                        <%----------End Header section -------%>
                        <%---------Start Title section --------%>
                        <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                            <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; font-weight: bolder; text-transform: uppercase;">ACKNOWLEDGEMENT (DEATH)</asp:Label>
                            <br />
                            <span id="lblDeptName" runat="server" style="font-size: 15px">Revenue Department</span>

                        </div>
                        <%----------End title section ---------%>
                        <%---------Start Applicant Section --------%>
                        <div style="margin: 0 auto; width: 708px; font-size: 13px;">

                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; background-color:#e4e4e4;" colspan="4">
                                        <b>Deceased Death Details</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">
                                        <asp:Label ID="Child" runat="server">Full Name of Deceased</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="lblname" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight:bold;">Father/Husband Name
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <asp:Label ID="lblfather" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">Mother Name
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblmother" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight:bold;">Gender
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblgender" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">Religion
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblreligion" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight:bold;">
                                        <asp:Label ID="lblBirthPlace" runat="server">Date of Birth</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">Date of Death
                                            
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lbldateofdeath" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight:bold;">
                                        <asp:Label ID="lblReligion1" runat="server">Age</asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblAge" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">Place of Death
                                            
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblplaceofdeath" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight:bold;">
                                        <asp:Label ID="Label18" runat="server">Nationality</asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblNationality" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight:bold;">
                                        <asp:Label ID="Label15" runat="server">No of days till death</asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblnoofday" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">Cause of Death
                                            
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblcauseofdeath" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight:bold;">
                                        <asp:Label ID="Label17" runat="server">Is death certified by any Hospital/Authority</asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                        <asp:Label ID="lblauthority" runat="server"></asp:Label>
                                    </td>
                                    <%--<td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Mobile
                                            
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                           <asp:Label ID="lblmobile" runat="server"></asp:Label>      
                                    </td>--%>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight:bold;">What kind of therapy recommended
                                            
                                    </td>
                                    <td style=" padding:5px; border: 1px solid #999; text-align: left;" colspan="3">
                                           <asp:Label ID="lbltherapy" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; font-weight:bold;">
                                        <asp:Label ID="Label22" runat="server">Relation with Deceased</asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                            <asp:Label ID="lblDeceased" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tr>
                                    <td colspan="5" style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px; background-color:#e4e4e4;"><b>Beneficiary Address Details</b></td>
                                </tr>
                                <tr>
                                    <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px; font-weight:bold;">
                                        <asp:Label ID="Label3" runat="server" Text="Beneficiary Address"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <asp:Label ID="lblBeneficiaryAddress" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="border-style: none solid solid solid; border-width: 1px; border-color: #999; padding: 5px; font-size: 11px; line-height: 11.5px; text-align: left; width: 135px;" rowspan="4">
                                        <asp:Label ID="Label5" runat="server" Text="House / Apartment No.&lt;br/&gt;No. / Name of Building &lt;br/&gt;Locality / Landmark&lt;br/&gt;Road / Street Name "></asp:Label>
                                    </td>


                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px; font-weight:bold;">
                                        <asp:Label ID="Label4" runat="server">State</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px; ">
                                        <asp:Label ID="lblstate" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px; font-weight:bold;">
                                        <asp:Label ID="Label49" runat="server">District</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                        <asp:Label ID="Label12" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px; font-weight:bold;">
                                        <asp:Label ID="Label50" runat="server">Block</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                        <asp:Label ID="Label7" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px; font-weight:bold;">Gram Panchayat</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                        <asp:Label ID="Label9" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>

                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px; font-weight:bold;">
                                        <asp:Label ID="Label13" runat="server">Pincode</asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label14" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px; font-weight:bold;">&nbsp;</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;
                                    </td>
                                    <%--<td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="Label16" runat="server">Muncipality</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                        <asp:Label ID="lblmuncipality" runat="server"></asp:Label>
                                    </td>--%>
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
                                        <asp:Label ID="Label26" runat="server" CssClass="lbl_property" Text="Reference ID"></asp:Label>
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
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; display: none;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><strong>Application Delivery Detail</strong></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Designated Officer</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">Sub-Collector</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">Expected Date of Delivery</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                        <asp:Label ID="lblExptDate" runat="server" Text="10 Days"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">Appellate Authority</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">Sub-Divisional Officer</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;"></td>
                                    <%--<td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; ">Apallate Date</td>--%>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                        <%--<asp:Label ID="lbl2Date" runat="server" Text=""></asp:Label>--%></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">Revisional Authority</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">Additional Collector</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;"></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                        <%--<asp:Label ID="lbl3Date" runat="server" Text=""></asp:Label>--%></td>
                                </tr>
                            </table>
                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; display: none; border: 0;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><strong>Current Status</strong></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">Authorised Person</td>

                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">Status</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                        <asp:Label ID="Label44" runat="server" Text="Pending for Acceptance"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                        <asp:Label ID="Label45" runat="server" Text="Office Address"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                        <asp:Label ID="Label46" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                        <asp:Label ID="Label47" runat="server" Text="Contact No."></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                        <asp:Label ID="Label48" runat="server" Text=""></asp:Label>
                                        <asp:Label ID="Label10" runat="server"></asp:Label>
                                    </td>
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
            <input type="button" id="btnSubmit" style="color: #fff; background-color: #337ab7; border-color: #2e6da4; border:none; border-radius:2px; padding:8px; min-width:120px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
           <%-- <input type="button" name="ViewOutput" value="View Output" id="btnViewOutput" style="color: #fff; background-color: #269abc; border-color: #1b6d85; border:none; border-radius:2px; padding:8px; min-width:120px; margin-left:3px;" onclick="btnOutput();" />--%>
            <input type="button" runat="server" value="View Certificate in English" id="Hi" style="color: #fff; background-color: #269abc; border-color: #1b6d85; border:none; border-radius:2px; padding:8px; min-width:120px; margin-left:3px;" onclick="btnOutput('Hi');" />
            <input type="button" runat="server" value="View Certificate in Hindi" id="En" style="color: #fff; background-color: #269abc; border-color: #1b6d85; border:none; border-radius:2px; padding:8px; min-width:120px; margin-left:3px;" onclick="btnOutput('En');" />
        </div>
    </form>
</body>
</html>
