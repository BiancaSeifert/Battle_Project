import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.4

ApplicationWindow{
    id: window
    minimumHeight: 720
    minimumWidth: 1280
    width: 1280
    height: 720
    title: "Who Would Win?"
    visible: true

    header: Rectangle {
        id: header
        height: 60
        color: 'Orange'

        Text{
            id: header_text
            font.pixelSize: 20
            anchors.horizontalCenter: header.horizontalCenter //COMMENT
            anchors.verticalCenter: header.verticalCenter
            text: "Who Would Win?"
            color: 'white'
        }
    }


    StackView{
        id: main
        anchors.fill: parent
        Rectangle {
            width: 400
            height: 300
            id: image
            anchors.horizontalCenter:parent.horizontalCenter
            AnimatedImage { id: animation;
            source: "../assets/svb.webp"
            anchors.fill:parent}
        }
        Button{
            id: fight_button
            text: "FIGHT!"
            anchors.top: image.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked:{
                    var data = {
                        "Intelligence_x": name1_int_slider.value,
                        "Strength_x": name1_str_slider.value,
                        "Speed_x": name1_spe_slider.value,
                        "Durability_x": name1_dur_slider.value,
                        "Power_x": name1_pow_slider.value,
                        "Combat_x": name1_com_slider.value,
                        "Intelligence_y": name2_int_slider.value,
                        "Strength_y": name2_str_slider.value,
                        "Speed_y": name2_spe_slider.value,
                        "Durability_y": name2_dur_slider.value,
                        "Power_y": name2_pow_slider.value,
                        "Combat_y": name2_com_slider.value
                }
                var name1 = name_text.text
                var name2 = name2_text.text
                backend.fight_pred(JSON.stringify(data), name1, name2);
            }
        }
        TextField {
            id: name_text
            placeholderText: qsTr("Enter name")
            anchors.top: parent.top
            anchors.horizontalCenter: left_grid.horizontalCenter
            anchors.topMargin: 10
            anchors.bottomMargin: 10
}
        Grid{
            id: left_grid
            anchors.margins: 25
            anchors.top: name_text.bottom
            columns: 2
            spacing: 2
            width: 350; height: 150
            anchors.left: parent.left
            anchors.right: image.left
            Text{
                anchors.margins: 25
                id: name1_int_text
                text: "Intelligence"
                font.pixelSize: 18
            }
            Slider {
                stepSize: 0.25
                anchors.margins: 25
                id: name1_int_slider
                from: 0
                value: 50
                to: 100
            }
            Text{
                anchors.margins: 25
                id: name1_str_text
                text: "Strength"
                font.pixelSize: 18
            }
            Slider {
                stepSize: 0.25
                anchors.margins: 25
                id: name1_str_slider
                from: 0
                value: 50
                to: 100
            }
            Text{
                anchors.margins: 25
                id: name1_spe_text
                text: "Speed"
                font.pixelSize: 18
            }
            Slider {
                stepSize: 0.25
                anchors.margins: 25
                id: name1_spe_slider
                from: 0
                value: 50
                to: 100
            }
            Text{
                anchors.margins: 25
                id: name1_dur_text
                text: "Durability"
                font.pixelSize: 18
            }
            Slider {
                stepSize: 0.25
                anchors.margins: 25
                id: name1_dur_slider
                from: 0
                value: 50
                to: 100
            }
            Text{
                anchors.margins: 25
                id: name1_pow_text
                text: "Power"
                font.pixelSize: 18
            }
            Slider {
                stepSize: 0.25
                anchors.margins: 25
                id: name1_pow_slider
                from: 0
                value: 50
                to: 100
            }
            Text{
                anchors.margins: 25
                id: name1_com_text
                text: "Combat"
                font.pixelSize: 18
            }
            Slider {
                stepSize: 0.25
                anchors.margins: 25
                id: name1_com_slider
                from: 0
                value: 50
                to: 100
            }
        }
        TextField {
            id: name2_text
            placeholderText: qsTr("Enter name")
            anchors.top: parent.top
            anchors.horizontalCenter: right_grid.horizontalCenter
            anchors.topMargin: 10
            anchors.bottomMargin: 10
}
        Grid{
            id: right_grid   
            anchors.margins: 25
            anchors.top:name2_text.bottom
            columns: 2
            spacing: 2
            width: 350; height: 150
            anchors.left: image.right
            anchors.right: parent.right
            Text{
                anchors.margins: 25
                id: name2_int_text
                text: "Intelligence"
                font.pixelSize: 18
            }
            Slider {
                stepSize: 0.25
                anchors.margins: 25
                id: name2_int_slider
                from: 0
                value: 50
                to: 100
            }
            Text{
                anchors.margins: 25
                id: name2_str_text
                text: "Strength"
                font.pixelSize: 18
            }
            Slider {
                stepSize: 0.25
                anchors.margins: 25
                id: name2_str_slider
                from: 0
                value: 50
                to: 100
            }
            Text{
                anchors.margins: 25
                id: name2_spe_text
                text: "Speed"
                font.pixelSize: 18
            }
            Slider {
                stepSize: 0.25
                anchors.margins: 25
                id: name2_spe_slider
                from: 0
                value: 50
                to: 100
            }
            Text{
                anchors.margins: 25
                id: name2_dur_text
                text: "Durability"
                font.pixelSize: 18
            }
            Slider {
                stepSize: 0.25
                anchors.margins: 25
                id: name2_dur_slider
                from: 0
                value: 50
                to: 100
            }
            Text{
                anchors.margins: 25
                id: name2_pow_text
                text: "Power"
                font.pixelSize: 18
            }
            Slider {
                stepSize: 0.25
                anchors.margins: 25
                id: name2_pow_slider
                from: 0
                value: 50
                to: 100
            }
            Text{
                anchors.margins: 25
                id: name2_com_text
                text: "Combat"
                font.pixelSize: 18
            }
            Slider {
                stepSize: 0.25
                anchors.margins: 25
                id: name2_com_slider
                from: 0
                value: 50
                to: 100
            }
        }

}
    Component.onCompleted: {
        backend.completed('App loaded');
        alert.visible = false
    }

    // Creates a connection to our backend. This exposes Slot() functions with to this QML script and it's children
    Connections {
        target: backend

        // implementation of a signal emitted by the backend
        function onAlert(msg){
            alert.message = msg
            alert.visible = true
            alert.startAnim();
        }
    }

    Rectangle{
        id: alert
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: 50
        height: 50
        width: 750
        color: "green"
        property alias message: alert_msg.text

        SequentialAnimation {
            id: anim
            NumberAnimation { target: alert; property: "x"; to: alert.x - 25; duration: 10}
            NumberAnimation { target: alert; property: "x"; to: alert.x + 25; duration: 10}
            NumberAnimation { target: alert; property: "x"; to: alert.x; duration: 10}
        }

        ImageButton{
            id: exit_button
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            imageSource: "../assets/close_button_white.png"
            onClicked: {
            alert.visible = false
            }
        }

        Text {
            id: alert_msg
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.right: exit_button.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            text: ""
            font.pointSize: 20
            color: "white"
            wrapMode: Text.WordWrap
        }
        visible: true

        function startAnim(){
            anim.restart();
        }
    }
}