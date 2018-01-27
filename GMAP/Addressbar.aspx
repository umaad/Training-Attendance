<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Addressbar.aspx.cs" Inherits="Addressbar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1Iw2axmiSRGnGh15d5TAtj0VHcwA4n38


&callback=initMap"
  type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();

    function InitializeMap() {
        directionsDisplay = new google.maps.DirectionsRenderer();
        var latlng = new google.maps.LatLng(-34.397, 150.644);
        var myOptions =
        {
            zoom: 8,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map"), myOptions);

        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('directionpanel'));

        var control = document.getElementById('control');
        control.style.display = 'block';


    }



    function calcRoute() {

        var start = document.getElementById('startvalue').value;
        var end = document.getElementById('endvalue').value;
        var request = {
            origin: start,
            destination: end,
            travelMode: google.maps.DirectionsTravelMode.DRIVING
        };
        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            }
        });

    }



    function Button1_onclick() {
        calcRoute();
    }

    window.onload = InitializeMap;
    </script>
    
<table id ="control">
<tr>
<td>
<table>
<tr>
<td>From:</td>
<td>
    <input id="startvalue" type="text" style="width: 305px" /></td>
</tr>
<tr>
<td>To:</td>
<td><input id="endvalue" type="text" style="width: 301px" /></td>
</tr>
<tr>
<td align ="right">
    <input id="Button1" type="button" value="GetDirections" onclick="return Button1_onclick()" /></td>
</tr>
</table>
</td>
</tr>
<tr>
<td valign ="top">
<div id ="directionpanel"  style="height: 390px;overflow: auto" ></div>
</td>
<td valign ="top">
<div id ="map" style="height: 390px; width: 489px"></div>
</td>
</tr>
</table>
</asp:Content>

