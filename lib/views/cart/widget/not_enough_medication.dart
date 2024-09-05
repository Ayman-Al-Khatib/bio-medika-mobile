import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/helpers/get_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotEnoughMedication extends StatelessWidget {
  const NotEnoughMedication({super.key, required this.data});

  final List data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        double availableHeight = size.height * 0.5;

        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.minHeight,
            maxHeight: availableHeight,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppTextsEnglish.Excuse_me.tr,
                  style: const TextStyle(
                    fontSize: AppConstants.val_17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppConstants.val_6),
                Text(
                  AppTextsEnglish
                      .Review_quantities_for_selected_items_Modify_or_await_restock
                      .tr,
                  style: const TextStyle(
                    fontSize: AppConstants.val_14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppConstants.val_10),
                Table(
                  border:
                      TableBorder.all(borderRadius: BorderRadius.circular(6)),
                  children: [
                    _buildHeadingRow(),
                    ..._buildDataRows(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TableRow _buildHeadingRow() {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppTextsEnglish.Name.tr,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppTextsEnglish.Quantity.tr,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  List<TableRow> _buildDataRows() {
    return data.map<TableRow>((item) {
      return TableRow(
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.val_8),
              child: Text(
                getTextLang(
                    nameEnglish: item['commercial_name_en'],
                    nameArabic: item[
                        'commercial_name_ar']), // Replace 'Name' with the actual key
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.val_8),
              child: Text(
                '${item['quantity'] ?? ''}', // Replace 'Quantity' with the actual key
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      );
    }).toList();
  }
}
