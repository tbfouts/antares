
import names
import databackend

def main():
    startApplication("GLOApp")
    
    datainterface = databackend.ws()
    datainterface.send("qsrIcons", True)

    snooze(3)

    test.compare(waitForObjectExists(names.antares_Cluster_qsrWarnings_ui).visible, True)
    test.vp("VP1")

