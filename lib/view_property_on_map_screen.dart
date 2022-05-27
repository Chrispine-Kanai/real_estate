import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewPropertyOnMap extends StatefulWidget {
  const ViewPropertyOnMap({Key? key}) : super(key: key);

  @override
  State<ViewPropertyOnMap> createState() => _ViewPropertyOnMapState();
}

class _ViewPropertyOnMapState extends State<ViewPropertyOnMap> {
  late GoogleMapController _mapController;
  final LatLng _center = const LatLng(-1.286389, 36.817223);

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: LatLng(
            -1.3299988365181687,
            36.862984584654335,
          ),
          zoom: 18.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _markers.add(
      const Marker(
        markerId: MarkerId('Work'),
        position: LatLng(
          -1.3299988365181687,
          36.862984584654335,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Location'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 18.0,
              ),
              markers: _markers,
            ),
          ),
        ],
      ),
    );
  }
}
