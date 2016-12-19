class WardrobeError(Exception):
    def __init__(self, value: str):
        self.value = value

    def __str__(self):
        return repr(self.value)
