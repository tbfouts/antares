# Global dictionary to store cached results
class Collector():
    def __init__(self):
        self.object_cache = {}
        
    def clear_object(self, object):
        """
        object argument must be an input from a q_object such as q_dashboard_button
           - Do not include the parenthesis
        """
        self.object_cache.pop(object.__name__)


collector = Collector()

ENABLE_CACHING = True

# Decorator function
def cache_object(func):
    def wrapper():
        
        if not ENABLE_CACHING:
            # Guard clause to consider global enablement of the decorator
            result = func()
            
        if func.__name__ in collector.object_cache:
            return collector.object_cache[func.__name__]
        else:
            result = func()
            if result is not None:
                collector.object_cache[func.__name__] = result
            return result
    return wrapper
