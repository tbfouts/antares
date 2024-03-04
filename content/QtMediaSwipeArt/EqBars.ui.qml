import QtQuick
import QtQuick.Controls
import QtQuick.Timeline 1.0
import Data 1.0 as Data

Rectangle {
    id: eqBars
    width: 700
    height: 399
    color: "transparent"
    property alias eQAnimationRunning: eQAnimation.running

    Rectangle {
        id: bar20
        x: 658
        y: 159
        width: 30
        height: 229
        color: Data.Themes.themeColor3
        radius: 4
    }

    Rectangle {
        id: bar19
        x: 624
        y: 203
        width: 30
        height: 185
        color: Data.Themes.themeColor3
        radius: 4
    }

    Rectangle {
        id: bar18
        x: 590
        y: 131
        width: 30
        height: 257
        color: Data.Themes.themeColor3
        radius: 4
    }

    Rectangle {
        id: bar17
        x: 556
        y: 66
        width: 30
        height: 322
        color: Data.Themes.themeColor2
        radius: 4
    }

    Rectangle {
        id: bar16
        x: 522
        y: 99
        width: 30
        height: 289
        color: Data.Themes.themeColor2
        radius: 4
    }

    Rectangle {
        id: bar15
        x: 488
        y: 33
        width: 30
        height: 355
        color: Data.Themes.themeColor2
        radius: 4
    }

    Rectangle {
        id: bar14
        x: 454
        y: 73
        width: 30
        height: 315
        color: Data.Themes.themeColor2
        radius: 4
    }

    Rectangle {
        id: bar13
        x: 420
        y: 83
        width: 30
        height: 305
        color: Data.Themes.themeColor1
        radius: 4
    }

    Rectangle {
        id: bar12
        x: 386
        y: 49
        width: 30
        height: 339
        color: Data.Themes.themeColor1
        radius: 4
    }

    Rectangle {
        id: bar11
        x: 352
        y: 33
        width: 30
        height: 355
        color: Data.Themes.themeColor1
        radius: 4
    }

    Rectangle {
        id: bar10
        x: 318
        y: 6
        width: 30
        height: 355
        color: Data.Themes.themeColor1
        radius: 4
    }

    Rectangle {
        id: bar9
        x: 284
        y: 61
        width: 30
        height: 322
        color: Data.Themes.themeColor1
        radius: 4
    }

    Rectangle {
        id: bar8
        x: 250
        y: 28
        width: 30
        height: 347
        color: Data.Themes.themeColor1
        radius: 4
    }

    Rectangle {
        id: bar7
        x: 216
        y: 72
        width: 30
        height: 339
        color: Data.Themes.themeColor2
        radius: 4
    }

    Rectangle {
        id: bar6
        x: 182
        y: 47
        width: 30
        height: 273
        color: Data.Themes.themeColor2
        radius: 4
    }

    Rectangle {
        id: bar5
        x: 148
        y: 55
        width: 30
        height: 297
        color: Data.Themes.themeColor2
        radius: 4
    }

    Rectangle {
        id: bar4
        x: 114
        y: 113
        width: 30
        height: 319
        color: Data.Themes.themeColor2
        radius: 4
    }

    Rectangle {
        id: bar3
        x: 80
        y: 124
        width: 30
        height: 195
        color: Data.Themes.themeColor3
        radius: 4
    }

    Rectangle {
        id: bar2
        x: 46
        y: 205
        width: 30
        height: 225
        color: Data.Themes.themeColor3
        radius: 4
    }

    Rectangle {
        id: bar1
        x: 12
        y: 230
        width: 30
        height: 278
        color: Data.Themes.themeColor3
        radius: 4
    }

    Timeline {
        id: eQtimeline
        animations: [
            TimelineAnimation {
                id: eQAnimation
                running: true
                loops: -1
               // duration: dial.value = Math.max(600, Math.min(dial.value + 100, 1600))
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: true

        KeyframeGroup {
            target: bar10
            property: "y"
            Keyframe {
                value: 33
                frame: 0
            }

            Keyframe {
                value: 33
                frame: 1000
            }

            Keyframe {
                value: 83
                frame: 583
            }

            Keyframe {
                value: 41
                frame: 229
            }

            Keyframe {
                value: 6
                frame: 737
            }
        }

        KeyframeGroup {
            target: bar11
            property: "y"
            Keyframe {
                value: 33
                frame: 0
            }

            Keyframe {
                value: 33
                frame: 1000
            }

            Keyframe {
                value: 83
                frame: 464
            }

            Keyframe {
                value: 41
                frame: 387
            }

            Keyframe {
                value: 6
                frame: 798
            }
        }

        KeyframeGroup {
            target: bar9
            property: "y"
            Keyframe {
                value: 66
                frame: 0
            }

            Keyframe {
                value: 66
                frame: 1000
            }

            Keyframe {
                value: 25
                frame: 301
            }

            Keyframe {
                value: 88
                frame: 525
            }

            Keyframe {
                value: 61
                frame: 696
            }
        }

        KeyframeGroup {
            target: bar12
            property: "y"
            Keyframe {
                value: 66
                frame: 0
            }

            Keyframe {
                value: 66
                frame: 1000
            }

            Keyframe {
                value: 25
                frame: 166
            }

            Keyframe {
                value: 88
                frame: 383
            }

            Keyframe {
                value: 61
                frame: 696
            }
        }

        KeyframeGroup {
            target: bar8
            property: "y"
            Keyframe {
                value: 80
                frame: 0
            }

            Keyframe {
                value: 80
                frame: 1000
            }

            Keyframe {
                value: 61
                frame: 254
            }

            Keyframe {
                value: 80
                frame: 430
            }

            Keyframe {
                value: 28
                frame: 604
            }
        }

        KeyframeGroup {
            target: bar13
            property: "y"
            Keyframe {
                value: 80
                frame: 0
            }

            Keyframe {
                value: 80
                frame: 1000
            }

            Keyframe {
                value: 61
                frame: 432
            }

            Keyframe {
                value: 80
                frame: 608
            }

            Keyframe {
                value: 28
                frame: 782
            }
        }

        KeyframeGroup {
            target: bar7
            property: "y"
            Keyframe {
                value: 49
                frame: 0
            }

            Keyframe {
                value: 49
                frame: 1000
            }

            Keyframe {
                value: 22
                frame: 75
            }

            Keyframe {
                value: 56
                frame: 367
            }

            Keyframe {
                value: 22
                frame: 567
            }

            Keyframe {
                value: 72
                frame: 712
            }
        }

        KeyframeGroup {
            target: bar14
            property: "y"
            Keyframe {
                value: 49
                frame: 0
            }

            Keyframe {
                value: 49
                frame: 1000
            }

            Keyframe {
                value: 22
                frame: 75
            }

            Keyframe {
                value: 56
                frame: 367
            }

            Keyframe {
                value: 22
                frame: 567
            }

            Keyframe {
                value: 72
                frame: 712
            }
        }

        KeyframeGroup {
            target: bar6
            property: "y"
            Keyframe {
                value: 75
                frame: 0
            }

            Keyframe {
                value: 75
                frame: 1000
            }

            Keyframe {
                value: 106
                frame: 304
            }

            Keyframe {
                value: 66
                frame: 543
            }

            Keyframe {
                value: 47
                frame: 740
            }
        }

        KeyframeGroup {
            target: bar15
            property: "y"
            Keyframe {
                value: 75
                frame: 0
            }

            Keyframe {
                value: 75
                frame: 1000
            }

            Keyframe {
                value: 106
                frame: 304
            }

            Keyframe {
                value: 66
                frame: 543
            }

            Keyframe {
                value: 47
                frame: 740
            }
        }

        KeyframeGroup {
            target: bar5
            property: "y"
            Keyframe {
                value: 91
                frame: 0
            }

            Keyframe {
                value: 91
                frame: 1000
            }

            Keyframe {
                value: 40
                frame: 269
            }

            Keyframe {
                value: 57
                frame: 520
            }

            Keyframe {
                value: 122
                frame: 717
            }

            Keyframe {
                value: 55
                frame: 857
            }
        }

        KeyframeGroup {
            target: bar16
            property: "y"
            Keyframe {
                value: 91
                frame: 0
            }

            Keyframe {
                value: 91
                frame: 1000
            }

            Keyframe {
                value: 40
                frame: 269
            }

            Keyframe {
                value: 57
                frame: 520
            }

            Keyframe {
                value: 122
                frame: 717
            }

            Keyframe {
                value: 55
                frame: 857
            }
        }

        KeyframeGroup {
            target: bar4
            property: "y"
            Keyframe {
                value: 128
                frame: 0
            }

            Keyframe {
                value: 128
                frame: 1000
            }

            Keyframe {
                value: 79
                frame: 338
            }

            Keyframe {
                value: 128
                frame: 530
            }

            Keyframe {
                value: 113
                frame: 728
            }
        }

        KeyframeGroup {
            target: bar17
            property: "y"
            Keyframe {
                value: 128
                frame: 0
            }

            Keyframe {
                value: 128
                frame: 1000
            }

            Keyframe {
                value: 79
                frame: 338
            }

            Keyframe {
                value: 128
                frame: 530
            }

            Keyframe {
                value: 113
                frame: 728
            }
        }

        KeyframeGroup {
            target: bar3
            property: "y"
            Keyframe {
                value: 113
                frame: 0
            }

            Keyframe {
                value: 113
                frame: 1000
            }

            Keyframe {
                value: 163
                frame: 259
            }

            Keyframe {
                value: 144
                frame: 495
            }

            Keyframe {
                value: 169
                frame: 649
            }

            Keyframe {
                value: 124
                frame: 838
            }
        }

        KeyframeGroup {
            target: bar18
            property: "y"
            Keyframe {
                value: 113
                frame: 0
            }

            Keyframe {
                value: 113
                frame: 1000
            }

            Keyframe {
                value: 163
                frame: 259
            }

            Keyframe {
                value: 144
                frame: 495
            }

            Keyframe {
                value: 169
                frame: 649
            }

            Keyframe {
                value: 124
                frame: 838
            }
        }

        KeyframeGroup {
            target: bar2
            property: "y"
            Keyframe {
                value: 168
                frame: 0
            }

            Keyframe {
                value: 168
                frame: 1000
            }

            Keyframe {
                value: 111
                frame: 91
            }

            Keyframe {
                value: 204
                frame: 507
            }

            Keyframe {
                value: 150
                frame: 696
            }

            Keyframe {
                value: 205
                frame: 862
            }
        }

        KeyframeGroup {
            target: bar19
            property: "y"
            Keyframe {
                value: 168
                frame: 0
            }

            Keyframe {
                value: 168
                frame: 1000
            }

            Keyframe {
                value: 111
                frame: 91
            }

            Keyframe {
                value: 204
                frame: 507
            }

            Keyframe {
                value: 150
                frame: 696
            }

            Keyframe {
                value: 205
                frame: 862
            }
        }

        KeyframeGroup {
            target: bar1
            property: "y"
            Keyframe {
                value: 143
                frame: 0
            }

            Keyframe {
                value: 143
                frame: 1000
            }

            Keyframe {
                value: 109
                frame: 224
            }

            Keyframe {
                value: 166
                frame: 449
            }

            Keyframe {
                value: 230
                frame: 875
            }
        }

        KeyframeGroup {
            target: bar20
            property: "y"
            Keyframe {
                value: 143
                frame: 0
            }

            Keyframe {
                value: 143
                frame: 1000
            }

            Keyframe {
                value: 109
                frame: 224
            }

            Keyframe {
                value: 166
                frame: 449
            }

            Keyframe {
                value: 230
                frame: 875
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"fca4d525-2cac-5d53-a981-4631ef7d7c23"}D{i:1;uuid:"c157b831-46bb-56c1-a2d6-442453210e41"}
D{i:2;uuid:"b57857c3-b5a9-5d9e-b8d8-3a8481c22600"}D{i:3;uuid:"864330de-250f-5521-b050-4cb00046e80f"}
D{i:4;uuid:"81e60297-4f1e-5ca4-af7b-705086f430ac"}D{i:5;uuid:"126fd8d6-aff0-5cbf-9cd3-3627e8bc2a73"}
D{i:6;uuid:"b5674341-5d32-596d-ab2f-731adefeb8f6"}D{i:7;uuid:"b57a3716-70e2-5f16-97e0-c7cdf6ef3619"}
D{i:8;uuid:"94206b40-19bd-5b88-aafb-1ce5d4dfd433"}D{i:9;uuid:"43e3d4e0-9a91-59ec-a981-7efd2d1d4d6c"}
D{i:10;uuid:"625cc2ae-faf4-53a7-92c9-283160d61557"}D{i:11;uuid:"cfbb7cee-4cb3-59ec-8c05-a27ada3e91ba"}
D{i:12;uuid:"e5a917fb-bf37-5bf0-ae35-642da89b0bcf"}D{i:13;uuid:"a14d30f6-0e64-5340-9fc4-e3bd2e100934"}
D{i:14;uuid:"daca4806-5c88-522d-b47b-15bd86594c91"}D{i:15;uuid:"83b8ef31-5f87-5441-8232-99f10eaee08a"}
D{i:16;uuid:"4737a96a-6b05-5900-9f6a-b0ff83f7d252"}D{i:17;uuid:"4afa61f1-f47a-5131-a122-bc39511354ce"}
D{i:18;uuid:"5f4d10f8-557c-5615-b7c7-90f54ef5ab4b"}D{i:19;uuid:"df915974-00d1-5410-a781-18b7c5396e00"}
D{i:20;uuid:"cfca1146-940e-5664-8901-5794b1c0d6e3"}
}
##^##*/

