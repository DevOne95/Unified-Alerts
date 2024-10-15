class Heart {
  final int userID;
  final String userName;
  final String userURL;

  Heart({
    required this.userID,
    required this.userName,
    required this.userURL,
  });

  // Factory method to create a Heart object from a JSON map
  factory Heart.fromJson(Map<String, dynamic> json) {
    return Heart(
      userID: json['userID'],
      userName: json['userName'],
      userURL: json['userURL'],
    );
  }

  // Method to convert Heart object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'userName': userName,
      'userURL': userURL,
    };
  }
}
