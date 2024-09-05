import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker {
  final Connectivity _connectivity = Connectivity();

  final StreamController<bool> _networkStatusController = StreamController<bool>.broadcast();

  Stream<bool> get networkStatusStream => _networkStatusController.stream;

  NetworkChecker() {
    _initialize();
  }

  Future<void> _initialize() async {
    // Check the connectivity status
    List<ConnectivityResult> results = await _connectivity.checkConnectivity();
    // Update network status based on the results
    _updateNetworkStatus(results);

    // Listen to connectivity changes
    _connectivity.onConnectivityChanged.listen(_updateNetworkStatus);
  }

  void _updateNetworkStatus(List<ConnectivityResult> results) {
    // Determine if any of the results indicate connectivity
    bool isOnline = results.any((result) => result != ConnectivityResult.none);
    _networkStatusController.add(isOnline);
  }

  Future<bool> isOnline() async {
    // Check the connectivity status
    List<ConnectivityResult> results = await _connectivity.checkConnectivity();
    // Determine if any of the results indicate connectivity
    return results.any((result) => result != ConnectivityResult.none);
  }

  void dispose() {
    _networkStatusController.close();
  }
}
