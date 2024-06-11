import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/app_export.dart';
import '../splash_one_screen/splash_one_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  StreamSubscription<ConnectivityResult>? _subscription;
  bool _isDialogShown = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showSplashScreenAndCheckConnection();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<void> _showSplashScreenAndCheckConnection() async {
    // Ensure splash screen is visible for at least 2 seconds
    await Future.delayed(Duration(seconds: 2));
    await _checkInitialConnection();
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      _handleConnectivityChange(result);
    });
  }

  Future<void> _checkInitialConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    await _handleConnectivityChange(connectivityResult);
  }

  Future<void> _handleConnectivityChange(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      if (!_isDialogShown) {
        _showNoConnectionDialog();
      }
    } else {
      if (_isDialogShown) {
        Navigator.of(context).pop();
        setState(() {
          _isDialogShown = false;
        });
      }
      _navigateToSplashScreen();
    }
  }

  void _showNoConnectionDialog() {
    setState(() {
      _isDialogShown = true;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 300.0,
            height: 172.0,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'No Internet Connection',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Please check your internet connection.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                TextButton(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    setState(() {
                      _isDialogShown = false;
                    });
                    var connectivityResult =
                        await Connectivity().checkConnectivity();
                    _handleConnectivityChange(connectivityResult);
                  },
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      setState(() {
        _isDialogShown = false;
      });
    });
  }

  void _navigateToSplashScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => SplashOneScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 56.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.0),
              CustomImageView(
                imagePath: ImageConstant.imgXWhite1,
                height: 202.0,
                width: 277.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
