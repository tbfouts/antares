#!/bin/bash

while true; do
    /Applications/Squish/9.0.1/Qt/bin/squishrunner --testsuite .
    echo "Test run completed. Starting next iteration..."
    sleep 1
done