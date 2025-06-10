

class StaticMethodMeta(type):
    def __new__(cls, name, bases, dct):
        for key, val in dct.items():
            if callable(val) and not key.startswith("__"):
                dct[key] = staticmethod(val)
        return super().__new__(cls, name, bases, dct)