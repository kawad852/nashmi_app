import 'package:algoliasearch/algoliasearch.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/provider/provider_screen.dart';

import '../../alerts/errors/app_error_widget.dart';
import '../../utils/app_constants.dart';
import '../../utils/base_extensions.dart';
import '../../utils/my_theme.dart';
import '../../widgets/custom_network_image.dart';
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
  late Future<List<ProviderModel>> _searchFuture;

  void _initialize(String value) {
    if (value.isEmpty) {
      _searchFuture = Future.value([]);
      return;
    }
    _searchFuture = _fetch(value);
  }

  Future<List<ProviderModel>> _fetch(String query) async {
    try {
      if (query == '') {
        return List<ProviderModel>.empty();
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
      return providersFuture;
    } catch (e) {
      debugPrint("SearchError::: $e");
      return List<ProviderModel>.empty();
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
          future: _searchFuture,
          onComplete: (context, snapshot) {
            final providers = snapshot.data!;
            if (providers.isEmpty) {
              return const SizedBox.shrink();
            }
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  providers.length,
                  (int index) {
                    final element = providers[index];
                    return ListTile(
                      onTap: () {
                        context.navigate((context) {
                          return ProviderScreen(provider: element);
                        });
                      },
                      leading: CustomNetworkImage(
                        element.thumbnail!,
                        height: 45,
                        width: 45,
                        radius: MyTheme.radiusPrimary,
                      ),
                      title: Text(
                        context.translate(textEN: element.nameEn!, textAR: element.nameAr!),
                      ),
                      subtitle: Text(
                        context.translate(textEN: element.descriptionEn!, textAR: element.descriptionAr!),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                      ),
                    );
                  },
                ),
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
