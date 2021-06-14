import 'dart:math';

import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;
  late String id;
  Dog({
    required this.nome,
    required this.foto,
  }) {
    this.id = Random().nextDouble().toString();
  }
}

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Dog> listDogs = [
    Dog(nome: 'doguinho1', foto: 'assets/images/01.jpg'),
    Dog(nome: 'doguinho2', foto: 'assets/images/02.jpg'),
    Dog(nome: 'doguinho3', foto: 'assets/images/03.jpg'),
    Dog(nome: 'doguinho4', foto: 'assets/images/04.jpg'),
    Dog(nome: 'doguinho5', foto: 'assets/images/05.png'),
    Dog(nome: 'doguinho1', foto: 'assets/images/01.jpg'),
    Dog(nome: 'doguinho2', foto: 'assets/images/02.jpg'),
    Dog(nome: 'doguinho3', foto: 'assets/images/03.jpg'),
    Dog(nome: 'doguinho4', foto: 'assets/images/04.jpg'),
    Dog(nome: 'doguinho5', foto: 'assets/images/05.png'),
    Dog(nome: 'doguinho1', foto: 'assets/images/01.jpg'),
    Dog(nome: 'doguinho2', foto: 'assets/images/02.jpg'),
    Dog(nome: 'doguinho3', foto: 'assets/images/03.jpg'),
    Dog(nome: 'doguinho4', foto: 'assets/images/04.jpg'),
    Dog(nome: 'doguinho5', foto: 'assets/images/05.png'),
  ];

  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Listview'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                isGrid = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                isGrid = true;
              });
            },
          ),
        ],
      ),
      body: isGrid ? DogGridView(listDogs) : DogListView(listDogs),
    );
  }
}

class DogListView extends StatelessWidget {
  const DogListView(this.listDogs);

  final List<Dog> listDogs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 300,
      itemCount: listDogs.length,
      itemBuilder: (context, index) {
        Dog dog = listDogs[index];
        return DogItem(dog: dog);
      },
    );
  }
}

class DogGridView extends StatelessWidget {
  const DogGridView(this.listDogs);

  final List<Dog> listDogs;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: EdgeInsets.all(10),
      itemCount: listDogs.length,
      itemBuilder: (context, index) {
        Dog dog = listDogs[index];
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: DogItem(dog: dog),
        );
      },
    );
  }
}

class DogItem extends StatelessWidget {
  const DogItem({
    Key? key,
    required this.dog,
  }) : super(key: key);

  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/dog-detail', arguments: dog);
      },
      child: Hero(
        tag: dog.id,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              dog.foto,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  dog.nome,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
