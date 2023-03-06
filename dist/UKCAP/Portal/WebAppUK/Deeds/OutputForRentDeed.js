$(document).ready(function () {
    debugger;
    var qs = getQueryStrings();
    var AppID = qs["AppID"];
    var svcID = qs["SvcID"];
    var UID = qs["UID"];
    $("#btnClose").click(function () {
        window.location.href = '/WebApp/Citizen/Forms/Dashboard.aspx?UID=' + UID;
        return false;
    });
    objOutPut = {
        "AppID": "",
        "svcID": "",
        "UID": ""
    }
    objOutPut.AppID = AppID;
    objOutPut.svcID = svcID;
    objOutPut.UID = UID; 
    var temp = "OutPut";
    var obj = {
        "prefix": "'" + temp + "'",
        "Data": JSON.stringify(objOutPut, null, 4)
    };
    $.when(
       $.ajax({
           type: "POST",
           contentType: "application/json; charset=utf-8",
           url: "/WebAppUK/Deeds/OutputForRentDeed.aspx/HouseRentDtl",
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
               $("#txtDeedPlace").html(checkIsnullorEmpty(obj["DeedPlace"]));
               $("#txtDeedDate").html(checkIsnullorEmpty(obj["DeedDate"]));
               $("#txtLandlordName").html(checkIsnullorEmpty(obj["LandlordName"]));
               $("#txtTenantName").html(checkIsnullorEmpty(obj["TenantName"]));
               $("#txtOwnerFullAddrs").html(checkIsnullorEmpty(obj["OwnerFullAddrs"]));
               $("#txtTenantFullAddrs").html(checkIsnullorEmpty(obj["TenantFullAddrs"]));
               $("#txttenantage").html(checkIsnullorEmpty(obj["tenantage"]));
               $("#txttenantPermanetAddrs").html(checkIsnullorEmpty(obj["tenantPermanetAddrs"]));
               $("#txtTenantRentPlaceAddr").html(checkIsnullorEmpty(obj["TenantRentPlaceAddr"]));
               $("#txtRentcity").html(checkIsnullorEmpty(obj["Rentcity"]));
               $("#txtPeriodOfRent").html(checkIsnullorEmpty(obj["PeriodOfRent"]));
               $("#txtRentPayableDatePM").html(checkIsnullorEmpty(obj["RentPayableDatePM"]));
               $("#txtTotalRentAmntPM").html(checkIsnullorEmpty(obj["TotalRentAmntPM"]));
               $("#txtTotalRentAmntInWordsPM").html(checkIsnullorEmpty(obj["TotalRentAmntInWordsPM"]));
               $("#txtRentPayableGraceDatePM").html(checkIsnullorEmpty(obj["RentPayableGraceDatePM"]));
               $("#txtMaintenanceChargePM").html(checkIsnullorEmpty(obj["MaintenanceChargePM"]));
               $("#txtSecurityAmnt").html(checkIsnullorEmpty(obj["SecurityAmnt"]));
               $("#txtSecurityAmntInWords").html(checkIsnullorEmpty(obj["SecurityAmntInWords"]));
               $("#txtPremises").html(checkIsnullorEmpty(obj["Premises"]));
               $("#txtWitness1Name").html(checkIsnullorEmpty(obj["Witness1Name"]));
               $("#txtWitness2Name").html(checkIsnullorEmpty(obj["Witness2Name"]));
               $("#txtOwnersignature").html(checkIsnullorEmpty(obj["Ownersignature"]));
               $("#txtTenantsignature").html(checkIsnullorEmpty(obj["Tenantsignature"]));

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