function isNum(char) {
    if (char == 8) return true;
    if (char == 9) return true;
    if (char == 13) return true;
    //if (char == 35) return true;
    //if (char == 36) return true;
    //if (char == 46) return true;
    if (char >= 48 && char <= 57) return true;
    //if (char > 111 && char <= 123) return true;
}

function isNumberKey(evt, inputName) {
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (!isNum(charCode)) return false;
    return true;
}


function Salutation() {


    var SelIndex = "";
    var strText = "";


    SelIndex = document.getElementById('CPH_ddlSalutation').selectedIndex;
    strText = document.getElementById('CPH_ddlSalutation').options[SelIndex].text;


    if (strText == 'कुमार' || strText == 'श्री.') {

        var valueToSet = 'पुरुष';
        var valuetoremove = 'स्त्री';
        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), false);
        //document.getElementById('CPH_RequiredFieldValidator17').disabled = true;
        //                if (document.getElementById('CPH_Dropgen').selectedIndex <= 0) {
        //                    ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), true);
        //                }   

    }

    if (strText == 'कुमारी' || strText == 'श्रीमती' || strText == 'सौ') {

        var valueToSet = 'स्त्री';
        var valuetoremove = 'पुरुष';
        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), false);

    }


    if (strText == '---निवडा---') {


        var valueToSet = '---निवडा---';

        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), true);

    }


    var selectObj = document.getElementById('CPH_Dropgen');
    for (var i = 0; i < selectObj.options.length; i++) {
        selectObj.options[i].disabled = false;
    }

    for (var i = 0; i < selectObj.options.length; i++) {
        var vari = selectObj.options[i].text;
        var reminx = "";
        if (vari == valuetoremove) {
            selectObj.options[i].disabled = true;
        }
        if (vari == valueToSet) {
            selectObj.options[i].selected = true;
        }

    }
    SalutationGen();
}

function SalutationGen() {


    var SelIndex = "";
    var strText = "";
    var SelGen = "";
    var strGen = "";

    SelIndex = document.getElementById('CPH_ddlSalutation').selectedIndex;
    strText = document.getElementById('CPH_ddlSalutation').options[SelIndex].text;
    SelGen = document.getElementById('CPH_Dropgen').selectedIndex;
    strGen = document.getElementById('CPH_Dropgen').options[SelGen].text;

    if (strText == 'कुमार' || strText == 'श्री.') {

        var valueToSet = 'पुरुष';
        var valuetoremove = 'स्त्री';
        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), false);
        //document.getElementById('CPH_RequiredFieldValidator17').disabled = true;
        //                if (document.getElementById('CPH_Dropgen').selectedIndex <= 0) {
        //                    ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), true);
        //                }   

    }

    if (strText == 'कुमारी' || strText == 'श्रीमती' || strText == 'सौ') {

        var valueToSet = 'स्त्री';
        var valuetoremove = 'पुरुष';
        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), false);

    }


    if (strText == '---निवडा---') {

        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), true);

    }
    if (strGen == '---निवडा---') {

        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), true);

    }




}


function Salutation_Contact2() {
    var SelIndex = "";
    var strText = "";


    SelIndex = document.getElementById('CPH_ddl_sal1').selectedIndex;
    strText = document.getElementById('CPH_ddl_sal1').options[SelIndex].text;

    if (strText == 'कुमार' || strText == 'श्री.') {
        var valueToSet = 'पुरुष';
        var valuetoremove = 'स्त्री';
    }

    if (strText == 'कुमारी' || strText == 'श्रीमती' || strText == 'सौ') {
        var valueToSet = 'स्त्री';
        var valuetoremove = 'पुरुष';
    }

    var selectObj = document.getElementById('CPH_ddlgen2');
    for (var i = 0; i < selectObj.options.length; i++) {
        selectObj.options[i].disabled = false;
    }

    for (var i = 0; i < selectObj.options.length; i++) {
        var vari = selectObj.options[i].text;
        var reminx = "";
        if (vari == valuetoremove) {
            selectObj.options[i].disabled = true;
        }
        if (vari == valueToSet) {
            selectObj.options[i].selected = true;
        }

    }

}
//Modified on 17-12-2012
function Page_ClientValidate() {
    return true;
}

