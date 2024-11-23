import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/extentions.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/widgets/app_text_form_field.dart';
import 'package:hero_store_app/features/products/logic/search_cubit/cubit/search_cubit.dart';

class SearchTextFormField extends StatefulWidget {
  const SearchTextFormField({super.key});

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  @override
  Widget build(BuildContext context) {
    var searchCubit = context.read<SearchproductCubit>();
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back)),
            Container(
              width: 320,
              child: AppTextFormField(
                onChanged: (value) {
                  setState(() {
                    searchCubit.search.text = value;
                  });
                  searchCubit.searchByName(value);
                },
                hintText: 'Search',
                hintStyle: TextStyle(color: AppColors.primaryColor),
                controller: searchCubit.search,
                validator: (value) {},
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    searchCubit.search.clear();
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.searchScreen);
                  },
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
