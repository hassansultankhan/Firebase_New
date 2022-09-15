import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class editProduct extends StatefulWidget {
  String productKey = "";
  editProduct(this.productKey);

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
    getProductDetail();
  }

  @override
  Widget build(BuildContext context) {
    // String name = productController.text;
    return Scaffold(
      body: Container(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          TextFormField(
            autofocus: true,
            controller: productController,
            decoration: InputDecoration(
              hoverColor: Colors.blueGrey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              labelText: productController.text,
            ),
          ),
        ]),
      ),
    );
  }

  getProductDetail() async {
    DatabaseEvent event = await _ref.child(widget.productKey).once();

    Map product = event.snapshot.value as Map;
    productController.text = product['name'];
    // print(product["name"]);
  }
}
