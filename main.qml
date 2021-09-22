import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.XmlListModel 2.0
import QtQuick.Controls 2.15

Window {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Hello World")
    color:'black'

    XmlListModel {
        id: xmlModel
        source: "movies.xml"
        query: "/Movies/Movie"

        XmlRole { name: "id"; query: "id/string()" }
        XmlRole { name: "name"; query: "name/string()" }
        XmlRole { name: "year"; query: "year/number()" }
        XmlRole { name: "rating"; query: "rating/string()" }
        XmlRole { name: "path"; query: "path/string()" }
    }

   ScrollView{
       width:parent.width
       height: 400
       clip: true
    ListView {
        id:list
        spacing:20
        width: parent.width; height: parent.width*0.5
        anchors.verticalCenter: parent.verticalCenter
        model: xmlModel
        clip:true
        orientation: ListView.Horizontal
        delegate:
            Rectangle{ id: rect; width: 300;height: 300; color:'gray'
            Image{
                id:id
                anchors.fill: parent
                source:path
                fillMode: Image.PreserveAspectFit
                scale:focus?1.2:1
                Behavior on scale {
                            PropertyAnimation{ duration: 2000 }
                }
                MouseArea{
                    id:area1
                    anchors.fill:parent

                        onClicked: {
                        id.scale=1.2

                  }


              }

                    //hoverEnabled: true

                    /*onEntered: {
                             // hobbit.scale=1.2
                              id.focus=true
                           }

                    onExited: {
                              // hobbit.scale=1
                               id.focus=false
                           }*/
                }
            }
             Text{
            width: parent.width*0.5
            height: parent.height*0.5
            color:'white'
            anchors.top:rect.bottom
            text: name + " " + year + " " + rating
           }
        }
     }
   }





