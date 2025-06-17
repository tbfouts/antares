import builtins

def controlledMouseDrag(uiObject, x0=0, y0=0, dx=0, dy=0,
                            fromCenter=True, segments=100, delay=0.01, mode='mouse'):
    
    # Action will begin in center of object
    snooze(0.25)
    
    if fromCenter:
        mouseMove(uiObject)
        pos = QCursor.pos()
        start_x = pos.x
        start_y = pos.y
        
    else:
        mouseMove(uiObject, x0,  y0)
        pos = QCursor.pos()
        start_x = pos.x
        start_y = pos.y
    
    # test.log(f"x: {start_x}, y: {start_y}")
    snooze(0.5)
    mousePress()
    snooze(0.25)
        
    # pos = uiObject.mapToGlobal(QPoint(start_x + dx, start_y + dy))
    end_x = start_x + dx
    end_y = start_y + dy
    
    xStep = dx / segments
    yStep = dy / segments
    
    x = start_x
    y = start_y
    
    # test.log(f"x: {x}, y: {y}")
    
    while True:
        snooze(delay)
        x += xStep
        y += yStep
        # test.log(f"x: {x}, y: {y}")
        mouseMove(builtins.int(x), builtins.int(y))

        if (start_x < end_x and x >= end_x) or \
           (start_x > end_x and x <= end_x) or \
           (start_y < end_y and y >= end_y) or \
           (start_y > end_y and y <= end_y):
            break
        
    mouseRelease()
    snooze(0.5)
    
def controlledTouchDrag(uiObject, x0=0, y0=0, dx=0, dy=0,
                            fromCenter=True, segments=100, delay=0.01):
    
    # Action will begin in center of object
    snooze(0.25)
    
    touchAndDrag(uiObject,
                     builtins.int(x0),
                     builtins.int(y0),
                     builtins.int(dx),
                     builtins.int(dy),
                     0,
                     delay)
    """
    if fromCenter:
        start_x = uiObject.x + (uiObject.width / 2)
        start_y = uiObject.y + (uiObject.height / 2)
    else:
        start_x = x0
        start_y = y0
    
    # test.log(f"x: {start_x}, y: {start_y}")
    snooze(0.5)
    # touchPress(uiObject, start_x, start_y)
    # snooze(0.25)
        
    # pos = uiObject.mapToGlobal(QPoint(start_x + dx, start_y + dy))
    end_x = start_x + dx
    end_y = start_y + dy
    
    xStep = dx / segments
    yStep = dy / segments
    
    x = start_x
    y = start_y
    
    # test.log(f"x: {x}, y: {y}")
    
    while True:
        # snooze(delay)
        x += xStep
        y += yStep
        # test.log(f"x: {x}, y: {y}")
        # mouseMove(builtins.int(x), builtins.int(y))
        touchAndDrag(uiObject,
                     builtins.int(x),
                     builtins.int(y),
                     builtins.int(xStep),
                     builtins.int(yStep),
                     0,
                     delay)

        if (start_x < end_x and x >= end_x) or \
           (start_x > end_x and x <= end_x) or \
           (start_y < end_y and y >= end_y) or \
           (start_y > end_y and y <= end_y):
            break
        
    mouseRelease()
    """
    snooze(0.5)

