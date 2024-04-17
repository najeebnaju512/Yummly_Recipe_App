import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/presentation/creators/controller/creators_controller.dart';
import 'package:recipe_app/presentation/explorepage/controller/expolre_page_controller.dart';
import 'package:recipe_app/presentation/feed_page/view/feed_page.dart';

import '../all_categories/all_categories.dart';
import '../all_categories/controller/all_categories_controller.dart';
import '../detailed_catagory_screen/view/detailed_catogory_screen.dart';
import '../creators/all_creators.dart';
import '../search_details_screen/view/search_details_screen.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _FavoratePageState();
}

class _FavoratePageState extends State<ExplorePage> {
  TextEditingController searchController = TextEditingController();

  var catergory = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpuJ4h2m9R-0ddUYVi53CjFBtByDjmhxdafA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk488-Mt1kJ0GxmhEr0h3lXlImeAkTNBXYbg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBenTu6SBmQSJsuPJxTjIAy5FRZx-bH2FWcw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgAw45JF1tN7IvLZBCWZQ68hWsMFlaDiNciQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1rdrz_ScMGHt9gqxMJ9Vv1wgFUfClfG46GA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGB9QhJNZkPEq2a-MJAcsbd7psr66xZJDgcg&usqp=CAU',
  ];
  List data = [
    'Ingredients',
    'Meal Type',
    'Cook Time',
    'Nutrition',
    'Diet',
  ];

  fetchData() {
    Provider.of<AllCategoriesScreenController>(context, listen: false)
        .fetchCategoriesList(context);
    Provider.of<CreatorsController>(context, listen: false)
        .fetchCreatorsList(context);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
              child: Consumer<ExplorePageController>(
                  builder: (context, controller, child) {
                return SearchBar(
                  hintText: "Search",
                  controller: searchController,
                  onSubmitted: (result) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchDetailsScreen()));
                    controller.fetchData(context,
                        searchList: result.toLowerCase());
                  },
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FeedPage(), //new class create cheyanm
                                ));
                          },
                          child: Container(
                            height: 300,
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "New Feeds",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 30,
                                          color: Colors.deepOrangeAccent),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.only(top: 20),
                                    //   child: TextButton(
                                    //       onPressed: () {

                                    //       },
                                    //       child: Text(
                                    //         'See All',
                                    //         style: TextStyle(
                                    //           color: Colors.black,
                                    //           fontSize: 16,
                                    //           fontWeight: FontWeight.bold,
                                    //         ),
                                    //       )),
                                    // ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // Padding(
                                //   padding: EdgeInsets.all(4),
                                //   child: Column(
                                //     children: [
                                //       GestureDetector(
                                //         onTap: () {
                                //           print("image clicked");
                                //         },
                                //         child: CircleAvatar(
                                //             maxRadius: 60,
                                //             backgroundImage: AssetImage(
                                //                 "assets/images/userimage3.jpg")),
                                //       ),
                                //       Consumer<CreatorsController>(
                                //         builder: (context, controller, child) {
                                //           return Text(
                                //             // controller
                                //             //     .creatorsModel
                                //             //     .users?[index]
                                //             //     .username ??
                                //             "",
                                //             style: TextStyle(
                                //                 fontSize: 20,
                                //                 fontWeight: FontWeight.bold),
                                //           );
                                //         },
                                //       ),
                                //       Text(
                                //         'Name',
                                //         style: TextStyle(
                                //           color: Colors.black,
                                //           fontWeight: FontWeight.bold,
                                //           fontSize: 18,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // )
                                // Expanded(
                                //   child: SizedBox(
                                //     width: double.infinity,
                                //     child: ListView.builder(
                                //       scrollDirection: Axis.horizontal,
                                //       itemCount: 3,
                                //       itemBuilder: (context, index) => Consumer<
                                //               AllCategoriesScreenController>(
                                //           builder: (context, controller, child) =>
                                //               controller.isLoading == true
                                //                   ? Center(
                                //                       child: Padding(
                                //                       padding:
                                //                           const EdgeInsets.all(
                                //                               15.0),
                                //                       child:
                                //                           CircularProgressIndicator(),
                                //                     ))
                                //                   : InkWell(
                                //                       onTap: () {
                                //                         Navigator.push(
                                //                             context,
                                //                             MaterialPageRoute(
                                //                                 builder: (context) => DetailedCatogoryScreen(
                                //                                     tag: controller
                                //                                         .categoryModel
                                //                                         .data?[
                                //                                             index]
                                //                                         .tag)));
                                //                       },
                                //                       child: Padding(
                                //                         padding:
                                //                             EdgeInsets.all(8.0),
                                //                         child: Row(
                                //                           children: [
                                //                             ClipRRect(
                                //                               borderRadius:
                                //                                   BorderRadius
                                //                                       .circular(
                                //                                           30),
                                //                               child: Container(
                                //                                 color:
                                //                                     Colors.white,
                                //                                 padding:
                                //                                     EdgeInsets
                                //                                         .all(10),
                                //                                 width: 250,
                                //                                 child: Row(
                                //                                   children: [
                                //                                     CircleAvatar(
                                //                                       maxRadius:
                                //                                           45,
                                //                                       backgroundImage: NetworkImage(controller
                                //                                               .categoryModel
                                //                                               .data?[index]
                                //                                               .categoryImage ??
                                //                                           ""),
                                //                                     ),
                                //                                     SizedBox(
                                //                                       width: 10,
                                //                                     ),
                                //                                     Text(
                                //                                       controller
                                //                                               .categoryModel
                                //                                               .data?[index]
                                //                                               .displayName ??
                                //                                           "",
                                //                                       style: TextStyle(
                                //                                           fontWeight:
                                //                                               FontWeight
                                //                                                   .bold,
                                //                                           fontSize:
                                //                                               20),
                                //                                     )
                                //                                   ],
                                //                                 ),
                                //                               ),
                                //                             ),
                                //                           ],
                                //                         ),
                                //                       ),
                                //                     )),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 300,
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange[300],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Top categories",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const AllCategories(),
                                              ));
                                        },
                                        child: const Text(
                                          'See All',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (context, index) => Consumer<
                                            AllCategoriesScreenController>(
                                        builder: (context, controller, child) =>
                                            controller.isLoading == true
                                                ? Center(
                                                    child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ))
                                                : InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => DetailedCatogoryScreen(
                                                                  tag: controller
                                                                      .categoryModel
                                                                      .data?[
                                                                          index]
                                                                      .tag)));
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Row(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            child: Container(
                                                              color:
                                                                  Colors.white,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              width: 250,
                                                              child: Row(
                                                                children: [
                                                                  CircleAvatar(
                                                                    maxRadius:
                                                                        45,
                                                                    backgroundImage: NetworkImage(controller
                                                                            .categoryModel
                                                                            .data?[index]
                                                                            .categoryImage ??
                                                                        ""),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    controller
                                                                            .categoryModel
                                                                            .data?[index]
                                                                            .displayName ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            20),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      //creators
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 350,
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange[300],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Popular Creators',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AllCreators(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'See All',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 250,
                                width: double.infinity,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      margin: const EdgeInsets.all(10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              child: const CircleAvatar(
                                                  maxRadius: 60,
                                                  backgroundImage: AssetImage(
                                                      "assets/images/userimage3.jpg")),
                                            ),
                                            Consumer<CreatorsController>(
                                              builder:
                                                  (context, controller, child) {
                                                return Text(
                                                  controller
                                                          .creatorsModel
                                                          .users?[index]
                                                          .username ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                );
                                              },
                                            ),
                                            MaterialButton(
                                              shape: StadiumBorder(),
                                              color: Colors.orange,
                                              onPressed: () {},
                                              child: Text(
                                                'Follow',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
