import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app/app.dart';
import 'features/ads/ad_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("Firebase Error: $e");
  }

  try {
    await MobileAds.instance.initialize();
  } catch (e) {
    debugPrint("AdMob Error: $e");
  }

  AdService.loadInterstitialAd();
  AdService.loadRewardedAd();

  runApp(const GeniusChallengeApp());
}
