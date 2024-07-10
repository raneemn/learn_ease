class LearnItem {
  final String id;
  final String name;
  final String description;

  LearnItem({ this.id='', required this.name,required this.description});

  //get data from API (from json)
  factory LearnItem.fromJson(Map<String, dynamic> json) {
    return LearnItem(
      id: 
      json['_id'],
      name: 
      json['name'],
      description: 
      json['description'],
    );
  }

  //send data to API(to json)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }
}
