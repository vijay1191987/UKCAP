<%@ Page Title="" Language="C#"  MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="DashboardV2.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.DashboardV2" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/DesignatedOfficer.ascx" TagPrefix="uc1" TagName="DesignatedOfficer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>
    <script src="../../Scripts/ValidationScript.js"></script>
<%--    <script src="../../Scripts/AddressScript.js"></script>
    <script src="../../Scripts/OfficeOfficer.js"></script>--%>
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


        $(document)
            .ready(function() {

                var prefix = "";
                var Param1 = "";


                


                //$.ajax({
                //    type: "POST",
                //    contentType: "application/json; charset=utf-8",
                //    url: '/WebApp/Citizen/Forms/DashboardV2.aspx/GetDepartmentServiceData',
                //    data: '{"prefix":"' + prefix + '","Param1":"' + Param1 + '"}',
                //    processData: false,
                //    dataType: "json",
                //    success: function(response) {
                //        var arr = eval(response.d);
                //        var html = "";

                //    },
                //    error: function(a, b, c) {
                //        alert("1." + a.responseText);
                //    }
                //});


                $.when(
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: '/WebApp/Citizen/Forms/DashboardV2.aspx/GetDepartmentServiceData',
                            data: '{"prefix":"' + prefix + '","Param1":"' + Param1 + '"}',
                            processData: false,
                            dataType: "json",
                            success: function(response) {

                            },
                            error: function(a, b, c) {
                                result = false;

                            }
                        })
                    )
                    .then(function(data, textStatus, jqXHR) {

                        //var panelStr = "";
                        //var obj = data.d;
                        //panelStr = obj;
                        //$("#pnlServices").append(panelStr);


                        
                        //$("#ulDept").append("<li>Health & Welfare</li>");
                        //$("#ulDept").append("<li title='SOCIAL SECURITY EMPOWERMENT OF PERSON WITH DISSABILITIES DEPARTMENT'>SSEPDD</li>");

                        var panelStr = "";

                        //panelStr = panelStr + "<div>";

                        //panelStr = panelStr + "<div class='box-body box-body-open'>";
                        //panelStr = panelStr + "<div id='parentHorizontalTab'>";

                        //panelStr = panelStr + "<!--vertical Tabs-->";

                        //panelStr = panelStr + "<div id='ChildVerticalTab_1'>";

                        //panelStr = panelStr + "<ul class='resp-tabs-list ver_1'>"; //Start of Side Tabs

                        //panelStr = panelStr + "<li>Health & Welfare</li>";
                        //panelStr = panelStr +
                        //    "<li title='SOCIAL SECURITY EMPOWERMENT OF PERSON WITH DISSABILITIES DEPARTMENT'>SSEPDD</li>";

                        //panelStr = panelStr + "</ul>"; // End of Side Tabs

                        //panelStr = panelStr + "<div class='resp-tabs-container ver_1'>"; //Start of Services Right Panel

                        //panelStr = panelStr + "<div>"; // Start First Tab

                        //panelStr = panelStr + "<div style='min-height:4.66em; z-index:-760;' class='SrvDiv' id='103'>";

                        //panelStr = panelStr +
                        //    "<a href='#' onclick='javascript:return RedirectToService('../Birth/BirthCertificate.aspx?SvcID=103');'>";

                        //panelStr = panelStr +
                        //    "<img src='/webapp/kiosk/Images/odisalogo_1.png' alt='' align='left' style='height: 70px;' />";
                        //panelStr = panelStr + "</a>";
                        //panelStr = panelStr +
                        //    "<a href='#' onclick='javascript:return RedirectToService('../Birth/BirthCertificate.aspx?SvcID=103');'>BIRTH CERTIFICATE</a>";
                        //panelStr = panelStr + "<br />";
                        //panelStr = panelStr + "<span>Revenue Dept. Birth Certificate</span>";

                        //panelStr = panelStr + "</div>";

                        //panelStr = panelStr + "</div>"; //End First Tab

                        //panelStr = panelStr + "<div>"; // Start Second Tab

                        //panelStr = panelStr + "<div style='min-height:4.66em; z-index:-760;' class='SrvDiv' id='105'>";

                        //panelStr = panelStr +
                        //    "<a href='#' onclick='javascript:return RedirectToService('../NFBS/NFBS.aspx?SvcID=105');'>";

                        //panelStr = panelStr +
                        //    "<img src='/webapp/kiosk/Images/odisalogo_1.png' alt='' align='left' style='height: 70px;' />";
                        //panelStr = panelStr + "</a>";
                        //panelStr = panelStr +
                        //    "<a href='#' onclick='javascript:return RedirectToService('../NFBS/NFBS.aspx?SvcID=105');'>NFBS</a>";
                        //panelStr = panelStr + "<br />";
                        //panelStr = panelStr + "<span>National Family Benefit Scheme</span>";

                        //panelStr = panelStr + "</div>"; // End First Service

                        //panelStr = panelStr + "<div style='min-height:4.66em; z-index:-760;' class='SrvDiv' id='106'>";

                        //panelStr = panelStr +
                        //    "<a href='#' onclick='javascript:return RedirectToService('../MBPY/PensionForm.aspx?SvcID=106');'>";

                        //panelStr = panelStr +
                        //    "<img src='/webapp/kiosk/Images/odisalogo_1.png' alt='' align='left' style='height: 70px;' />";
                        //panelStr = panelStr + "</a>";
                        //panelStr = panelStr +
                        //    "<a href='#' onclick='javascript:return RedirectToService('../MBPY/PensionForm.aspx?SvcID=106');'>MBPY</a>";
                        //panelStr = panelStr + "<br />";
                        //panelStr = panelStr + "<span>Madhu Babu Pension Yojana</span>";

                        //panelStr = panelStr + "</div>"; // End Second Service

                        //panelStr = panelStr + "</div>"; // End Second Tab

                        //panelStr = panelStr + "</div>"; //End of Services Right Panel

                        //panelStr = panelStr + "</div>"; //id=ChildVerticalTab_1
                        //panelStr = panelStr + "<div class='clearfix'></div>";
                        //panelStr = panelStr + "</div>"; //id=parentHorizontalTab
                        //panelStr = panelStr + "</div>"; //outer div

                        //$("#pnlServices").append(panelStr);


                        panelStr = panelStr + '<div class="box-body box-body-open">';
                        panelStr = panelStr + '<div id="parentHorizontalTab">';

                        panelStr = panelStr + '<!--vertical Tabs-->';

                        panelStr = panelStr + '<div id="ChildVerticalTab_1">';

                        panelStr = panelStr + '<ul class="resp-tabs-list ver_1">'; //Start of Side Tabs

                        panelStr = panelStr + '<li>Health & Welfare</li>';
                        panelStr = panelStr +
                            '<li title="SOCIAL SECURITY EMPOWERMENT OF PERSON WITH DISSABILITIES DEPARTMENT">SSEPDD</li>';

                        panelStr = panelStr + '</ul>'; // End of Side Tabs

                        panelStr = panelStr + '<div class="resp-tabs-container ver_1">'; //Start of Services Right Panel

                        panelStr = panelStr + '<div>'; // Start First Tab

                        panelStr = panelStr + '<div style="min-height:4.66em; z-index:-760;" class="SrvDiv" id="103">';

                        panelStr = panelStr +
                            '<a href="#" onclick="javascript:return RedirectToService("../Birth/BirthCertificate.aspx?SvcID=103");">';

                        panelStr = panelStr +
                            '<img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />';
                        panelStr = panelStr + '</a>';
                        panelStr = panelStr +
                            '<a href="#" onclick="javascript:return RedirectToService("../Birth/BirthCertificate.aspx?SvcID=103");">BIRTH CERTIFICATE</a>';
                        panelStr = panelStr + '<br />';
                        panelStr = panelStr + '<span>Revenue Dept. Birth Certificate</span>';

                        panelStr = panelStr + '</div>';

                        panelStr = panelStr + '</div>'; //End First Tab

                        panelStr = panelStr + '<div>'; // Start Second Tab

                        panelStr = panelStr + '<div style="min-height:4.66em; z-index:-760;" class="SrvDiv" id="105">';

                        panelStr = panelStr +
                            '<a href="#" onclick="javascript:return RedirectToService("../NFBS/NFBS.aspx?SvcID=105");">';

                        panelStr = panelStr +
                            '<img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />';
                        panelStr = panelStr + '</a>';
                        panelStr = panelStr +
                            '<a href="#" onclick="javascript:return RedirectToService("../NFBS/NFBS.aspx?SvcID=105");">NFBS</a>';
                        panelStr = panelStr + '<br />';
                        panelStr = panelStr + '<span>National Family Benefit Scheme</span>';

                        panelStr = panelStr + '</div>'; // End First Service

                        panelStr = panelStr + '<div style="min-height:4.66em; z-index:-760;" class="SrvDiv" id="106">';

                        panelStr = panelStr +
                            '<a href="#" onclick="javascript:return RedirectToService("../MBPY/PensionForm.aspx?SvcID=106");">';

                        panelStr = panelStr +
                            '<img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />';
                        panelStr = panelStr + '</a>';
                        panelStr = panelStr +
                            '<a href="#" onclick="javascript:return RedirectToService("../MBPY/PensionForm.aspx?SvcID=106");">MBPY</a>';
                        panelStr = panelStr + '<br />';
                        panelStr = panelStr + '<span>Madhu Babu Pension Yojana</span>';

                        panelStr = panelStr + '</div>'; // End Second Service

                        panelStr = panelStr + '</div>'; // End Second Tab

                        panelStr = panelStr + '</div>'; //End of Services Right Panel

                        panelStr = panelStr + '</div>'; //id=ChildVerticalTab_1
                        panelStr = panelStr + '<div class="clearfix"></div>';
                        panelStr = panelStr + '</div>'; //id=parentHorizontalTab
                        panelStr = panelStr + '</div>'; //outer div

                        //$("#pnlServices").append("<link href=\"/WebApp/Styles/easy-responsive-tabs.css\" rel=\"stylesheet\" />");
                        //$("#pnlServices").append(panelStr);

                    }); // end of Then function of main Data Insert Function


        
                

            });

        function RedirectToService(p_URL) {
            debugger;
            
            window.location.href = p_URL + "&UID=" + $("#HFUID").val();
            //alert(p_URL + "&UID=" + $("#HFUID").val());
            return false;
        }


        function RedirectToService_Temp(p_URL) {
            debugger;
            alert('Line1');
            return false;
        }


        /**
 * Forces a reload of all stylesheets by appending a unique query string
 * to each stylesheet URL.
 */
        function reloadStylesheets() {
            var queryString = '?reload=' + new Date().getTime();
            $('link[rel="stylesheet"]').each(function () {
                this.href = this.href.replace(/\?.*|$/, queryString);
            });
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
            padding: 5px !important;
            text-align: center;
            vertical-align: middle !important;
        }
    </style>
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }


         #container {
            width: 100%;
        }

        @media only screen and (max-width: 768px) {
            #container {
                width: 100%;
                margin: 0 auto;
            }
        }

        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 47.1%;
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

        #parentHorizontalTab {
            margin: 0 10px !important;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">

    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
