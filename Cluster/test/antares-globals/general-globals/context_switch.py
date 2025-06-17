import squish

CLASS_APP_MAP = {'IviApp' : 'IVI',
                  'ClusterApp' : 'ClusterContext',
                  'Outrun_Local' : 'Outrun_IVI',
                  'Outrun_Android': 'OutrunTest'}

def context_switcher(func):
    def wrapper(self, *args, **kwargs):
        class_name = self.__class__.__name__
        if squish.currentApplicationContext().name != CLASS_APP_MAP[class_name]:
            # If the calling class doesn't currently have context, switch it
            squish.setApplicationContext(self.context)
            
        func(self, *args, **kwargs)    
    return wrapper


