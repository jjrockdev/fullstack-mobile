import 'package:flutter/material.dart';

class TesterView extends StatefulWidget {
  const TesterView({super.key});

  @override
  State<TesterView> createState() => _TesterViewState();
}

class _TesterViewState extends State<TesterView> {
  //Scaffold ແມ່ນ Widget ທີ່ໃຊ້ເປັນ backgroupd ໃຫ້ກັບການອອກແບບແອັດ
  // ສ່ວນປະກອບຂອງ Scaffold ປະກອບມີ: 1. appBar, 2. body, 3. buttomNavigator, 4. floatingButton, 5. Drawer
  // 1. App ປະກອບມີ: 3ສ່ວນ=> 1. leading, 2. title, 3.action
  // 2. Body ແມ່ນສ່ວນກາງ
  @override
  Widget build(BuildContext context) {
    //----- Begin Scaffold
    return Scaffold(
      //----- Begin AppBar
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(Icons.menu),
        title: Text("Tesster View",
            style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight:FontWeight.bold
            ),
          ),
        actions: [
          Icon(
            Icons.person,
            color: Colors.green,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.blue,
          ),
        ],
      ),
      //------- End AppBar
      //------- Begin Body
      body: Center(
        child: Text("Welcom to my first App"),
      ),
      //------- End Body
      bottomNavigationBar: Container(
        height: 120,
        color: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: (){},
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
      ),
    );
  }
}
