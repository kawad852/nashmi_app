import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/category_bubble.dart';
import 'package:nashmi_app/widgets/fire_builder.dart';
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
                widget.mainCategory != null
                    ? context.translate(
                        textEN: widget.mainCategory!.nameEn!,
                        textAR: widget.mainCategory!.nameAr!,
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
          if (widget.mainCategory != null) {
            return FireBuilder(
              futures: [
                FirebaseFirestore.instance.categories.where(MyFields.id, whereIn: widget.mainCategory!.subCategories).get(),
              ],
              onComplete: (context, snapshot) {
                final categorySnapshot = snapshot.data![0] as QuerySnapshot<CategoryModel>;
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: categorySnapshot.docs.length,
                  padding: const EdgeInsets.symmetric(horizontal: kScreenMargin),
                  itemBuilder: (context, index) {
                    final category = categorySnapshot.docs[index].data();
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
