// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class BottomSheetMaps extends StatefulWidget {
  const BottomSheetMaps({Key? key}) : super(key: key);

  @override
  State<BottomSheetMaps> createState() => _BottomSheetMapsState();
}

class _BottomSheetMapsState extends State<BottomSheetMaps> {
  String locationadress = 'pick location';
  double latitude = 1, longitude = 36;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps search'),
      ),
      body: Center(
        child: InkWell(
          child: Text(locationadress),
          onTap: () {
            _showModal(context);
          },
        ),
      ),
    );
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 600,
            child: OpenStreetMapSearchAndPick(
                center: LatLong(latitude, longitude),
                buttonColor: Colors.blue,
                buttonText: 'Set Current Location',
                onPicked: (pickedData) {
                  print(pickedData.latLong.latitude);
                  print(pickedData.latLong.longitude);
                  print(pickedData.address);
                  Navigator.pop(context);
                  setState(() {
                    locationadress = pickedData.addressName;
                    latitude = pickedData.latLong.latitude;
                    longitude = pickedData.latLong.longitude;
                  });
                }),
          );
        });
  }
}
