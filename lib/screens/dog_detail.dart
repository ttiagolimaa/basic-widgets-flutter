import 'package:flutter/material.dart';
import 'package:basic_widgets/screens/listview_screen.dart';

class DogDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dog dog = ModalRoute.of(context)?.settings.arguments as Dog;

    return Scaffold(
      appBar: AppBar(
        title: Text(dog.nome),
      ),
      body: Hero(
        tag: dog.id,
        child: Image.asset(
          dog.foto,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
