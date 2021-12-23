import 'dart:convert';

import 'package:class_manadement/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SubjectDbScreen extends StatelessWidget {
  const SubjectDbScreen({ Key? key }) : super(key: key);

 
  SubjectModel postFromJson(String str) {
    final jsonData = json.decode(str);
    return SubjectModel.fromJson(jsonData);
  }

  Future<SubjectModel> getStudent() async {
    final response = await http.get(Uri.parse(
        'https://hamon-interviewapi.herokuapp.com/subjects/?api_key=3aDe0'));
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
      child: FutureBuilder<SubjectModel>(
        future: getStudent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return Text("Error");
        }

        return ListView.builder(
          itemCount: snapshot.data!.subjects.length,
          itemBuilder: (context, i){
             return ListTile(
              title: Text(' ${snapshot.data!.subjects[i].name }'),
              subtitle: Text('teacher:  ${snapshot.data!.subjects[i].teacher }'),
              leading: Text('id:   ${snapshot.data!.subjects[i].id }'),
              trailing: Text('credits:   ${snapshot.data!.subjects[i].credits }'),
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