function RadioListVisibility(ctrlName, DisplayItem) {

    var chkBox = document.getElementById(ctrlName);
    var options = chkBox.getElementsByTagName('input');


    if (options[0].checked == true) {
        toggleDisplay(DisplayItem, 1);
    }
    else {
        toggleDisplay(DisplayItem, 0);
    }
}

function toggleDisplay(CtrlName, flag) {

    element = document.getElementById(CtrlName).style;
    if (flag == 1) {
        element.display = 'block';
    }
    else {
        element.display = 'none';
    }
}


function changescript() {
    var FullName = document.getElementById('CPH_FullName');
    FullName.value = toProperCase(FullName.value);

    var FullName = document.getElementById('CPH_txtfullNameE');
    FullName.value = toProperCase(FullName.value);

    return;
}


function toProperCase(s) {
    return s.toLowerCase().replace(/^(.)|\s(.)/g,
        function ($1) { return $1.toUpperCase(); });
}



function ValidateUID() {

    if (!ValidateNumbers('CPH_UID')) {
        if (document.getElementById('CPH_HV1').value == 'Eng') {
            alert('Please Enter 12 digit UID Number');
        }
        else {
            alert('कृपया १२ अंकी आधार क्रमांकाची नोंद करा ');
        }

        document.getElementById('CPH_HV1').focus();
        return false;
    }


    if (!ValidateNumbers('CPH_txtUid3')) {
        if (document.getElementById('CPH_HV1').value == 'Eng') {
            alert('Please Enter 12 digit UID Number');
        }
        else {
            alert('कृपया १२ अंकी आधार क्रमांकाची नोंद करा ');
        }

        document.getElementById('CPH_HV1').focus();
        return false;
    }


    return true;
}

function ValidateNumbers(p_Control) {

    var t_Value = document.getElementById(p_Control).value;
    var t_Length = t_Value.length;
    var t_Result = true;
    for (var i = 0; i < t_Length; i++) {

        var t_ACSIICode = t_Value.charAt(i).charCodeAt(0);

        if (t_ACSIICode > 31 && (t_ACSIICode < 48 || t_ACSIICode > 57)) {
            t_Result = false;
            break;
        }
    }

    if (!t_Result) {
        document.getElementById(p_Control).value = '';
    }

    return t_Result;
}



