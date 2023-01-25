import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class OttPlatform extends StatefulWidget {
  const OttPlatform({super.key});

  @override
  State<OttPlatform> createState() => _OttPlatformState();
}

class _OttPlatformState extends State<OttPlatform> {
  InAppWebViewController? inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> web =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(web["name"]),
        actions: [
          IconButton(
              onPressed: () async {
                await inAppWebViewController?.loadUrl(
                    urlRequest: URLRequest(url: Uri.parse(web["url"])));
              },
              icon: Icon(Icons.home)),
          IconButton(
              onPressed: () async {
                await inAppWebViewController?.goBack();
              },
              icon: Icon(Icons.arrow_back_ios)),
          IconButton(
              onPressed: () async {
                await inAppWebViewController?.reload();
              },
              icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () async {
                await inAppWebViewController?.goForward();
              },
              icon: Icon(Icons.arrow_forward_ios))
        ],
      ),
      body: InAppWebView(
        onWebViewCreated: (controller) {
          inAppWebViewController = controller;
        },
        initialUrlRequest: URLRequest(url: Uri.parse(web["url"])),
        // pullToRefreshController: ,
      ),
    );
  }
}