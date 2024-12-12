import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/helper/my_factory.dart';
import 'package:nashmi_app/models/favorite/favorite_model.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/custom_stream_builder.dart';

import '../../../utils/my_icons.dart';
import '../../../widgets/custom_svg.dart';

class FavoriteButton extends StatefulWidget {
  final String id;

  const FavoriteButton({
    super.key,
    required this.id,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late Stream<DocumentSnapshot<FavoriteModel>> _stream;

  String get _providerId => widget.id;
  DocumentReference<FavoriteModel> get _favDocRef => context.userProvider.favoritesCollectionRef.doc(_providerId);

  void _toggleFavorite(bool inFav) {
    if (inFav) {
      _favDocRef.delete();
    } else {
      _favDocRef.set(
        FavoriteModel(
          id: MyFactory.generateId,
          createdAt: DateTime.now(),
          providerId: _providerId,
        ),
      );
    }
  }

  void _initialize() {
    _stream = _favDocRef.snapshots();
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
      stream: _stream,
      onLoading: () => const SizedBox.shrink(),
      onError: (error) => const SizedBox.shrink(),
      onComplete: (context, snapshot) {
        final inFav = snapshot.data!.exists;
        return ZoomIn(
          child: IconButton(
            onPressed: () {
              _toggleFavorite(inFav);
            },
            icon: CustomSvg(
              inFav ? MyIcons.favSelect : MyIcons.favorite,
              color: inFav ? context.colorPalette.red018 : null,
            ),
          ),
        );
      },
    );
  }
}
