﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebAppUK.AayushDept.DrugLicense.Acknowledgement" %>

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
            <asp:Button ID="btnOutPut" Text="View OutPut" Style="color: #fff; background-color: #337ab7; border-color: #2e6da4; border: none; border-radius: 2px; padding: 8px; min-width: 120px;"  runat="server" />
        </div>
        <div id="divPrint">
            <div style="width: 950px; height:auto; border: 3px solid #000; padding: 1px; font-family: Arial; margin: 0 auto;">
                <div style="background-image: url('/WebAppUK/img/certificate_logo_bg.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center; width: 940px; border: 1px solid #000; margin: 2px auto;">
                    <table style="width: 98%; font-family: Arial; text-align: center; font-size: 13px; margin: 0 auto;">
                        <tbody>
                            <tr>
                                <td style="text-align: left; width: 100px;">
                                    <img src="data:image/png;base64,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" alt="" style="width: 70px; -webkit-print-color-adjust: exact;" /></td>
                                <td style="font-size: 24px; padding-top: 10px; font-weight: bold; text-align: center;">ACKNOWLEDGEMENT : NEW/RENEWAL DRUG LICENCE <%--<span style="display: block; font-size: 14px; font-weight: normal;"></span>--%></td>
                                <td style="/*float: right; */ width: 80px; height: 47px; text-align: right; margin: 10px 11px 0 0; -webkit-print-color-adjust: exact;">
                                    <uc1:QRCode runat="server" ID="QRCode" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="font-family: Times New Roman; font-size: 15px;"></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 98%; font-size: 12px; line-height: 18px; border: 0; margin: 0 auto;">
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
                    <table width="98%" border="0" cellspacing="0" cellpadding="0" class="table-bordered" style="width: 98%; font-size: 13px; margin: 0 auto;">
                        <tbody>
                            <tr>
                                <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B;"><b>Applicant/Owner/Firm Details</b></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top; width: 1%;">
                                    <table border="0" cellspacing="0" cellpadding="0">
                                        <tbody>
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; font-size: 10px; text-align: center; width: 150px; vertical-align: top;">
                                                    <img id="ImgPhoto" runat="server" src="data:image/png;base64,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" name="ProfilePhoto" style="margin: 1px; width: 118px;" /><b>Applicant Photo</b></td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; font-size: 10px; text-align: center; width: 150px;">
                                                    <img id="ImgSign" runat="server" src="data:image/png;base64,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" name="ProfileSignature" style="width: 118px; height: 50px;" /><b>Applicant Sign</b></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td valign="top" style="width: 75%;">
                                    <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; font-size: 13px; line-height: 18px; margin: 0;">
                                        <tbody>
                                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Licence Applied For</b></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                    <asp:Label ID="lblApplyFor" runat="server"></asp:Label>
                                </td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Authority Name</b></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                    <asp:Label ID="lblAuthorityName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Company/Firm Name</b></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                    <asp:Label ID="lblCompany" runat="server"></asp:Label>
                                </td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Licence No</b></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                    <asp:Label ID="lblLicenceNo" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Gender</b></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                    <asp:Label ID="lblgendername" runat="server"></asp:Label>
                                </td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Office No.</b></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblOfficeNo" runat="server"></asp:Label>
                                                </td>
                            </tr>
                                            <tr>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Mobile No.</b></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblMobileNo" runat="server"></asp:Label>
                                                </td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">&nbsp;</td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Full Address <small>(Applicant)</small></b></td>
                                                <td colspan="3" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblAppAddress" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>State</b></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblState" runat="server"></asp:Label></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>District</b></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblDistrict" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Block</b></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblBlock" runat="server"></asp:Label></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Panchayat</b></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblPanchayat" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Pincode</b></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblPincode" runat="server"></asp:Label></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Email ID</b></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblEmailId" runat="server"></asp:Label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                  <table cellpadding="0" cellspacing="0" style="width: 98%; font-size: 12px; line-height: 18px; border: 0; margin: 0 auto;">
                        <tbody>
                            <tr>
                                <td style="padding: 12px 5px; border: 1px solid #999; text-align: left; font-size: 14px; font-weight: bold; background-color: #383E4B; color: #fff; -webkit-print-color-adjust: exact;" colspan="4">Patent & Proprietary Details</td>
                            </tr>
                            <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Product Name</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblproductName" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">PackSize</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblPackSize" runat="server"></asp:Label></td>
                            </tr>
                              <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Sub Category</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblSubCategory" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Use- Internal/External</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lbluse" runat="server"></asp:Label></td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Method to Use</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblMethod" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Method of Preparation(Stepwise)</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblmethodusePreparation" runat="server"></asp:Label></td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Indication</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblIndication" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Expiry Date</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblExpiryDate" runat="server"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                    <asp:GridView ID="GridPatentDetail" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin: 0 auto;" ClientIDMode="Static" Width="98%" BorderStyle="Solid" Font-Strikeout="False">
                        <HeaderStyle BackColor="#CCCCCC" BorderColor="Black" Font-Size="Small" ForeColor="Black" />
                        <RowStyle Font-Size="Small" />
                    </asp:GridView>
                    <br />
                     <table cellpadding="0" cellspacing="0" style="width: 98%; font-size: 12px; line-height: 18px; border: 0; margin: 0 auto;">
                        <tbody>
                            <tr>
                                <td style="padding: 12px 5px; border: 1px solid #999; text-align: left; font-size: 14px; font-weight: bold; background-color: #383E4B; color: #fff; -webkit-print-color-adjust: exact;" colspan="4">Classical Medicine Details</td>
                            </tr>
                            
                        </tbody>
                    </table>
                    <asp:GridView ID="GridClassical" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin: 0 auto;" ClientIDMode="Static" Width="98%" BorderStyle="Solid" Font-Strikeout="False">
                        <HeaderStyle BackColor="#CCCCCC" BorderColor="Black" Font-Size="Small" ForeColor="Black" />
                        <RowStyle Font-Size="Small" />
                    </asp:GridView>
                    <br />

                      <table cellpadding="0" cellspacing="0" style="width: 98%; font-size: 12px; line-height: 18px; border: 0; margin: 0 auto;">
                        <tbody>
                            <tr>
                                <td style="padding: 12px 5px; border: 1px solid #999; text-align: left; font-size: 14px; font-weight: bold; background-color: #383E4B; color: #fff; -webkit-print-color-adjust: exact;" colspan="4">Label Claim Details</td>
                            </tr>
                            <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Product Name</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblLProduct" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Packing Size</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblLPackSize" runat="server"></asp:Label></td>
                            </tr>
                              <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Sub Category</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblSubCategoryL" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Use- Internal/External</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblUseInternalL" runat="server"></asp:Label></td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Method to Use</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblMethodL" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Method of Preparation(Stepwise)</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblMethodprepartionL" runat="server"></asp:Label></td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Indication</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblIndicationL" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Expiry Date</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblExpirdateL" runat="server"></asp:Label></td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Dose</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lbldoseL" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                    &nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                    <asp:GridView ID="grvLabelClaim" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin: 0 auto;" ClientIDMode="Static" Width="98%" BorderStyle="Solid" Font-Strikeout="False">
                        <HeaderStyle BackColor="#CCCCCC" BorderColor="Black" Font-Size="Small" ForeColor="Black" />
                        <RowStyle Font-Size="Small" />
                    </asp:GridView>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 98%; font-size: 12px; line-height: 18px; border: 0; margin: 0 auto;">
                        <tbody>
                            <tr>
                                <td style="padding: 12px 5px; border: 1px solid #999; text-align: left; font-size: 14px; font-weight: bold; background-color: #383E4B; color: #fff; -webkit-print-color-adjust: exact;" colspan="4">Patent & Proprietary testing protocol</td>
                            </tr>
                            <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Sr No</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Name Of Test</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Product Result</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Specifications</td>
                            </tr>
                              <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">1.</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">Total Bacterial Count</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR1" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    1*10(5) CFU/gm</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Yeast & Mould</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR2" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    1*10(3) CFU/gm</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    E.coli</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR3" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Absent</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Salminella</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR4" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Absent</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    P.Aeruginosa</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR5" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Absent</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    S.Aureus</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR6" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Absent</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">2.</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Pesticide Residue-Organo-chloro group</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR7" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Less than 1 ppm</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">3.</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Heavy Metals</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPRH" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    &nbsp;</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Lead</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR8" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    10ppm</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Mercury</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR9" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    01ppm</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Arsenic</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR10" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    03ppm</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Cadmium</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR11" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    0.3ppm</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; font-weight: bold;">4.</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    Aflatoxin</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR12" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    B1-0.5 ppb</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    &nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR13" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    G1-0.5 ppb</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    &nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR14" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    B2-0.1 ppb</td>
                            </tr>
                             <tr>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">&nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    &nbsp;</td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; ">
                                    <asp:Label ID="LBLPR15" runat="server"></asp:Label></td>
                                <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left; background-color: #F8F8F8; color: #383E4B; font-weight: bold;">
                                    G2-0.5 ppb</td>
                            </tr>
                        </tbody>
                    </table>
                         <br />
                    <table cellpadding="0" cellspacing="0" style="width: 98%; font-size: 12px; line-height: 18px; margin: 0 auto;">
                        <tr>
                            <td style="padding: 12px 5px; border: 1px solid #999; background-color: #383E4B; color: #fff; font-size: 14px; text-align: left; border-bottom: none; -webkit-print-color-adjust: exact;" colspan="3"><b>List of essential documents (enclosed with the application)</b></td>
                        </tr>
                    </table>
                    
               

                    <asp:GridView ID="GridDocument" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" 
                        CssClass="table table-striped table-bordered" Style="margin: 0 auto;" ClientIDMode="Static" Width="98%" 
                         BorderStyle="Solid" Font-Strikeout="False" OnRowDataBound="grdView_RowDataBound">
                        <HeaderStyle BackColor="#CCCCCC" BorderColor="Black" Font-Size="Small" ForeColor="Black" />
                        <RowStyle Font-Size="Small" />
                    </asp:GridView>
                    <br />
                    <table cellpadding="0" cellspacing="0" width="100%" style="width: 98%; font-size: 12px; margin: 0 auto;">
                        <tr>
                            <td style="padding: 12px 5px; border: 1px solid #999; background-color: #383E4B; color: #fff; font-size: 14px; text-align: left; border-bottom: none;" colspan="3"><b>Action History</b></td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridActionHistory" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin: 0 auto;" ClientIDMode="Static" Width="98%" BorderStyle="Solid" Font-Strikeout="False">
                        <HeaderStyle BackColor="#CCCCCC" BorderColor="Black" Font-Size="Small" ForeColor="Black" />
                        <RowStyle Font-Size="Small" />
                    </asp:GridView>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width: 98%; font-size: 12px; line-height: 18px; margin: 0 auto; border: 0;">
                        <tr>
                            <td style="padding: 12px 5px; border: 1px solid #383E4B; color: #fff; font-size: 14px; font-weight: bold; text-align: left; background-color: #383E4B; border-bottom: none; -webkit-print-color-adjust: exact;" colspan="4">Payment Details</td>
                        </tr>
                        <tr>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%; font-weight: bold;">
                                <asp:Label ID="Label1" runat="server" CssClass="lbl_property" Text="Application Number"></asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="lblTAppID" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%; font-weight: bold;">
                                <asp:Label ID="Label31" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="lblTAppDate" runat="server" Font-Bold="True" CssClass="lbl_value"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: bold;">Transaction ID</td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="lblTrnsID" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%; font-weight: bold;">Transaction Date</td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="lblTrnsDate" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%; font-weight: bold;">
                                <asp:Label ID="TokenNo0" runat="server">Kiosk Name (ID)</asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="lblKiosk" runat="server"></asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%; font-weight: bold;">
                                <asp:Label ID="TokenNo3" runat="server">Kiosk Mobile No.</asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <asp:Label ID="lblKioskMob" runat="server" CssClass="lbl_value"></asp:Label>
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%; font-weight: bold;">Transaction Amount</td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;"><i class="fa fa-rupee"></i>
                                <asp:Label ID="lblAppFee" runat="server"></asp:Label>
                            </td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%; white-space: nowrap; font-weight: bold;">Portal Fee + Service Tax</td>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                <i class="fa fa-rupee"></i>Rs.<asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>+ <i class="fa fa-rupee"></i>
                                <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; font-weight: bold;">Total Amount</td>
                            <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                Rs.<asp:Label ID="lblTotalFee" Font-Bold="True" runat="server"></asp:Label><asp:HiddenField ID="HdfAppId" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </div>
            </div>
        </div>
      
    </form>
</body>
</html>