function validateValues() {

    if (document.getElementById('CPH_HV1').value == 'Eng') {

        if (document.getElementById('CPH_FullName').value == '') {

            showalert('Please Enter Full Name in English', 'CPH_FullName');
            return false;

        }


        if (document.getElementById('CPH_FullName_LL').value == '') {

            showalert('Please Enter Full Name in Marathi', 'CPH_FullName_LL');

            return false;

        }

        if (document.getElementById('CPH_DOB').value == '') {

            alert('Please Enter Date Of Birth');

            document.getElementById('CPH_DOB').focus();

            return false;

        }




        if (document.getElementById('CPH_Mobile').value == '') {

            alert('Please Enter Mobile No');

            document.getElementById('CPH_Mobile').focus();

            return false;

        }
        if (document.getElementById('CPH_AddrCare').value == '') {

            alert('Please Enter Address');

            document.getElementById('CPH_AddrCare').focus();

            return false;

        }


        SelIndex = document.getElementById('CPH_District').selectedIndex;

        if (SelIndex <= 0) {
            alert('Please Select District.');
            document.getElementById('CPH_District').focus();
            return false;
        }

        SelIndex = document.getElementById('CPH_SubDistrict').selectedIndex;

        if (SelIndex <= 0) {
            alert('Please Select SubDistrict.');
            document.getElementById('CPH_SubDistrict').focus();
            return false;
        }

        SelIndex = document.getElementById('CPH_Village').selectedIndex;

        if (SelIndex <= 0) {
            alert('Please Select Village.');
            document.getElementById('CPH_Village').focus();
            return false;
        }


        if (document.getElementById('CPH_txtfullNameE').value == '') {

            alert('Please Enter Full Name(English) of Emergency Contact Person-1 .');

            document.getElementById('CPH_txtfullNameE').focus();

            return false;

        }
        if (document.getElementById('CPH_txtfullnameM').value == '') {

            alert('Please Enter Full Name(Marathi) of Emergency Contact Person-1 .');

            document.getElementById('CPH_txtfullnameM').focus();

            return false;

        }

        if (document.getElementById('CPH_txtMobie').value == '') {

            alert('Please Enter Mobile Number of Emergency Contact Person-1');

            document.getElementById('CPH_txtMobie').focus();

            return false;

        }

        if (document.getElementById('CPH_txtfename').value == '') {

            alert('Please Enter Full Name(English) of Emergency Contact Person-2 .');

            document.getElementById('CPH_txtfename').focus();

            return false;

        }
        if (document.getElementById('CPH_txtfmname').value == '') {

            alert('Please Enter Full Name(Marathi) of Emergency Contact Person-2 .');

            document.getElementById('CPH_txtfmname').focus();

            return false;

        }
        if (document.getElementById('CPH_txtbirth').value == '') {

            alert('Please Select date of birth of Emergency Contact Person-2.');

            document.getElementById('CPH_txtbirth').focus();

            return false;

        }
        if (document.getElementById('CPH_ddlgen2').value == '---Select---') {

            alert('Please Select Gender of Emergency Contact Person-2.');

            document.getElementById('CPH_ddlgen2').focus();

            return false;

        }


    }
    else {

        //                if ((document.getElementById('CPH_FullName_LL').value == '')){

        //                    ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator2"), true);
        //                    alert('');
        //                    return true;
        //                }

        if ((document.getElementById('CPH_ddlSalutation').value == '---निवडा---') && (document.getElementById('CPH_FullName').value == '') && (document.getElementById('CPH_FullName_LL').value == '') && (document.getElementById('CPH_age').value == '') && (document.getElementById('CPH_AddrCare').value == '') && (document.getElementById('CPH_Building').value == '') && (document.getElementById('CPH_District').selectedIndex <= 0) && (document.getElementById('CPH_SubDistrict').selectedIndex <= 0) && (document.getElementById('CPH_Village').selectedIndex <= 0) && (document.getElementById('CPH_txtfullNameE').value == '') && (document.getElementById('CPH_txtfullnameM').value == '')) {

            alert("एक किंवा एकापेक्षा जास्त चिन्हांकित क्षेत्रात माहिती भरण्यात आलेली नाही. कृपया चिन्हांकित क्षेत्रात माहिती भरावी.");
            return true;
        }

        //                if (document.getElementById('CPH_ddlSalutation').value == '---निवडा---') {

        //                    showalert('कृपया अर्जदाराच्या संबोधनाची निवड करा.', 'CPH_ddlSalutation');

        //                    return false;

        //                }

        //                if (document.getElementById('CPH_FullName').value == '') {

        //                    showalert('कृपया अर्जदाराच्या पूर्ण नावाची (इंग्रजी) नोंद करा.', 'CPH_FullName');

        //                    return false;

        //                }


        //                if (document.getElementById('CPH_FullName_LL').value == '') {

        //                    showalert('कृपया अर्जदाराच्या पूर्ण नावाची (मराठी) नोंद करा.', 'CPH_FullName_LL');

        //                    return false;
        //                }

        //                if (document.getElementById('CPH_age').value == '') {

        //                    showalert('कृपया अर्जदाराच्या वयाची नोंद करा .', 'CPH_age');

        //                    return false;

        //                }



        //                if (document.getElementById('CPH_AddrCare').value == '') {

        //                    showalert('कृपया घर ओळख/ क्रमांकाची नोंद करा.', 'CPH_AddrCare');

        //                    return false;

        //                }


        //                if (document.getElementById('CPH_Building').value == '') {

        //                    showalert('कृपया अर्जदाराच्या पत्त्याची नोंद करा.', 'CPH_Building');

        //                    return false;

        //                }




        //                SelIndex = document.getElementById('CPH_District').selectedIndex;

        //                if (SelIndex <= 0) {
        //                    alert('कृपया अर्जदाराच्या जिल्ह्याची निवड करा.');
        //                    document.getElementById('CPH_District').focus();
        //                    return false;
        //                }

        //                SelIndex = document.getElementById('CPH_SubDistrict').selectedIndex;

        //                if (SelIndex <= 0) {
        //                    alert('कृपया अर्जदाराच्या तालुक्याची निवड करा.');
        //                    document.getElementById('CPH_SubDistrict').focus();
        //                    return false;
        //                }

        //                SelIndex = document.getElementById('CPH_Village').selectedIndex;

        //                if (SelIndex <= 0) {
        //                    alert('कृपया अर्जदाराच्या गावाची निवड करा.');
        //                    document.getElementById('CPH_Village').focus();
        //                    return false;
        //                }


        //                if (document.getElementById('CPH_txtfullNameE').value == '') {

        //                    showalert('कृपया आपत्कालीन परिस्थितीत संपर्क साधावयाच्या व्यक्तीच्या पूर्ण नावाची (इंग्रजी) नोंद करा.', 'CPH_txtfullNameE');

        //                    return false;

        //                }
        //                if (document.getElementById('CPH_txtfullnameM').value == '') {

        //                    showalert('कृपया आपत्कालीन परिस्थितीत संपर्क साधावयाच्या व्यक्तीच्या पूर्ण नावाची (मराठी) नोंद करा.', 'CPH_txtfullnameM');

        //                    return false;

        //                }



        //                var SelectedValue = $('#CPH_RadioBttnLst1 :radio:checked').next().text();

        //                if (SelectedValue == '') {


        //                    showalert('आपत्कालीन स्थितीत संपर्कासाठी अन्य व्यक्ती आहे का ?', 'CPH_RadioBttnLst1');

        //                    return false;

        //                }
        //                if (SelectedValue == '') {

        //                    var Typeval = $('#CPH_RadioBttnLst1 :radio:checked').next().text();

        //                    if (Typeval == "हो") {
        //                        if (document.getElementById('CPH_ddl_sal1').value == '---निवडा---') {

        //                            showalert('कृपया आपत्कालीन व्यक्ती-2 ची उपाधी निवडा .', 'CPH_ddl_sal1');

        //                            return false;

        //                        }

        //                        if (document.getElementById('CPH_txtfename').value == '') {

        //                            showalert('कृपया आपत्कालीन व्यक्ती-२ चे पूर्ण नावाची (इंग्रजी) नोंद करा.', 'CPH_txtfename');

        //                            return false;

        //                        }
        //                        if (document.getElementById('CPH_txtfmname').value == '') {

        //                            showalert('कृपया आपत्कालीन व्यक्ती-२ चे पूर्ण नावाची (मराठी) नोंद करा.', 'CPH_txtfmname');

        //                            return false;

        //                        }

        //                        if (document.getElementById('CPH_ddlgen2').value == '---निवडा---') {

        //                            showalert('कृपया आपत्कालीन व्यक्ती-२ लिंग निवडा.', 'CPH_ddlgen2');

        //                            return false;

        //                        }

        //                    }
        //                }
    }

    if (typeof (Page_ClientValidate) == 'function') {
        Page_ClientValidate();
    }
    if (Page_IsValid) {
        //return true;
    }
    else {
        return false;
    }

    /*******/
    var x = 3;
    var e = document.getElementById('CPH_age').value;
    var t_Length = e.length;
    //            if (t_Length >= x) {

    //                document.getElementById("CPH_age").value = '';
    //                alert("कृपया वयाची नोंद जास्तीत जास्त ३ अंकापर्यंतच करा.");
    //                return false;
    //            }

    if (e > 125) {
        document.getElementById("CPH_age").value = '';
        alert("कृपया वयाची नोंद जास्तीत जास्त १२५ वर्षा पर्यंत असावी.");
        return false;
    }

    var t_NumberMessage = 'कृपया केवळ अंकांची नोंद करा';
    if (!ValidateNumbers('CPH_age')) {
        alert(t_NumberMessage);
        document.getElementById('CPH_age').focus();
        return false;
    }


    if (document.getElementById('CPH_HFValidate').value == '') {
        document.getElementById('CPH_HFValidate').value = 'Y';
        return ValidateMsg(document.getElementById('CPH_HV1').value);
    }

} //end of validate values function



