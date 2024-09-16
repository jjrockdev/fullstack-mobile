import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/components/botton_navigator_widget.dart';
import 'package:restaurant_app/components/message_helper.dart';
import 'package:restaurant_app/provider/product_provider.dart';
import 'package:restaurant_app/services/product_service.dart';

void main() {
  //runApp(MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()..getProduct()),
      ],
      child: MyApp(),
    ),
  );
}

//-------- state less ແມ່ນ wedgte(keyword= stl) ທີ່ໃຊ້ໄວ້ສະແດງຂໍ້ມູນຄົງທີ່, ທີ່ບໍ່ປ່ຽນແປງຫຼາຍຄັ້ງ
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: MessageHelper.scaffoldMessagerKey,
      home: BottonNavigatorWidget(),
      );
  }
}
