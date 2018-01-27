<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Layers.aspx.cs" Inherits="Layers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type ="text/javascript">
 var map 
    function InitializeMap() {
        var latlng = new google.maps.LatLng(-34.397, 150.644);
        var myOptions = {
            zoom: 8,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
       map = new google.maps.Map(document.getElementById("map"), myOptions);
    }
    window.onload = InitializeMap;
    var bikeLayer = new google.maps.BicyclingLayer();
    bikeLayer.setMap(map);
   
</script>
<h2>Creating Your First Google Map Demo:</h2>
<div id ="map"   style="width: 304px; top: 68px; left: 172px; position: absolute; height: 238px">

</div>
</asp:Content>

