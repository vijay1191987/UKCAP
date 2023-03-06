<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="DocumentBriefcase.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.DocumentBriefcase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script type="text/javascript">

        function fnNext() {
            var qs = getQueryStrings();
            var appid = qs["AppID"];
            var svcid = qs["SvcID"];
            if (svcid == '386') {
                window.location = "Default.aspx";
            } else {
                window.location = "../Forms/ConfirmPayment.aspx?AppID=" + appid + "&SvcID=" + svcid + "";
            }
        }
        $(document).ready(function () {
            var qs = getQueryStrings();
            var svcid = qs["SvcID"];
            if (svcid == '386') {
                $('#btnNext').val("Submit");
            }
            $("#liBasic").removeClass("active");
            $("#liService").removeClass("active");
            $("#liDetails").removeClass("active");
            $("#liDoc").addClass("active");
            $("#liPayment").removeClass("active");

            $("#step1").addClass("stepfinish");
            $("#step2").addClass("stepfinish");
            $("#step3").addClass("stepfinish");
            $("#step4").addClass("stepactive ");
            $("#step5").addClass("active");
            $("#step6").addClass("active");
            $("#step7").addClass("active");
        });

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

        function SubmitData(DocRowID) {
            //window.opener.document.getElementById('HFDocID').value = DocRowID;
            //window.opener.document.forms[0].submit();
            //self.close();

        }
        function ShowDowload(keyfield) {
            debugger;
            var t_DocBriefcase = window.open('/WebApp/G2G/Download.aspx?a=1&file=' + keyfield, 'DocDowload',
              'height= 500,width= 550,Left=25,top=35,titlebar=no,menubar=no,status=yes,toolbar=no,resizable=no,scrollbars=yes');
            return false;
        }

    </script>
    <style type="text/css">
        .fldupload {
            position: absolute;
            margin: -40px 0 0 8px;
            opacity: 0;
            -ms-filter: 'alpha(opacity=0)';
            direction: ltr;
            cursor: pointer;
        }

        .fldupload {
            width: 120px;
            height: 30px;
        }

        .error {
        }

        .btnUpload {
            color: #fff;
            background-color: #5cb85c;
            border-color: #4cae4c;
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
            content: "\f019";
        }
    </style>
    <style type="text/css">
        .divError {
            font-family: Arial;
            font-size: 20px;
            text-align: center;
            margin: 10px auto;
        }

            .divError img {
                float: left;
                width: 50px;
                margin: 0 20px 0 10px;
            }

            .divError div {
                float: left;
                color: red;
                font-size: .8em;
            }

            .divError h1 {
                float: left;
                margin: 0;
                padding: 0;
                font-size: .9em;
                color: maroon;
            }

        .info, .success, .warning, .error, .validation {
            /*border: 1px solid;*/
            margin: 10px 0px;
            padding: 15px 10px 15px 15px;
            background-repeat: no-repeat;
            background-position: 10px left;
            text-align: left;
            font: 13px Tahoma,sans-serif;
        }

        .success {
            color: #4F8A10;
            background-color: #DFF2BF;
        }

        .error {
            color: #D8000C;
            background-color: #FFBABA;
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
                
                <%----Start of Attachment-----%>
                <%--<div class="row" id="divAtt" runat="server">
					
				</div>--%>
                <%-----End of Attachment------%>

                <%----Start of Attachment-----%>
                <div class="row" id="divSearch" runat="server">
                    <div class="col-md-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title"><i class="fa fa-briefcase fa-fw fa-2x" style="vertical-align: middle;"></i>Document Briefcase</h4>
                            </div>
                        <div class="box-body box-body-open" style="padding: 10px;">
                            <div style="color: darkred; margin-bottom: 5px">
                                <span>Note: Only <b>.Jpeg</b>, <b>.Jpg</b> and <b>.pdf</b> files are allowed to upload ! <br/> File should not be greater than 200 KB ! </span>
                            </div>
                            <div runat="server" class="danger error bg-warning" id="divErr">
                                <div class="divError">
                                    <img src="/WebApp/Images/index.png" />
                                    <h1>Error! Attachment Error.</h1>

                                    <br />
                                    <div>Please Select the file to upload</div>

                                </div>
                            </div>
                            <asp:GridView ID="gvDoc" runat="server" AutoGenerateColumns="False"
                                CssClass="table table-striped table-bordered" OnRowCommand="gvDoc_RowCommand" OnRowCreated="gvDoc_OnRowCreated"
                                OnRowDataBound="gvDoc_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No.">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>.<asp:Label ID="lblIsMandatory" runat="server"
                                                Text="*" ForeColor="Red" Visible="false"> </asp:Label>
                                            <asp:Label ID="IsMandatory" runat="server" Text='<%# Eval("IsMandatory") %>' Visible="true"
                                                ForeColor="Red">*</asp:Label>
                                            <asp:Label ID="lblDocID" runat="server" Text='<%# Eval("DocID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblIsUploaded" runat="server" Text='<%# Eval("IsUploaded") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblRowID" runat="server" Text='<%# Eval("RowID") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DocDesc" HeaderText="Document Description"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Browse File">
                                        <ItemTemplate>
                                            <span class="">
                                                <asp:FileUpload ID="fu" runat="server" class="" ClientIDMode="Static" onchange="this.form.submit();" Height="50px"  />
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Upload" Visible="false">
                                        <ItemTemplate>
                                            
                                            <asp:ImageButton ID="btnUpload" runat="server" ImageUrl="~/WebApp/Kiosk/Images/upload.png" Height="50px" Width="50px" ToolTip="Click to upload the file"
                                                Text="Upload" CommandArgument="<%# Container.DataItemIndex%>" OnClientClick="return ValidateDate();" CommandName="save"></asp:ImageButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="View" HeaderStyle-Width="90px">
                                        <ItemTemplate>                                          
                                            <asp:HyperLink ID="hlMySite" runat="server" ToolTip="Click to download the file" Target="_blank" Visible='<%# Convert.ToBoolean( Eval("IsUploaded")) %>'>
                                                <%--<asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("path") %>' Height="30px" Width="50px" />--%>
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/WebApp/Kiosk/Images/download.png" Height="50px" Width="50px" />
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" Visible="false">
                                        <ItemTemplate>                                            
                                            <asp:ImageButton ID="hlDelete" runat="server" ImageUrl="~/WebApp/Kiosk/Images/delete.png" Height="50px" Width="50px" ToolTip="Click to Remove the file"
                                                Visible='<%# Convert.ToBoolean( Eval("IsUploaded")) %>' Text="Delete" CommandArgument="<%# Container.DataItemIndex%>"
                                                OnCommand="lnkDelete" CommandName="delete"></asp:ImageButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select" Visible="True">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="hlSelect" runat="server" ImageUrl="~/WebApp/Kiosk/Images/upload.png" Height="50px" Width="50px" ToolTip="Click to Select the file"
                                                Visible='<%# Convert.ToBoolean(Eval("IsUploaded")) %>' Text="Select" CommandArgument="<%# Container.DataItemIndex%>" OnClientClick='<%# "return SubmitData(" +Eval("DocID") + ");" %>'
                                                CommandName="select"></asp:ImageButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>                               
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                                
                <%-----End of SearhBasicDetails------%>
                <%---Start of Button----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">

                            <%--<input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" onclick="fnNext();" />--%>
                           <%-- <asp:Button ID="btnNext" runat="server" CausesValidation="True" OnClick="btnNext_Click" ToolTip=" Proceed to Payment"
                                CssClass="btn btn-success" Text="Next =>>" />
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                CssClass="btn btn-danger" PostBackUrl=""
                                Text="Cancel" />--%>
                            <asp:Button ID="btnHome" runat="server" 
                                CssClass="btn btn-primary" PostBackUrl="" ToolTip="Back to Home Page"
                                Text="Home" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%---End of Button----%>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="997" />


</asp:Content>
