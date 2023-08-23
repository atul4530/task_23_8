import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/view/dog_image_screen.dart';
import 'package:task/view/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final MethodChannel _channel = MethodChannel('bluetooth_channel');

  Future<void> enableBluetooth() async {
    try {
      await _channel.invokeMethod('enableBluetooth');
    } on PlatformException catch (e) {
      print("Error: ${e.message}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RandonDogImage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black
                ),
                margin: const EdgeInsets.all(8),
                child: Container(
                  constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: const Text(
                    'Random dog images',style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                enableBluetooth();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black
                ),
                margin: const EdgeInsets.all(8),
                child: Container(
                  constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: const Text(
                    'Enable Bluetooth',style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black
                ),
                margin: const EdgeInsets.all(8),
                child: Container(
                  constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: const Text(
                    'Profile',style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
