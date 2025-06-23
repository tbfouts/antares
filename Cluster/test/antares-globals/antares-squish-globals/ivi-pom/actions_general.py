
class IVI_General_Actions():
    
    @staticmethod
    def select_tab(input:str=None):
        # mouseClick( Ivi_Objects.tabElement( input ))
        mouseClick( Ivi.objects.tabElement( input ))
        snooze(1)
        
    @staticmethod
    def set_model_setting(setting:str=None, state:str=None):
        btn = Ivi._get_setting_btn_reference(setting)
        
        if state == None:
            #Blind toggle
            mouseClick( btn )
        elif ( state == 'on' and btn.checked == False ) or \
             ( state == 'off' and btn.checked == True ):
            # Explicit toggle state
            mouseClick( btn )
            
        
    @staticmethod
    def get_model_setting_state(setting:str=None) -> bool:
        return Ivi._get_setting_btn_reference(setting).checked
        
        
    @staticmethod
    def _get_setting_btn_reference(setting:str=None):
        input = setting.lower()
        if input == "lights":
            btn = Ivi.objects.lampsIndicator()
        elif input == "driver door":
            btn = Ivi.objects.driverDoorIndicator()
        elif input == "passenger door":
            btn = Ivi.objects.passengerDoorIndicator()
        elif input == "adas":
            btn = Ivi.objects.adasIndicator()
        else:
            test.fatal("Pass in valid 3D model setting")
        return btn
        