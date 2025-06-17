
import platform
import subprocess
from datetime import datetime

VEHICLE_SIMULATOR = None

class Setup():
    
    APPS = ["IVIApp", "ClusterApp"]
    
    def __init__(self, launchParameters:dict={}):
        """
            launchParameters [dict]
                keys: ["IVIApp", "ClusterApp"]
                values: ["launch", "attach"]
            reference usage:
                Setup( {"ClusterApp": "launch", "IVIApp", "attach" } )
        """
        global VEHICLE_SIMULATOR
        
        self.import_global_scripts()
        self.log_system_info()        
        self.app_launch_sequence(launchParameters)
        
        if "ClusterApp" in launchParameters.keys():
            VEHICLE_SIMULATOR = VehicleSimulatorWS()
            VEHICLE_SIMULATOR.send_test_name(str(squishinfo.testCaseName))
        
        
    def app_launch_sequence(self, params:dict):
        for app, launchMode in params.items():
            if app not in self.APPS:
                test.warning(f"Invalid AUT specified provided! Verify AUT name {app} registerred with squishserver")
                continue
            
            testSettings.setWrappersForApplication(app, ["Qt"])
            
            if launchMode == 'launch':
                startApplication(app)
            elif launchMode == 'attach':
                attachToApplication(app)
            else:
                test.warning(f"Invalid launch mode specified. `{launchMode}`")
            

    def import_global_scripts(self):
        #Generic globals
        self._safe_source_import('general-globals/context_switch.py')
        self._safe_source_import('general-globals/object_cache.py')
        self._safe_source_import('general-globals/object_searching.py')
        self._safe_source_import('general-globals/verify_image.py')
        self._safe_source_import('general-globals/utilities.py')
        self._safe_source_import('general-globals/pom_class_helpers.py')
        
        #Project POM directories
        self._safe_source_import('antares-squish-globals/cluster-pom/base.py')
        self._safe_source_import('antares-squish-globals/ivi-pom/base.py')
        
        #Non-UI Antares Helper Utils
        self._safe_source_import('antares-squish-globals/cluster_databackend.py')
        
    def _safe_source_import(self, filename:str):
        try:
            source(findFile('scripts', filename))
        except Exception as e:
            test.warning(f"Unable to find file or Error in file preventing import: {filename}")
            test.log(f"ERROR: {e}")
                
    def get_git_info(self):
        try:
            subprocess.run(['git', 'rev-parse', '--is-inside-work-tree'],
                           check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    
            commit_hash = subprocess.check_output(['git', 'rev-parse', 'HEAD']).decode().strip()
            commit_msg = subprocess.check_output(['git', 'log', '-1', '--pretty=%B']).decode().strip()
            commit_author = subprocess.check_output(['git', 'log', '-1', '--pretty=%an']).decode().strip()
            return {
                'commit_hash': commit_hash,
                'commit_msg': commit_msg,
                'commit_author': commit_author
            }
        except subprocess.CalledProcessError:
            return None


    def log_system_info(self):
    
        test.log(f"Squish version: {squishinfo.major}.{squishinfo.minor}.{squishinfo.patch}")
        test.log(f"Test Case: {squishinfo.testCaseName} of {squishinfo.testSuiteName}")
    
        test.log(f"Timestamp: {datetime.now().isoformat()}")
        test.log(f"OS: {platform.system()}")
        test.log(f"OS Version: {platform.version()}")
    
        git_info = self.get_git_info()
        if git_info:
            test.log(f"Git Commit Hash: {git_info['commit_hash']}")
            test.log(f"Git Commit Message: {git_info['commit_msg']}")
            test.log(f"Git Commit Author: {git_info['commit_author']}")
        else:
            test.log("Git Info: Not in a Git repository or unable to retrieve Git data")

        
        
    