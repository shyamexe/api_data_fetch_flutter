import 'dart:convert';

import 'package:class_manadement/data/model/classroom_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClassroomDbScreen extends StatelessWidget {
  const ClassroomDbScreen({ Key? key }) : super(key: key);


  ClassRoomModel postFromJson(String str) {
    final jsonData = json.decode(str);
    return ClassRoomModel.fromJson(jsonData);
  }

  Future<ClassRoomModel> getStudent() async {
    final response = await http.get(Uri.parse(
        'https://hamon-interviewapi.herokuapp.com/classrooms/?api_key=3aDe0'));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      throw Exception('unable to fetch details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder<ClassRoomModel>(
        future: getStudent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return Text("Error");
        }

        return ListView.builder(
          itemCount: snapshot.data!.classrooms.length,
          itemBuilder: (context, i){
             return ListTile(
              title: Text(' ${snapshot.data!.classrooms[i].name }'),
              subtitle: Text('  ${snapshot.data!.classrooms[i].layout }'),
              leading: Text('id:   ${snapshot.data!.classrooms[i].id }'),
              trailing: Text('size:   ${snapshot.data!.classrooms[i].size }'),
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