
class IVI_General_Actions():
    
    @staticmethod
    def select_tab(input:str=None):
        mouseClick( Ivi_Objects.o_tabElement( input ))
        snooze(1)
        
