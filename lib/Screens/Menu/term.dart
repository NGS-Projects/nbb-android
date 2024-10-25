import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
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
          title: "Terms and Conditions",
        ),
        body: SafeArea(
          child: Stack(
            children: [
              WebView(
                initialUrl: "http://bloodbank.nuhvin.com/temsconditions", //
                // https://bloodbank.nuhvin.com/temsconditions
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
