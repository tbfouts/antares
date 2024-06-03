pragma Singleton
import QtQuick 2.0

Item {
    id: backend

    property string timeString: "00:00"
    property string dateString: ""

    /*!
        Returns the seconds (0–59) in the specified date according to local time.
    */
    property int seconds: 0

    /*!
        Returns the minutes (0–59) in the specified date according to local time.
    */
    property int minutes: 0

    /*!
        Returns the hour (0–23) in the specified date according to local time.
    */
    property int hours: 0

    /*!
        Returns the day of the week (0–6) for the specified date according to local time (starting with Sunday).
    */
    property int day: 0   

    /*!
        Returns the day of the month (1–31) for the specified date according to local time.
    */
    property int date: 0

    /*!
        Returns the month (0–11) in the specified date according to local time.
    */
    property int month: 0

    Component.onCompleted: hidden.update()

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            hidden.update()
        }
    }

    QtObject
    {
        id: hidden

        function update() {
            var currentDate = new Date()
            minutes = currentDate.getMinutes()
            hours = currentDate.getHours()
            seconds = currentDate.getSeconds()
            timeString = (hours > 12 ? (hours - 12) : hours) + ":" + (minutes < 10 ? ("0" + minutes) : minutes)

            day = currentDate.getDay()
            date = currentDate.getDate()
            month = currentDate.getMonth()
            dateString = getDayString(day) + ", " + getMonthString(month) + " " + date
        }

        function getDayString(day) {
            switch(day) {
              case 0:
                return "Sunday";
              case 1:
                return "Monday";
              case 2:
                return "Tuesday";
              case 3:
                return "Wednesday";
              case 4:
                return "Thursday";
              case 5:
                return "Friday";
              case 6:
                return "Saturday";
              default:
                return ""
            }
        }

        function getMonthString(month) {
            switch(month) {
              case 0:
                return "January";
              case 1:
                return "February";
              case 2:
                return "March";
              case 3:
                return "April";
              case 4:
                return "May";
              case 5:
                return "June";
              case 6:
                return "July";
              case 7:
                return "August";
              case 8:
                return "September";
              case 9:
                return "October";
              case 10:
                return "November";
              case 11:
                return "December";
              default:
                return ""
            }
        }
    }
}

