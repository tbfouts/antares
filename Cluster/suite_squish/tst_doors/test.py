# -*- coding: utf-8 -*-
import databackend

def main():
    startApplication("GLOApp")
    datainterface = databackend.ws()
    datainterface.send("doorLeft", True)
    datainterface.send("doorRight", True)
    snooze(2)
    test.vp("VP1")

