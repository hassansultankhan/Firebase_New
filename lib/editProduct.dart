import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class editProduct extends StatefulWidget {
  
  String productKey = "";
  editProduct({required productKey});

  @override
  State<editProduct> createState() => _editProductState();
}

class _editProductState extends State<editProduct> {
  late TextEditingController productController;
  late DatabaseReference _ref; 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     productController = TextEditingController();
    _ref = FirebaseDatabase.instance.ref().child('Products');
    getContactDetail();
  }

  @override
  Widget build(BuildContext context) {
    String name = productController.text;
    return Container(
      child: Text(name),
    );
    
  }

 getContactDetail() async {
    DataSnapshot snapshot = await _ref.child(widget.productKey).once() as DataSnapshot;

    Map contact = snapshot.value as Map;

    productController.text = contact['name'];

    productController.text = contact['number'];
 }

  }