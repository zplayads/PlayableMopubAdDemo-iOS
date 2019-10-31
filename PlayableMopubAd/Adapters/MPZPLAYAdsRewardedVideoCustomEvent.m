//
//  MPZPLAYAdsRewardedVideoCustomEvent.h
//  PlayableMopubAd
//
//  Created by lgd on 2017/11/2.
//  Copyright © 2017年 lgd. All rights reserved.
//

#import "MPZPLAYAdsRewardedVideoCustomEvent.h"

#import "MPLogging.h"
#import "MPRewardedVideoError.h"
#import "MPRewardedVideoReward.h"

@import PlayableAds;

@interface MPZPLAYAdsRewardedVideoCustomEvent ()<PlayableAdsDelegate>

@property (nonatomic) PlayableAds *pAds;

@end

@implementation MPZPLAYAdsRewardedVideoCustomEvent

- (void)requestRewardedVideoWithCustomEventInfo:(NSDictionary *)info {
    NSString *appId =  [info objectForKey:@"APPID"];
    appId = [appId stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *adUnitId = [info objectForKey:@"AdUnitId"];
    adUnitId = [adUnitId stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    self.pAds = [[PlayableAds alloc] initWithAdUnitID:adUnitId appID:appId];
    self.pAds.autoLoad = NO;
    self.pAds.delegate = self;
    self.pAds.channelId = [info objectForKey:@"ChannelID"];
    
    [self.pAds loadAd];
}

- (void)presentRewardedVideoFromViewController:(UIViewController *)viewController {
    if (self.pAds.isReady){
        [self.pAds present];
    }else{
        [self.delegate rewardedVideoDidFailToPlayForCustomEvent:self error:nil];
        NSLog(@"ZPLAYAds is not ready.");
    }
}

- (BOOL)hasAdAvailable {
    return self.pAds.ready;
}

#pragma mark - PlayableAdsDelegate
- (void)playableAdsDidLoad:(PlayableAds *)ads {
    [self.delegate rewardedVideoDidLoadAdForCustomEvent:self];
}

- (void)playableAds:(PlayableAds *)ads didFailToLoadWithError:(NSError *)error {
    NSLog(@"playableAds didFailToLoadWithError: %@", error);
    [self.delegate rewardedVideoDidFailToLoadAdForCustomEvent:self error:error];
}

- (void)playableAdsDidRewardUser:(PlayableAds *)ads {
    MPRewardedVideoReward *reward = [[MPRewardedVideoReward alloc] initWithCurrencyType:@"ZPLAYAds" amount:[NSNumber numberWithInt:1]];
    [self.delegate rewardedVideoShouldRewardUserForCustomEvent:self  reward: reward];
}

- (void)playableAdsDidDismissScreen:(PlayableAds *)ads {
    [self.delegate rewardedVideoDidDisappearForCustomEvent:self];
    [self.delegate rewardedVideoDidExpireForCustomEvent:self];
}

- (void)playableAdsDidStartPlaying:(PlayableAds *)ads {
    [self.delegate rewardedVideoDidAppearForCustomEvent:self];
}

- (void)playableAdsDidEndPlaying:(PlayableAds *)ads {
}

- (void)playableAdsDidClick:(PlayableAds *)ads{
    [self.delegate rewardedVideoDidReceiveTapEventForCustomEvent:self];
}

- (void)playableAdsDidPresentLandingPage:(PlayableAds *)ads{
    
}
@end
