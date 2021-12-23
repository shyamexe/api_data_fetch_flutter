import 'package:flutter/material.dart';

class DashbordScreen extends StatelessWidget {
  const DashbordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: GridView.count(
            padding: EdgeInsets.all(50),
            crossAxisSpacing: 50,
            mainAxisSpacing: 50,
            crossAxisCount: 2,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('add new'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/db');
                },
                child: Text('databases'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
