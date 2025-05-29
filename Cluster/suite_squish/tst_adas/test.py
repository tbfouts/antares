# -*- coding: utf-8 -*-
import names
import databackend

def main():
    startApplication("ClusterApp")
    datainterface = databackend.ws()
    datainterface.send("adasEnabled", True)
    snooze(1)

    test.compare(str(waitForObjectExists(names.antares_Cluster_ADAS_Text_2).text), "ADAS")
    test.vp("VP1")

