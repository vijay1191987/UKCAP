<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutputForRentDeed.aspx.cs" Inherits="CitizenPortal.WebAppUK.Deeds.OutputForRentDeed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Output For Rent Deed</title>
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

        .indnt20 {
            text-indent: 20px;
        }
        form label {font-weight:bold}
    </style>
    <script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="../js/bootbox.min.js"></script>
    <script type="text/javascript"  src="OutputForRentDeed.js"></script>
    <style type="text/css">
        form label {
    font-weight: bold;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divPrint" style="margin: 0 auto; width: 750px; height: 550px; overflow-y: scroll;">
            <table style="margin-top: 2px; padding: 10px; border: dashed 1px #ccc; line-height: 24px; font-family: Arial; font-size: 14px;">
                <tbody>
                    <tr>
                        <td style="text-align: center; text-decoration: underline; padding: 15px 0;"><b>DEED OF RENT</b></td>
                    </tr>
                    <tr>
                        <td>
                            <p class="indnt20">
                                THIS This Deed of Rent is made at
                                <label id="txtDeedPlace"></label>
                                , this<label id="txtDeedDate"></label>effective from
                                <label id="txtLandlordName"></label>
                                between
                                <label id="txtTenantName"></label>
                                aged Years residing at
                                <label id="txtOwnerFullAddrs"></label>
                                . hereinafter called the <b>HOUSE OWNER</b> of the <b>ONE PART</b> and
                                <label id="txtTenantFullAddrs"></label>
                                aged
                                <label id="txttenantage"></label>
                                Years residing at
                                <label id="txttenantPermanetAddrs"></label>
                                . hereinafter called the <b>TENANT</b> of the <b>OTHER PART,</b> the terms the House owner and the Tenant whereever they may occur, unless found repugnant to the context hereinafter shall mean and include themselves and their respective heirs witnesseth as follows:-
                            </p>
                            <p>
                                WHEREAS the House owner is the sole absolute owner of
                                <label id="txtTenantRentPlaceAddr"></label>
                            </p>
                            <p>
                                WHEREAS the tenant has applied to the Houseowner for grant of tenancy on to him of the
                                <label id="txtRentcity"></label>
                                situated at the above address for living accommodation.
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>NOW THIS DEEDS OF TENANCY WITHNESSETH THE FOLLOWING:-:</b></p>
                            <ol>
                                <li>That the Tenancy shall be initially for the period of
                                    <label id="txtPeriodOfRent"></label>
                                    with effect from<label id="txtRentPayableDatePM"></label>and may be renewed from time to time with mutual consent of both the House owner and the Tenant.</li>

                                <li>That the rent payable by the Tenant to the House owner or his Authorized person, in respect of the said premises, shall be Rs
                                    <label id="txtTotalRentAmntPM"></label>
                                    /- (<label id="txtTotalRentAmntInWordsPM"></label>
                                    only) per month which shall be payable on or before
                                    <label id="txtRentPayableGraceDatePM"></label>
                                    <sup>th</sup> of every succeeding month in addition to the above mentioned immovable property maintenance charges payable to
                                    <label id="txtMaintenanceChargePM"></label>
                                    Association by the Tenant every month.</li>

                                <li>That the Tenant has paid a sum of Rs.
                                    <label id="txtSecurityAmnt"></label>
                                    /- (Rupees
                                    <label id="txtSecurityAmntInWords"></label>
                                    only) as interest free rent advance, the receipt of which is hereby acknowledge by the houseowner by these presents. This advance amount shall be returned to the tenant by the houseowner at the time of vacating the said premises after adjusting the dues such as rent, water charge, maintenance charges and electricity dues, apart from cost of damages if any.</li>

                                <li>That the said house premises have a separate normal three phase household electricity connection and the tenant shall pay the electricity charges to the Electricity Board as per the meter Reading noted in the card.</li>

                                <li>That the Corporation Property tax and water and sewerage tax shall be payable by the house owner but the tenant shall pay the water consumption charges periodically and likewise any running charges consequent to the usage/consumption by the Tenant shall be payable by the tenant.</li>

                                <li>That the fittings and fixtures in the house owner premises are in good condition and the tenant return the same to the house owner in good condition excepting normal wear and tear before vacating the house premises and actual cost of damages if any, shall be reimbursable by the tenant to the house owner.</li>

                                <li>That the tenant has agreed to ensure "minimum stay" for a period of six months. The tenant has agreed to give two months notice before vacating the house. Incase of shorter notice the tenant has agreed to pay two months rent to the houseowner. The Houseowner as agreed to give two months notice to the tenant which period does not consider the "minimum stay" period clause.</li>

                                <li>That the tenant shall not sublease or sublet either the entire or any part of the tenanted house premises. The tenanted house premises shall be used only for living purpose of the tenant and his family not for any other commercial or illegal purposes.</li>

                                <li>That the tenant has agreed to keep the house premises clean and in hygienic condition including the surrounding areas and the tenant has agreed not to do any action that would cause permanent / structural damages / changes  without obtaining prior consent from the owner on impact and costs.</li>
                                <li>That the houseonwer shall be at liberty to inspect to the house premises by him self and or by any other authorized person(s) as and when necessary.</li>
                                <li>That the tenanat has agreed not to keep any pet animals in the house premises.</li>
                                <li>
                                    <label id="txtPremises"></label>
                                </li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>IN WITNESS WHERE OF</b>, both the parties have put their hands and signed on the day month and year above written.
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Witness</p>
                            <p>
                                <label id="txtWitness1Name"></label>
                            </p>
                            <p>
                                <label id="txtWitness2Name"></label>
                            </p>
                        </td>
                        <td>
                            <p>
                                House Owner
                                <label id="txtOwnersignature"></label>
                            </p>
                            <p>
                                Tenant
                                <label id="txtTenantsignature"></label>
                            </p>
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
        <div style="margin: 0 auto; width: 750px; height: 550px; text-align: center;">
            <input id="btnClose" type="button" value="Close" style="margin-top: 15px; color: #fff; background-color: #d9534f; border-color: #d43f3a; border: none; padding: 10px; border-radius: 2px;" />
            <input id="btnSubmit" type="button"  value="Print" style="margin-top: 15px; color: #fff; background-color: #d9534f; border-color: #d43f3a; border: none; padding: 10px; border-radius: 2px;" onclick="javascript: CallPrint('divPrint');"" />
             </div>
    </form>
</body>
</html>
