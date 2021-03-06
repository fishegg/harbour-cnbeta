/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
import QtQuick 2.0
import Sailfish.Silica 1.0
Page {
    id: aboutPage
    allowedOrientations: Orientation.Landscape | Orientation.Portrait | Orientation.LandscapeInverted
    SilicaFlickable {
        id: about
        anchors.fill: parent
        contentHeight: aboutRectangle.height

        VerticalScrollDecorator { flickable: about }

        Column {
            id: aboutRectangle
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            spacing: Theme.paddingSmall

            PageHeader {
                //: headline of application information page
                title: qsTr("关于")
            }

            Image {
                source: "../cover/icon.png"
                width: parent.width
                fillMode: Image.PreserveAspectFit
                horizontalAlignment: Image.AlignHCenter
            }

            Label {
                text:  "Cnbeta 0.7.3"
                horizontalAlignment: Text.Center
                width: parent.width - Theme.paddingLarge * 2
                anchors.horizontalCenter: parent.horizontalCenter
            }

            SectionHeader {
                //: headline for application description
                text: "描述"
            }

            Label {
                //: application description
                textFormat: Text.RichText;
                text: '<style>a:link { color: ' + Theme.highlightColor + '; }</style>此程序使用了<a href="http://cnbeta1.com/">http://cnbeta1.com/</a>'+
                      '的API,以及OSC <a href="https://git.oschina.net/ywwxhz/cnBeta-reader">cnBeta-reader</a>项目<br/>'+
                      "感谢梦梦提供的桌面图标.<br/> "+
                      "感谢coderus的黑科技方法绕过harbour校验<br/>"+
                      "如果你对本软件有什么好的想法，可以邮件联系我 Email:0312birdzhang@gmail.com<br/>"
                width: parent.width - Theme.paddingLarge * 2
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                font.pixelSize: Theme.fontSizeSmall
            }

            SectionHeader {
                //: headline for application licensing information
                text: "许可证"
            }

            Label {
                //: Copyright and license information
                text: qsTr("Copyright © by") + " 0312birzhang\n" + qsTr("License") + ": GPL v2"
                width: parent.width - Theme.paddingLarge * 2
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Theme.fontSizeSmall
            }
            SectionHeader {
                //: headline for application licensing information
                text: "设置"
            }
            Item{
                width: parent.width
                height:imgswitch.height
                TextSwitch {
                    id: imgswitch
                    checked: openimg == 1
                    onClicked: updateSetting()
                    description:"Wifi下默认显示图片"
                    text: "显示图片"
                }

            }

            SectionHeader {
                //: headline for application project information
                text: "项目源码"
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                textFormat: Text.RichText;
                text: "<style>a:link { color: " + Theme.highlightColor + "; }</style><a href=\"https://github.com/0312birdzhang/harbour-cnbeta\">https://github.com/0312birdzhang/harbour-cnbeta\</a>"
                width: parent.width - Theme.paddingLarge * 2
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Theme.fontSizeTiny

                onLinkActivated: {
                    Qt.openUrlExternally(link)
                }
            }
            SectionHeader {
                //: headline for application licensing information
                text: "改动日志"
            }
            Label {
                text:"version 0.7<br/>"+
                     "1.调整消息通知<br/>"+
                     "2.Wifi下默认显示图片<br/>"+
                    "version 0.6<br/>"+
                     "1.许多改动...这里要感谢蝉曦么么哒<br/>"+
                     "2.评论的支持跟反对可能是API的问题，即使提交成功也不工作<br/>"+
                    "version 0.5<br/>"+
                     "1.更改首页加载消息的api，可以分页查看旧消息<br/>"+
                     "2.文章中的链接点击可以用自带浏览器打开<br/>"+
                    "version 0.4<br/>
                        1.将设置有图无图入库，不必每次都要设置<br/>
                        2.去掉上滑菜单，添加刷新下拉菜单<br/>
                        3.微调界面<br/>"+
                        "version 0.3<br/>"+
                        "匹配其他设备分辨率"
                width: parent.width - Theme.paddingLarge * 2
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Theme.fontSizeSmall
            }
        }
    }
}
