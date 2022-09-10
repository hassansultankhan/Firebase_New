import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  late TextEditingController _productAdd;
  late DatabaseReference _ref;
  

  @override
  void initState() {
    super.initState();
    _productAdd = TextEditingController();
    _ref = FirebaseDatabase.instance.ref().child('Products');
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: Container(
        margin:EdgeInsets.all(15),
        child: Column(
            children: [
              TextFormField(
                controller: _productAdd,
                decoration:const InputDecoration(
                  hintText: "Add Product Name",
                prefixIcon: Icon(
                  Icons.category
                ), iconColor: Colors.indigo,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
                contentPadding: EdgeInsets.all(15),
                ),
              ),

              SizedBox(height: 15,),
              Container(
                child: ElevatedButton(
                  
                  onPressed: ()=> savedProduct(), 
                  child: Text("Save Product")),
              ),
            ],
        ),
      ),
      
    );
  }
  void savedProduct(){
    String ProductName = _productAdd.text;

    Map <String, String> newProduct ={
      'name': ProductName,
    };

    _ref.push().set(newProduct).then((value) {
      Navigator.pop(context);
    });
  }
}