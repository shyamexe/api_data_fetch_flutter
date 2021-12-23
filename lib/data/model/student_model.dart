class StudentsModel {
  StudentsModel({
    required this.students,
  });
  late final List<Students> students;
  
  StudentsModel.fromJson(Map<String, dynamic> json){
    students = List.from(json['students']).map((e)=>Students.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['students'] = students.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Students {
  Students({
    required this.age,
    required this.email,
    required this.id,
    required this.name,
  });
  late final int age;
  late final String email;
  late final int id;
  late final String name;
  
  Students.fromJson(Map<String, dynamic> json){
    age = json['age'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['age'] = age;
    _data['email'] = email;
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}