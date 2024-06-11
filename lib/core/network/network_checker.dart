import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _connectionStatus = 'Checking...';

  @override
  void initState() {
    super.initState();
    checkNetworkStatus();
  }

  Future<void> checkNetworkStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _connectionStatus = 'No Internet Connection';
      });
    } else {
      setState(() {
        _connectionStatus = 'Internet Connection Available';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Connection Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Network Connection Demo'),
        ),
        body: Center(
          child: Text(
            _connectionStatus,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
