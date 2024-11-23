import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/products/ui/widgets/search/search_product_bloc_builder.dart';
import 'package:hero_store_app/features/products/ui/widgets/search_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
            const  SearchTextFormField(),
              vertcalSpace(20),
             const SearchProductBlocBuilder()
            ],
          ),
        ),
      ),
    );
  }
}

