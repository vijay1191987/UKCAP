<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.Dashboard" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/DesignatedOfficer.ascx" TagPrefix="uc1" TagName="DesignatedOfficer" %>
<%--<%@ Register Src="~/WebAppUK/controls/adminleftpanel.ascx" TagPrefix="uc1" TagName="adminleftpanel" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>
    <script src="../../Scripts/ValidationScript.js"></script>
    <script src="../../Scripts/AddressScript.js"></script>
    <script src="../../Scripts/OfficeOfficer.js"></script>
    <script>
        var baseUrl = "<%= Page.ResolveUrl("~/") %>";
        function RedirecteKYC(p_URL) {
            debugger;
            window.location.href = p_URL + "?UID=" + $("#HFUID").val();
            //alert(p_URL + "&UID=" + $("#HFUID").val());
            return false;
        }
        function ResolveUrl(url) {
            if (url.indexOf("~/") == 0) {
                url = baseUrl + url.substring(2);
            }
            return url;
        }
        function ViewDoc(p_URL, p_ServiceID, p_AppID) {
            //var t_URL = ResolveUrl(p_URL);
            if (p_ServiceID == '101') {
                var t_URL = "../Common/HTML2PDF/HTMLToPdf.aspx";
            } else if (p_ServiceID == '103')
            { var t_URL = "../Kiosk/Birth/Preview.aspx"; }
            else if (p_ServiceID == '104') {
                var t_URL = "../Kiosk/Death/Preview.aspx";
            }
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            window.open(t_URL, 'ViewDoc', 'titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
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

        function RedirectToPage(p_Page) {
            var qs = getQueryStrings();
            var UID = qs["UID"];

            if (p_Page == "1") {
                //View/Edit Profile
                t_URL = "" + "?UID=" + UID;

            }
            else if (p_Page == "2") {
                //View Briefcase
                t_URL = "CitizenBriefcase.aspx" + "?UID=" + UID;

            }
            else if (p_Page == "3") {
                //Apply for Service
                t_URL = "" + "?UID=" + UID;

            }
            else if (p_Page == "4") {
                //View Transactions
                t_URL = "" + "?UID=" + UID;

            }


            //window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            window.location.href = t_URL;

        }

        function TakeAction(p_ServiceID, p_AppID, p_PaymentStatus, p_AckURL) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Kiosk/Forms/AppRedirect.aspx";

            var qs = getQueryStrings();
            var UID = qs["UID"];

            //if (p_PaymentStatus == "P") {
            if (p_AckURL != "") {

                t_URL = p_AckURL;
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID;
                window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');

            }
            else {
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID;
                //window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
                window.location.href = t_URL;

            }

            return false;
        }
    </script>
    <style type="text/css">
        .fldupload {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            opacity: 0;
            -ms-filter: 'alpha(opacity=0)';
            font-size: 200px !important;
            direction: ltr;
            cursor: pointer;
        }

        .fldupload {
            width: 100px;
            height: 30px;
        }
        /*.pagination {
            font-size:12px;
        margin: 10px;
padding: 5px;}
            .pagination label {display: inline-block;padding-top:4px;
            }*/
        .pagination {
            border: 0;
            margin: 0;
        }

            .pagination > li > a, .pagination > li > span {
                padding: 2px 5px;
            }

        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
        }

        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 32.1%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #000;
                font-size: .9em;
                text-decoration: none;
                font-weight: bold;
            }

                .SrvDiv a:hover {
                    color: #5AB1D0;
                    font-size: .9em;
                    text-decoration: none;
                    font-weight: bolder;
                }

            .SrvDiv img {
                margin-right: 10px;
                border: none;
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 10px 0 0 0;
                color: #767676;
                font-size: .65em;
            }

        .table > tbody > tr > th {
            padding: 8px 18px !important;
            text-align: left;
            vertical-align: middle !important;
        }
    </style>
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <div class="row" style="display: none">
                    <uc1:FormTitle runat="server" ID="FormTitle" />
                </div>
                <%--<div class="row">
                <asp:Panel ID="pnlMenu" runat="server"></asp:Panel>
                </div>--%>
                
                

                <div class="container-fluid mt20">
                    <div class="row">
                        <%-- Start of Transaction List --%>
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading" style="background-color: #37495f; border: 1px solid #37495f; color:#fff;">
                                    <div class="row">
                                        <div class="col-lg-8" style="font-size:18px;">
                                            <i class="fa fa-tasks fa-fw"></i>Transaction Details
                                        </div>
                                        <div class="col-lg-4 text-right">
                                            <div class="dataTables_filter" id="dataTables-example_filter">
                                                <input aria-controls="dataTables-example" placeholder="Search" class="form-control input-sm" type="search" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="dataTable_wrapper">
                                        <div class="dataTables_wrapper form-inline dt-bootstrap no-footer" id="dataTables-example_wrapper">
                                            <div class="">
                                                <div class="" style="overflow: scroll; height: 200px;">
                                                    <asp:GridView ID="gridview" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound">
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            <div class="row" style="display: none;">
                                                <div class="col-sm-6">
                                                    <div aria-live="polite" role="status" id="dataTables-example_info" class="dataTables_info">Showing 1 to 10 of 57 entries</div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div id="dataTables-example_paginate" class="dataTables_paginate paging_simple_numbers">
                                                        <ul class="pagination">
                                                            <li id="dataTables-example_previous" tabindex="0" aria-controls="dataTables-example" class="paginate_button previous disabled"><a href="#">Previous</a></li>
                                                            <li tabindex="0" aria-controls="dataTables-example" class="paginate_button active"><a href="#">1</a></li>
                                                            <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">2</a></li>
                                                            <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">3</a></li>
                                                            <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">4</a></li>
                                                            <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">5</a></li>
                                                            <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">6</a></li>
                                                            <li id="dataTables-example_next" tabindex="0" aria-controls="dataTables-example" class="paginate_button next"><a href="#">Next</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <%--- End of Transaction List ---%>
                    </div>

                    <uc1:DesignatedOfficer runat="server" ID="DesignatedOfficer" ClientIDMode="Static" />

                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" />

</asp:Content>
