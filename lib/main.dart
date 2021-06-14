import 'package:basic_widgets/screens/dog_detail.dart';
import 'package:basic_widgets/screens/home_screen.dart';
import 'package:basic_widgets/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Basic Widgets'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
            ),
          ),
          body: TabBarView(children: [
            HomeScreen(),
            Container(color: Colors.yellow),
            Container(color: Colors.green),
          ]),
          drawer: DrawerList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          //  FloatingActionButton(
          //   onPressed: () {},
          //   child: Icon(Icons.add),
          // ),
        ),
      ),
      routes: {
        '/dog-detail': (context) => DogDetail(),
      },
    );
  }
}
