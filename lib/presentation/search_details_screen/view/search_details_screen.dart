import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/presentation/search_details_screen/view/widgets/search_single_itemscreen.dart';

import '../../explorepage/controller/expolre_page_controller.dart';

class SearchDetailsScreen extends StatefulWidget {
  const SearchDetailsScreen({super.key});

  @override
  State<SearchDetailsScreen> createState() => _SearchDetailsScreenState();
}

class _SearchDetailsScreenState extends State<SearchDetailsScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() {
    Provider.of<ExplorePageController>(context, listen: false).fetchData(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          // automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_outlined)),
        ),
        body: Consumer<ExplorePageController>(
            builder: (context, controller, child) {
          return controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.exploreModal.data?.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchSingleItemScreen(
                                  title: controller
                                      .exploreModal.data?[index].title,
                                  image: controller
                                      .exploreModal.data?[index].imageUrl,
                                  ingredient: controller.exploreModal
                                      .data?[index].ingredientLines,
                                  prepare: controller.exploreModal.data?[index]
                                      .preparationSteps)));
                    },
                    child: Card(
                      child: ListTile(
                        leading: Container(
                          child: Image.network(
                              controller.exploreModal.data?[index].imageUrl ??
                                  ""),
                        ),
                        title: Text(
                            controller.exploreModal.data?[index].title ?? ""),
                        subtitle: Text(
                            controller.exploreModal.data?[index].totalTime ??
                                ""),
                      ),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
