import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/widget/header_widget.dart';

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({super.key});

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  final GlobalConroller globalConroller =
      Get.put(GlobalConroller(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(() => globalConroller.getCheckLoading().isTrue
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            )
          : ListView(
              scrollDirection: Axis.vertical,
              children: const [
                SizedBox(
                  height: 20,
                ),
                HeaderWidget()
              ],
            )),
    ));
  }
}
