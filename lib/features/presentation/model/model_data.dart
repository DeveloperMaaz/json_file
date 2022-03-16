
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    Welcome({
        this.name,
        this.code,
    });

    String? name;
    String? code;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        name: json["name"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
    };
}


///
// class ModelData {
//    String? name;
//
//    String? code;
//
//   ModelData(this.name, this.code);
//
//   ModelData.fromJson(Map<String , dynamic>json){
//
//     name = json['name'];
//     code = json['code'];
//   }
// }



