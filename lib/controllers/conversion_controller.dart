import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConversionController extends GetxController {
  final unitToMlRatio = 450;

  // Manually create TextEditingControllers for 8 rows
  TextEditingController mlController1 = TextEditingController();
  TextEditingController unitController1 = TextEditingController();
  TextEditingController mlController2 = TextEditingController();
  TextEditingController unitController2 = TextEditingController();
  TextEditingController mlController3 = TextEditingController();
  TextEditingController unitController3 = TextEditingController();
  TextEditingController mlController4 = TextEditingController();
  TextEditingController unitController4 = TextEditingController();
  TextEditingController mlController5 = TextEditingController();
  TextEditingController unitController5 = TextEditingController();
  TextEditingController mlController6 = TextEditingController();
  TextEditingController unitController6 = TextEditingController();
  TextEditingController mlController7 = TextEditingController();
  TextEditingController unitController7 = TextEditingController();
  TextEditingController mlController8 = TextEditingController();
  TextEditingController unitController8 = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _addListeners(mlController1, unitController1);
    _addListeners(mlController2, unitController2);
    _addListeners(mlController3, unitController3);
    _addListeners(mlController4, unitController4);
    _addListeners(mlController5, unitController5);
    _addListeners(mlController6, unitController6);
    _addListeners(mlController7, unitController7);
    _addListeners(mlController8, unitController8);
  }

  void _addListeners(TextEditingController mlController,
      TextEditingController unitController) {
    mlController.addListener(() {
      final text = mlController.text;
      if (text.isNotEmpty) {
        final mlValue = double.tryParse(text.replaceAll(' ml', ''));
        if (mlValue != null) {
          final unitValue = mlValue / unitToMlRatio;
          if (unitController.text != unitValue.toStringAsFixed(2)) {
            unitController.text = unitValue.toStringAsFixed(2);
          }
        }
      }
    });

    unitController.addListener(() {
      final text = unitController.text;
      if (text.isNotEmpty) {
        final unitValue = double.tryParse(text.replaceAll(' Unit(s)', ''));
        if (unitValue != null) {
          final mlValue = unitValue * unitToMlRatio;
          if (mlController.text != mlValue.toStringAsFixed(0)) {
            mlController.text = mlValue.toStringAsFixed(0);
          }
        }
      }
    });
  }
}
