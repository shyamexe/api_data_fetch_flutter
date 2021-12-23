import 'package:flutter/material.dart';

class DataBaseScreen extends StatelessWidget {
  const DataBaseScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Databases'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
  children: <Widget>[
    InkWell(
        child: const ListTile(
          leading:  FlutterLogo(),
          // trailing: Icon(Icons.more_vert),
          title: Text('Student database'),
        ),
        onTap: (){
          Navigator.pushNamed(context, '/studentdb');
        },
    ),
    InkWell(
        child: const ListTile(
          leading:  FlutterLogo(),
          // trailing: Icon(Icons.more_vert),
          title: Text('Subject database'),
        ),
        onTap: (){
          Navigator.pushNamed(context, '/subjectdb');
        },
    ),
    InkWell(
        child: const ListTile(
          leading:  FlutterLogo(),
          // trailing: Icon(Icons.more_vert),
          title: Text('classroom database'),
        ),
        onTap: (){
          Navigator.pushNamed(context, '/classroomdb');
        },
    ),
  ],
),
      ),
    );
  }
}