<%--                                <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv">
                    <a href="/WebApp/Kiosk/OISF/OISFHome.aspx">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;"/>
                    </a><a href="/WebApp/Kiosk/OISF/OISFHome.aspx">Recruitment</a>
                    <br/>
                    <span>RECRUITMENT OF CONSTABLES IN 9TH INDIA RESERVE BATTALION (SPECIALISED)</span>
                </div>--%>
                <div class="row" style="display: none">
                    <uc1:FormTitle runat="server" ID="FormTitle" />
                </div>
                <div class="row">
                <asp:Panel ID="pnlMenu" runat="server"></asp:Panel>
                   
                    <!------Upload Doc File------->
                  <%--   <div style="display:block;" id="DivIssueCard" runat="server">
                <div style="min-height: 4.66em; z-index: -760; " class="SrvDiv" id="105">
                    <a href="#" onclick="javascript:return RedirectToService('/WebApp/Kiosk/Forms/CSCUploadDocument.aspx?UID=mohan.kumar&SvcID=424&DPT=101&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/Kiosk/Forms/CSCUploadDocument.aspx?UID=mohan.kumar&SvcID=424&DPT=101&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0" target="_self">Upload Document File</a>
                    <br />
                    <span>Upload all document used in services</span>
                </div>                
            </div>--%>
                </div>
                
                

                <div class="row mt20">
                    <div class="">
                        <%-- Start of Transaction List --%>
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-lg-8">
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