function disp_confirm() {
    var r = confirm(" तुम्हाला निश्चितपणे री-सेट करायचे आहे का? सावधान- री-सेट केल्यास सर्व माहिती पुसली जाईल. ")
    if (r == true) {

        location.reload();
        return true;

    }
    else {
        return false;
        // alert("You pressed Cancel!")
    }
}

function back() {

    var r = confirm(" तुम्हाला निश्चितपणे मागे जायचे आहे का? सावधान- मागे गेल्यास तुम्ही मुख्य पृष्ठावर परत जाल.")
    if (r == true) {

        location.href = '../HOME/Menu.aspx';

    }
    else {
        return false;

    }
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}
function isNumberKey1(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return true;

    return false;
}
function isBS(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode || 8)

        return false;

    return true;


}
function IsAlphabet(evt) {

    var charCode = (evt.which) ? evt.which : event.keyCode

    var txt = String.fromCharCode(charCode)

    if (txt.match(/^[a-zA-Z\b ]+$/))

        return true;

    return false;

}


function daysInMonth(month, year) { // months are 1-12

    var dd = new Date(year, month, 0);

    return dd.getDate();

}

function checkDate1(sender, args) {
    if (sender._selectedDate > new Date()) {
        if (document.getElementById('CPH_HV1').value == 'Eng') {
            alert("You cannot select a day next than today!");
            document.getElementById('CPH_DOB').value = '';
            document.getElementById('CPH_age').value = '';
            return false;
        }
        else {
            alert("तुम्ही आज नंतरचा दिनांक निवडू शकत नाही. ");
        }
        sender._selectedDate = new Date();
        sender._textbox.set_Value(sender._selectedDate.format(sender._format))
    }
    CheckAge();
}

