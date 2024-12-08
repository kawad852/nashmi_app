import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/helper/separator.dart';
import 'package:nashmi_app/models/offer/offer_model.dart';
import 'package:nashmi_app/models/offer_settings/offer_settings_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/network/my_fields.dart';
import 'package:nashmi_app/screens/offers/widgets/more_offer_card.dart';
import 'package:nashmi_app/screens/offers/widgets/offer_card.dart';
import 'package:nashmi_app/screens/offers/widgets/offers_nav_bar.dart';
import 'package:nashmi_app/screens/offers/widgets/time_bubble.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/widgets/custom_svg.dart';
import 'package:nashmi_app/widgets/fire_paginator/fire_paginator.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';
import 'package:provider/provider.dart';

import '../../helper/ui_helper.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  late Future<List<dynamic>> _futures;
  late Query<OfferModel> _pinnedQuery;
  late Query<OfferModel> _offersQuery;

  void _initialize() {
    final query = FirebaseFirestore.instance.offers.orderBy(MyFields.createdAt, descending: true);
    _pinnedQuery = query.where(MyFields.pinned, isEqualTo: true);
    _offersQuery = query.where(MyFields.pinned, isEqualTo: false);
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<OfferSettingsModel?, OfferSettingsModel?>(
      selector: (context, provider) => provider,
      builder: (context, offer, child) {
        if (offer == null) {
          return const SizedBox.shrink();
        } else if (offer.lunchAt!.isAfter(DateTime.now())) {
          final parts = UiHelper.formatDuration(context, offer.lunchAt!);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.translate(textEN: offer.contentEn, textAR: offer.contentAr),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    parts.length,
                    (index) {
                      final part = parts[index];
                      return TimeBubble(time: part);
                    },
                  ).separator(const SizedBox(width: 10)).toList(),
                ),
              ],
            ),
          );
        }
        return NashmiScaffold(
          bottomNavigationBar: const OffersNavBar(),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {},
                  icon: const CustomSvg(MyIcons.menu),
                ),
                title: Text(
                  context.appLocalization.nashmiDay,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const CustomSvg(MyIcons.notification),
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                sliver: SliverToBoxAdapter(
                  child: FirePaginator(
                      query: _pinnedQuery,
                      builder: (context, snapshot) {
                        if (snapshot.docs.isEmpty) {
                          return const SizedBox.shrink();
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                context.appLocalization.luxuriousOffers,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 230,
                              child: ListView.separated(
                                separatorBuilder: (context, index) => const SizedBox(width: 10),
                                itemCount: snapshot.docs.length,
                                padding: const EdgeInsetsDirectional.only(top: 10, start: 20, end: 20),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                                    snapshot.fetchMore();
                                  }

                                  if (snapshot.isFetchingMore) {
                                    return snapshot.toggleLoader();
                                  }

                                  final offer = snapshot.docs[index].data();
                                  return OfferCard(
                                    offer: offer,
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
              FirePaginator(
                query: _offersQuery,
                isSliver: true,
                builder: (context, snapshot) {
                  if (snapshot.docs.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: SizedBox.shrink(),
                    );
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverMainAxisGroup(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Text(
                            context.appLocalization.more,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          sliver: SliverList.separated(
                            separatorBuilder: (context, index) => Divider(color: context.colorPalette.greyF7E),
                            itemCount: snapshot.docs.length,
                            itemBuilder: (context, index) {
                              if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                                snapshot.fetchMore();
                              }

                              if (snapshot.isFetchingMore) {
                                return snapshot.toggleLoader();
                              }

                              final offer = snapshot.docs[index].data();
                              return MoreOfferCard(
                                offer: offer,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
