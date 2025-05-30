
import names
import databackend

def main():
    attachToApplication("samsung_tab")
    
    datainterface = databackend.ws()
    datainterface.send_test_name("Telltales ")
    datainterface.send("qsrIcons", True)

    snooze(3)

    test.compare(waitForObject(names.antares_Cluster_qsrWarnings_ui).visible, True)
    
    datainterface.send("qsrIcons", False)
            
def waitUntilObjectReady( obj ):
    highlightObject(obj, 750)

