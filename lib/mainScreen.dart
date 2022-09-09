import 'package:firebase_2/addContacts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  late Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Products');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.ref().child('Products').child('name');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
      ),
      body: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddData(),
              ));
        },
      ),
    );
  }
}
