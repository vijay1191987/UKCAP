<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Declaration.ascx.cs" Inherits="CitizenPortal.WebAppUK.controls.Declaration" %>

<script type="text/javascript">
    function Declaration(chk)
    {
        if (chk)
        {
            var qs = getQueryStrings();
            var uid = qs["UID"];
            var svcid = qs["SvcID"];

            if (uid != "" || uid != null)
            {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebAppUK/DomicileCertificate/DomicileForm.aspx/SearchCitizenData',
                    data: '{"ServiceID":"' + svcid + '","UID":"' + uid + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (data)
                    {
                        var obj = jQuery.parseJSON(data.d);
                        if (obj[0] != null)
                        {
                            if (obj[0]["Gender"] == "M" || obj[0]["Gender"] == "Male")
                            {
                                $('#lblGender').text("Son of ");
                                $('#lblTitle').text("Mr.");
                            }
                            else if (obj[0]["Gender"] == "F" || obj[0]["Gender"] == "Female")
                            {
                                $('#lblGender').text("Daughter of ");
                                $('#lblTitle').text("Ms.");
                            }

                            $('#lblAplicantName').text(obj[0]["ApplicantName"]);
                            $('#lblApplicantSign').text(obj[0]["ApplicantName"]);
                            $('#HDNFNM').val(obj[0]["ApplicantName"]);
                            $('#lblFatherName').text(obj[0]["FatherName"]);

                            var DOB = "";
                            DOB = obj[0]["DOB"];
                            DOB = DOB.split("-");
                            if (DOB[0].length == 4)
                            {
                                DOB = DOB[2] + "/" + DOB[1] + "/" + DOB[0];
                            }
                            else
                            {
                                DOB = DOB[0] + "/" + DOB[1] + "/" + DOB[2];
                            }

                            $('#txtDOB').val(DOB);
                            GetAge();

                            var today = new Date();
                            var dd = today.getDate();
                            var mm = today.getMonth() + 1; //January is 0!

                            var yyyy = today.getFullYear();
                            if (dd < 10)
                            {
                                dd = '0' + dd
                            }
                            if (mm < 10)
                            {
                                mm = '0' + mm
                            }
                            var today = dd + '/' + mm + '/' + yyyy;
                            $("#currntdte").text(today);

                            $('#divDeclaration').fadeToggle();
                            $('#btnSubmit').prop('disabled', false);
                        }
                    },
                    error: function (a, b, c)
                    {
                        result = false;
                        alert("5." + a.responseText);
                    }
                });
            }

            /*if ($('#lblAppName').val() == "")
            {
                //alert("Please enter the all the mandatory fields.");
                alert("Please enter your Full Name, Father Name  to continue.");
                chkPhysical.checked = false;
                return false;
            }

            if ($('#CddlDistrict').val() == 0)
            {
                alert("Please select Present District to continue.");
                chkPhysical.checked = false;
                return false;
            }
            if ($('#ddlGender').val() != '0')
            {
                if ($('#ddlGender').val() == "M")
                {
                    $('#lblGender').text("son of ");
                    $('#lblTitle').text("Mr.");
                } else if ($('#ddlGender').val() == "F")
                {
                    $('#lblGender').text("daughter of ");
                    $('#lblTitle').text("Ms.");
                } else { $('#lblGender').text("transgender of"); $('#lblTitle').text("Mr./Ms."); }
            }
            else
            {
                alert("Please, seect Gender");
            }

            var name = $('#lblAppName').val();
            var fname = $('#FatherName').val();
            var place = $("#CddlDistrict option:selected").text();//$('#CddlDistrict').val();
            //alert(name);
            $("#lblName").text(name);
            $("#lblAppName").text(name);
            $("#lblNameAadhaar").text(name);
            $("#lblPhsclFthrName").text(fname);
            //$("#lblPhsclDstName").text(fname);
            $("#cndidteplce").text(place);*/
        }
        else
        {
            $("#lblTitle").text("");
            $("#lblAplicantName").text("");
            $('#lblGender').text("");
            $("#lblFatherName").text("");
            $("#lblApplicantSign").text("");
            $('#btnSubmit').prop('disabled', true);
            //$('#divDeclaration').hide();
            $('#divDeclaration').fadeToggle();
        }
    }
</script>

<div class="row">
    <div class="col-md-12 box-container">
        <div class="box-heading">
            <h4 class="box-title manadatory" id="lblDeclaration">
                <input type="checkbox" runat="server" id="chkPhysical" onclick="javascript: Declaration(this.checked);" style="vertical-align: top;" />Declaration
            </h4>
        </div>
        <div class="box-body box-body-open" id="divDeclaration" style="display: none">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="text-danger text-danger-green mt0">
                    <p class="text-justify">
                        I <span id="lblTitle"></span>
                        <span id="lblAplicantName" style="text-transform: capitalize; font-weight: bold; color: #61626f !important;"></span>,
                        <span id="lblGender"></span>
                        <span id="lblFatherName" style="text-transform: capitalize; font-weight: bold; color: #61626f !important;"></span>
                        , hereby affirm that the above mentioned information submitted by me is true and correct to my knowledge and belief.<br />
                        I hereby agree to be liable for legal consequences for any information found incorrect or untrue at a later date.
                    </p>
                    <br />
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <p style="padding-right: 3px; display: block; color: #000;">
                                    Place : 
                                <span id="cndidteplce" style="font-weight: bold"></span>
                                    <br />
                                    <br />
                                    <span style="padding-right: 3px;">Date : <span id="currntdte" style="font-weight: bold; color: #61626f !important;"></span></span>
                                </p>
                            </td>
                            <td style="text-align: right;">
                                <p style="color: #000;">
                                    <span id="lblApplicantSign" style="text-transform: capitalize; display:block; font-weight: bold; color: #61626f !important;"></span>
                                    <br />
                                    <span>Signature</span>
                                </p>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
    </div>
</div>