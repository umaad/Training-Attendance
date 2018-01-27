<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReverseGeoCodingDemo.aspx.cs" Inherits="GeoCodingDemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1Iw2axmiSRGnGh15d5TAtj0VHcwA4n38


&callback=initMap"
  type="text/javascript"></script><script language="javascript" type="text/javascript">

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

    function FindLocaiton() {
        geocoder = new google.maps.Geocoder();
        InitializeMap();

        var address = document.getElementById("addressinput").value;
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
                if (results[0].formatted_address) {
                    region = results[0].formatted_address + '<br />';
                }
                var infowindow = new google.maps.InfoWindow({
                    content: '<div style =width:400px; height:400px;>Location info:<br/>Country Name:<br/>' + region + '<br/>LatLng:<br/>' + results[0].geometry.location + '</div>'
                });
                google.maps.event.addListener(marker, 'click', function () {
                    // Calling the open method of the infoWindow 
                    infowindow.open(map, marker);
                });

            }
            else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });


    }


    function Button1_onclick() {
        FindLocaiton();
    }



</script>

<h2>Reverse Gecoding Demo JavaScript: </h2>
<table>
<tr>
<td>
    <input id="addressinput" type="text" style="width: 447px" />   
</td>
<td>
    <input id="Button1" type="button" value="Find" onclick="return Button1_onclick()" /></td>
</tr>
<tr>
<td colspan ="2">
<div id ="map" style="height: 478px; width: 691px;" >
</div>
</td>
</tr>
</table>
 
</asp:Content>

