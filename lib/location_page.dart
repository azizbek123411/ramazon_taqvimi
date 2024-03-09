import 'dart:developer';

import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ramazon_taqvimi/src/repository/providers/times_provider.dart';
class LocationPage extends StatefulHookConsumerWidget {
  const LocationPage({super.key});

  @override
  ConsumerState<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends ConsumerState<LocationPage> {
  double distanceInMeters = Geolocator.distanceBetween(41.2744494, 69.200424, 41.2940167, 69.2269554);

  @override
  Widget build(BuildContext context) {
    final provider=ref.watch(mosqueProvider);
    final provider2=ref.watch(distanceProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            provider.when(data: (data){
              return SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context,index){return Text(data[index]!.name);}),
              );
            }, error: (error,st){
              return Text(error.toString());
            }, loading: (){
              return const CircularProgressIndicator();
            }),
            TextButton(onPressed: () {
              log(distanceInMeters.toString());
            }, child: const Text("Calculate"),),
            provider2.when(data: (data){
              return SizedBox(
                height: 100,
                child: ListView.builder(itemBuilder: (context,index){
                  return Text(data[index].toString());
                }),
              );
            }, error: (e,st){
              return Text(e.toString(),);
            }, loading: (){
              return const CircularProgressIndicator();
            })
          ],
        ),
      ),
    );
  }
}
