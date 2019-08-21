import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ovprogresshud/progresshud.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Progresshud.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      // _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Progress example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              button('loadingAndSuccessAfter3s', () async {
                await Progresshud.show();
                await Future.delayed(Duration(seconds: 3));
                await Progresshud.dismiss();
                await Progresshud.showSuccessWithStatus('success');
              }),
              button('show', () async {
                await Progresshud.show();
              }),
              
              button('showWithStatus', () async {
                await Progresshud.showWithStatus('myinfo');
              }),
              button('showInfoWithStatus', () async {
                await Progresshud.showInfoWithStatus('myinfo');
              }),
              button('showErrorWithStatus', () async {
                await Progresshud.showErrorWithStatus('myinfo');
              }),
              button('showSuccessWithStatus', () async {
                await Progresshud.showSuccessWithStatus('myinfo');
              }),
              // button('setDefaultStyleDark', () async {
              //   await Progresshud.setDefaultStyleDark();
              // }),
              // button('setDefaultStyleLight', () async {
              //   await Progresshud.setDefaultStyleLight();
              // }),
              button('setDefaultMaskTypeNone', () async {
                await Progresshud.setDefaultMaskTypeNone();
              }),
              button('setDefaultMaskTypeBlack', () async {
                await Progresshud.setDefaultMaskTypeBlack();
              }),
              button('setDefaultMaskTypeClear', () async {
                await Progresshud.setDefaultMaskTypeClear();
              }),
              button('setDefaultMaskTypeGradient', () async {
                await Progresshud.setDefaultMaskTypeGradient();
              }),
              button('dismiss', () async {
                await Progresshud.dismiss();
              }),
            ],
          ),
        ),
      ),
    );
  }

  Timer dismissTimer;

  Widget button(String title, VoidCallback callback) {
    return new MaterialButton(
      child: Text(
        title,
        style: new TextStyle(
          color: Colors.white,
        ),
      ),
      color: Colors.blueAccent,
      onPressed: () async {
        callback();
        dismissTimer?.cancel();
        dismissTimer = new Timer(new Duration(seconds: 5), () async {
          if (await Progresshud.isVisible()) {
            await Progresshud.dismiss();
            print('dismiss');
          } else {
            print('..');
          }
        });
      },
    );
  }
}
