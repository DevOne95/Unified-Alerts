class ProfileModel {
  final int userID;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String? extName;
  final String? url;
  final String email;
  final String? contact;

  ProfileModel(
      {required this.userID,
      required this.firstName,
      this.middleName,
      required this.lastName,
      this.extName,
      this.url,
      required this.email,
      this.contact});

  // Factory constructor to create a ProfileModel from JSON
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        userID: json['userID'],
        firstName: json['firstName'],
        middleName: json['middleName'], // Allow null
        lastName: json['lastName'],
        extName: json['extName'], // Allow null
        url: json['url'],
        email: json['email'],
        contact: json['contact']);
  }

  // Method to convert ProfileModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'firstName': firstName,
      'middleName': middleName, // Allow null
      'lastName': lastName,
      'extName': extName, // Allow null
      'url': url,
      'email': email,
      'contact': contact
    };
  }

  String get name => "$firstName ${lastName[0]}";
}
