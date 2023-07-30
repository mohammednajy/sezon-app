import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/style_manager.dart';
import '../../../widgets/cutom_text_field_widget.dart';
import '../../home/homeComponent/label_widget.dart';


class AddressBottomSheetWidget extends StatelessWidget {
  const AddressBottomSheetWidget({
    super.key,
  });

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
            LabelWidget(text: 'إضافة عنوان جديد'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(hintText: 'الامارات', labelText: 'الدولة'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(
                hintText: 'المنطقة، محافظة، ولاية...', labelText: 'المنطقة'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(hintText: 'الشيخ زايد', labelText: 'المدينة'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(
                hintText: 'الشارع، المنزل، الوحدة السكنية...',
                labelText: 'الشارع'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(hintText: '872', labelText: 'الرمز البريدي'),
            SizedBox(
              height: Get.size.height / 30,
            ),
            CustomTextField(
                hintText: '+9720592072429', labelText: 'رقم الهاتف'),
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
