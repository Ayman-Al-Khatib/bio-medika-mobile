import 'package:bio_medika/views/categories/widget/image_sliver_appbar_categories.dart';
import 'package:bio_medika/views/categories/widget/list_sliver_appbar_categories.dart';
import 'package:bio_medika/views/categories/widget/search_sliver_appbar_categories.dart';
import 'package:flutter/material.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomImageSliverAppBarCategory(),
        CustomSearchSliverAppBarCategory(),
        CustomListSliverAppBarCategory(),
      ],
    );
  }
}
