<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MultipleMarker.aspx.cs" Inherits="MultipleMarker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1Iw2axmiSRGnGh15d5TAtj0VHcwA4n38


&callback=initMap"
  type="text/javascript"></script>
<script type ="text/javascript">
    var map; var infowindow;
    function InitializeMap() {
        var latlng = new google.maps.LatLng(28.3949, 84.1240);
        var myOptions =
        {
            zoom: 8,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map"), myOptions);
    }


    function markicons() {

        InitializeMap();

        var ltlng = [];

        ltlng.push(new google.maps.LatLng(27.7365, 85.3304));
        ltlng.push(new google.maps.LatLng(27.6710, 85.4298));
        ltlng.push(new google.maps.LatLng(27.6644, 85.3188));

        map.setCenter(ltlng[0]);
        for (var i = 0; i <= ltlng.length; i++) {
            marker = new google.maps.Marker({
                map: map,
                position: ltlng[i]
            });

            (function (i, marker) {

                google.maps.event.addListener(marker, 'click', function () {

                    if (!infowindow) {
                        infowindow = new google.maps.InfoWindow();
                    }

                    infowindow.setContent("Messagesss" + i);

                    infowindow.open(map, marker);

                });

            })(i, marker);

        }

    }

    window.onload = markicons; 

</script>
<h2>Multiple Dustbin Tracer:</h2>
<div id ="map"   
style="width: 896px; top: 200px; left: 32px; position: absolute; height: 400px">

</div>
</asp:Content>

