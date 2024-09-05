import 'package:bio_medika/views/drugs/widget/image_sliver_appbar_drug.dart';
import 'package:bio_medika/views/drugs/widget/list_sliver_appbar_drug.dart';
import 'package:bio_medika/views/drugs/widget/search_sliver_appbar_drug.dart';
import 'package:flutter/material.dart';

class DrugBody extends StatelessWidget {
  const DrugBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomImageSliverAppBarDrug(),
        CustomSearchSliverAppBarDrug(),
        CustomListSliverAppBarDrug(),
      ],
    );
  }
}
