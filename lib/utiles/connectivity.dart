import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hope/utiles/fullscreen_loader.dart';

var nonetWork = "Veuillez vous assurer d'être connecté à un réseau Wi-Fi ou à des données mobiles";

class ConnetivityController extends GetxController {
  static ConnetivityController get instance => Get.find();

  final _connectivity = Connectivity();
  final Rx<ConnectivityResult> _connectivityStatus =
      ConnectivityResult.none.obs;
  late StreamSubscription<ConnectivityResult> _streamSubscription;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(updateConnectivity);
  }

  updateConnectivity(ConnectivityResult result) {
    _connectivityStatus.value = result;

    if (_connectivityStatus.value == ConnectivityResult.none) {
      return;
    }
  }

  Future<bool> isConnect() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        Get.to(NoConnexionScreen());
        Get.snackbar("Problème de réseau", nonetWork);
        
        //

        return false;
      } else {
        return true;
      }
    } on PlatformException {
      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamSubscription.cancel();
  }
}

class NoConnexionScreen extends StatelessWidget {
  const NoConnexionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pas de connexion"),
          actions: [],
        ),
        body: Center(
            child: Column(
          children: [
            Text(nonetWork),
            Icon(Icons.network_check, size: 100),
          ],
        )));
  }
}
