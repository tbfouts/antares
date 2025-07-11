

# Top-level object container definitions
built_with_Qt_QQuickWindowQmlImpl = {"title": "Built with Qt", "type": "QQuickWindowQmlImpl", "visible": True}
built_with_Qt_swipeView_SwipeView = {"container": built_with_Qt_QQuickWindowQmlImpl, "id": "swipeView", "type": "SwipeView", "unnamed": 1, "visible": True}

class Ivi_Objects():
        
    @staticmethod
    def appWindow():
        return waitForObject(built_with_Qt_QQuickWindowQmlImpl)
    
    @staticmethod
    def mainScreen():
        return waitForObject( {"container": built_with_Qt_QQuickWindowQmlImpl, "id": "mainScreen", "type": "Screen01.ui", "visible": True} )
    
    @staticmethod
    def mainSwipeView():
        return waitForObject( {"container": built_with_Qt_QQuickWindowQmlImpl, "id": "swipeView", "type": "SwipeView", "visible": True} )
    
    """  Top Bar Area  """
    @staticmethod
    def topBar():
        return waitForObject( {"container": built_with_Qt_QQuickWindowQmlImpl, "id": "topBar", "type": "TopBarSwipe.ui", "visible": True} )
    
    @staticmethod
    def lampsIndicator():
        return waitForObject( {"checkable": True, "container": built_with_Qt_QQuickWindowQmlImpl, "type": "Btn3DView.ui", "id": "btn3DViewLamps", "visible": True} )
    
    @staticmethod
    def driverDoorIndicator():
        return waitForObject( {"checkable": True, "container": built_with_Qt_QQuickWindowQmlImpl, "id": "btn3DViewDRVR", "type": "Btn3DView.ui", "visible": True} )
    
    @staticmethod    
    def passengerDoorIndicator():
        return waitForObject( {"checkable": True, "container": built_with_Qt_QQuickWindowQmlImpl, "id": "btn3DViewPSGR", "type": "Btn3DView.ui", "visible": True} )
    
    @staticmethod    
    def adasIndicator():
        return waitForObject( {"checkable": True, "container": built_with_Qt_QQuickWindowQmlImpl, "id": "btn3ADASview", "type": "Btn3DView.ui", "visible": True} )
        
        
    """  Tab Bar Area  """
    @staticmethod
    def tabBar():
        return waitForObject( {"container": built_with_Qt_QQuickWindowQmlImpl, "id": "tabBar", "type": "TabBar", "visible": True} )
    
    @staticmethod
    def tabElement(tabName:str=None):
        # Expected inputs: [Vehicle, Media, Navigation]
        return find_recursively( Ivi_Objects.tabBar(), {"carViewText": tabName}, max_search_depth=3)
    
    """  Vehicle/Car View  """
    @staticmethod
    def carView():
        return waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "carView3D", "type": "CarView3D.ui", "visible": True} )
    
    @staticmethod
    def carModel():
        return find_recursively( Ivi_Objects.carView(), {"id": "view3DCar"}, 2)
    
    @staticmethod
    def carModelInteractableArea():
        return find_recursively( Ivi_Objects.carModel(), {"id": "orbitCameraController"} )
    
    @staticmethod
    def carViewMediaPlayerComponent():
        # [props] txtArtistText, txtTrackText
        return waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "sideLTMediaPlayer", "type": "SideLTMediaPlayer.ui", "visible": True} )
    
    # This object is re-used on each page. Only need one reference
    @staticmethod
    def mediaPlayerControls():
        return find_recursively( Ivi_Objects.mainSwipeView(), {"id": "miniPlayer"} )
        # return waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "miniPlayer", "type": "MiniPlayer.ui", "visible": True} )
    
    @staticmethod
    def trackName():
        return find_recursively( Ivi_Objects.mediaPlayerControls(), {"id": "txtTrack"})
    
    @staticmethod
    def artistName():
        return find_recursively( Ivi_Objects.mediaPlayerControls(), {"id": "txtArtist"})
    
    @staticmethod
    def mediaPlayerPlayButton():
        return find_recursively( Ivi_Objects.mediaPlayerControls(), {"id": "btnPlayMedia"})
    
    @staticmethod
    def mediaPlayerNextButton():
        return find_recursively( Ivi_Objects.mediaPlayerControls(), {"id": "btnNext"})
    
    @staticmethod
    def mediaPlayerPrevButton():
        return find_recursively( Ivi_Objects.mediaPlayerControls(), {"id": "btnPrev"})
    
    @staticmethod
    def carViewRowControls():
        return waitForObjectExists( {"container": built_with_Qt_swipeView_SwipeView, "id": "row3DViews", "type": "Row", "unnamed": 1, "visible": True} )
    
    @staticmethod
    def carViewRowControl(selection:str=None):
        # Expected inputs: [SIDE, FRONT, REAR]
        return find_recursively( Ivi_Objects.carViewRowControls(), {"txtViewText": selection}, 1 )
    
        
    """  Media View  """
    @staticmethod
    def mediaView():
        return waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "mediaPlayerLayout", "type": "MediaPlayerLayout.ui"} )
    
    @staticmethod
    def mediaVolumeControl():
        # [props]: txtDialValueText
        return waitForObjectExists( {"container": built_with_Qt_swipeView_SwipeView, "id": "knobComponent", "type": "KnobComponent_1.ui", "visible": True} )
    
    @staticmethod
    def mediaPlayerComponent():
        return waitForObjectExists( {"container": built_with_Qt_swipeView_SwipeView, "id": "mediaPlayerWindow", "type": "MediaPlayerWindow.ui","visible": True} )
    
    @staticmethod
    def mediaScrollList():
        return waitForObjectExists( {"container": built_with_Qt_swipeView_SwipeView, "id": "scrollListPanel", "type": "ScrollListPanel.ui", "visible": True} )
    
    @staticmethod
    def trackBySubstring(substring:str=None):
        track_listview = waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "listViewTracks", "index": 0, "type": "ListViewTracks.ui", "unnamed": 1, "visible": True} )
        tracks = object.children(track_listview)
        for track in tracks:
            if substring in str(track.artistInfoText):
                return track
        test.fatal("Selected substring not found in track!")
        return None

    # Media Player Controls object is re-used on each page. See Car View section for object reference
    
    
    """ Navigation View  """
    @staticmethod
    def navigationView():
        return waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "navView", "type": "NavView.ui"} )
    
    @staticmethod
    def routePerformanceComponent():
        return waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "routePerformance", "type": "RoutePerformance.ui", "visible": True} )
    
    # Media Player Controls object is re-used on each page. See Car View section for object reference
    
    # Verify how the route options are in QML. Is all that text actually an SVG graphic?
    

    
        
        
