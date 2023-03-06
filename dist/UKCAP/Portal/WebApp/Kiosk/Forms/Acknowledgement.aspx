<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.Acknowledgement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>

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

        $(document).ready(function ()
        {
            var t_URL = "";
            var t_AppID = "", t_ServiceID = "";
            t_AppID = $("#HFAppID").val();
            t_ServiceID = $("#HFServiceID").val();

            //t_URL = "../Kiosk/Forms/SeniorCitizenPramaanapatra.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            if (t_ServiceID == '101')
            {
                t_URL = "../Common/HTML2PDF/HTMLToPDF.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            } else if (t_ServiceID == '103')
            { t_URL = "../Kiosk/Birth/Preview.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID; }
            else if (t_ServiceID == '104')
            {
                t_URL = "../Kiosk/Death/Preview.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            }
            else if (t_ServiceID == '105')
            {
                t_URL = "../NFBS/Acknowledgement.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            }
            else if (t_ServiceID == '106')
            {
                t_URL = "../MBPY/Acknowledgement.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            }
            //t_URL = "../Common/HTML2PDF/HTMLToPDF.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            loadIframe("FrameURL", t_URL);
        });

        function loadIframe(iframeName, url)
        {
            var $iframe = $('#' + iframeName);
            if ($iframe.length)
            {
                $iframe.attr('src', url);
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-md-12 box-container mTop5">
                <div class="box-heading">
                    <h4 class="box-title register-num" runat="server" id="SvcName">Application Acknowledgment</h4>
                </div>
                <div class="box-body box-body-open">
                    <iframe id="AckURL" scrolling="yes" width="100%" runat="server" src="" height="1234" frameborder="0"></iframe>
                </div>
            </div>
        </div>
        <%---Start of Button----%>
        <div class="row" style="display:none">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input type="button" id="btnPrint" class="btn btn-primary" value="Print" onclick="javascript: CallPrint('AckURL');" />
                    <a href="DashboardChart.aspx" class="btn btn-success">Home</a>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <%----END of Button-----%>
    </div>
    <asp:HiddenField ID="HFAppID" runat="server" />
    <asp:HiddenField ID="HFServiceID" runat="server" />
</asp:Content>
