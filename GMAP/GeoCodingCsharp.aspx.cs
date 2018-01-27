using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Xml.Linq;

public partial class GeoCodingCsharp : System.Web.UI.Page
{
    static string baseUri = "http://maps.googleapis.com/maps/api/geocode/xml?latlng={0},{1}&sensor=false";
    string location = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public static Coordinate GetCoordinates(string region)
    {
        using (var client = new WebClient())
        {

            string uri = "http://maps.google.com/maps/geo?q='" + region + "'&output=csv&key=ABQIAAAAzr2EBOXUKnm_jVnk0OJI7xSosDVG8KKPE1-m51RBrvYughuyMxQ-i1QfUnH94QxWIa6N4U6MouMmBA";

            string[] geocodeInfo = client.DownloadString(uri).Split(',');

            return new Coordinate(Convert.ToDouble(geocodeInfo[2]), Convert.ToDouble(geocodeInfo[3]));
        }
    }

    public struct Coordinate
    {
        private double lat;
        private double lng;

        public Coordinate(double latitude, double longitude)
        {
            lat = latitude;
            lng = longitude;

        }

        public double Latitude { get { return lat; } set { lat = value; } }
        public double Longitude { get { return lng; } set { lng = value; } }

    }

    //Reverse Gecoding
    public static void RetrieveFormatedAddress(string lat, string lng)
    {
        string requestUri = string.Format(baseUri, lat, lng);

        using (WebClient wc = new WebClient())
        {
            string result = wc.DownloadString(requestUri);
            var xmlElm = XElement.Parse(result);
            var status = (from elm in xmlElm.Descendants() where elm.Name == "status" select elm).FirstOrDefault();
            if (status.Value.ToLower() == "ok")
            {
                var res = (from elm in xmlElm.Descendants() where elm.Name == "formatted_address" select elm).FirstOrDefault();
                requestUri = res.Value;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        double Lat = GetCoordinates("Hyderabad").Latitude;
        double Lng = GetCoordinates("Hyderabad").Longitude;
        Button1.Attributes.Add("onclick", "return FindLocaiton('"+Lat+"','"+Lng+"') ");
    }
}