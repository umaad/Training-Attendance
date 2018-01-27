<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GeoCodingCsharp.aspx.cs" Inherits="GeoCodingCsharp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=f<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1Iw2axmiSRGnGh15d5TAtj0VHcwA4n38


&callback=initMap"
  type="text/javascript"></script>alse"></script>
<script language="javascript" type="text/javascript">

    var map;
    var geocoder;
    function InitializeMap() {

        var latlng = new google.maps.LatLng(-34.397, 150.644);
        var myOptions =
        {
            zoom: 8,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true
        };
        map = new google.maps.Map(document.getElementById("map"), myOptions);
    }

    function FindLocaiton(lat,lng) {
        geocoder = new google.maps.Geocoder();
        InitializeMap();
        var latlng = new google.maps.LatLng(lat,lng);
        map.setCenter(latlng);
        var marker = new google.maps.Marker({
            map: map,
            position: latlng
        });

        var infowindow = new google.maps.InfoWindow({
            content: 'Message 1'
        });

        google.maps.event.addListener(marker, 'click', function () {
            // Calling the open method of the infoWindow 
            infowindow.open(map, marker);
        });
        return false;

    }


    window.onload = InitializeMap;

</script>

<h2>Gecoding Demo CSharp: </h2>
<table>
<tr>
<td>
    <input id="addressinput" type="text" style="width: 447px" />   
</td>
<td>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Find" />
    </td>
</tr>
<tr>
<td colspan ="2">
<div id ="map" style="height: 253px" >
</div>
</td>
</tr>
</table>
 
</asp:Content>

