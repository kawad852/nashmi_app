import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/alerts/errors/app_error_widget.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/network/api_service.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/category_bubble.dart';
import 'package:nashmi_app/widgets/custom_future_builder.dart';
import 'package:nashmi_app/widgets/fire_paginator/fire_paginator.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';

import '../../network/my_fields.dart';
import '../../utils/my_theme.dart';
import '../../widgets/area_button.dart';
import '../provider/providers_screen.dart';

class CategoriesScreen extends StatefulWidget {
  final CategoryModel? mainCategory;

  const CategoriesScreen({
    super.key,
    this.mainCategory,
  });

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<CategoryModel>> _categoryFuture;
  late CategoryModel? _mainCategory;

  void _init() {
    _categoryFuture = ApiService.build(
      callBack: () async {
        return FirebaseFirestore.instance.categories.where(MyFields.id, whereIn: _mainCategory!.subCategories).get().then((value) {
          final categories = value.docs.map((e) => e.data()).toList();
          categories.insert(
            0,
            CategoryModel(
              id: "0",
              nameEn: "All",
              nameAr: "الكل",
              subCategories: categories.map((e) => e.id!).toList(),
            ),
          );
          return categories;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _mainCategory = widget.mainCategory;
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return NashmiScaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        title: const AreaButton(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: kScreenMargin, bottom: 10),
              child: Text(
                _mainCategory != null
                    ? context.translate(
                        textEN: _mainCategory!.nameEn!,
                        textAR: _mainCategory!.nameAr!,
                      )
                    : context.appLocalization.whatDoWehave,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: MyTheme.fontFamily,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (_mainCategory != null) {
            return CustomFutureBuilder(
              future: _categoryFuture,
              onComplete: (context, snapshot) {
                final categorySnapshot = snapshot.data!;
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: categorySnapshot.length,
                  padding: const EdgeInsets.symmetric(horizontal: kScreenMargin),
                  itemBuilder: (context, index) {
                    final category = categorySnapshot[index];
                    return GestureDetector(
                      onTap: () {
                        context.push(ProvidersScreen(
                          category: category,
                        ));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: context.colorPalette.greyF2F,
                          borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                context.translate(
                                  textEN: category.nameEn!,
                                  textAR: category.nameAr!,
                                ),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: context.colorPalette.blackD1D,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              onError: (error) {
                return AppErrorWidget(
                  error: error,
                  onRetry: () {
                    setState(() {
                      _init();
                    });
                  },
                );
              },
            );
          }
          return FirePaginator(
            pageSize: 30,
            query: context.fireProvider.mainCategoriesQuery,
            builder: (context, snapshot) {
              final categories = snapshot.docs;
              return GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                    snapshot.fetchMore();
                  }

                  if (snapshot.isFetchingMore) {
                    return snapshot.toggleLoader();
                  }

                  final category = categories[index].data();
                  return CategoryBubble(
                    category: category,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
