import data.dart;
void main() {
  studentDetails = SimulatedRFIDReader().getStudentDetails("001");
  Column(
    children: [
      Text("Tag ID: ${studentDetails[0]}"),
      Text("Name: ${studentDetails[1]}"),
      Text("Flex: ${studentDetails[2]}"),
      Text("Swipes: ${studentDetails[3]}"),
      Text("Campus: ${studentDetails[4]}"),
      Text("Green Box Checked Out: ${studentDetails[5]}"),
    ],
  );

  var reader = SimulatedRFIDReader();
  String tagId = reader.readTagId();  // Getting user input for tag ID

  var studentDetails = reader.getStudentDetails(tagId);
  if (studentDetails.first == "Unknown tag ID.") {
    print(studentDetails.first);
  } else {
    print("Tag ID: ${studentDetails[0]}");
    print("Name: ${studentDetails[1]}");
    print("Flex: ${studentDetails[2]}");
    print("Swipes: ${studentDetails[3]}");
    print("Campus: ${studentDetails[4]}");
    print("Green Box Checked Out: ${studentDetails[5]}");
  }
}