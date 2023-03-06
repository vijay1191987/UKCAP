<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportReceipt.aspx.cs" Inherits="CitizenPortal.WebAppUK.Transport.TransportReceipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Charge Receipt</title>
    <script type="text/javascript">
        function CallPrint(strid) {
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
        <div id="divPrint">
            <div style="width: 950px; border: 3px solid #000; padding: 0; font-family: Arial; margin: 0 auto;">
                <table cellpadding="0" cellspacing="0" style="width: 100%; font-size: 12px; line-height: 29px; padding: 0; margin: 0 auto;">
                    <tbody>
                        <tr>
                            <td colspan="2" style="text-align: center; font-size: 20px; background-color: #dbdbdb; padding: 8px; border-bottom: 1px solid #ccc;">सेवा शुल्क प्राप्ति रसीद
                                <br />
                                <b>(User Charges Receipt)</b></td>
                        </tr>
                        <tr>
                            <td style="padding: 8px;"><b>सेवा का नाम (Service Name)</b></td>
                            <td style="padding: 8px;">
                                <asp:Label ID="lblServiceName" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="padding: 8px;"><b>विभाग का नाम (Department Name)</b></td>
                            <td style="padding: 8px;">
                                <asp:Label ID="lblDeptName" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="padding: 8px;"><b>आवेदन संख्या (Application No.)</b></td>
                            <td style="padding: 8px;">
                                <asp:Label ID="lblApplicationNo" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="padding: 8px;"><b>आवेदन तिथि (Application Date)</b></td>
                            <td style="padding: 8px;">
                                <asp:Label ID="lblApplicationDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding: 8px 8px 8px 28px; font-size: 16px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">उपरोक्त विवरण के अनुसार आवेदनकर्त से 20 / रु. सेवा शुल्क प्राप्त किया गया |</td>
                        </tr>
                        <tr>
                            <td style="font-size: 18px; text-align:center; padding: 40px 8px 8px 0px; vertical-align:top;"><b>सेवा शुल्क 20/ रु.</b> </td>
                            <td>
                                <table cellpadding="0" cellspacing="0" style="width: 100%; font-size: 12px; line-height: 29px; padding: 0; margin: 0 auto;">
                                    <tbody>
                                        <tr>
                                            <td colspan="2" style="border-bottom:1px solid #ccc;"><b>केन्द्र का विवरण (Centre Description)</b></td>
                                        </tr>
                                        <tr>
                                            <td>नाम (Name)</td>
                                            <td><asp:Label ID="lblCenterName" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>पता (Address)</td>
                                            <td><asp:Label ID="lblCenterAddress" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>दिनाक (Date)</td>
                                            <td><asp:Label ID="lblCurrentDate" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align:center; border-top:1px solid #ccc; padding-bottom:20px; font-weight:bold;">(हस्ताक्षर एवम मोहर)<br />
                                                (Signature & Stamp)
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div style="text-align: center; margin: 10px auto;">
            <input type="button" id="btnSubmit" style="color: #fff; background-color: #337ab7; border-color: #2e6da4; border: none; border-radius: 2px; padding: 8px; min-width: 120px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
        </div>
    </form>
</body>
</html>
