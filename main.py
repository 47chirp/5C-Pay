# this is a simulation of how the RFID reader would work in real life
# the user can swipe their card to enter a building or swipe their card to enter the dining hall

class SimulatedRFIDReader:
    def __init__(self):
        self.tag_database = {
            # if we wanted to make this more realistic we could have Pomona swipes and 5C swipes
            "001": {"name": "Mitchell", "flex": 80, "swipes": 10, "campus": "Pomona"},
            "002": {"name": "Prof Dobbs", "flex": 80, "swipes": 5, "campus": "Harvey Mudd"},
            "003": {"name": "Cecilia Sagehen", "flex": 80, "swipes": 10, "campus": "Pomona"},
            "004": {"name": "Yukie Grace Chang", "flex": 200, "swipes": 0, "campus": "Pomona"},
            "005": {"name": "Mikey Dickerson", "flex": 5, "swipes": 0, "campus": "Pomona"},
            # Add more tag IDs and text as needed
        }

    def read_building_access(self):
        # Simulate reading RFID tag for building access
        tag_id = input("Enter RFID tag ID: ")
        tag_text = self.get_tag_text(tag_id)
        return tag_id, tag_text

    def read_dining_hall_access(self):
        # Simulate reading RFID tag for dining hall access
        tag_id = input("Enter RFID tag ID: ")
        return tag_id

    def get_tag_text(self, tag_id):
        # Retrieve tag information from the database
        return self.tag_database.get(tag_id, "Unknown")

    def validate_building_access_at_Pomona(self, tag_id):
        # Validate building access based on campus
        if tag_id in self.tag_database:
            user = self.tag_database[tag_id]
            if user["campus"] == "Pomona":
                print("Access granted")
                return True
            else:
                print("Access denied: You are not authorized to access this building.")
                return False
        else:
            print("Tag ID not found")
            return False

    def update_tag(self, tag_id):
        # Update meal swipes and flex for the given tag ID
        if tag_id in self.tag_database:
            user = self.tag_database[tag_id]
            if user["swipes"] > 0:
                # If swipes are available, use one and update swipes
                user["swipes"] -= 1
                print("SUCCESS")
            else:
                # If no swipes are left, ask if the user wants to use flex
                use_flex = input("No meal swipes left. Do you want to use flex? (yes/no): ")
                if use_flex.lower() == "yes" and user["flex"] >= 10:
                    print("SUCCESS")
                    # No need to track meal type when using flex
                    # Subtract a fixed amount of flex
                    user["flex"] -= 10
                elif use_flex.lower() == "yes" and user["flex"] < 10:
                    print("You are broke.")
                else:
                    print("Transaction canceled")
            # Print user's updated values
            print(f"{user['name']} now has {user['swipes']} swipes and {user['flex']} flex.")
        else:
            print("Tag ID not found")

# Create an instance of the simulated RFID reader
reader = SimulatedRFIDReader()

reading_tags = True
while reading_tags:
    if reading_tags:
        print("1. Swipe for Building Access")
        print("2. Swipe for Dining Hall Access")
        option = input("Select an option (1 or 2): ")

    if option == "1":
        tag_id, tag_text = reader.read_building_access()
        if reader.validate_building_access_at_Pomona(tag_id):
            # Building access granted, no need to proceed to dining hall access
            reading_tags = False
    elif option == "2":
        tag_id = reader.read_dining_hall_access()
    else:
        print("Invalid option")
        continue

    if option == "2":
        # Print tag text only for dining hall access
        tag_text = reader.get_tag_text(tag_id)
        print("Tag ID:", tag_id)
        print("Tag Text:", tag_text)

        # Update the tag information
        reader.update_tag(tag_id)

    # Ask user if they want to continue
    response = input("Do you want to continue reading tags? (yes/no): ")
    if response.lower() != "yes":
        reading_tags = False

print("Exiting program")

