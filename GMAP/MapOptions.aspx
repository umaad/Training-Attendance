<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MapOptions.aspx.cs" Inherits="MapOptions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1Iw2axmiSRGnGh15d5TAtj0VHcwA4n38


&callback=initMap"
  type="text/javascript"></script>
<script type="text/javascript">

    function initialize() {
        var latlng = new google.maps.LatLng(28.3949, 84.1240);
        var options =
        {
            zoom: 3,
            center: new google.maps.LatLng(28.3949, 84.1240),
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            mapTypeControl: true,
            mapTypeControlOptions:
            {
                style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
                poistion: google.maps.ControlPosition.TOP_RIGHT,
                mapTypeIds: [google.maps.MapTypeId.ROADMAP, google.maps.MapTypeId.TERRAIN, google.maps.MapTypeId.HYBRID, google.maps.MapTypeId.SATELLITE]
            },
            navigationControl: true,
            navigationControlOptions:
            {
                style: google.maps.NavigationControlStyle.ZOOM_PAN
            },
            scaleControl: true,
            disableDoubleClickZoom: true,
            streetViewControl: true,
            draggableCursor: 'move'
        };
        var map = new google.maps.Map(document.getElementById("map"), options);
    }
    window.onload = initialize;
</script>

<h2>GoogleMapOptions Demo</h2>

    <div id ="map" style="height: 397px; width: 513px">
    </div>

</asp:Content>

