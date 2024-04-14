class SimulatedRFIDReader:
    def __init__(self):
        self.tag_database = {
            "001": {"name": "Mitchell", "flex": 80, "swipes": 10, "campus": "Pomona", "green_box": 0},
            "002": {"name": "Prof Dobbs", "flex": 80, "swipes": 5, "campus": "Harvey Mudd", "green_box": 0},
            "003": {"name": "Cecilia Sagehen", "flex": 80, "swipes": 10, "campus": "Pomona", "green_box": 0},
            "004": {"name": "Yukie Grace Chang", "flex": 200, "swipes": 0, "campus": "Pomona", "green_box": 0},
            "005": {"name": "Mikey Dickerson", "flex": 5, "swipes": 0, "campus": "Pomona", "green_box": 0},
        }

    def read_tag_id(self):
        return input("Enter RFID tag ID: ")

    def validate_building_access(self, tag_id):
        if tag_id in self.tag_database:
            user = self.tag_database[tag_id]
            if user["campus"] == "Pomona":
                print("Access granted to Pomona building.")
                return True
            else:
                print("Access denied: You are not authorized to access this building.")
                return False
        print("Tag ID not found.")
        return False

    def dining_hall_access(self, tag_id):
        if tag_id not in self.tag_database:
            print("Tag ID not found.")
            return
        
        user = self.tag_database[tag_id]
        if user["swipes"] > 0:
            user["swipes"] -= 1
            print(f"Access granted to dining hall. Remaining swipes: {user['swipes']}")
        else:
            print("No meal swipes left. Would you like to use flex? (yes/no)")
            if input().lower() == "yes":
                if user["flex"] >= 10:
                    user["flex"] -= 10
                    print("10 Flex dollars used. Access granted.")
                else:
                    print("Not enough flex points.")
            else:
                print("Access denied to dining hall.")

    def manage_green_box(self, tag_id):
        user = self.tag_database[tag_id]
        if user["green_box"] == 1:
            print("You already have a green box checked out.")
            return
        
        print("Do you need to check out a green box? (yes/no)")
        if input().lower() == "yes" and user["green_box"] == "1":
            if user["flex"] >= 5:
                user["flex"] -= 5
                user["green_box"] = 1
                print("Green box checked out. 5 Flex points used.")
            else:
                print("Not enough flex points to check out a green box.")

# Create an instance of the simulated RFID reader
reader = SimulatedRFIDReader()

while True:
    print("\n1. Swipe for Building Access\n2. Swipe for Dining Hall Access\n3. Exit")
    choice = input("Select an option (1, 2, or 3): ")
    
    if choice == "1":
        tag_id = reader.read_tag_id()
        reader.validate_building_access(tag_id)
    elif choice == "2":
        tag_id = reader.read_tag_id()
        reader.dining_hall_access(tag_id)
        reader.manage_green_box(tag_id)
    elif choice == "3":
        print("Exiting program.")
        break
    else:
        print("Invalid option. Please try again.")

