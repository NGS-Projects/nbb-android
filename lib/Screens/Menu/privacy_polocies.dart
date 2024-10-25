import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  bool isLoading = true;

  late WebViewController webView;

  Future<bool> _onBack() async {
    var value = await webView.canGoBack();

    if (value) {
      await webView.goBack();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBack(),
      child: Scaffold(
        backgroundColor: Kwhite,
        appBar: Bankappbar(
          dontHaveBackAsLeading: false,
          title: "Privacy Policy",
        ),
        body: SafeArea(
          child: Stack(
            children: [
              WebView(
                initialUrl:
                    "https://sites.google.com/view/nuhvin-blood-bank-privacy/home",
                //   "https://sites.google.com/view/nuhvinbloodbank/nbb-privacy-policy",
                //    "http://bloodbank.nuhvin.com/policy",

                javascriptMode: JavascriptMode.unrestricted,
                onPageStarted: (url) {
                  setState(() {
                    isLoading = true;
                  });
                },
                onPageFinished: (status) {
                  setState(() {
                    isLoading = false;
                  });
                },
                onWebViewCreated: (WebViewController controller) {
                  webView = controller;
                },
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: kbloodred,
                      ),
                    )
                  : Stack(),
            ],
          ),
        ),
      ),
    );
  }
}
