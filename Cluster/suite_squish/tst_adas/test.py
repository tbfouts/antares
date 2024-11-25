import names
import databackend

def main():
    startApplication("GLOApp")
    
    datainterface = databackend.ws()
    datainterface.send("adasEnabled", True)

    snooze(1)

    test.compare(str(waitForObjectExists(names.antares_Cluster_ADAS_Text).text), "ADAS")
    test.compare(str(waitForObjectExists(names.antares_Cluster_ADAS_ENGAGED_Text).text), "ADAS ENGAGED")