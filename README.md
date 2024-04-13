# 5C-Pay

This a general simulation of how different readers work for cards

The idea is to demonstrate first how RFIC card readers work, with a very simple demonstration using the 5Cs

The simulation is then broken into two parts. We have an option to swipe into a building, in this case if the user
is a Pomona student they will gain access to a Pomona building. In the case where they are not, we return back a 
string that denies access, similar to how a RFIC system would buzz or beep to signal denied access. 

The second part focuses on dining halls. We begin by checking if there are meal swipes available, if yes we grant
access and return the updated swipe counter. If the user doesn't have enough swipes we prompt a question asking if 
they want to use flex. 

To further add to this project we could add an option for Claremont cash, which would be another very simple method to add.


