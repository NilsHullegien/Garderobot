#!/usr/bin/env python3

#from .errors import *

class Garderobot(object):
  
    def __init__(self, size, threshold):
        """
        :param size: the size of the wardrobe.
        :param threshold: the treshold for the balance to be okay. 

        {
            "123456": [1, 9, 5, 4],
            "789012": [7, 8]
        }
        """
        
        self.rack = {} 
        self.size = size
        self.threshold = threshold
        self.procList = [0,4,8,1,5,9,2,7,6,3,10]

    def __str__(self):
        return repr(self.rack)

    def count(self):
      length = 0
      for v in self.rack.values():
        length = length + len(v)
      return length
      
    def has_space(self):
        return self.count() < self.size

    def hang(self, customer_id):
        position = self.generatePosition()
        if self.rack.has_key(customer_id):
          self.rack[customer_id].append(position)
        else:
          self.rack[customer_id] = [position]  
          
        print(self.rack)

        return self

    # TODO implement
    def take(self, customer_id, position=-1):
        print("BEFORE TAKE")
        print(self.rack)
        if(position < 0):
            if len(self.rack[customer_id]) == 1: #Extra check
                self.pickup_jacket(self.rack[customer_id])
                self.rack.pop(customer_id)
            else:
              raise Exception("PROGRAMMING FAILURE IN TAKE METHOD (Pos < 0)")
            
        else: # position >= 0
          if position in self.rack[customer_id]: #Extra check
              SELF.pickup_jacket(position)
              self.rack[customer_id].remove(position)
          else:
            raise Exception("PROGRAMMING FAILURE IN TAKE METHOD (Pos >=0)")
          
        print("AFTER TAKE")
        print(self.rack)
        print("============")
        return self

    #Find all the occupied positions in the carousel.
    #Returns a list
    def findOccupied(self):
      occupiedList = []
      for key, value in self.rack.iteritems():
        for pos in value:
          occupiedList.append(pos)
      
      print(occupiedList)
      return occupiedList

    def generatePosition(self):
        listOfOccupiedPositions = self.findOccupied()
        print("OCCUPIED: ", listOfOccupiedPositions)
        sequencePosition = -1
        for item in self.procList:
          if item not in listOfOccupiedPositions:
            sequencePosition = item
            break
        print(sequencePosition)
        errorPos, errorNr,okay = self.isBalanceOkay(sequencePosition, listOfOccupiedPositions)
        print("Position:", errorPos)
        if(okay):
          return sequencePosition		
        else:
          print("BAD POSITION")
          print("ErrorNR", errorNr)
          if errorNr < 0:
            if errorPos == "fs":
              return searchForFreePos(0,size/2)
            elif errorPos == "tb":
              try_1 = searchForFreePos(0,size/4)
              if try_1 == -1:
                return searchForFreePos(size*3/4,size/4)
              else:
                return try_1
            else:
              raise Exception("PROGRAMMER FAILURE <0: ",errorPos)
          elif errorNr > 0:
            if errorPos == "fs":
              return searchForFreePos(size/2,size)
            elif errorPos == "tb":
              return searchForFreePos(size/4,size*3/4)
            else:
              raise Exception("PROGRAMMER FAILURE >0: ",errorPos)
          else:
            raise Exception("WEIRD ERROR") 		


    #Search for a free spot in the range(start,end).
    #Returns the position or -1 when no position is found in the range.
    def searchForFreePos(start,end):
      print("Searching in range: ", start, "to", end)
      for i in range(start,end):
        print("Checking: ",i)
        print("Value: ",positions[i])
        if positions[i] == 0:
          return i
      return -1

    #Checks if the balance of the carousel is considered good enough.
    #Uses the threshold value.
    #Returns: 
    #A not balanced "axis", denoted by either fs or tb. Empty string when the balance is okay.
    #The value of the difference in the number of jackets, between the two sides given in the first return value. 0 when everything is balanced.
    #True/False whether or not the carousel is balanced.
    def isBalanceOkay(self, seqPos, positions_list):
      firstHalf = 0
      secondHalf = 0
      topHalf = 0
      bottomHalf = 0
      if seqPos < self.size/2:
        firstHalf+=1
      else:
        secondHalf+=1
      if seqPos < self.size/4 or seqPos > self.size * 3/4:
        topHalf+=1
      else:
        bottomHalf+=1
        
      for index, item in enumerate(positions_list):
        if item != 0:
          if index < self.size/2:
            firstHalf+=1
          elif index >= self.size/2:
            secondHalf+=1
          
          if index <= self.size/4 or index >= self.size*3/4:
            topHalf+=1
          elif index > self.size/4 and index < self.size * 3/4:
            bottomHalf+=1

      if abs(firstHalf - secondHalf) <= self.threshold:
        if abs(topHalf - bottomHalf) <= self.threshold:
          return "", 0, True
        else:
          return "tb", topHalf - bottomHalf, False
      else:
        return "fs", firstHalf - secondHalf, False


    #TODO: IMPLEMENT WITH UR5
    def pickup_jacket(self, position):
      print("PICKING UP THE JACKET FROM POSITION: ", position)
      return self

    def empty(self):
        self.rack = dict()
        return self


if __name__ == "__main__":
    print "Initializing wardrobe..."
    wr = Garderobot(11, 2)
    print wr.count(), wr
    print wr.isBalanceOkay(3, wr.rack)
    print "Hanging a jacket on position 6..."
    wr.hang(6)
    print "Hanging a jacket on position 0..."
    wr.hang(0)
    print "Hanging a jacket on position 3..."
    wr.hang(3)
    print wr.count(), wr
    print "Taking a jacket from position 6..."
    wr.take(6)
    print wr.count(), wr

