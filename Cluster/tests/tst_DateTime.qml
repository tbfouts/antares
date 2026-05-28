import QtQuick
import QtTest
import Cluster

Item {
    id: root
    width: 200
    height: 200

    TestCase {
        name: "DateTimeTests"
        when: windowShown

        function test_singletonAccessible() {
            verify(DateTime !== null)
            compare(DateTime.timeString !== "", true)
        }

        function test_hoursInRange() {
            verify(DateTime.hours >= 0)
            verify(DateTime.hours <= 23)
            compare(DateTime.hours >= 0 && DateTime.hours <= 23, true)
        }

        function test_minutesInRange() {
            verify(DateTime.minutes >= 0)
            verify(DateTime.minutes <= 59)
            compare(DateTime.minutes >= 0 && DateTime.minutes <= 59, true)
        }

        function test_secondsInRange() {
            verify(DateTime.seconds >= 0)
            verify(DateTime.seconds <= 59)
            compare(DateTime.seconds >= 0 && DateTime.seconds <= 59, true)
        }

        function test_dayInRange() {
            verify(DateTime.day >= 0)
            verify(DateTime.day <= 6)
            compare(DateTime.day >= 0 && DateTime.day <= 6, true)
        }

        function test_dateInRange() {
            verify(DateTime.date >= 1)
            verify(DateTime.date <= 31)
            compare(DateTime.date >= 1 && DateTime.date <= 31, true)
        }

        function test_monthInRange() {
            verify(DateTime.month >= 0)
            verify(DateTime.month <= 11)
            compare(DateTime.month >= 0 && DateTime.month <= 11, true)
        }

        function test_timeStringFormat() {
            let parts = DateTime.timeString.split(":")
            compare(parts.length, 2)
        }

        function test_dateStringNotEmpty() {
            compare(DateTime.dateString !== "", true)
        }

        function test_timeUpdatesWithinInterval() {
            let initialSeconds = DateTime.seconds
            wait(1500)
            let secondsChanged = (DateTime.seconds !== initialSeconds)
            compare(secondsChanged, true)
        }
    }
}
