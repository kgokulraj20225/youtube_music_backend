import 'package:flutter/material.dart';
import 'package:get/get.dart';

class first_page extends StatefulWidget {
  const first_page({super.key});

  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {

  @override
  Widget build(BuildContext context) {
    TextEditingController ted = TextEditingController();
    TextEditingController ted1 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
        centerTitle: true,
      ),
      body: Center(
        child: Wrap(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'enter the phone number',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'enter the password',
              ),
            )
          ],
        ),
      ),
    );
  }
}
