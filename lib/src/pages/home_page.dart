import 'package:flutter/material.dart';
import 'package:flutter_crud_sqflite/src/models/data_model.dart';
import 'package:flutter_crud_sqflite/src/pages/add_edit_product.dart';
import 'package:flutter_crud_sqflite/src/seivces/db_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBService? dbService;
  @override
  void initState() {
    super.initState();
    dbService = DBService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Flutter CRUD'),
      ),
      body: _fetchData(),
    );
  }

  Widget _fetchData() {
    return FutureBuilder(
        future: dbService?.getProducts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> products) {
          if (products.hasData) {
            return _buildUI(products.data);
          }
          return const CircularProgressIndicator();
        });
  }

  Widget _buildUI(List<ProductModel>? data) {
    var widgets = <Widget>[];
    widgets.add(
      Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditProduct(),
              ),
            );
          },
          child: Container(
            height: 40.0,
            width: 100,
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                "Add Product",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return Padding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        ),
        padding: const EdgeInsets.all(10));
  }
}
