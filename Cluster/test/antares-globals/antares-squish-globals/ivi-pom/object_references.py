

# Top-level object container definitions
built_with_Qt_QQuickWindowQmlImpl = {"title": "Built with Qt", "type": "QQuickWindowQmlImpl", "visible": True}
built_with_Qt_swipeView_SwipeView = {"container": built_with_Qt_QQuickWindowQmlImpl, "id": "swipeView", "type": "SwipeView", "unnamed": 1, "visible": True}

class Ivi_Objects():
    
    # The metaclass argument is important. This way @staticmethod is not required on all methods. It gets applied during construction
    # class IVI_Objects(metaclass=StaticMethodMeta):
    
    @staticmethod
    def o_iviAppWindow():
        return waitForObject(built_with_Qt_QQuickWindowQmlImpl)
    
    @staticmethod
    def o_iviMainScreen():
        return waitForObject( {"container": built_with_Qt_QQuickWindowQmlImpl, "id": "mainScreen", "type": "Screen01.ui", "visible": True} )
    
    @staticmethod
    def o_iviMainSwipeView():
        return waitforObject( {"container": built_with_Qt_QQuickWindowQmlImpl, "id": "swipeView", "type": "SwipeView", "visible": True} )
    
    """  Top Bar Area  """
    @staticmethod
    def o_topBar():
        return waitForObject( {"container": built_with_Qt_QQuickWindowQmlImpl, "id": "topBar", "type": "TopBarSwipe.ui", "visible": True} )
    
    @staticmethod
    def o_lampsIndicator():
        return waitForObject( {"checkable": True, "container": built_with_Qt_QQuickWindowQmlImpl, "id": "btn3DViewLamps", "visible": True} )
    
    @staticmethod
    def o_driverDoorIndicator():
        return waitForObject( {"checkable": True, "container": built_with_Qt_QQuickWindowQmlImpl, "id": "btn3DViewDRVR", "type": "Btn3DView.ui", "visible": True} )
    
    @staticmethod    
    def o_passengerDoorIndicator():
        return waitForObject( {"checkable": True, "container": built_with_Qt_QQuickWindowQmlImpl, "id": "btn3DViewPSGR", "type": "Btn3DView.ui", "visible": True} )
    
    @staticmethod    
    def o_adasIndicator():
        return waitForObject( {"checkable": True, "container": built_with_Qt_QQuickWindowQmlImpl, "id": "btn3ADASview", "type": "Btn3DView.ui", "visible": True} )
        
        
    """  Tab Bar Area  """
    @staticmethod
    def o_tabBar():
        return waitForObject( {"container": built_with_Qt_QQuickWindowQmlImpl, "id": "tabBar", "type": "TabBar", "visible": True} )
    
    @staticmethod
    def o_tabElement(tabName:str=None):
        # Expected inputs: [Vehicle, Media, Navigation]
        return find_recursively( Ivi_Objects.o_tabBar(), {"carViewText": tabName}, max_search_depth=3)
    
    """  Vehicle/Car View  """
    @staticmethod
    def o_carView():
        return waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "carView3D", "type": "CarView3D.ui", "visible": True} )
    
    @staticmethod
    def o_carModel():
        return find_recursively( Ivi_Objects.o_carView(), {"id": "view3DCar"}, 2)
    
    @staticmethod
    def o_carModelInteractableArea():
        return find_recursively( Ivi_Objects.o_carModel(), {"id": "orbitCameraController"} )
    
    @staticmethod
    def o_carViewMediaPlayerComponent():
        # [props] txtArtistText, txtTrackText
        return waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "sideLTMediaPlayer", "type": "SideLTMediaPlayer.ui", "visible": True} )
    
    # This object is re-used on each page. Only need one reference
    @staticmethod
    def o_mediaPlayerControls():
        return waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "miniPlayer", "type": "MiniPlayer.ui", "visible": True} )
    
    @staticmethod
    def o_trackName():
        return find_recursively( Ivi_Objects.o_mediaPlayerControls(), {"id": "txtTrack"})
    
    @staticmethod
    def o_artistName():
        return find_recursively( Ivi_Objects.o_mediaPlayerControls(), {"id": "txtArtist"})
    
    @staticmethod
    def o_mediaPlayerPlayButton():
        return find_recursively( Ivi_Objects.o_mediaPlayerControls(), {"id": "btnPlayMedia"})
    
    @staticmethod
    def o_mediaPlayerNextButton():
        return find_recursively( Ivi_Objects.o_mediaPlayerControls(), {"id": "btnNext"})
    
    @staticmethod
    def o_mediaPlayerPrevButton():
        return find_recursively( Ivi_Objects.o_mediaPlayerControls(), {"id": "btnPrev"})
    
    @staticmethod
    def o_carViewRowControls():
        return waitForObjectExists( {"container": built_with_Qt_swipeView_SwipeView, "id": "row3DViews", "type": "Row", "unnamed": 1, "visible": True} )
    
    @staticmethod
    def o_carViewRowControl(selection:str=None):
        # Expected inputs: [SIDE, FRONT, REAR]
        return find_recursively( Ivi_Objects.o_carViewRowControls(), {"txtViewText": selection}, 1 )
    
        
    """  Media View  """
    @staticmethod
    def o_mediaView():
        return waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "mediaPlayerLayout", "type": "MediaPlayerLayout.ui"} )
    
    @staticmethod
    def o_mediaVolumeControl():
        # [props]: txtDialValueText
        return waitForObjectExists( {"container": built_with_Qt_swipeView_SwipeView, "id": "knobComponent", "type": "KnobComponent_1.ui", "visible": True} )
    
    @staticmethod
    def o_mediaPlayerComponent():
        return waitForObjectExists( {"container": built_with_Qt_swipeView_SwipeView, "id": "mediaPlayerWindow", "type": "MediaPlayerWindow.ui","visible": True} )
    
    @staticmethod
    def o_mediaScrollList():
        return waitForObjectExists( {"container": built_with_Qt_swipeView_SwipeView, "id": "scrollListPanel", "type": "ScrollListPanel.ui", "visible": True} )
    
    @staticmethod
    def o_trackBySubstring(substring:str=None):
        track_listview = waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "listViewTracks", "index": 0, "type": "ListViewTracks.ui", "unnamed": 1, "visible": True} )
        tracks = object.children(track_listview)
        for track in tracks:
            if substring in track.artistInfoText:
                return track
        test.fatal("Selected substring not found in track!")
        return None

    # Media Player Controls object is re-used on each page. See Car View section for object reference
    
    
    """ Navigation View  """
    @staticmethod
    def o_navigationView():
        return waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "navView", "type": "NavView.ui"} )
    
    @staticmethod
    def o_routePerformanceComponent():
        return waitForObject( {"container": built_with_Qt_swipeView_SwipeView, "id": "routePerformance", "type": "RoutePerformance.ui", "visible": True} )
    
    # Media Player Controls object is re-used on each page. See Car View section for object reference
    
    # Verify how the route options are in QML. Is all that text actually an SVG graphic?
    

    
        
        
