import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/models/provider/provider_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/network/my_fields.dart';
import 'package:nashmi_app/screens/provider/widgets/filter_sheet.dart';
import 'package:nashmi_app/screens/provider/widgets/provider_card.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_back.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/editors/base_editor.dart';
import 'package:nashmi_app/widgets/fire_paginator/fire_paginator.dart';
import 'package:nashmi_app/widgets/header_tile.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';

class ProvidersScreen extends StatefulWidget {
  final CategoryModel category;

  const ProvidersScreen({
    super.key,
    required this.category,
  });

  @override
  State<ProvidersScreen> createState() => _ProvidersScreenState();
}

class _ProvidersScreenState extends State<ProvidersScreen> {
  var filterEnum = FilterEnum.topRated;

  List<String> get _getAllIds {
    List<String> ids = [];

    ids.add(widget.category.id!);
    for (var element in widget.category.subCategories) {
      ids.add(element);
    }

    return ids;
  }

  void _openFilterSheet(BuildContext context) {
    showModalBottomSheet<FilterEnum?>(
        context: context,
        backgroundColor: context.colorPalette.greyF2F,
        builder: (context) {
          return FilterSheet(
            filterEnum: filterEnum,
          );
        }).then((value) {
      if (value != null && value != filterEnum) {
        setState(() {
          filterEnum = value;
        });
      }
    });
  }

  Query<ProviderModel> _getQuery() {
    final query = FirebaseFirestore.instance.providers.where(MyFields.categoryIds, arrayContainsAny: _getAllIds);
    switch (filterEnum) {
      case FilterEnum.mostLikes:
        return query.orderBy(MyFields.likesCount, descending: true);
      case FilterEnum.nearest:
        return query.orderBy(MyFields.avgRating, descending: true);
      default:
        return query.orderBy(MyFields.avgRating, descending: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NashmiScaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            leadingWidth: kBarLeadingWith,
            collapsedHeight: 100,
            leading: const CustomBack(),
            title: InkWell(
              onTap: () async {
                try {
                  final d = await FirebaseFirestore.instance.providers.where(MyFields.categoryIds, arrayContains: _getAllIds).get();
                } catch (e) {
                  print("eeee::: $e");
                }
              },
              child: const Row(
                children: [
                  Flexible(
                    child: CustomText(
                      "📍️عمان ، خلدا",
                      fontSize: 16,
                      overFlow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  CustomSvg(MyIcons.arrowDown),
                ],
              ),
            ),
            flexibleSpace: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: BaseEditor(
                        hintText: context.appLocalization.whatAreYouLooking,
                        hintStyle: TextStyle(
                          color: context.colorPalette.blackD1D,
                          fontSize: 14,
                        ),
                        prefixIcon: const IconButton(
                          onPressed: null,
                          icon: CustomSvg(MyIcons.search),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _openFilterSheet(context);
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: context.colorPalette.greyF2F,
                          borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                        ),
                        child: const CustomSvg(MyIcons.filter),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: HeaderTile(
              title: context.translate(
                textEN: widget.category.nameEn!,
                textAR: widget.category.nameAr!,
              ),
            ),
          ),
          FirePaginator(
            key: ValueKey(filterEnum),
            query: _getQuery(),
            isSliver: true,
            builder: (context, snapshot) {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: kScreenMargin),
                sliver: SliverList.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: snapshot.docs.length,
                  itemBuilder: (context, index) {
                    final provider = snapshot.docs[index].data();
                    return ProviderCard(
                      provider: provider,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
