#!/usr/bin/env python3

from .errors import *

JACKET_ID = 1


class Garderobot(object):
    def __init__(self, size):
        """
        :param size: the size of the wardrobe.

        {
            "123456": [1, 9, 5, 4],
            "789012": [7, 8]
        }
        """
        self.rack = dict()
        self.size = size

    def __str__(self):
        return repr(self.rack)

    def count(self) -> int:
        return sum([len(v) for k, v in self.rack])

    def has_space(self) -> bool:
        return self.count() < self.size

    # TODO implement
    def hang(self, position: int, id: int=JACKET_ID) -> object:
        if position < 0 or position >= self.size:
            raise WardrobeError("Position {} is not in range of the wardrobe!".format(position))

        if self.rack[position] > 0:
            raise WardrobeError("Position {} is already occupied!".format(position))

        self.rack[position] = id

        return self

    # TODO implement
    def take(self, position: int) -> str:
        if position < 0 or position >= self.size:
            raise WardrobeError("Position {} is not in range of the wardrobe!".format(position))

        if self.rack[position] == 0:
            raise WardrobeError("Position {} is not occupied!".format(position))

        id = self.rack[position]
        self.rack[position] = 0

        return id

    # TODO implement
    def autohang(self, id: int = JACKET_ID) -> str:
        return

    def empty(self) -> object:
        self.rack = dict()
        return self


if __name__ == "__main__":
    print("Initializing wardrobe...")
    wr = Garderobot(11)
    print(wr.count(), wr)
    print("Hanging a jacket on position 6...")
    wr.hang(6)
    print("Hanging a jacket on position 0...")
    wr.hang(0)
    print("Hanging a jacket on position 3...")
    wr.hang(3)
    print(wr.count(), wr)
    print("Taking a jacket from position 6...")
    wr.take(6)
    print(wr.count(), wr)

    try:
        print("Trying to hang a jacket on position 3...")
        wr.hang(3)
    except WardrobeError as e:
        print(e)
