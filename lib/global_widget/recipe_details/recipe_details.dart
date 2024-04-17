import 'package:flutter/material.dart';
import 'package:recipe_app/repository/api/homepage/model/home_model.dart';

class RecipeDetails extends StatelessWidget {
  final Datum? resData;

  const RecipeDetails(this.resData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${resData!.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: resData?.image != null
                    ? SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.network(
                          resData!.image!,
                          fit: BoxFit.cover,
                        ),
                    )
                    : SizedBox(),
              ),
            ),
            Text("Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Column (
                          children: [
                            Text("Ingredients",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(height: 20,),
                            Text(resData!.ingredients.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 20,),
                            Text("Preparation Steps",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(height: 20,),
                            Text(resData!.preparationSteps.toString(),style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
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
