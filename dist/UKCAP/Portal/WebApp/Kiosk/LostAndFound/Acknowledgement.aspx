<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.LostAndFound.Acknowledgement" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledgement - Lost and Found</title>

    <script src="../../../g2c/HomeV2/js/jquery-2.2.3.min.js"></script>
    <script src="../../Scripts/CommonScript.js"></script>

    <script type="text/javascript">
        function printDiv(DIVID)
        {
            var divToPrint = document.getElementById('divPrint1');
            var htmlToPrint = "";
            var htmlToPrint = '' + '<style type="text/css">'
                + 'table th, table td {' + 'padding:0;' + '' + 'font-size:10px;' + '' + 'line-height:initial;' + ' }' +
                '</style>';
            htmlToPrint += divToPrint.outerHTML;
            newWin = window.open("");
            newWin.document.write(htmlToPrint);
            newWin.print();
            newWin.close();
        }

        function CreateDialog(src, FileName)
        {
            var dialog = '<div  title="' + FileName + '" style="overflow:hidden;">';
            dialog += '<iframe  src="' + src + '" height="100%" width="100%"></iframe>';
            dialog += '</div>';
            console.log(dialog);
            $(dialog).dialog({ width: '890', height: '600' });

        }

        var baseUrl = "<%= Page.ResolveUrl("~/") %>";

            function ResolveUrl(url)
            {
                if (url.indexOf("~/") == 0)
                {
                    url = baseUrl + url.substring(2);
                }
                return url;
            }

            function ViewDoc(m_ServiceID, m_AppID, m_Path)
            {
                var t_URL = "";
                t_URL = m_Path;//+ "&SvcID=" + m_ServiceID + "&AppID=" + m_AppID;
                t_URL = ResolveUrl(t_URL);
                window.open(t_URL, "");
            }
    </script>

    <style>
        .btn-danger {
            min-width: 120px;
            background-color: #28de40 !important;
            color: #fff;
            padding: 8px 15px;
            border: 0;
            border-radius: 2px;
            margin-left: 5px;
            cursor: pointer;
        }

        .homebtn {
            background-color: #5cb85c;
            border-color: #4cae4c;
            color: #fff;
            border: none;
            padding: 6px 9px;
            width: 150px;
            border-color: #2e6da4;
        }

        #GridLostFound td {
            word-break: break-all !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box-body box-body-open">
            <div id="divPrint" style="margin: 0 auto; width: 800px; height: 100%; /*height: 1220px; overflow: auto; */">
                <div style="margin: 0 auto; width: 100%; height: auto; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 2px auto; width: 99%; height: 99.4%; height: auto; border: 1px solid #000; background-image: url('/WebApp/Kiosk/Images/odisha_police_bg.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                        <%---------Start Header section --------%>
                        <div style="height: 140px; width: 100%; border-bottom: 1px solid #999;">
                            <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                <img alt="Logo" src="../images/depLgog.png" style="width: 110px; margin: 25px 0px 0px 33px;" />
                            </div>
                            <div style="width: 105px; float: right; text-align: right; padding-right: 20px;">
                                <img alt="Logo" src="/WebApp/Kiosk/Images/Orissa_PoliceLogo.png" style="width: 90px; height: 90px; margin: 22px 0px 0px 0;" />
                            </div>
                            <div style="float: right; height: 47px; text-align: right; margin: 25px 11px 0 0; -webkit-print-color-adjust: exact;">
                                <uc1:QRCode runat="server" ID="QRCode" />
                            </div>
                        </div>
                        <%----------End Header section ---------%><%---------Start Title section --------%>
                        <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                            <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; text-transform: uppercase;">ACKNOWLEDGEMENT FOR <span id="AckTitle" runat="server"></span></asp:Label>
                        </div>
                        <%----------End title section ---------%><%---------Start Applicant Section --------%>
                        <div style="margin: 10px auto; width: 760px; font-size: 12px; line-height: 18px;">
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 1px solid #999; margin: 0 auto;">
                                <tr>
                                    <td colspan="4" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B;"><b>Registration Detail</b></td>
                                </tr>
                                <tr>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 12px;"><b>Register For</b></td>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; font-size: 12px;" class="auto-style2">
                                        <asp:Label ID="lblRegistrationType" runat="server"></asp:Label></td>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 12px;" class="auto-style1"><b>Register Date</b></td>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; font-size: 12px;">
                                        <asp:Label ID="lblRegistrationDate" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 12px;"><b>Application ID</b></td>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; font-size: 12px;" class="auto-style2">
                                        <asp:Label ID="ldlAppID" runat="server"></asp:Label></td>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 12px;" class="auto-style1"><b>Application Date</b></td>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; font-size: 12px;">
                                        <asp:Label ID="lblAppDate" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                            <br />
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 1px solid #999; margin: 0 auto;">
                                <tr>
                                    <td colspan="4" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B;"><b>Applicant Details</b></td>
                                </tr>
                                <tr>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 12px;"><b>Name of the Applicant</b></td>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; font-size: 12px;" class="auto-style2">
                                        <asp:Label ID="lblFullName" runat="server"></asp:Label></td>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 12px;" class="auto-style1"><b>Mobile Number</b></td>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; font-size: 12px;">
                                        <asp:Label ID="lblMobileNo" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 12px;">
                                        <b>Email</b>
                                    </td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; font-size: 12px;">
                                        <asp:Label ID="lblEmailId" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 1px solid #999; margin: 0 auto;">
                                <tr>
                                    <td colspan="4" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B;"><b>Applicant Address</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Address</b></td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="AddressLine1" runat="server"></asp:Label>&nbsp;<asp:Label ID="AddressLine2" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;"><b>Road/Street Name</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 190px;">
                                        <asp:Label ID="RoadStreetName" runat="server"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 190px;"><b>Landmark</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="LandMark" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Locality</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="Locality" runat="server"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Panchayat/Village/City</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="ddlVillage" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Block/Taluka</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="Block" runat="server"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>District</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="ddlDistrict" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>State</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="ddlState" runat="server"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Pincode</b></td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                        <asp:Label ID="PinCode" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                            <br />
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 1px solid #999; margin: 0 auto;">
                                <tbody>
                                    <tr>
                                        <td colspan="4" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B;"><b>Details of Lost/Found Items</b></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:GridView ID="GridLostFound" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin: 0 auto;" ClientIDMode="Static" Width="100%">
                                <HeaderStyle BackColor="#F8F8F8" Font-Bold="True" />
                            </asp:GridView>
                            <br />
                            <table cellpadding="0" cellspacing="0" style="width: 100%; margin: 0 auto;">
                                <tr>
                                    <td colspan="4" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B;"><b>List of essential documents (enclosed with the application)</b></td>
                                </tr>
                            </table>
                            <asp:GridView ID="grdView" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin: 0 auto;" ClientIDMode="Static" Width="100%" OnRowDataBound="grdView_RowDataBound">
                                <HeaderStyle BackColor="#F8F8F8" Font-Bold="True" />
                            </asp:GridView>
                            <br />
                            <table cellpadding="0" cellspacing="0" width="100%" style="">
                                <tr>
                                    <td colspan="4" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B;"><b>Action History</b></td>
                                </tr>
                            </table>
                            <asp:GridView ID="GridActionHistory" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin: 0 auto;" ClientIDMode="Static" Width="100%">
                                <HeaderStyle BackColor="#F8F8F8" Font-Bold="True" />
                            </asp:GridView>
                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; margin: 0 auto; display: none;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="4"><b>Payment Details</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%; font-size: 12px;">
                                        <asp:Label runat="server" CssClass="lbl_property" Font-Bold="true" Text="Application Number"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%; font-size: 12px;">
                                        <asp:Label ID="PAppID" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%; font-size: 12px;">
                                        <asp:Label runat="server" CssClass="lbl_property" Font-Bold="true" Text="Application Date"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%; font-size: 12px;">
                                        <asp:Label ID="PAppDate" runat="server" CssClass="lbl_value"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-size: 12px;"><b>Transaction ID</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px; font-size: 12px;"><span id="lblTrnsID" runat="server" style="font-weight: bold;"></span></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-size: 12px;"><b>Transaction Date</b></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px; font-size: 12px;"><span id="lblTrnsDate" runat="server" style="font-weight: bold;"></span></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-size: 12px;"><b>Total Amount</b></td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; font-size: 12px;"><i class="fa fa-rupee"></i>
                                        Rs.
                                            <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                        <%--<asp:Label ID="lblAmtWord" runat="server" Text="(Thirty Two Rupees and Ninety Paise)"></asp:Label>--%>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </div>
                        <%----------End Document Section ---------%>
                        <div style="clear: both; margin: 0; line-height: 0; padding: 0; width: 135px;"></div>
                    </div>
                </div>
            </div>
            <div class="clear" style="page-break-before: always;">
                &nbsp;
            </div>
            <div style="text-align: center; margin-bottom: 10px;">
                <input type="button" id="btnSubmit" class="btn btn-info" style="color: #fff; background-color: #337ab7 !important; border: none; padding: 6px 9px; width: 150px; border-color: #2e6da4;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                <asp:Button ID="btnHome" runat="server" PostBackUrl="" ToolTip="Back to Home Page" CssClass="homebtn" Text="Home"  OnClick="btnHome_Click"/>
            </div>
        </div>
    </form>
</body>
</html>