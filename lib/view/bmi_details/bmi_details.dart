import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIDetail extends StatelessWidget {
  BMIDetail({Key? key, required this.bmi}) : super(key: key);

  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite * 0.5,
      decoration: const BoxDecoration(
        color: Color(0xFFEB1555),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
            height: Get.height,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Your Bmi is',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
                ),
                const SizedBox(height: 25),
                Text(
                  '$bmi kg/m2',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A1028),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
