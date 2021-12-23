import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:class_manadement/data/model/student_model.dart';

class StudentDbScreen extends StatelessWidget {
  const StudentDbScreen({ Key? key }) : super(key: key);

  StudentsModel postFromJson(String str) {
    final jsonData = json.decode(str);
    return StudentsModel.fromJson(jsonData);
  }

  Future<StudentsModel> getStudent() async {
    final response = await http.get(Uri.parse(
        'https://hamon-interviewapi.herokuapp.com/students/?api_key=3aDe0'));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      throw Exception('unable to etch details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder<StudentsModel>(
        future: getStudent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return Text("Error");
        }

        return ListView.builder(
          itemCount: snapshot.data!.students.length,
          itemBuilder: (context, i){
             return ListTile(
              title: Text(' ${snapshot.data!.students[i].name }'),
              subtitle: Text(' ${snapshot.data!.students[i].email }'),
              leading: Text('id:   ${snapshot.data!.students[i].id }'),
              trailing: Text('age:   ${snapshot.data!.students[i].age }'),
            );

          },
          );
           
          } else
        return CircularProgressIndicator();
        },
      ),
    )
    );
  }
}