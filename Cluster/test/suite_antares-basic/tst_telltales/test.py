
import names
import databackend

def main():
    startApplication("ClusterApp")
    # attachToApplication("samsung_tab")
    
    datainterface = databackend.ws()
    datainterface.send_test_name("Telltales ")
    datainterface.send("qsrIcons", True)

    snooze(3)

    # property based verification
    test.compare(waitForObject(names.antares_Cluster_qsrWarnings_ui).visible, True)
    
    # Screenshot verification of telltale presence
    test.vp("VP2")
    test.vp("VP3")

    datainterface.send("qsrIcons", False)
            
def waitUntilObjectReady( obj ):
    highlightObject(obj, 750)

