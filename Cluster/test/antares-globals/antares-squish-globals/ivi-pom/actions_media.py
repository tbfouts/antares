
class IVI_Media_Actions():
    
    @staticmethod
    def select_song(input:str=None):
        """ Selects any song by song name or artist substring """
        
        track = Ivi_Objects.trackBySubstring(input)
        mouseClick( track )
        snooze(2)  # Gives time for IVI to update and send socket msg to Cluster
        