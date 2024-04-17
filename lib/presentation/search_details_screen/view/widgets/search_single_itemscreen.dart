import 'package:flutter/material.dart';

class SearchSingleItemScreen extends StatelessWidget {
  final String? title;
  final String? image;
  final List<String>? ingredient;
  final List<String>? prepare;

  SearchSingleItemScreen({
    Key? key,
    this.title,
    this.image,
    this.ingredient,
    this.prepare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title ?? '', 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: image != null
                    ? SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    image!,
                    fit: BoxFit.cover,
                  ),
                )
                    : Text("No Image Found"),
              ),
            ),
            Text(
              "Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Ingredients",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        ingredient?.join(", ") ?? "No Data Found", // Join ingredients into a string separated by ', ' 
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Preparation Steps",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        prepare?.join(",") ?? "No Data Found", // Join preparation steps into a string separated by '\n'
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
