import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:nashmi_app/models/category/category_model.dart';
import 'package:nashmi_app/models/provider/provider_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/network/my_fields.dart';
import 'package:nashmi_app/providers/location_provider.dart';
import 'package:nashmi_app/screens/provider/widgets/filter_sheet.dart';
import 'package:nashmi_app/screens/provider/widgets/provider_card.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/enums.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/area_button.dart';
import 'package:nashmi_app/widgets/custom_future_builder.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/fire_paginator/fire_paginator.dart';
import 'package:nashmi_app/widgets/header_tile.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:provider/provider.dart';

import '../../providers/providers_search_screen.dart';
import '../../widgets/grant_location_card.dart';

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
  Future<List<ProviderModel>> _nearestFuture = Future.value([]);

  List<String> get _getAllIds {
    List<String> ids = [];

    ids.add(widget.category.id!);
    for (var element in widget.category.subCategories) {
      ids.add(element);
    }

    return ids;
  }

  void _openFilterSheet(
    BuildContext context, {
    double? lat,
    double? lng,
  }) {
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
          if (filterEnum != FilterEnum.nearest) {
            _nearestFuture = Future.value([]);
          } else {
            getNearestProviders(lat!, lng!, categoryIds: _getAllIds);
          }
        });
      }
    });
  }

  Query<ProviderModel> _getQuery({
    required String? stateId,
    required String? cityId,
  }) {
    final query = FirebaseFirestore.instance.providers
        .where(MyFields.categoryIds, arrayContainsAny: _getAllIds)
        .where("state.id", isEqualTo: stateId)
        .where("city.id", isEqualTo: cityId);
    switch (filterEnum) {
      case FilterEnum.mostLikes:
        return query.orderBy(MyFields.likesCount, descending: true);
      case FilterEnum.topRated:
        return query.orderBy(MyFields.avgRating, descending: true);
      default:
        return query.orderBy(MyFields.avgRating, descending: true);
    }
  }

  void getNearestProviders(
    double lat,
    double lng, {
    required List<String> categoryIds,
  }) {
    try {
      _nearestFuture = GeoCollectionReference<ProviderModel>(FirebaseFirestore.instance.providers)
          .subscribeWithin(
            center: GeoFirePoint(GeoPoint(lat, lng)),
            radiusInKm: 10,
            field: MyFields.geo,
            geopointFrom: (provider) => provider.geo!.geoPoint!,
            queryBuilder: (provider) => provider.where(MyFields.categoryIds, arrayContainsAny: categoryIds),
          )
          .first
          .then((value) {
        return value.map((e) => e.data()!).toList();
      });
    } catch (e) {
      _nearestFuture = Future.value([]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NashmiScaffold(
      body: Consumer<LocationProvider>(
        builder: (BuildContext context, locationProvider, Widget? child) {
          if (!locationProvider.isLocationGranted) {
            return const GrantLocationCard(
              onPermissionGranted: null,
            );
          }
          final stateId = locationProvider.selectedState?.id;
          final cityId = locationProvider.selectedCity?.id;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                centerTitle: true,
                collapsedHeight: 100,
                title: const AreaButton(),
                flexibleSpace: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        const Expanded(
                          child: ProvidersSearchScreen(),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            _openFilterSheet(
                              context,
                              lat: locationProvider.latitude,
                              lng: locationProvider.longitude,
                            );
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
              if (filterEnum == FilterEnum.nearest)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: kScreenMargin),
                  sliver: CustomFutureBuilder(
                    future: _nearestFuture,
                    isSliver: true,
                    onComplete: (context, snapshot) {
                      if (snapshot.data!.isEmpty) {
                        return const SliverToBoxAdapter(child: SizedBox.shrink());
                      }
                      return SliverList.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final provider = snapshot.data![index];
                          return ProviderCard(
                            provider: provider,
                          );
                        },
                      );
                    },
                    onError: (error) => const SizedBox.shrink(),
                  ),
                ),
              if (filterEnum != FilterEnum.nearest)
                FirePaginator(
                  key: ValueKey("${filterEnum.value}$stateId$cityId"),
                  query: _getQuery(
                    stateId: stateId,
                    cityId: cityId,
                  ),
                  isSliver: true,
                  builder: (context, snapshot) {
                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: kScreenMargin),
                      sliver: SliverList.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemCount: snapshot.docs.length,
                        itemBuilder: (context, index) {
                          if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                            snapshot.fetchMore();
                          }

                          if (snapshot.isFetchingMore) {
                            return snapshot.toggleLoader();
                          }

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
          );
        },
      ),
    );
  }
}
