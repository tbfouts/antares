# -*- coding: utf-8 -*-
import names
import databackend

def main():
    startApplication("GLOApp")
    datainterface = databackend.ws()
    datainterface.send("units", "Metric")


    test.compare(str(waitForObjectExists(names.antares_Cluster_KPH_Text).text), "KPH")
    test.verify(str(waitForObjectExists(names.antares_Cluster_13_3_km_Text).text).find("km"))
    test.verify(str(waitForObjectExists(names.antares_Cluster_15_C_Text).text).find("° C"))