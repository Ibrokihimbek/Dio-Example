import 'package:dio_example/screens/app_router.dart';
import 'package:dio_example/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutName.product);
            },
            icon: const Icon(
              Icons.navigate_next_outlined,
              size: 40,
            ),
          )
        ],
      ),
      body: Consumer<CategoryViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.categoryModel == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var datalist = viewModel.categoryModel;
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: datalist!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 15),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                  datalist[index].imageUrl.toString(),
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              const SizedBox(width: 15),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  "${datalist[index].name}",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 22,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
        },
      ),
    );
  }
}
