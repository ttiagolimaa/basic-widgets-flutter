import 'package:basic_widgets/screens/listview_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import 'page_1.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Hello World!!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: Colors.purple,
            ),
          ),
          Container(
            height: 300,
            child: PageView(
              children: [
                Image.asset(
                  'assets/images/01.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/02.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/03.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/04.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text('page'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Page1(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text('ListView'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ListViewScreen(),
                  ));
                },
              ),
              ElevatedButton(
                child: Text('buutton.'),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text('Snack'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('ola...'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 5),
                      action: SnackBarAction(
                        label: 'Dismiss',
                        onPressed: () =>
                            ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                      ),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Dialog'),
                onPressed: () {
                  showDialog(
                    barrierDismissible: false, //não sair ao clicar fora
                    context: context,
                    builder: (context) {
                      return WillPopScope(
                        // não volta ao clicar em voltar do android
                        onWillPop: () async => false,
                        child: AlertDialog(
                          title: Text('Teste do Dialog.'),
                          content: Text('Esse é o conteudo.'),
                          actions: [
                            TextButton(
                              child: Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Ok'),
                              onPressed: () {
                                print('ok');
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              ElevatedButton(
                child: Text('toast.'),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "This is Center Short Toast",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
