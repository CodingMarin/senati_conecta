import 'package:flutter/material.dart';
import 'package:senati_conecta/screens/home/homepage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Initialized environment on value = 0
  int pageIndex = 0;
  //Function for state value page index
  void onTap(int index){
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>{},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: pageIndex,
          children: <Widget>[
            //Screen HomePage
            const HomePage(nombre: Color(0xFFF12312),),
            Container(
              child: Text('Soy la vista asdasda'),
            ),
            //Screen Setting
            Container(
              child: Text('Soy la vista homeasdasdadpage'),
            ),
            //Screen Profile
            Container(
              child: Text('Soy la vista profile'),
            ),
          ],
        ),
      ),
    );
  }
}
