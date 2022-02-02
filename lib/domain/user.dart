class User{
  String name;
  Map? details;

  User({required this.name,this.details});

  User.fromMap(String name)
    :name=name,
    details={};

  Map<String, dynamic> toMap() => {
    'name':name,
    'details':details
  };
}