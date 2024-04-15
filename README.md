# 5C-Pay

This project is broken into two seperate components one of which is a very simple demonstration of how different readers work for cards. 

The idea is to demonstrate first how RFIC card readers work, with a simple simulation of the the 5Cs system.

The simulation is then broken into sub-parts. We have an option to swipe into a building, in this case if the user
is a Pomona student they will gain access to a Pomona building. In the case where they are not, we return back a 
string that denies access, similar to how a RFIC system would buzz or beep to signal denied access. 

The second part focuses on dining halls. We begin by checking if there are meal swipes available, if yes we grant
access and return the updated swipe counter. If the user doesn't have enough swipes we prompt a question asking if 
they want to use flex. If the user wants a green box we check if they have any previously checked out, if they do 
we ask if they want another one on flex. If they do we substract from flex. If they check a box in we swap the value to 1,
if they have a value already equal to 1 we keep it as this.

From this point the focus of the project shifts towards programming in Dart, as we are creating a mobile application
that allows users to track in real time the criteria mentioned in part one. We further build upon this through the implementation of adding funds to the live balance.

At this stage (4/14/24) the app is set up with general functionality that we wish to build upon through the implementation of cards that can be added to google wallet and apple pay. This, together with payment splitting are additional features that would greatly help students at the 5Cs.

https://devpost.com/software/5c-pay 

- Helene and Mitchell

