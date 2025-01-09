import 'package:algoliasearch/algoliasearch.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/models/tag/tag_model.dart';
import 'package:nashmi_app/widgets/search_builder.dart';

import '../../alerts/errors/app_error_widget.dart';
import '../../utils/app_constants.dart';
import '../../utils/base_extensions.dart';
import '../models/provider/provider_model.dart';
import '../utils/my_icons.dart';
import '../widgets/custom_future_builder.dart';
import '../widgets/custom_svg.dart';
import '../widgets/editors/base_editor.dart';
import '../widgets/fire_animated_search_bar.dart';

class ProvidersSearchScreen extends StatefulWidget {
  const ProvidersSearchScreen({super.key});

  @override
  State<ProvidersSearchScreen> createState() => _ProvidersSearchScreenState();
}

class _ProvidersSearchScreenState extends State<ProvidersSearchScreen> {
  late SearchClient _algolia;
  late Future<List<dynamic>> _searchFuture;

  void _initialize(String value) {
    if (value.isEmpty) {
      _searchFuture = Future.value([]);
      return;
    }
    _searchFuture = _fetch(value);
  }

  Future<List<dynamic>> _fetch(String query) async {
    try {
      if (query == '') {
        return [];
      }
      final providersFuture = _algolia
          .searchIndex(
        request: SearchForHits(
          indexName: AlgoliaIndices.providers,
          query: query,
          hitsPerPage: 10,
        ),
      )
          .then((value) {
        return value.hits.map((e) => ProviderModel.fromJson(e.toJson())).toList();
      });
      final tagsFuture = _algolia
          .searchIndex(
        request: SearchForHits(
          indexName: AlgoliaIndices.tags,
          query: query,
          hitsPerPage: 10,
        ),
      )
          .then((value) {
        return value.hits.map((e) => TagModel.fromJson(e.toJson())).toList();
      });
      return Future.wait([providersFuture, tagsFuture]);
    } catch (e) {
      debugPrint("SearchError::: $e");
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    _algolia = SearchClient(
      appId: kAlgoliaApplicationId,
      apiKey: kAlgoliaApiKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FireAnimatedSearchBar(
      hintText: context.appLocalization.whatAreYouLooking,
      onChanged: (value, onRebuild) {
        onRebuild(() {
          _initialize(value);
        });
      },
      builder: (context, controller) {
        return BaseEditor(
          hintText: context.appLocalization.whatAreYouLooking,
          hintStyle: TextStyle(
            color: context.colorPalette.blackD1D,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: const IconButton(
            onPressed: null,
            icon: CustomSvg(MyIcons.search),
          ),
          readOnly: true,
          onTap: () {
            controller.openView();
          },
        );
      },
      resultsBuilder: (context, query) {
        if (query.isEmpty) {
          return const SizedBox.shrink();
        }
        return CustomFutureBuilder(
          key: ValueKey(query),
          future: _searchFuture,
          onComplete: (context, snapshot) {
            final providers = snapshot.data![0] as List<ProviderModel>;
            final tags = snapshot.data![1] as List<TagModel>;
            if (providers.isEmpty && tags.isEmpty) {
              return const SizedBox.shrink();
            }
            return SingleChildScrollView(
              child: SearchBuilder(
                providers: providers,
                tagIds: tags.map((e) => e.id!).toList(),
              ),
            );
          },
          onError: (error) {
            return AppErrorWidget(
              error: error,
              onRetry: () {
                setState(() {
                  _initialize('');
                });
              },
            );
          },
        );
      },
    );
  }
}
