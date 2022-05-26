import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const ListTile(
              title: CircleAvatar(
                child: Icon(Icons.account_circle, size: 35,),
                radius: 35,
              ),
              subtitle:  Center(
                child: Text(
                  "Nome do Usuário",
                  style: TextStyle(color: Colors.white, fontSize: 18),), 
                heightFactor: 2,),
            )
          ),
          ListTile(
            onTap: () => Get.toNamed("/login"),
            leading: const Icon(Icons.login),
            title: const Text('Login'),
          ),
        ],
      ),
    );
  }
}