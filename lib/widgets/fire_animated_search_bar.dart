import 'package:flutter/material.dart';

import 'my_search_anchor.dart';

class FireAnimatedSearchBar extends StatefulWidget {
  final Function(String, void Function(void Function()) onRebuild) onChanged;
  final Widget Function(BuildContext context, String query) resultsBuilder;
  final String hintText;
  final bool isFullScreen;
  final Widget Function(BuildContext, MySearchController) builder;

  const FireAnimatedSearchBar({
    super.key,
    required this.onChanged,
    required this.resultsBuilder,
    required this.hintText,
    this.isFullScreen = true,
    required this.builder,
  });

  @override
  State<FireAnimatedSearchBar> createState() => _FireAnimatedSearchBarState();
}

class _FireAnimatedSearchBarState extends State<FireAnimatedSearchBar> {
  @override
  Widget build(BuildContext context) {
    return MySearchAnchor(
      viewHintText: widget.hintText,
      isFullScreen: widget.isFullScreen,
      viewTrailing: const [],
      viewConstraints: const BoxConstraints(maxWidth: 600),
      viewOnChanged: (value) {
        widget.onChanged(value, setState);
      },
      builder: widget.builder,
      resultsBuilder: widget.resultsBuilder,
    );
  }
}
