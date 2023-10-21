import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Webview Communication Example'),
        ),
        body: WebViewCommunication(),
      ),
    );
  }
}

class WebViewCommunication extends StatefulWidget {
  @override
  _WebViewCommunicationState createState() => _WebViewCommunicationState();
}

class _WebViewCommunicationState extends State<WebViewCommunication> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://www.youtube.com',
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      javascriptChannels: <JavascriptChannel>{
        _toFlutterChannel(context),
      },
    );
  }

  JavascriptChannel _toFlutterChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'toFlutter',
      onMessageReceived: (JavascriptMessage message) {
        // 웹 페이지에서 Flutter 앱으로 메시지를 전달받는 부분
        print('Message from web page: ${message.message}');

        // 여기에서 필요한 작업을 수행합니다.
      },
    );
  }
}
