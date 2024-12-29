import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';

import 'custom_network_image.dart';

class PhotosViewerScreen extends StatefulWidget {
  final List<String> photos;
  final int initialIndex;

  const PhotosViewerScreen({
    super.key,
    required this.photos,
    required this.initialIndex,
  });

  @override
  State<PhotosViewerScreen> createState() => _PhotosViewerScreenState();
}

class _PhotosViewerScreenState extends State<PhotosViewerScreen> {
  late int _currentIndex;
  late PageController _pageController;
  late ScrollController _scrollController;
  late List<GlobalKey> _globalKeys;

  int get _duration => 250;

  void _scrollToIndex() {
    Scrollable.ensureVisible(
      _globalKeys[_currentIndex].currentContext!,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      alignment: 0.5,
    );
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _globalKeys = List.generate(widget.photos.length, (index) => GlobalKey(debugLabel: '$index'));
    _pageController = PageController(initialPage: widget.initialIndex);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _currentIndex = value;
                      });
                      _scrollToIndex();
                    },
                    children: widget.photos.map((element) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Center(
                          child: CustomNetworkImage(
                            element,
                            radius: 0,
                            boxFit: BoxFit.contain,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: _currentIndex != 0,
                          maintainState: true,
                          maintainSize: true,
                          maintainAnimation: true,
                          child: IconButton.filledTonal(
                            onPressed: () {
                              _pageController.previousPage(
                                duration: Duration(milliseconds: _duration),
                                curve: Curves.easeIn,
                              );
                              _scrollToIndex();
                            },
                            icon: const Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                        Visibility(
                          visible: _currentIndex + 1 != widget.photos.length,
                          maintainState: true,
                          maintainSize: true,
                          maintainAnimation: true,
                          child: IconButton.filledTonal(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: _duration),
                                curve: Curves.easeIn,
                              );
                              _scrollToIndex();
                            },
                            icon: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: List.generate(widget.photos.length, (index) {
                    final photo = widget.photos[index];
                    return CustomNetworkImage(
                      key: _globalKeys[index],
                      photo,
                      width: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      border: _currentIndex == index
                          ? Border.all(
                              width: 4,
                              color: context.colorScheme.primary,
                            )
                          : null,
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                        _pageController.jumpToPage(_currentIndex);
                      },
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
