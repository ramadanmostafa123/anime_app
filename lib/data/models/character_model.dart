// // دا الموديل اللى أنا عاملة بأيدى غالبا غلط
// class Character {
//   late String name;
//   late int id;
//   late String status;
//   late String gender;
//   late String image;
//   late String species;
//   late Origin origin;
//   // late  Map<String,dynamic> location;
//   // late  List<String> eposido;

//   Character.fromjson(Map<String, dynamic> json) {
//     name = json["name"];
//     id = json["id"];
//     status = json["status"];
//     gender = json["gender"];
//     //gender = json["name"];
//     species = json["species"];
//     origin = Origin.fromjson(json[origin]);
//     // location = json["location"];

//     // eposido =List<String>.from(json["eposido"]??[]);
//   }
// }

// class Origin {
//   late String name;
//   late String url;

//   Origin.fromjson(Map<String, dynamic> json) {
//     name = json['name'];
//     url = json['url'];
//   }
// }
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class Character {
  Info? info;
  List<Results>? results;

  Character({this.info, this.results});
  
    factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  // Character.fromJson(Map<String, dynamic> json) {
  //   info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  //   if (json['results'] != null) {
  //     results = <Results>[];
  //     json['results'].forEach((v) {
  //       results!.add(new Results.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.info != null) {
  //     data['info'] = this.info!.toJson();
  //   }
  //   if (this.results != null) {
  //     data['results'] = this.results!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
@JsonSerializable()
class Info {
  int? count;
  int? pages;
  String? next;
 // Null? prev;

  Info({this.count, this.pages, this.next});
  
    factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

  // Info.fromJson(Map<String, dynamic> json) {
  //   count = json['count'];
  //   pages = json['pages'];
  //   next = json['next'];
  //   prev = json['prev'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['count'] = this.count;
  //   data['pages'] = this.pages;
  //   data['next'] = this.next;
  //   data['prev'] = this.prev;
  //   return data;
  // }
}
@JsonSerializable()
class Results {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Results(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});
        factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);

  // Results.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   status = json['status'];
  //   species = json['species'];
  //   type = json['type'];
  //   gender = json['gender'];
  //   origin =
  //       json['origin'] != null ? new Origin.fromJson(json['origin']) : null;
  //   location =
  //       json['location'] != null ? new Origin.fromJson(json['location']) : null;
  //   image = json['image'];
  //   episode = json['episode'].cast<String>();
  //   url = json['url'];
  //   created = json['created'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['status'] = this.status;
  //   data['species'] = this.species;
  //   data['type'] = this.type;
  //   data['gender'] = this.gender;
  //   if (this.origin != null) {
  //     data['origin'] = this.origin!.toJson();
  //   }
  //   if (this.location != null) {
  //     data['location'] = this.location!.toJson();
  //   }
  //   data['image'] = this.image;
  //   data['episode'] = this.episode;
  //   data['url'] = this.url;
  //   data['created'] = this.created;
  //   return data;
  // }
}
@JsonSerializable()
class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});
  
        factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);

  Map<String, dynamic> toJson() => _$OriginToJson(this);

  // Origin.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   url = json['url'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['url'] = this.url;
  //   return data;
  // }
}
