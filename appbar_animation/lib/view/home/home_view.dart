import 'package:appbar_animation/core/app_constant.dart';
import 'package:appbar_animation/core/app_pages.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Appbar Animation"),
      ),
      body: ListView.builder(
        itemCount: AppConstant.appBarUseCaseList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppPages.animatedAppBar);
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstant.appBarUseCaseList[index].title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppConstant.appBarUseCaseList[index].desc,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
