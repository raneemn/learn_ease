class UserInterest {
  final String id;
  final String userName;
  final String interest;
  final String description;

  UserInterest({
    this.id = '',
    this.userName = '',
    this.interest = '',
    this.description = '',
  });

  factory UserInterest.fromJson(Map<String, dynamic> json) {
    return UserInterest(
      id: json['_id'],
      userName: json['userName'],
      interest: json['interest'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'interest': interest,
      'description': description,
    };
  }
}
