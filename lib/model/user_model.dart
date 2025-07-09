import 'dart:ffi';

class UserModel{
  int ? id;
  String ? name;
  String ? email;
  String?  phone;
  String ? username;
  String ? website;
  Company ? company;
  Address? address;
  // Geo? geo;

  UserModel({
 this.id,
 this.name,
 this.email,
 this.phone,
 this.username,
 this.website,
 this.company,
 this.address,
//  this.geo

  });

  UserModel.fromJson(Map<String, dynamic> json){
    id = json[ 'id'];
    name = json ['name'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    website = json ['website'];
    company = json ['company']!= null ? Company.fromJson(json['company']): null;
    address = json ['address']!=null? Address.fromJson(json['address']): null;
    // geo = json['geo']!=null? Geo.fromJson(json['geo']): null;
  }
}

// create the company class

class Company{
  String ? name;
  String ? catchPhrase;
  String ? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs
  });

  Company.fromJson(Map<String, dynamic> json){

    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }
}

class Address{
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;
  

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo
    

  });

  Address.fromJson(Map<String, dynamic> json){
    street =json['street'];
      suite =json['suite'];
        city =json['city'];
          zipcode =json['zipcode'];
          geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
          
  }
}


class Geo {
  String? lat;
  String? lng;

  Geo({
 this.lat,
 this.lng
  });

  Geo.fromJson(Map<String, dynamic> json){
    lat = json['lat']??'';
    lng = json['lng']??'';
  }

}

