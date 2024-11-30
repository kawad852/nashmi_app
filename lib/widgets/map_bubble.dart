import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controllers/map_controller.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/base_extensions.dart';

class MapBubble extends StatefulWidget {
  final double zoom;
  final Function(CameraPosition cameraPosition)? onCameraMove;
  final Function(LatLng latLng)? onTap;
  final bool zoomGesturesEnabled;
  final Set<Marker> markers;
  final MapController controller;

  const MapBubble({
    Key? key,
    this.zoom = kMapZoom,
    this.onCameraMove,
    this.onTap,
    this.zoomGesturesEnabled = true,
    this.markers = const {},
    required this.controller,
  }) : super(key: key);

  @override
  State<MapBubble> createState() => _MapBubbleState();
}

class _MapBubbleState extends State<MapBubble> {
  late MapController _controller;
  bool _loading = true;

  void _toggleLoading() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _toggleLoading();
    _controller = widget.controller;
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(_controller.latitude, _controller.longitude),
            zoom: widget.zoom,
          ),
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          mapToolbarEnabled: false,
          zoomGesturesEnabled: widget.zoomGesturesEnabled,
          onMapCreated: (GoogleMapController controller) {
            _controller.googleMapCtrl.complete(controller);
          },
          onCameraMove: widget.onCameraMove,
          onTap: widget.onTap,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 36),
          child: Icon(
            Icons.location_pin,
            size: 40,
            color: context.colorScheme.surfaceTint,
          ),
        ),
        if (_loading)
          Padding(
            padding: const EdgeInsets.all(10),
            child: context.loaders.circular(
              isSmall: true,
              alignment: AlignmentDirectional.topEnd,
              color: context.colorScheme.onSurface,
            ),
          ),
      ],
    );
  }
}
