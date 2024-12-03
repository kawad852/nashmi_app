import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/models/like/like_model.dart';
import 'package:nashmi_app/network/fire_queries.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/providers_extension.dart';

import '../../../helper/my_factory.dart';
import '../../../network/my_fields.dart';
import '../../../utils/my_icons.dart';
import '../../../utils/my_theme.dart';
import '../../../widgets/custom_stream_builder.dart';
import '../../../widgets/custom_svg.dart';

class LikeBuilder extends StatefulWidget {
  final int count;
  final String id;

  const LikeBuilder({
    super.key,
    required this.count,
    required this.id,
  });

  @override
  State<LikeBuilder> createState() => _LikeBuilderState();
}

class _LikeBuilderState extends State<LikeBuilder> {
  late Stream<DocumentSnapshot<LikeModel>> _stream;
  late int _count;

  String get _providerId => widget.id;
  DocumentReference<LikeModel> get _likeDocRef => context.userProvider.likesCollectionRef.doc(_providerId);

  void _initialize() {
    _stream = _likeDocRef.snapshots();
  }

  void _toggleLike(bool liked) {
    final batch = FirebaseFirestore.instance.batch();
    if (liked) {
      batch.delete(_likeDocRef);
      batch.update(
        FirebaseFirestore.instance.providers.doc(_providerId),
        {
          MyFields.likesCount: FieldValue.increment(-1),
        },
      );
      _count--;
    } else {
      batch.set(
          _likeDocRef,
          LikeModel(
            id: MyFactory.generateId,
            providerId: _providerId,
            createdAt: DateTime.now(),
          ));
      batch.update(
        FirebaseFirestore.instance.providers.doc(_providerId),
        {
          MyFields.likesCount: FieldValue.increment(1),
        },
      );
      _count++;
    }
    setState(() {});
    batch.commit();
  }

  @override
  void initState() {
    super.initState();
    _count = widget.count;
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
      stream: _stream,
      onLoading: () => const SizedBox.shrink(),
      onError: (error) => const SizedBox.shrink(),
      onComplete: (context, snapshot) {
        final isLike = snapshot.data!.exists;
        return FadeIn(
          child: Container(
            padding: const EdgeInsetsDirectional.all(10),
            decoration: BoxDecoration(
              color: context.colorPalette.greyF2F,
              borderRadius: BorderRadius.circular(MyTheme.radiusSecondary),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _toggleLike(isLike);
                  },
                  child: CustomSvg(isLike ? MyIcons.like : MyIcons.emptyLike),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                  child: Text(
                    context.appLocalization.like,
                  ),
                ),
                Text(
                  "$_count",
                  style: TextStyle(
                    fontSize: 12,
                    color: context.colorPalette.grey8F8,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
