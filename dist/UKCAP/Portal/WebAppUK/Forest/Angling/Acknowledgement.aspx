<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebAppUK.Forest.Angling.Acknowledgement" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledgement</title>
    <script type="text/javascript">
        function CallPrint(strid)
        {
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
</head>
<body>
    <form id="form1" runat="server">
         <div style="text-align: center; margin: 10px auto;">
            <input type="button" id="btnSubmit" style="color: #fff; background-color: #337ab7; border-color: #2e6da4; border: none; border-radius: 2px; padding: 8px; min-width: 120px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
            <asp:Button ID="btnOutPut" Text="Angling Permit" Style="color: #fff; background-color: #337ab7; border-color: #2e6da4; border: none; border-radius: 2px; padding: 8px; min-width: 120px;" OnClick="btnOutPut_Click" runat="server" />
        </div>
        <div id="divPrint">
            <div style="margin: 0 auto; height: 1250px; width: 990px; border: 3px solid #000; padding: 1px; font-family: Arial">
                <div style="width: 990px; height: 99.5%; border: 1px solid #000; margin: 2px auto;">
                    <table style="width: 100%; font-family: Arial; text-align: center; font-size: 13px;">
                        <tbody>
                            <tr>
                                <td style="text-align: left; width: 100px;">
                                    <img src="data:image/png;base64,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" alt="" style="width: 70px; -webkit-print-color-adjust: exact;" /></td>
                                <td style="font-size: 24px; padding-top: 10px; font-weight:bold; text-align:center;">ANGLING APPLICATION ACKNOWLEDGEMENT</td>
                                <td style="float: right; height: 47px; text-align: right; margin: 10px 11px 0 0; -webkit-print-color-adjust: exact;">
                                    <uc1:QRCode runat="server" ID="QRCode" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="font-family: Times New Roman; font-size: 15px;"></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 99%; font-size: 12px; line-height: 18px; border: 0; margin: 0 auto;">
                        <tbody>
                            <tr>
                                <td style="padding: 12px 5px; border: 1px solid #999; text-align: left; font-size: 14px; font-weight: bold; background-color: #383E4B; color: #fff; -webkit-print-color-adjust: exact;" colspan="4">Application Detail</td>
                            </tr>
                            <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Application ID</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblAppID" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Application Date</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblAppDate" runat="server"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 99%; font-size: 12px; line-height: 18px; border: 0; margin: 0 auto;">
                        <tbody>
                            <tr>
                                <td style="padding: 12px 5px; border: 1px solid #999; text-align: left; font-size: 14px; font-weight: bold; background-color: #383E4B; color: #fff; -webkit-print-color-adjust: exact;" colspan="4">Applicant Detail</td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Applicant Name</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblFullName" runat="server"></asp:Label></td>
                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Gender</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblGender" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Date Of Birth</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblDOB" runat="server"></asp:Label></td>
                                <td  style="padding: 5px;  display:none; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Age</td>
                                <td style="padding: 5px; display:none; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblAge" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Father/Husband Name</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblFatherHusbandName" runat="server"></asp:Label></td>
                                <td style="padding: 5px; display:none; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Nationality</td>
                                <td style="padding: 5px; display:none; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblNationality" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Mobile No.</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblMobileNo" runat="server"></asp:Label></td>
                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Email ID</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblEmailId" runat="server"></asp:Label></td>
                            </tr>
                            <tr style="display:none">
                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">ID Proof Type</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblIDProof" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">ID Proof (Detail)</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblIDProofDetail" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="display:none" >
                                 <td style="width:25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Emergency No</td>
                                 <td style="width:25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblEmergencyNo" runat="server"></asp:Label>
                                </td>
                                <td style="width:25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Angling Fee</td>
                                <td style="width:25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblFee" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="display:none" >
                                <td style="width:25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold; ">No Of Fishing Rods</td>
                                <td style="width:25%; padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                    <asp:Label ID="lblFishingRods" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                   
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 99%; font-size: 12px; line-height: 18px; border: 0; margin: 0 auto;">
                        <tbody>
                            <tr>
                                <td style="padding: 12px 5px; border: 1px solid #999; text-align: left; font-size: 14px; font-weight: bold; background-color: #383E4B; color: #fff; -webkit-print-color-adjust: exact;" colspan="4">Booking Detail</td>
                            </tr>
                            <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Division</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblDivision" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Area</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblAea" runat="server"></asp:Label></td>
                            </tr>
                            <tr style="display:none">
                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Start Date</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblStartDate" runat="server"></asp:Label></td>
                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">End Date</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblEndDate" runat="server"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />

                    <table cellpadding="0" cellspacing="0" style="width: 99%; font-size: 12px; margin: 0 auto;">
                        <tr>
                            <td style="padding: 12px 5px; border: 1px solid #999; background-color: #383E4B; color: #fff; font-size: 14px; text-align: left; border-bottom: none; -webkit-print-color-adjust: exact;" colspan="3"><b>Angling Permits Details</b></td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridAnglinng" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered"
                         Style="margin: 0 auto;" ClientIDMode="Static" Width="99%"  BorderStyle="Solid" Font-Strikeout="False">
                        <HeaderStyle BackColor="#CCCCCC" Font-Size="Small" ForeColor="Black" />
                        <RowStyle Font-Size="Small" />
                    </asp:GridView>
                    <br />

                    <table cellpadding="0" cellspacing="0" style="width: 99%; font-size: 12px; margin: 0 auto;">
                        <tr>
                            <td style="padding: 12px 5px; border: 1px solid #999; background-color: #383E4B; color: #fff; font-size: 14px; text-align: left; border-bottom: none; -webkit-print-color-adjust: exact;" colspan="3"><b>List of essential documents (enclosed with the application)</b></td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridDocument" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin: 0 auto;" ClientIDMode="Static" Width="99%" OnRowDataBound="grdView_RowDataBound" BorderStyle="Solid" Font-Strikeout="False">
                        <HeaderStyle BackColor="#CCCCCC" Font-Size="Small" ForeColor="Black" />
                        <RowStyle Font-Size="Small" />
                    </asp:GridView>
                    <br />
                    <table cellpadding="0" cellspacing="0" width="100%" style="width: 99%; font-size: 12px; margin: 0 auto;">
                        <tr>
                            <td style="padding: 12px 5px; border: 1px solid #999; background-color: #383E4B; color: #fff; font-size: 14px; text-align: left; border-bottom: none;" colspan="3"><b>Action History</b></td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridActionHistory" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin: 0 auto;" ClientIDMode="Static" Width="99%" BorderStyle="Solid" Font-Strikeout="False">
                        <HeaderStyle BackColor="#CCCCCC" Font-Size="Small" ForeColor="Black" />
                        <RowStyle Font-Size="Small" />
                    </asp:GridView>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 99%; font-size: 12px; margin: 0 auto; border: 0;">
                        <tr>
                            <td style="padding: 12px 5px; border: 1px solid #383E4B; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none; -webkit-print-color-adjust: exact;" colspan="4"><b>Payment Details</b></td>
                        </tr>
                        <tr>
                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold; width: 25%;">Application ID</td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="lblTAppID" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold; width: 25%;">Application Date</td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: bold; width: 25%;">
                                <asp:Label ID="lblTAppDate" runat="server" CssClass="lbl_value"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Transaction ID</td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="lblTrnsID" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold; width: 25%;">Transaction Date</td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="lblTrnsDate" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <!-------hide Kiosk details as discussed with Niraj Sir on 21 july--------->
                        <tr style="display: none;">
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="TokenNo0" runat="server">Kiosk Name (ID)</asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="lblKiosk" runat="server"></asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="TokenNo3" runat="server">Kiosk Mobile No.</asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="lblKioskMob" runat="server" CssClass="lbl_value"></asp:Label>
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">Transaction Amount</td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;"><i class="fa fa-rupee"></i>
                                <asp:Label ID="lblAppFee" runat="server"></asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%; white-space: nowrap;">Portal Fee + Service Tax</td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <i class="fa fa-rupee"></i>Rs.<asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>+ <i class="fa fa-rupee"></i>
                                <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold; width: 135px;">Total Amount</td>
                            <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                <b>Rs. </b>
                                <asp:Label ID="lblTotalFee" runat="server" Font-Bold="True"></asp:Label><asp:HiddenField ID="HdfAppId" runat="server" />
                            </td>
                        </tr>
                    </table>

                    
                    <br />

                    <table cellpadding="0" cellspacing="0" style="width: 99%; font-size: 12px; margin: 0 auto; border: 0;">
                        <tr>
                            <td style="padding: 12px 5px; border: 1px solid #383E4B; color: #fff; font-size: 14px; text-align: left; 
background-color: #383E4B; border-bottom: none; -webkit-print-color-adjust: exact;" colspan="4"><b>Download Permit</b></td>
                        </tr>
                        <tr>
                            <td>
                             <asp:Panel ID="pnlG2GDocs" runat="server" />
                            </td>
                            
                        </tr>
                        </table>
                </div>
            </div>
        </div>
       
    </form>
</body>
</html>
