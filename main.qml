import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtPositioning 5.3
import QtLocation 5.6

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Mapping")

    property bool test : true
    property var nantes : QtPositioning.coordinate(47.2172500, -1.5533600)
    property var iTech : QtPositioning.coordinate(47.223967, -1.637279)


    Plugin{
        id:plug
        name:"mapbox"
        PluginParameter{
            name:"mapbox.access_token"
            value:"pk.eyJ1IjoiY2hhcmJ5IiwiYSI6Ijc0ZTc1NjA5YjhlZTJiNGU1NzQ2OWFiYjNlYmYxMGNiIn0.mtjd_F2G1M81vCULJWzhGQ"
        }
        PluginParameter{
            name:"mapbox.map_id"
            value:"mapbox.mapbox-streets-v7"
        }
    }

    Map{
        id:map
        plugin: plug
        anchors.fill: parent
        property real zoum : 15.0
        center: test? nantes: src.position.coordinate
        zoomLevel: this.zoum
        Column{
            id:allZoom
            anchors.bottom:map.bottom
            anchors.right: map.right
            width : 50
            height : 150

            Button{
                id:zoomP
                text : "+"
                width:parent.width
                height : parent.height/3
                onClicked: {map.zoum=map.zoum+1.0}
            }
            Rectangle{
                id: fZoom
                height:zoomP.height
                width:zoomP.width
                color : "lightgrey"
                border.color: "white"
                border.width : 1
                Text{
                    id:tZoom
                    anchors.fill: parent
                    text:map.zoum
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button{
                id:zoomM
                text : "-"
                width:parent.width
                height : parent.height/3
                onClicked: {map.zoum=map.zoum-1.0}
            }
        }
        gesture.enabled: true

        Button{
            id:position
            text:"X"
            anchors.bottom: parent.bottom
            width : 50
            height : 50
            onClicked: map.center = src.position.coordinate
            visible: test? false:true
        }

        PositionSource{
            id:src
            updateInterval: 1000
            active: true

            onPositionChanged: {
                var coord = src.position.coordinate;
                console.log("Coordinate:", coord.longitude, coord.latitude);
            }

        }

        ListModel{
           id: gpsLocation
           ListElement{lat: 47.2172500; longitude: -1.5533600}
           ListElement{lat: 47.223967; longitude: -1.637279}
        }

        MapItemView {
            model: gpsLocation
            delegate: MapQuickItem {
                coordinate: QtPositioning.coordinate(lat, longitude)
                Component.onCompleted: {console.log(lat);}
                anchorPoint.x: image.width * 0.5
                anchorPoint.y: image.height

                sourceItem: Column {
                    Image { id: image; source: "marker.png" }
                    Text { text: title; font.bold: true }
                }
            }
        }

    }
}
