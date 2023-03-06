$(document).ready(function () {
    var qs = getQueryStrings();
    var AppID = qs["AppID"];
    var svcID = qs["SvcID"];
    var UID = qs["UID"];

    $("#btnClose").click(function () {
        window.location.href = '/WebApp/Citizen/Forms/Dashboard.aspx?UID=' + UID;
        return false;
    })

    objOutPut = {
        "AppID": "",
        "svcID": "",
        "UID": ""
    }

    objOutPut.AppID = AppID;
    objOutPut.svcID = svcID;
    objOutPut.UID = UID;

    //alert(AppID)

    var temp = 'OutPut';
    var obj = {
        "prefix": "'" + temp + "'",
        "Data": JSON.stringify(objOutPut, null, 4)
    };

    $.when(
       $.ajax({
           type: "POST",
           contentType: "application/json; charset=utf-8",
           url: "/WebAppUK/Deeds/OutputForHSA.aspx/SaleOfHouseDtl",
           data: JSON.stringify(obj, null, 4),
           processData: false,
           dataType: "json",
           success: function (response) {
           },
           error: function (a, b, c) {
               result = false;
               alert("5." + a.responseText);
           }
       })
       ).then(function (data, textStatus, jqXHR) {

           var obj = jQuery.parseJSON(data.d);
           var html = "";
           AppID = obj.AppID;
           result = true;

           if (result) {
               console.log(obj);
               //alert(obj);
               debugger;
               $("#txtAgreementPlace").html(checkIsnullorEmpty(obj["AgreementPlace"]));
               $("#txtAgreementDate").html(checkIsnullorEmpty(obj["AgreementDate"]));
               $("#txtVendorName").html(checkIsnullorEmpty(obj["VendorName"]));
               $("#txtVendorRentPlace").html(checkIsnullorEmpty(obj["VendorRentPlace"]));
               $("#txtVendeeName").html(checkIsnullorEmpty(obj["VendeeName"]));
               $("#txtVendeeRentPlace").html(checkIsnullorEmpty(obj["VendeeRentPlace"]));
               $("#txtSaleHouseFullAddress").html(checkIsnullorEmpty(obj["SaleHouseFullAddress"]));
               $("#txtSaleHouseLandmark").html(checkIsnullorEmpty(obj["SaleHouseLandmark"]));
               $("#txtTotalSaleAmount").html(checkIsnullorEmpty(obj["TotalSaleAmount"]));
               $("#txtAdvanceAmountInNumber").html(checkIsnullorEmpty(obj["AdvanceAmountInNumber"]));
               $("#txtAdvancePaidDate").html(checkIsnullorEmpty(obj["AdvancePaidDate"]));
               $("#txtSaleCompletionMonth").html(checkIsnullorEmpty(obj["SaleCompletionMonth"]));
               $("#txtAdvocateIntimationPeriod").html(checkIsnullorEmpty(obj["AdvocateIntimationPeriod"]));
               $("#txtRefuhndDays").html(checkIsnullorEmpty(obj["RefuhndDays"]));
               $("#txtAdvocateIntimationPeriod").html(checkIsnullorEmpty(obj["AdvocateIntimationPeriod"]));
               $("#txtRateOfInterest").html(checkIsnullorEmpty(obj["RateOfInterest"]));
               $("#txtRefundAmount").html(checkIsnullorEmpty(obj["RefundAmount"]));
               $("#txtRecieptAmount").html(checkIsnullorEmpty(obj["RecieptAmount"]));

               //bootbox.alert("Aggreement Request Applied Successfully..")
               //alert("Application submitted successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
               //window.location.href = "/WebAppUK/Deeds/OutputForHSA.aspx?SvcID=" + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
           }

       });// end of Then function of main Data fatch Function

    return false;

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
function checkIsnullorEmpty(val) {
    if (val == "" || val == null) {
        return ".............";
    }
    else {
        return val;
    }
}