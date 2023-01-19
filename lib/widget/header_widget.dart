import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = '';
  String date = DateFormat('yMMMMd').format(DateTime.now());
  final GlobalConroller globalConroller =
      Get.put(GlobalConroller(), permanent: true);

  @override
  void initState() {
    getAdress(globalConroller.getLattitude().value,
        globalConroller.getLongitude().value);
    super.initState();
  }

  getAdress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.subLocality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [cityName(context), timeNow(context)],
    );
  }

  Container timeNow(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.topLeft,
      child: Text(
        date,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Container cityName(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.topLeft,
      child: Text(
        city,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(color: Colors.black),
      ),
    );
  }
}
