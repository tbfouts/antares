# -*- coding: utf-8 -*-
import databackend

def main():
    startApplication("ClusterApp")
    datainterface = databackend.ws()
    datainterface.send("doorLeft", True)
    snooze(2)
    test.vp("VP1")
    datainterface.send("doorLeft", False)
    datainterface.send("doorRight", True)
    snooze(2)
    test.vp("VP2")
    datainterface.send("doorLeft", False)
    datainterface.send("doorRight", False)    
    snooze(2)
    test.vp("VP3")