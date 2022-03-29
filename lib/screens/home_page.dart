import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text('Create New List'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('See Existing Lists'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