<%--                    <uc1:DesignatedOfficer runat="server" ID="DesignatedOfficer" ClientIDMode="Static" />--%>
                    
                                                
                    
                    
                    <div class="">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading" id="Div4">
                            <h4 class="box-title register-num">Department & Services
                            </h4>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 mt10">
                            <div class="row">
                                <div class="form-group col-lg-4">
                                    <label for="txtSvcName" style="font-weight: normal">
                                        Search Service</label>
                                </div>
                                <div class="form-group col-lg-5">
                                    <asp:TextBox ID="txtSvcName" runat="server" class="form-control" type="text" placeholder="Enter service name to search"></asp:TextBox>
                                </div>
                                <div class="form-group col-lg-3 text-right">                                    
                                    <a class="btn btn-primary" href="#" data-toggle="modal" data-target="#desigOffice"><span>Proceed</span></a>
                                </div>
                            </div>
                        </div>
                        
                            <div>
                                <asp:Panel ID="pnlServices" runat="server" />
                                
                                <%--<div class="box-body box-body-open">
                                    <div id="parentHorizontalTab">
                                        <!--vertical Tabs-->
                                        <div id="ChildVerticalTab_1">
                                            <ul id="ulDept" class="resp-tabs-list ver_1">
                                                
                                            </ul>
                                            <div class="resp-tabs-container ver_1">
                                                <div>
                                                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="103">
                                                        <a href="#" onclick="javascript:return RedirectToService('../Birth/BirthCertificate.aspx?SvcID=103');">
                                                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                        </a><a href="#" onclick="javascript:return RedirectToService('../Birth/BirthCertificate.aspx?SvcID=103');">BIRTH CERTIFICATE</a>
                                                        <br />
                                                        <span>Revenue Dept. Birth Certificate</span>

                                                    </div>
                                                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="104">
                                                        <a href="#" onclick="javascript:return RedirectToService('../Death/DeathForm.aspx?SvcID=104');">
                                                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                        </a><a href="#" onclick="javascript:return RedirectToService('../Death/DeathForm.aspx?SvcID=104');">DEATH CERTIFICATE</a>
                                                        <br />
                                                        <span>Revenue Dept. Death Certificate</span>

                                                    </div>
                                                </div>
                                                <div>
                                                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="105">
                                                        <a href="#" onclick="javascript:return RedirectToService('../NFBS/NFBS.aspx?SvcID=105');">
                                                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                        </a><a href="#" onclick="javascript:return RedirectToService('../NFBS/NFBS.aspx?SvcID=105');">NFBS</a>
                                                        <br />
                                                        <span>National Family Benefit Scheme</span>
                                                    </div>
                                                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="106">
                                                        <a href="#" onclick="javascript:return RedirectToService('../MBPY/PensionForm.aspx?SvcID=106');">
                                                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                        </a><a href="#" onclick="javascript:return RedirectToService('../MBPY/PensionForm.aspx?SvcID=106');">MBPY</a>
                                                        <br />
                                                        <span>Madhu Babu Pension Yojana</span>
                                                    </div>
                                                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="107">
                                                        <a href="#" onclick="javascript:return RedirectToService('../IGNWP/IGNWPForm.aspx?SvcID=107');">
                                                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                        </a><a href="#" onclick="javascript:return RedirectToService('../IGNWP/IGNWPForm.aspx?SvcID=107');">IGNWP</a>
                                                        <br />
                                                        <span>Indira Gandhi National Widow Pension Scheme</span>
                                                    </div>
                                                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="108">
                                                        <a href="#" onclick="javascript:return RedirectToService('../IGNDP/IGNDPForm.aspx?SvcID=108');">
                                                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                        </a><a href="#" onclick="javascript:return RedirectToService('../IGNDP/IGNDPForm.aspx?SvcID=108');">IGNDP</a>
                                                        <br />
                                                        <span>Indira Gandhi National Disabled Pension Scheme</span>
                                                    </div>
                                                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="109">
                                                        <a href="#" onclick="javascript:return RedirectToService('../IGNOAP/IGNOAPForm.aspx?SvcID=109');">
                                                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                        </a><a href="#" onclick="javascript:return RedirectToService('../IGNOAP/IGNOAPForm.aspx?SvcID=109');">IGNOAP</a>
                                                        <br />
                                                        <span>Indira Gandhi National Old Age Pension</span>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="110">
                                                        <a href="#" onclick="javascript:return RedirectToService('../Conversion/ConversionForm.aspx?SvcID=110');">
                                                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                        </a><a href="#" onclick="javascript:return RedirectToService('../Conversion/ConversionForm.aspx?SvcID=110');">Apply for conversion</a>
                                                        <br />
                                                        <span>General Admin. Dpet. (Conversion)</span>

                                                    </div>
                                                </div>
                                                <div>
                                                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="111">
                                                        <a href="#" onclick="javascript:return RedirectToService('../water/Connection.aspx?SvcID=111');">
                                                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                                                        </a><a href="#" onclick="javascript:return RedirectToService('../water/Connection.aspx?SvcID=111');">Water & Sewage Connection</a>
                                                        <br />
                                                        <span>Apply for Water & Sewage Connection</span>

                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>--%>

                            </div>
                        <div>
                           
                        </div>
                    </div>
                </div>


                    <%--  --%>
                    <%--<div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <i class="fa fa-tasks fa-fw"></i>Document List
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="">
                                        <table style="width: 100%" class="table table-striped table-bordered">
                                            <tbody>
                                                <tr>
                                                    <th style="text-align: center;">
                                                        <label class="" for="txtSlNo">
                                                            Sl. No.</label>
                                                    </th>
                                                    <th style="text-align: center;">
                                                        <label class="" for="">
                                                            Document Description</label>
                                                    </th>
                                                    <th style="text-align: center;">
                                                        <label for="">
                                                            Service</label>
                                                    </th>
                                                    <th style="text-align: center; width: 190px">
                                                        <label for="txtContact">
                                                            Uploaded Date</label>
                                                    </th>
                                                    <th style="text-align: center;">
                                                        <label class="" for="txtRemark">
                                                            View</label>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;" colspan="5">No Document Uploaded
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <asp:GridView ID="grdDoc" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered">
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>

                    </div>--%>
                    <%--  --%>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" />
    <asp:HiddenField ID="HFUID" runat="server" />

    <link href="/WebApp/Styles/easy-responsive-tabs.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/easyResponsiveTabs.js"></script>

     <!--Plug-in Initialisation-->
    <script type="text/javascript">
        $(document).ready(function () {
            //Horizontal Tab
            $('#parentHorizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true, // 100% fit in a container
                tabidentify: 'hor_1', // The tab groups identifier
                activate: function (event) { // Callback function if tab is switched
                    var $tab = $(this);
                    var $info = $('#nested-tabInfo');
                    var $name = $('span', $info);
                    $name.text($tab.text());
                    $info.show();
                }
            });

            // Child Tab
            $('#ChildVerticalTab_1').easyResponsiveTabs({
                type: 'vertical',
                width: 'auto',
                fit: true,
                tabidentify: 'ver_1', // The tab groups identifier
                activetab_bg: '#fff', // background color for active tabs in this group
                inactive_bg: '#F5F5F5', // background color for inactive tabs in this group
                active_border_color: '#c1c1c1', // border color for active tabs heads in this group
                active_content_border_color: '#5AB1D0' // border color for active tabs contect in this group so that it matches the tab head border
            });

            //Vertical Tab
            $('#parentVerticalTab').easyResponsiveTabs({
                type: 'vertical', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true, // 100% fit in a container
                closed: 'accordion', // Start closed if in accordion view
                tabidentify: 'hor_1', // The tab groups identifier
                activate: function (event) { // Callback function if tab is switched
                    var $tab = $(this);
                    var $info = $('#nested-tabInfo2');
                    var $name = $('span', $info);
                    $name.text($tab.text());
                    $info.show();
                }
            });
        });
    </script>
   

</asp:Content>
