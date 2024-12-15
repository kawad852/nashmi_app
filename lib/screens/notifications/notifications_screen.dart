import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/dimensions.dart';
import 'package:nashmi_app/utils/my_images.dart';
import 'package:nashmi_app/utils/my_theme.dart';
import 'package:nashmi_app/widgets/custom_text.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';

import '../../models/notification/notification_model.dart';
import '../../network/my_collections.dart';
import '../../network/my_fields.dart';
import '../../notifications/notifications_route.dart';
import '../../utils/shared_pref.dart';
import '../../widgets/builders/custom_firestore_query_builder.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> with AutomaticKeepAliveClientMixin {
  late Query<NotificationModel> _notificationsQuery;

  void _initializeQuery() {
    _notificationsQuery = FirebaseFirestore.instance
        .collectionGroup(MyCollections.notifications)
        .where(MyFields.topic, isEqualTo: 'all_${MySharedPreferences.language}')
        .orderBy(MyFields.createdAt, descending: true)
        .withConverter<NotificationModel>(
          fromFirestore: (snapshot, _) => NotificationModel.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson(),
        );
  }

  @override
  void initState() {
    super.initState();
    _initializeQuery();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NashmiScaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        title: Text(
          context.appLocalization.notifications,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CustomFirestoreQueryBuilder(
        query: _notificationsQuery,
        onComplete: (context, snapshot) {
          // if (snapshot.docs.isEmpty) {
          //   return EmptyWidget(
          //     icon: FontAwesomeIcons.bell,
          //     title: context.appLocalization.emptyNotificationsTitle,
          //     body: context.appLocalization.emptyNotificationsBody,
          //   );
          // }

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(color: context.colorPalette.greyF7E),
            itemCount: snapshot.docs.length,
            padding: const EdgeInsets.all(kScreenMargin),
            itemBuilder: (context, index) {
              if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                snapshot.fetchMore();
              }

              final notification = snapshot.docs[index].data();
              final id = notification.data?.id;
              return GestureDetector(
                onTap: () {
                  final type = notification.data?.type;
                  NotificationsRouteHandler.toggle(context, id: id, type: type);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          margin: const EdgeInsetsDirectional.only(end: 10),
                          decoration: BoxDecoration(
                            color: context.colorPalette.blackD1D,
                            borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
                            image: const DecorationImage(
                              image: AssetImage(MyImages.logoWhite),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification.notification!.title!,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                notification.notification!.body!,
                                style: TextStyle(
                                  color: context.colorPalette.grey5F5,
                                  fontSize: 12,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (notification.createdAt != null)
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: CustomText(
                          intl.DateFormat.yMd().add_jm().format(notification.createdAt!),
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
