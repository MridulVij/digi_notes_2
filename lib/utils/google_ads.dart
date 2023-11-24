import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAds {
  static RewardedAd? rewardedAd;
  int rewardedAttempts = 0;

  initRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-5498431563071990/3944304817',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;
          rewardedAttempts = 0;
        },
        onAdFailedToLoad: (error) {
          rewardedAttempts++;
          rewardedAd = null;
          if (kDebugMode) {
            print('failed to load${error.message}');
          }

          if (rewardedAttempts <= 5) {
            initRewardedAd();
          }
        },
      ),
    );
  }

  showRewardedAd() {
    if (rewardedAd == null) {
      if (kDebugMode) {
        print('trying to show before loading');
      }
      return;
    }
    rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) => print('ad showed $ad'),
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        initRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        if (kDebugMode) {
          print('failed to show the ad $ad');
        }
        initRewardedAd();
      },
    );
    rewardedAd!.show(
      onUserEarnedReward: (ad, reward) {
        print("reward");
      },
    );
    rewardedAd = null;
  }
}