function CheckAge(p_Control) {

    today = new Date();
    var dt = document.getElementById("CPH_DOB").value;
    var d = dt.split("/");

    var dateTimeInput = new Date(d[1] + "/" + d[0] + "/" + d[2]);
    if (dateTimeInput > today) {
        document.getElementById("CPH_DOB").value = '';
        alert("तुम्ही आज नंतरचा दिनांक निवडू शकत नाही.");
        return false;
    }
    if (ageCount() == true) {

        Appage();
    }
    else { return false; }

    return true;
}



function AgeChk() {
    var agecalc = document.getElementById('CPH_age').value;
    if (eval(agecalc) > 125) {
        alert('वय १२५ पेक्षा कमी असावे.');
        document.getElementById('CPH_age').value = '';
        document.getElementById('CPH_age').focus();
        return false;
    }

    if (eval(agecalc) <= 0) {
        alert('किमान वय शुन्य नसावे.');
        document.getElementById('CPH_age').value = '';
        document.getElementById('CPH_age').focus();
        return false;
    }

    if (eval(agecalc) < 60) {
        alert('तुम्ही पात्र नाही. वय ६० वर्षांपेक्षा जास्त असले पाहिजे.');
        document.getElementById('CPH_age').value = '';
        document.getElementById('CPH_age').focus();
        return false;
    }
}

function ValidateDate(ctrl) {


    //            if (ctrl.value == "" || ctrl.value == "dd/mm/yyyy") {
    //                if (document.getElementById('CPH_HV1').value == 'Eng') {
    //                    alert("Please Enter Date of Birth");
    //                } else {
    //                    alert("जन्मतारीखेची नोंद करा.");
    //                }
    //                return false;
    //            }
    //            else if (isDateMar(ctrl.value) == false) {
    //                ctrl.value = "";
    //                ctrl.focus();
    //                return false;

    //            }
    if (isDateMar(ctrl.value) == false) {
        ctrl.value = "";
        ctrl.focus();
        return false;

    }
}



function CheckAgeNew() {

    if (document.getElementById('CPH_DOB').value == "" || document.getElementById('CPH_DOB').value == "dd/mm/yyyy") {
        document.getElementById("CPH_age").disabled = false;
        document.getElementById('CPH_age').value = '';

        return false;
    }
    else if (isDateMar(document.getElementById('CPH_DOB').value) == false) {
        document.getElementById('CPH_DOB').value = "";
        document.getElementById('CPH_DOB').focus();
        document.getElementById("CPH_age").disabled = false;
        document.getElementById('CPH_age').value = '';

        return false;

    }

    today = new Date();
    var dt = document.getElementById("CPH_DOB").value;
    var d = dt.split("/");

    var dateTimeInput = new Date(d[1] + "/" + d[0] + "/" + d[2]);

    var SelectedDate = new Date(d[2], d[1], d[0]);


    if (dateTimeInput > today) {
        if (document.getElementById('CPH_HV1').value == 'Eng') {

            document.getElementById("CPH_DOB").value = '';
            alert("You cannot select a day next than Today.");
            document.getElementById("CPH_age").disabled = false;
            document.getElementById('CPH_age').value = '';


            return false;
        }

        else {
            document.getElementById("CPH_DOB").value = '';
            alert("तुम्ही आज नंतरचा दिनांक निवडू शकत नाही. ");
            document.getElementById("CPH_age").disabled = false;
            document.getElementById('CPH_age').value = '';

            return false;
        }

    }


    ageCount();

    return true;
}



