class userInfo {
  String? fName;
  String? lName;
  String? email;
  String? password;

  userInfo(
      {required this.fName,
      required this.lName,
      required this.email,
      required this.password});

  factory userInfo.fromJson(Map<String, dynamic> json) {
    return userInfo(
        fName: json['firstName'],
        lName: json['lastName'],
        email: json['email'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': fName,
      'lastName': lName,
      'email': email,
      'password': password,
    };
  }

   @override
   String toString() {
    return 'fName: $fName, lName: $lName, email: $email, password: $password'; // you can add more values to be printed
  }
  
}
