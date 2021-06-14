import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/01.jpg'),
            ),
            accountName: Text('Tiago Lima'),
            accountEmail: Text('tiago@tiago.com'),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Favoritos'),
            subtitle: Text('mais informações...'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Ajuda'),
            subtitle: Text('mais informações...'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      )),
    );
  }
}
