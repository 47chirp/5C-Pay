class SimulatedRFIDReader:
    def __init__(self):
        self.tag_database = {
            "001": {"name": "Mitchell", "flex": 80, "swipes": 10, "campus": "Pomona", "green_box": 0},
            "002": {"name": "Prof Dobbs", "flex": 80, "swipes": 5, "campus": "Harvey Mudd", "green_box": 0},
            "003": {"name": "Cecilia Sagehen", "flex": 80, "swipes": 10, "campus": "Pomona", "green_box": 0},
            "004": {"name": "Yukie Grace Chang", "flex": 200, "swipes": 0, "campus": "Pomona", "green_box": 0},
            "005": {"name": "Mikey Dickerson", "flex": 5, "swipes": 0, "campus": "Pomona", "green_box": 0},
            "006": {"name": "Rebecca", "flex": 20, "swipes": 2, "campus": "Scripps", "green_box": 0},
            "007": {"name": "James Bond", "flex": 5, "swipes": 8, "campus": "CMC", "green_box": 0},
        }

    def read_tag_id(self):
        return input("Enter RFID tag ID: ")

    def get_student_details(self, tag_id):
        """Retrieve student details as a list; includes tag_id and all user details."""
        if tag_id in self.tag_database:
            user_details = self.tag_database[tag_id]
            return [tag_id] + list(user_details.values())
        return ["Unknown tag ID"]

# Main execution
reader = SimulatedRFIDReader()
tag_id = reader.read_tag_id()  # User inputs the RFID tag ID

student_details = reader.get_student_details(tag_id)
if student_details[0] == "Unknown tag ID":
    print(student_details[0])
else:
    print(f"Tag ID: {student_details[0]}")
    print(f"Name: {student_details[1]}")
    print(f"Flex: {student_details[2]}")
    print(f"Swipes: {student_details[3]}")
    print(f"Campus: {student_details[4]}")
    print(f"Green Box Checked Out: {student_details[5]}")

