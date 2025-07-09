class UserModel{
  int ? id;
  String ? name;
  String ? email;
  String?  phone;
  String ? username;
  String ? website;

  UserModel({
 this.id,
 this.name,
 this.email,
 this.phone,
 this.username,
 this.website

  });

  UserModel.fromJson(Map<String, dynamic> json){
    id = json[ 'id'];
    name = json ['name'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    website = json ['website'];
  }
}

