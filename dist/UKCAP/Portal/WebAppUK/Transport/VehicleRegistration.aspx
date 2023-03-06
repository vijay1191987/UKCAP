<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="VehicleRegistration.aspx.cs" Inherits="CitizenPortal.WebAppUK.Transport.VehicleRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/WebAppUK/css/style.admin.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebAppUK/Transport/Transport.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="container-fluid">
             <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2 class="form-heading" style="margin: 15px auto;"><i class="fa fa-pencil-square-o fa-fw"></i>Vehicle Registration</h2>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Basic Information</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory ">Purpose Code</label>
                               <select class="form-control" id="pur_cd" runat="server">
                               <%--<option value="0">-Select-</option>
                                   <option value="950">Transfer of Ownership</option>
                                   <option value="950">Duplicate Registration Certificate</option>
                                   <option value="950">Change of Address</option>
                                   <option value="950">Hypothecation Addition</option>
                                   <option value="950">Hypothecation Termination</option>
                                   <option value="951">Check Pending Transaction</option>
                                   <option value="2">Fitness of Vehicle</option>
                                   <option value="9">NOC Of Vehicle</option>
                                   <option value="11">Conversion of Vehicle</option>
                                   <option value="14">Duplicate Fitness</option>
                                   <option value="15">Renewal of Registration</option>
                                   <option value="16">Alternation of Vehicle</option>
                                   <option value="58">Payment of Road Tax</option>--%>
                               </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory ">Registration Number</label>
                                <input type="text" maxlength="30" style="text-transform:uppercase" id="regn_no" runat="server" placeholder="Registration No" class="form-control" />
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory ">Chasis Number</label>
                                <input type="text" maxlength="30" id="chassi_no" runat="server" placeholder="Chasis No." class="form-control" />
                            </div>
                        </div>
                         <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory ">Mobile Number</label>
                                <input type="text" maxlength="30" id="mobile_no" runat="server" placeholder="Mobile No" class="form-control" />
                            </div>
                        </div>
                        
                        <div class="clearfix"></div>
                        </div>
                </div>

             <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                 <input type="button" class="btn btn-success" value="Submit" onclick="SubmitTData();" />
                 <input type="button" class="btn btn-primary" value="Reset" onclick="Reset();" />
                 <input type="button" class="btn btn-danger" value="Cancel" onclick="ReturnSubmit();" />
             </div>
        </div>
         </div>
</asp:Content>
