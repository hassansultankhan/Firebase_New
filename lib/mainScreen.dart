import 'package:firebase_2/addContacts.dart';
import 'package:firebase_2/editProduct.dart';
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
    _ref =
        FirebaseDatabase.instance.ref().child('Products').orderByChild('name');
  }

  Widget _buildProductItem({required Map product}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.card_travel, size: 20, color: Colors.amber),
                InkWell(
                  child: Text(
                    product["name"],
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:((context) => editProduct(productKey: product["key"],)), ));
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                    child: const Icon(
                     Icons.delete,
                      size: 20,
                      color: Colors.black38,
                    ),
                    onTap: () {
                      reference.child(product['key']).remove();
                    }),
              ],
            ),
          ]),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map product = snapshot.value as Map;

            product['key'] = snapshot.key;
            return _buildProductItem(product: product);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
