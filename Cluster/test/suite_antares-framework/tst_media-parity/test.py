
source(findFile('scripts', 'antares-setup.py'))


def main():
    Setup( {'IVIApp': 'launch', 'Cluster': 'launch'} )
    
    """
     * Verify that Media Controls invoked in the IVI are reflected in the Cluster *
    """
    
    test.startSection("Set Song 1")
    artist = "Pixel Pulse"
    Ivi.select_song(artist)
    
    test.startSection("Verify the song change on the IVI")
    test.verify(Ivi_Objects.o_artistName == artist, 
                f"Expected Artist Name: {artist}")
    verify_image("IVI_Pixel_Pulse_MediaPlayer", Ivi_Objects.o_mediaPlayerComponent())
    test.endSection()
    
    test.startSection("Verify the song on the Cluster Media Player")
    test.endSection()
    
    test.endSection()
    
    test.startSection("Set Song 2")
    song = "Whispers of the Wind"
    Ivi.select_song(song)
    
    test.startSection("Verify the song change on the IVI")
    test.verify(Ivi_Objects.o_trackName == song, 
                f"Expected Track Name: {song}")
    verify_image("IVI_Wind_Whispers_MediaPlayer", Ivi_Objects.o_mediaPlayerComponent())
    test.endSection()
    
    test.startSection("Verify the song on the Cluster Media Player")
    
    test.endSection()
    test.endSection()
    