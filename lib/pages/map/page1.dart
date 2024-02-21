import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  double long = 49.5;
  double lat = -0.09;
  LatLng point = LatLng(49.5, -0.09);
  var location = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            // onTap: (p) async {
            //   location = await Geocoder.local.findAddressesFromCoordinates(
            //       new Coordinates(p.latitude, p.longitude));

            //   setState(() {
            //     point = p;
            //     print(p);
            //   });

            //   print(
            //       "${location.first.countryName} - ${location.first.featureName}");
            // },
            center: LatLng(51.5, -0.09),
            zoom: 5.0,
          ),
          children: [
            TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c']),
            // RichAttributionWidget(
            //   popupInitialDisplayDuration: const Duration(seconds: 5),
            //   animationConfig: const ScaleRAWA(),
            //   showFlutterMapAttribution: false,
            //   attributions: [
            //     TextSourceAttribution(
            //       'OpenStreetMap contributors',
            //       onTap: () => launchUrl(
            //         Uri.parse('https://openstreetmap.org/copyright'),
            //       ),
            //     ),
            //     const TextSourceAttribution(
            //       'This attribution is the same throughout this app, except '
            //       'where otherwise specified',
            //       prependCopyright: false,
            //     ),
            //   ],
            // ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 34.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       const Card(
        //         child: TextField(
        //           decoration: InputDecoration(
        //             contentPadding: EdgeInsets.all(16.0),
        //             hintText: "Search for your localisation",
        //             prefixIcon: Icon(Icons.location_on_outlined),
        //           ),
        //         ),
        //       ),
        //       Card(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(
        //             children: [
        //               Text(
        //                   "${location.first.countryName},${location.first.locality}, ${location.first.featureName}"),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