function ageCount() {

    var date1 = new Date();
    var dob = document.getElementById("CPH_DOB").value;
    var d = dob.split("/");
    var dateTimeInput = new Date(d[1] + "/" + d[0] + "/" + d[2]);
    var date2 = new Date(dateTimeInput);

    var allMonths = date1.getMonth() - date2.getMonth() + (12 * (date1.getFullYear() - date2.getFullYear()));

    var pattern = /^\d{1,2}\/\d{1,2}\/\d{4}$/; //Regex to validate date format (dd/mm/yyyy)
    if (pattern.test(dob)) {

        var y1 = date1.getFullYear(); //getting current year
        var nowmonth = date1.getMonth();
        var nowday = date1.getDate();

        var y2 = date2.getFullYear(); //getting dob year

        var birthmonth = date2.getMonth();
        var birthday = date2.getDate();
        //calculating age

        var datetemp = new Date();
        var tempyear = datetemp.getFullYear() - 125;
        var nd = new Date(tempyear, 01, 01);

        var age = y1 - y2;
        var age_month = nowmonth - birthmonth;
        var age_day = nowday - birthday;



        if (d[2] == "0000") {
            alert("अवैध दिनांक.");
            document.getElementById('CPH_DOB').value = "";
            document.getElementById('CPH_DOB').focus();
            document.getElementById('CPH_age').value = '';
            document.getElementById('CPH_age').focus();
            return false;
        }

        if (d[2] < nd.getFullYear()) {
            alert('वय १२५ पेक्षा कमी असावे.');
            document.getElementById('CPH_DOB').value = "";
            document.getElementById('CPH_DOB').focus();
            document.getElementById('CPH_age').value = '';
            document.getElementById('CPH_age').focus();
            return false;
        }



        if (age_month < 0 || (age_month == 0 && age_day < 0)) {
            age = parseInt(age) - 1;
        }

        if (age < 60) {
            alert('तुम्ही पात्र नाही. वय ६० वर्षांपेक्षा जास्त असले पाहिजे.');
            document.getElementById('CPH_DOB').value = '';
            document.getElementById('CPH_age').value = '';
            document.getElementById("CPH_age").disabled = false;
            document.getElementById('CPH_age').focus();
            return false;
        }

        //                if ((age <= 0 && age_month <= 0 && age_day <= 0) || age < 60) {

        //                    alert('तुम्ही पात्र नाही. वय ६० वर्षांपेक्षा जास्त असले पाहिजे.');
        //                    document.getElementById('CPH_age').value = '';
        //                    document.getElementById('CPH_age').focus();
        //                    return false;
        //                }


        //                var agecalc = document.getElementById('CPH_age').value;

        //                if (allMonths < 720) {
        //                    alert('तुम्ही पात्र नाही. वय ६० वर्षांपेक्षा जास्त असले पाहिजे.');
        //                    document.getElementById('CPH_age').value = '';
        //                    document.getElementById('CPH_age').focus();
        //                    return false;
        //                }


        if (allMonths > 1500) {
            alert('वय १२५ पेक्षा कमी असावे.');
            document.getElementById('CPH_DOB').value = "";
            document.getElementById('CPH_DOB').focus();
            document.getElementById('CPH_age').value = '';
            return false;
        }
        else {
            ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator12"), false);
            document.getElementById("CPH_age").value = age;
            document.getElementById("CPH_age").disabled = true;
            return true;
        }
    }
    else {
        if (document.getElementById('CPH_HV1').value == 'Eng') {
            document.getElementById("CPH_age").disabled = false;
            document.getElementById("CPH_DOB").value = '';
            alert("Invalid Date. Please enter correct date format (dd/mm/yyyy)!");
        }
        else {
            document.getElementById("CPH_age").disabled = false;
            document.getElementById("CPH_DOB").value = '';
            alert("अवैध दिनांक. कृपया दिनांक (dd/mm/yyyy) मध्ये लिहा.");
        }

        return false;

    }
}
