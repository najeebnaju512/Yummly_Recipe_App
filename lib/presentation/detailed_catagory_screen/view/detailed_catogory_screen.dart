import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/presentation/detailed_catagory_screen/controller/detailed_catogary_controller.dart';
import 'package:recipe_app/presentation/search_details_screen/view/widgets/search_single_itemscreen.dart';

class DetailedCatogoryScreen extends StatefulWidget {
  DetailedCatogoryScreen({super.key, this.tag});
  final tag;
  @override
  State<DetailedCatogoryScreen> createState() => _DetailedCatogoryScreenState();
}

class _DetailedCatogoryScreenState extends State<DetailedCatogoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<DetailedCatogoryController>(context, listen: false)
          .fetchData(context, widget.tag);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<DetailedCatogoryController>(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body:
                // FutureBuilder(
                //   future: Provider.of<DetailedCatogoryController>(context,
                //           listen: false)
                //       .fetchData(context, widget.tag),
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return Center(child: CircularProgressIndicator());
                //     } else if (snapshot.hasError) {
                //       return Center(child: Text('Error: ${snapshot.error}'));
                //     } else {
                //       return

                //     }
                //   },
                // )
                Consumer<DetailedCatogoryController>(
              builder: (context, dControl, child) {
                return dControl.isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount:
                            providerData.detailedCatagoryModel.data?.length,
                        itemBuilder: (context, index) {
                          var imageUrl = providerData.detailedCatagoryModel
                                      .data?[index].image ==
                                  null
                              ? "https://th.bing.com/th/id/OIP.y6HMdOJ4LiIUWk7n5ZGlpAHaHa?w=480&h=480&rs=1&pid=ImgDetMain"
                              : providerData
                                  .detailedCatagoryModel.data?[index].image
                                  .toString();
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SearchSingleItemScreen(
                                            title: providerData
                                                .detailedCatagoryModel
                                                .data?[index]
                                                .title,
                                            image: providerData
                                                .detailedCatagoryModel
                                                .data?[index]
                                                .image
                                                .toString(),
                                            ingredient: providerData
                                                .detailedCatagoryModel
                                                .data?[index]
                                                .ingredients,
                                            prepare: providerData
                                                .detailedCatagoryModel
                                                .data?[index]
                                                .preparationSteps,
                                          )));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ListTile(
                                    title: Text(
                                      "${providerData.detailedCatagoryModel.data?[index].title}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    subtitle: Text(
                                        "${providerData.detailedCatagoryModel.data?[index].totalTime.toString()}"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        "$imageUrl",
                                        fit: BoxFit.cover,
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // IconButton(
                                        //   onPressed: () {
                                        //     _showCommentDialog(context);
                                        //   },
                                        //   icon: Icon(
                                        //     Icons.comment,
                                        //     color: Colors.black,
                                        //     size: 30,
                                        //   ),
                                        // ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.bookmark_add_outlined,
                                            size: 30,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              },
            )));
  }
}
