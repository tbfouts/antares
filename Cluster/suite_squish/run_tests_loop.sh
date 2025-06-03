#!/bin/bash

adb forward tcp:4711 tcp:4711
adb forward tcp:5555 tcp:5555

while true; do
    /Applications/Squish/9.0.1/Qt/bin/squishrunner --testsuite .
    echo "Test run completed. Starting next iteration..."
    sleep 1
done