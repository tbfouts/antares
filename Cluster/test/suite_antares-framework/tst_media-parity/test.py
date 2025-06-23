
source(findFile('scripts', 'antares-setup.py'))


def main():
    """ NOTE: This test requires both the Antares IVI & Cluster apps to be mapped to squishserver """
     
    Setup( {'IVIApp': 'launch', 'ClusterApp': 'launch'} )
    
    """
     * Verify that Media Controls invoked in the IVI are reflected in the Cluster *
    """
    
    test.breakpoint()
    
    test.startSection("Set Song 1")
    expected_artist = "Pixel Pulse"
    
    test.startSection("Verify the artist set on the IVI")
    setApplicationContext(applicationContext('IVIApp'))
    Ivi.select_song(expected_artist)
    ivi_artist = str(Ivi.objects.artistName().text)
    test.verify(ivi_artist == expected_artist, f"Expected Artist Name: {expected_artist}. Observed value: {ivi_artist}")
    verify_image("IVI_Pixel_Pulse", Ivi.objects.mediaPlayerComponent())
    test.endSection()
    
    test.startSection("Verify the artist on the Cluster Media Player")
    setApplicationContext(applicationContext('ClusterApp'))
    cluster_artist = str(Cluster.objects.musicPlayerComponent().txtArtistText)
    test.verify(cluster_artist == expected_artist, f"Expected Artist Name: {expected_artist}. Observed value: {cluster_artist}")
    verify_image("Cluster_Pixel_Pulse", Cluster.objects.musicPlayerComponent())
    test.endSection()
    test.endSection()
    
    
    test.startSection("Set Song 2")
    expected_song = "Whispers of the Wind"
    
    test.startSection("Verify the song set on the IVI")
    setApplicationContext(applicationContext('IVIApp'))
    Ivi.select_song(expected_song)
    ivi_track = str( Ivi.objects.trackName().text )
    test.verify(ivi_track == expected_song, 
                f"Expected Track Name: {expected_song}, Observed value: {ivi_track}")
    verify_image("IVI_Wind_Whispers", Ivi.objects.mediaPlayerComponent())
    test.endSection()
    
    test.startSection("Verify the song on the Cluster Media Player")
    setApplicationContext(applicationContext('ClusterApp'))
    cluster_track = str(Cluster.objects.musicPlayerComponent().txtTrackText)
    test.verify(cluster_track == expected_song, f"Expected Artist Name: {expected_song}. Observed value: {cluster_track}")
    verify_image("Cluster_Pixel_Pulse", Cluster.objects.musicPlayerComponent())
    test.endSection()
    test.endSection()
    