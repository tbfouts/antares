# -*- coding: utf-8 -*-

import names
import databackend

def main():
    startApplication("GLOApp")
    
    datainterface = databackend.ws()
    datainterface.send("speed", 100)

    test.compare(str(waitForObjectExists(names.antares_Cluster_6_Text).text), "6")
    test.compare(str(waitForObjectExists(names.antares_Cluster_55_Text_2).color.name), "#ff0000")
    test.compare(waitForObjectExists(names.antares_Cluster_55_Text_2).color.red, 255)
    test.compare(waitForObjectExists(names.antares_Cluster_55_Text_2).color.green, 0)
    test.compare(waitForObjectExists(names.antares_Cluster_55_Text_2).color.blue, 0)
    test.compare(str(waitForObjectExists(names.antares_Cluster_0_Text).text), "100")

