import 'package:baseproject/core/constant/string_constants.dart';
import 'package:baseproject/core/theme/theme_service.dart';
import 'package:baseproject/features/home/controller/home_controller.dart';
import 'package:baseproject/features/home/widget/category-item.dart';
import 'package:baseproject/features/home/widget/news-item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConstants.APP_NAME,
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              StringConstants.DEVELOPER_NAME,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
        leading: Icon(
          Icons.list_alt_rounded,
          color: context.theme.primaryColor,
          size: 45,
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                ThemeService().switchTheme();
              },
              icon: Icon(
                Icons.wb_sunny,
                color: context.theme.primaryColor,
              )),
          IconButton(
              onPressed: () {
                //Get.to(() => AboutMe());
              },
              icon: Icon(
                Icons.info,
                color: context.theme.primaryColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: Obx(() {
                return controller.categoryList.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categoryList.length,
                        itemBuilder: (context, index) {
                          return CategoryItem(
                            category: controller.categoryList[index],
                            onPressed: (value) {
                              controller.changeCategoryNews(value);
                            },
                          );
                        })
                    : const SizedBox();
              }),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.topHeadLinesNewsList.length,
                  itemBuilder: (context, index) {
                    return TopHeadLineNewsItem(
                      newsModel: controller.topHeadLinesNewsList[index],
                      onPressed: (value) {

                      },
                    );
                  },
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
