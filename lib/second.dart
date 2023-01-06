import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller.dart';

class Second extends StatelessWidget {
   Second({Key? key}) : super(key: key);
  var con=Get.find<controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Center(child: Text(con.a.value.toString()),),));
  }
}
