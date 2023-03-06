<%@ Page Title="" Language="C#" MasterPageFile="~/WebAppUK/master/UKAdmin.Master" AutoEventWireup="true" CodeBehind="AttachmentV2.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.AttachmentV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            var qs = getQueryStrings();
            var svcid = qs["svcid"];
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

        function fnNext() {
            debugger;
            var qs = getQueryStrings();
            var appid = qs["AppID"];
            var svcid = qs["SvcID"];
            if (svcid == '386') {
                window.location = "Default.aspx";
            } else {
                window.location = "../Forms/ConfirmPayment.aspx?AppID=" + appid + "&SvcID=" + svcid + "";
            }
        }

        function getQueryStrings() {
            var assoc = {};
            var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
            var queryString = location.search.substring(1).toLowerCase();
            var keyValues = queryString.split('&');

            for (var i in keyValues) {
                var key = keyValues[i].split('=');
                if (key.length > 1) {
                    assoc[decode(key[0])] = decode(key[1]);
                }
            }

            return assoc;
        }

        function ValidateDate() {

        }

        function EnableBriefcase(option, RowIndex, DocID) {
            var id = 'btnSelect_' + RowIndex;
            //alert(option);
            if (option == "Yes") {
                $('#' + id).prop("disabled", false);
                $('#' + id).bind("click", function () {
                    //alert(DocID);
                    return ShowDocumentBriefcase(DocID);
                });

            } else {
                $('#' + id).prop("disabled", true);
            }

            return false;
        }


        function ShowDocumentBriefcase(DocID) {
            var qs = getQueryStrings();
            var appid = qs["AppID"];
            var svcid = qs["SvcID"];
            var ProfileId = '';
            var AppType = '';
            var DocMapID = DocID;
            //alert(DocID);
            var t_DocBriefcase = window.open('/WebApp/Kiosk/Forms/DocumentBriefcasev2.aspx?A=1&SvcID=' + svcid + '&AppID=' + appid + '&DocID=' + DocID, 'DocBriefcase',
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
                <%----Start of Attachment-----%>
                <div class="row" id="divSearch" runat="server">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num"><i class="fa fa fa-cloud-upload fa-fw fa-2x" style="vertical-align: middle;"></i>Upload Supporting Document</h4>
                        </div>
                        <div class="box-body box-body-open" style="padding: 10px;">
                            <div style="color: darkred; margin-bottom: 5px">
                                <span>Note: Only <b>.Jpeg</b>, <b>.Jpg</b> and <b>.pdf</b> files are allowed to upload !
                                    <br />
                                    File should not be greater than 200 KB ! </span>
                            </div>
                            <div runat="server" class="danger error bg-warning" id="divErr">
                                <div class="divError">
                                    <img src="../Images/index.png" />
                                    <h1>Error! Attachment Error.</h1>
                                    <br />
                                    <div>Please Select the file to upload</div>
                                </div>
                            </div>
                            <asp:GridView ID="gvDoc" runat="server" AutoGenerateColumns="False"
                                CssClass="table table-striped table-bordered" OnRowCommand="gvDoc_RowCommand"
                                OnRowDataBound="gvDoc_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No.">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>.<asp:Label ID="lblIsMandatory" runat="server"
                                                Text="*" ForeColor="Red" Visible="false"> </asp:Label>
                                            <asp:Label ID="IsMandatory" runat="server" Text='<%# Eval("IsMandatory") %>' Visible="true"
                                                ForeColor="Red">*</asp:Label>
                                            <asp:Label ID="lblDocID" runat="server" Text='<%# Eval("DocID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblAutoDocid" runat="server" Text='' Visible="false"></asp:Label>
                                          
                                              <asp:Label ID="lblIsUploaded" runat="server" Text='<%# Eval("IsUploaded") %>' Visible="false"></asp:Label>
                                            <asp:HiddenField ID="HFDocID" runat="server" Value='<%# Eval("DocID") %>' />
                                            <asp:HiddenField ID="hdnDocName" runat="server" Value='<%# Eval("DocName") %>' />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DocDesc" HeaderText="Document Description"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Select from Briefcase" Visible="false">
                                        <%--<ItemTemplate>
											<span class="btn btn-success fileinput-button">
												<i class="fa- fa-plus-"></i>
												<img src="../Images/add.png" width="35"></img>
												<span>Add files...</span> 
												<asp:FileUpload ID="fu" runat="server" class="fldupload" />
											</span>--%>
                                        <ItemTemplate>
                                            <span class="">
                                                <%--<img src="../Images/add.png" style="width:50px;height:50px"></img>
												<span>Add files...</span> --%>
                                                <asp:RadioButton ID="rbtDocYes" runat="server" GroupName="grpDoc" />
                                                Yes
                            <asp:RadioButton ID="rbtDocNo" runat="server" GroupName="grpDoc" />
                                                No
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select from Briefcase">
                                        <%--<ItemTemplate>
											<span class="btn btn-success fileinput-button">
												<i class="fa- fa-plus-"></i>
												<img src="../Images/add.png" width="35"></img>
												<span>Add files...</span> 
												<asp:FileUpload ID="fu" runat="server" class="fldupload" />
											</span>--%>
                                        <ItemTemplate>
                                            <span class="">
                                                <%--<img src="../Images/add.png" style="width:50px;height:50px"></img>
												<span>Add files...</span> --%>
                                                <%--<asp:ImageButton ID="btnSelect" runat="server" ImageUrl="~/WebApp/Kiosk/Images/upload.png" Height="50px" Width="50px" ToolTip="Click to select the file"
                                                    Text="Select" CommandArgument="<%# Container.DataItemIndex%>" CommandName="select"></asp:ImageButton>--%>
                                                <a id="btnSelect" runat="server" title="Select"><img src="/WebApp/Kiosk/Images/upload.png" style="width:50px;height:50px"></img></a>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Browse File">
                                        <%--<ItemTemplate>
											<span class="btn btn-success fileinput-button">
												<i class="fa- fa-plus-"></i>
												<img src="../Images/add.png" width="35"></img>
												<span>Add files...</span> 
												<asp:FileUpload ID="fu" runat="server" class="fldupload" />
											</span>--%>
                                        <ItemTemplate>
                                            <span class="">
                                                <%--<img src="../Images/add.png" style="width:50px;height:50px"></img>
												<span>Add files...</span> --%>
                                                <asp:FileUpload ID="fu" runat="server" class="" ClientIDMode="Static" onchange="this.form.submit();" Height="50px" />
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Upload" Visible="false">
                                        <ItemTemplate>
                                            <%--<asp:ImageButton ID="btnUpload" runat="server" Text="Upload" CssClass="btn" OnClientClick="return ValidateDate();"
												CommandArgument="<%# Container.DataItemIndex%>" CommandName="save" />--%>
                                            <%--<span class="btn btn-dark">
												<i class="fa fa-upload"></i>
												<span>Upload</span>
												<asp:ImageButton ID="btnUpload" runat="server"
												   Visible='<%# Convert.ToBoolean( Eval("IsUploaded")) %>' Text="Upload" CommandArgument="<%# Container.DataItemIndex%>" OnClientClick="return ValidateDate();" CommandName="save"></asp:ImageButton>
											</span>--%>
                                            <asp:ImageButton ID="btnUpload" runat="server" ImageUrl="~/WebApp/Kiosk/Images/upload.png" Height="50px" Width="50px" ToolTip="Click to upload the file"
                                                Text="Upload" CommandArgument="<%# Container.DataItemIndex%>" CommandName="save"></asp:ImageButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="View" HeaderStyle-Width="90px">
                                        <ItemTemplate>
                                            <%--<span class="btn btn-primary">
												<i class="fa fa-download"></i>
												<span>Download</span>
												<asp:HyperLink ID="hlMySite" runat="server" class="btn" 
													NavigateUrl='<%# Eval("Path") %>' Target="_blank" Visible='<%# Convert.ToBoolean( Eval("IsUploaded")) %>'
													Text="Download">
												</asp:HyperLink>
											</span>--%>
                                            <asp:HyperLink ID="hlMySite" runat="server" ToolTip="Click to download the file"
                                                NavigateUrl='<%# Eval("Path") %>' Target="_blank" Visible='<%# Convert.ToBoolean( Eval("IsUploaded")) %>'
                                                Text="Download"> <img src="../Images/download.png" style="width:50px;height:50px"></img></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" Visible="false">
                                        <ItemTemplate>
                                            <%--<span class="btn btn-danger delete">
												<i class="fa fa-trash"></i>
												<span>Delete</span>
												<asp:ImageButton ID="hlDelete" runat="server" ImageUrl="/Quick Links/FDA/Images/Cancel.png" CssClass="btn btn-danger delete fa fa-trash"
													Visible='<%# Convert.ToBoolean( Eval("IsUploaded")) %>' Text="Delete" CommandArgument="<%# Container.DataItemIndex%>"
													OnCommand="lnkDelete" CommandName="delete"></asp:ImageButton>
											</span>--%>
                                            <%--<asp:ImageButton ID="hlDelete" runat="server" ImageUrl="" CssClass="btn btn-danger delete fa fa-trash"
												Visible='<%# Convert.ToBoolean( Eval("IsUploaded")) %>' Text="Delete" CommandArgument="<%# Container.DataItemIndex%>"
												OnCommand="lnkDelete" CommandName="delete"> </asp:ImageButton>--%>
                                            <asp:ImageButton ID="hlDelete" runat="server" ImageUrl="~/WebApp/Kiosk/Images/delete.png" Height="50px" Width="50px" ToolTip="Click to Remove the file"
                                                Visible='<%# Convert.ToBoolean( Eval("IsUploaded")) %>' Text="Delete" CommandArgument="<%# Container.DataItemIndex%>"
                                                OnCommand="lnkDelete" CommandName="delete"></asp:ImageButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <%--<EditRowStyle BackColor="#7C6F57" />
								<FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
								<HeaderStyle BackColor="#e8f4da" Font-Bold="True" ForeColor="Black" BorderColor="Gray"
									BorderStyle="Solid" BorderWidth="1px" />
								<PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
								<RowStyle BackColor="#E3EAEB" />
								<SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
								<SortedAscendingCellStyle BackColor="#F8FAFA" />
								<SortedAscendingHeaderStyle BackColor="#246B61" />
								<SortedDescendingCellStyle BackColor="#D4DFE1" />
								<SortedDescendingHeaderStyle BackColor="#15524A" />--%>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div class="row" id="dvSentBack" runat="server" visible="false">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Re-submit Appplication </h4>
                        </div>
                        <div class="box-body box-body-open" style="padding: 10px;">
                            <div style="color: darkred; margin-bottom: 5px">
                                <span>Note: Need to enter remark and submit the application for Department Approval </span>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group manadatory">Remark</div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-8">
                                <div class="form-group">
                                    <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvRemarks" ControlToValidate="txtRemarks" ErrorMessage="Enter Remarks" runat="server"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="text-align: right">
                                <div class="form-group">
                                    <%--<asp:Button ID="btnSubmit" Text="Submit" CssClass="btn btn-success" runat="server" OnClick="btnSubmit_Click"></asp:Button>--%>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <%-----End of SearhBasicDetails------%>
                <%---Start of Button----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <%--<input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" onclick="fnNext();" />--%>
                            <asp:Button ID="btnNext" runat="server" CausesValidation="True" OnClick="btnNext_Click" ToolTip=" Proceed to Payment" CssClass="btn btn-success" Text="Next =>>" />
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page" CssClass="btn btn-danger" PostBackUrl="" Text="Cancel" />
                            <%--<asp:Button ID="btnHome" runat="server" CssClass="btn btn-primary" PostBackUrl="" ToolTip="Back to Home Page" Text="Home" />--%>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%---End of Button----%>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFDocBriefcaseID" runat="server" />
    <asp:HiddenField ID="hdnPrevious" runat="server" />

    <asp:HiddenField ID="HFServiceID" runat="server" Value="997" />
</asp:Content>
