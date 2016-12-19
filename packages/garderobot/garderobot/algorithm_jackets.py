#1 -> 5 -> 9 -> 2 -> 6 -> 10 -> 3 -> 7 -> 11 -> 4 -> 8 -> (1)
import unittest

#Tests
class MyTest(unittest.TestCase):
	def testHangJacket(self):
		hangJacket(1)
		self.assertEqual(positions[1],1)
		
	def testTakeJacket(self):
		takeJacket(1)
		self.assertEqual(positions[1],0)
		
	#Default to first position in the proclist
	def testAutoHangEmpty(self):
		self.assertEqual(autoHangJacket(),procList[0])

	#Check if the next element in the proclist will be taken when the first one is occupied
	def testAutoHangFirstPosTaken(self):
		hangJacket(0)
		self.assertEqual(autoHangJacket(),procList[1])
	
	#Check if, when the carousel is not balanced, a correct position will be chosen to stabilize the structure. 	
	def testAutoHangNotInBalance(self):
		hangJacket(0)
		hangJacket(1)
		hangJacket(2)
		hangJacket(3)
		self.assertEqual(autoHangJacket(),5)
    
#The size of the carousel	
size = 11
#The theshold at which the carousel is considered stable.
threshold = 2
#All the positions in the rack: 0
#0 = empty
#1 = Jacket
positions = [0,0,0,0,0,0,0,0,0,0,0]
#The default list that will be followed to create a stable carousel.
procList = [0,4,8,1,5,9,2,7,6,3,10]

#Simplified version of this method, used in testing
def hangJacket(pos):
	positions[pos] = 1

#Simplified version of this method, used in testing
def takeJacket(pos):
	positions[pos] = 0

#Find all the occupied positions in the carousel.
def findOccupied():
	occupiedList = []
	for index,item in enumerate(positions):
		if item != 0: #Jacket found!
			occupiedList.append(index)
	if len(occupiedList) == size:
		raise Exception("The wardrobe is full!")
	return occupiedList

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
def balanceIsOkay(seqPos):
	firstHalf = 0
	secondHalf = 0
	topHalf = 0
	bottomHalf = 0
	if seqPos < size/2:
		firstHalf+=1
	else:
		secondHalf+=1
	if seqPos < size/4 or seqPos > size * 3/4:
		topHalf+=1
	else:
		bottomHalf+=1
		
	for index, item in enumerate(positions):
		if item != 0:
			if index < size/2:
				firstHalf+=1
			elif index >= size/2:
				secondHalf+=1
			
			if index <= size/4 or index >= size*3/4:
				topHalf+=1
			elif index > size/4 and index < size * 3/4:
				bottomHalf+=1
		
	print("FirstHalf:", firstHalf)
	print("SecondHalf:", secondHalf)
	print("TopHalf:", topHalf)
	print("BottomHalf:", bottomHalf)
	if abs(firstHalf - secondHalf) <= threshold:
		if abs(topHalf - bottomHalf) <= threshold:
			return "", 0, True
		else:
			return "tb", topHalf - bottomHalf, False
	else:
		return "fs", firstHalf - secondHalf, False
		
#The algorithm that searches for a spot where a jacket could be placed.
def autoHangJacket(): 
	listOfOccupiedPositions = findOccupied()
	sequencePosition = -1
	print(listOfOccupiedPositions)
	for item in procList:
		if item not in listOfOccupiedPositions:
			sequencePosition = item
			break
	print(sequencePosition)
	errorPos, errorNr,okay = balanceIsOkay(sequencePosition)
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
			
#Main method
def main():
	print("Range firsthalf: 0 to", size/2)
	print("Range secondHalf:", size/2, "to", size)
	print("Range topHalf: 0 to", size/4, "and", size*3/4, "to", size)
	print("Range bottomHalf:", size/4, "to", size*3/4)
		
	
	print("The next position (0-10) will be: %d", autoHangJacket())

#Call the main method or the tests.
if __name__ == "__main__":
	unittest.main()
	#main()


