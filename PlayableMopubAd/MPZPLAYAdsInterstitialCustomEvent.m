//
//  MPZPLAYAdsInterstitialCustomEvent.m
//  PlayableMopubAd
//
//  Created by lgd on 2018/4/10.
//  Copyright © 2018年 lgd. All rights reserved.
//

#import "MPZPLAYAdsInterstitialCustomEvent.h"
#import <PlayableAds/PlayableAds.h>

@interface MPZPLAYAdsInterstitialCustomEvent ()<PlayableAdsDelegate>

@property (nonatomic) PlayableAds *pAds;
@property NSString *appId;
@property NSString *adUnitId;
@end

@implementation MPZPLAYAdsInterstitialCustomEvent

-(void)requestInterstitialWithCustomEventInfo:(NSDictionary *)info {
    self.appId =  [info objectForKey:@"APPID"];
    self.adUnitId = [info objectForKey:@"AdUnitId"];
    self.pAds = [[PlayableAds alloc] initWithAdUnitID:self.adUnitId appID:self.appId];
    self.pAds.autoLoad = NO;
    self.pAds.delegate = self;
    [self.pAds loadAd];
}

-(void)showInterstitialFromRootViewController:(UIViewController *)rootViewController {
    if (self.pAds.isReady){
        [self.pAds present];
    }else{
        [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:nil];
        NSLog(@"ZPLAYAds is not ready.");
    }
}

- (BOOL)enableAutomaticImpressionAndClickTracking {
    return NO;
}

#pragma mark - PlayableAdsDelegate
- (void)playableAdsDidLoad:(PlayableAds *)ads {
    [self.delegate interstitialCustomEvent:self didLoadAd:nil];
}

- (void)playableAds:(PlayableAds *)ads didFailToLoadWithError:(NSError *)error {
    NSLog(@"playableAds didFailToLoadWithError: %@", error);
    [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:error];
}

- (void)playableAdsDidDismissScreen:(PlayableAds *)ads {
    [self.delegate interstitialCustomEventDidDisappear:self];
}

- (void)playableAdsDidStartPlaying:(PlayableAds *)ads {
    [self.delegate interstitialCustomEventDidAppear:self];
}

- (void)playableAdsWillPresentScreen:(PlayableAds *)ads {
    [self.delegate interstitialCustomEventWillAppear:self];
}

- (void)playableAdsDidEndPlaying:(PlayableAds *)ads {
}

- (void)playableAdsWillDismissScreen:(PlayableAds *)ads {
    [self.delegate interstitialCustomEventWillDisappear:self];
}

-(void)playableAdsDidClickFromVideoPage:(PlayableAds *)ads {
    [self.delegate interstitialCustomEventDidReceiveTapEvent:self];
}

-(void)playableAdsDidClickFromLandingPage:(PlayableAds *)ads {
    [self.delegate interstitialCustomEventDidReceiveTapEvent:self];
}

- (void)playableAdsDidRewardUser:(PlayableAds *)ads {
}

@end
