import 'package:flutter/material.dart';
import 'package:flutter_fire_shopping_list/widgets/stadium_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              StadimButton(title: 'Create New List', onPressed: () {}),
              StadimButton(title: 'See Existing Lists', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
