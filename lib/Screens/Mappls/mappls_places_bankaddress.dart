import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mappls_place_widget/mappls_place_widget.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class PlacesSearchBanks extends StatefulWidget {
  const PlacesSearchBanks({super.key});

  @override
  State<PlacesSearchBanks> createState() => _PlacesSearchBanksState();
}

class _PlacesSearchBanksState extends State<PlacesSearchBanks> {
  ApiController authentication = Get.put(ApiController());
  ELocation _eLocation = ELocation();
  @override
  void initState() {
    openMapplsSearchWidget();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 100.h),
        child: CircularProgressIndicator(
          color: kbloodred,
        ),
      )

          //    RaisedButton(onPressed: initPlatformState ,child: Text("Go to native"),)
          ),
    );
  }
  //////////

  openMapplsSearchWidget() async {
    AutocompleteResult autocompleteResult;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      autocompleteResult = await openPlaceAutocomplete(PlaceOptions());
    } on PlatformException {
      autocompleteResult = AutocompleteResult();
    }
    if (kDebugMode) {
      print(json.encode(autocompleteResult.toJson()));
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    ELocation eLocation;
    if (autocompleteResult.eLocation != null) {
      eLocation = autocompleteResult.eLocation!;
    } else {
      eLocation = ELocation();
    }
    setState(() {
      _eLocation = eLocation;
      authentication.BloodBankAddressController.text =
          '${_eLocation.placeAddress}';
      print(authentication.BloodBankAddressController.value);
      Get.back();
    });
  }
  ///////////
}
