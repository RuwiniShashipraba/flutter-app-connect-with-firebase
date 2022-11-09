import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("WELCOME"),
        centerTitle: true,
        elevation: 0,
        leading: Builder(
          builder: (context)=>IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
            )),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: (){},
                )
            ],
      ),
      body: Center(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blue,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"),
            BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Calendar"),
            BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: "Forum"),
            BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "News"),
            BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: "LogOut"),
        ],
      ),
      
    );
  }
}