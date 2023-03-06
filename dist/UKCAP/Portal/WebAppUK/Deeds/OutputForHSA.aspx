<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutputForHSA.aspx.cs" Inherits="CitizenPortal.WebAppUK.Deeds.OutputForHSA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>House For Sale Agreement</title>
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
    <style type="text/css">
        .pleft10 {
            padding-left: 10px !important;
        }

        .indnt50 {
            text-indent: 50px;
        }
        form label {
    font-weight: bold;
}
        
    </style>
    <script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="../js/bootbox.min.js"></script>
    <script type="text/javascript" src="OutputForHSA.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divPrint" style="margin: 0 auto; width: 750px; height: 550px; overflow-y: scroll;">
            <table style="margin-top: 2px; padding: 10px; border: dashed 1px #ccc; line-height: 20px; font-family: Arial; font-size: 14px;">
                <tbody>
                    <tr>
                        <td style="text-align: center; text-decoration: underline; padding: 15px 0;"><b>AGREEMENT FOR SALE OF A HOUSE</b></td>
                    </tr>
                    <tr>

                        <td>
                            <p class="indnt20">
                            THIS AGREEMENT of sale made at
                            <label id="txtAgreementPlace"></label>
                            on this 
                            <label id="txtAgreementDate"></label>
                            day of<label id="saleday"></label>
                            2017 , between
                            <label id="txtVendorName"></label>
                            resident of
                            <label id="txtVendorRentPlace"></label>
                            hereinafter 
called the vendor of the ONE PART and
                            <label id="txtVendeeName"></label>
                            resident of
                            <label id="txtVendeeRentPlace"></label>
                            hereinafter called the BUYER of the OTHERPART.
                            </p>
                            <p class="indnt50">WHEREAS the vendor is absolutely seized and possessed of or well and sufficiently entitled to the house more fully described in the Schedule hereunder:</p>
                            <p class="indnt50">AND WHEREAS the vendor has agreed to sell his house to the BUYER on the terms and conditions hereafter set-forth.</p>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>NOW THIS AGREEMENT WITNESSTH AS FOLLOWS:</b></p>
                            <ol>
                                <li>The vendor will sell and the BUYER will buy that entire house No. <label id="txtSaleHouseFullAddress"></label> Landmark <label id="txtSaleHouseLandmark"></label> more particularly described in the Schedule hereunder written at a price of Rs <label id="txtTotalSaleAmount"></label> free from all encumbrances.</li>

                                <li>The BUYER has paid a sum of Rs . <label id="txtAdvanceAmountInNumber"></label> as earnest money on . <label id="txtAdvancePaidDate"></label> .the receipt of which sum,( the Vendor hereby acknowledges) and the balance amount of consideration  will  be paid at the time of execution of conveyance deed.</li>
                                <li>The sale shall be completed within a period of <label id="txtSaleCompletionMonth"></label> months from this date and it is hereby agreed that time is the essence of the contract.</li>
                                <li>The Vendor shall submit the title deeds of the house in his possession or power to the BUYER’s advocate within one week from the date of his investigation of title and the BUYER will intimate about his advocate ‘s report within <label class="txtAdvocateIntimationPeriod"></label> days after delivery of title deeds to his advocate.</li>
                                <li>If the BUYER’s Advocate gives the report that the Vendor ‘s  title is not clear, the Vendor shall refund the earnest money, without interest to the BUYER within <label id="txtRefuhndDays"></label> days from the date of intimation about the advocate’s report by the BUYER if the Vendor does not refund the earnest money within <label class="txtAdvocateIntimationPeriod"></label> days  from the date of intimation about the advocate’s report , the Vendor will be liable to pay interest @<label id="txtRateOfInterest"></label> p.m. up to the date of repayment of earnest money.</li>
                                <li>The Vendor declares that that sale of the house will be without encumbrances.</li>
                                <li>The Vendor will hand over the vacant possession of the house on the execution and registration of conveyance deed.</li>
                                <li>If the BUYER commits breach of the agreement, the vendor shall be entitled to forfeit the earnest money paid by the purchaser to the vendor and vendor will be at liberty to resell the property to the person.</li>
                                <li>It the Vendor commits breach of the agreement, he shall be liable to refund earnest money,  
                                    received by him and a sum of Rs <label id="txtRefundAmount"></label> by way of liquidated damages.</li>
                                <li>The Vendor shall execute the conveyance deed in favour of the purchaser or his nominee as the purchaser may require, on receipt of <label id="txtRecieptAmount"></label> the balance consideration.</li>
                                <li>The vendor shall at his own costs obtain clearance certificate under Income tax Act, 1961
                                    and other permission required for the completion of the sale.</li>
                            </ol>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div style="page-break-after:always;"></div>
        </div>
      
        <div style="margin: 0 auto; width: 750px; height: 550px; text-align: center;">
            <input id="btnClose" type="button" value="Close" style="margin-top: 15px; color: #fff; background-color: #d9534f; border-color: #d43f3a; border: none; padding: 10px; border-radius: 2px;" />
            <input id="btnSubmit" type="button"  value="Print" style="margin-top: 15px; color: #fff; background-color: #d9534f; border-color: #d43f3a; border: none; padding: 10px; border-radius: 2px;" onclick="javascript: CallPrint('divPrint');"" />
        </div>
         
    </form>
</body>
</html>
