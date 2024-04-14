import 'dart:io';  // Import Dart's IO library for console inputs

class SimulatedRFIDReader {
  final Map<String, Map<String, dynamic>> tagDatabase = {
    "001": {"name": "Mitchell", "flex": 80, "swipes": 10, "campus": "Pomona", "green_box": 0},
    "002": {"name": "Prof Dobbs", "flex": 80, "swipes": 5, "campus": "Harvey Mudd", "green_box": 0},
    "003": {"name": "Cecilia Sagehen", "flex": 80, "swipes": 10, "campus": "Pomona", "green_box": 0},
    "004": {"name": "Yukie Grace Chang", "flex": 200, "swipes": 0, "campus": "Pomona", "green_box": 0},
    "005": {"name": "Mikey Dickerson", "flex": 5, "swipes": 0, "campus": "Pomona", "green_box": 0},
  };

  String readTagId() {
    stdout.write("Enter RFID tag ID: ");
    return stdin.readLineSync() ?? "";  // Read input from the user
  }

  List<dynamic> getStudentDetails(String tagId) {
    if (tagDatabase.containsKey(tagId)) {
      return [tagId] + tagDatabase[tagId]!.values.toList();
    }
    return ["Unknown tag ID."];  // Returns this list if the tag ID is not found
  }

  List getInfoAsArray(String tagId) {
    for tag in tagDatabase.keys {
      if (tag == tagId) {
        return [tag] + tagDatabase[tag]!.values.toList();
      }
    }
  }
}

print(SimulatedRFIDReader().getStudentDetails("001"));
