// To parse this JSON data, do
//
//     final classRoomModel = classRoomModelFromJson(jsonString);

import 'dart:convert';

ClassRoomModel classRoomModelFromJson(String str) => ClassRoomModel.fromJson(json.decode(str));

String classRoomModelToJson(ClassRoomModel data) => json.encode(data.toJson());

class ClassRoomModel {
  ClassRoomModel({
    required this.classrooms,
  });

  List<Classroom> classrooms;

  factory ClassRoomModel.fromJson(Map<String, dynamic> json) => ClassRoomModel(
    classrooms: List<Classroom>.from(json["classrooms"].map((x) => Classroom.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classrooms": List<dynamic>.from(classrooms.map((x) => x.toJson())),
  };
}

class Classroom {
  Classroom({
    this.id,
    this.layout,
    this.name,
    this.size,
  });

  int? id;
  String? layout;
  String? name;
  int? size;

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
    id: json["id"],
    layout: json["layout"],
    name: json["name"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "layout": layout,
    "name": name,
    "size": size,
  };
}