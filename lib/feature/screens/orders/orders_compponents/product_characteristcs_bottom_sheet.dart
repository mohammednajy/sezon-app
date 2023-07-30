import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/style_manager.dart';
import '../../../widgets/cutom_text_field_widget.dart';
import '../../home/homeComponent/label_widget.dart';

class ProductCharacteristic extends StatelessWidget {
  const ProductCharacteristic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 26,
          right: 26,
          top: 30,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              height: 7,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: Get.size.height / 30,
            ),
            LabelWidget(text: 'إضافة مواصفات المنتج'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(
                hintText: 'مثال: خزف ملون صنع يدوي', labelText: 'اسم المنتج'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(hintText: 'مثال: 5 قطع', labelText: 'الكمية'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(hintText: 'مثال: الأسود', labelText: 'لون المنتج'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(hintText: 'مثال: xxl', labelText: 'الحجم'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text('حفظ',
                    style: StyleManager.smallText(
                        fontWeight: FontWeight.bold, color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
