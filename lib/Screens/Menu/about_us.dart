import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
          title: "About Us",
        ),
        body: SafeArea(
          child: Stack(
            children: [
              WebView(
                initialUrl: "http://bloodbank.nuhvin.com/whoweare",
                //"http://bloodbank.nuhvin.com/registor",
                // http://bloodbank.nuhvin.com/policy
                // http://bloodbank.nuhvin.com/temsconditions
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
