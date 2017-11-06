//
//  MPPlayableAdMobRewardedVideoCustomEvent.m
//  PlayableMopubAd
//
//  Created by lgd on 2017/11/2.
//  Copyright © 2017年 lgd. All rights reserved.
//

#import "MPPlayableAdMobRewardedVideoCustomEvent.h"

#import "MPLogging.h"
#import "MPRewardedVideoError.h"
#import "MPRewardedVideoReward.h"
#import "MPRewardedVideoCustomEvent+Caching.h"

@import PlayableAds;

@interface MPPlayableAdMobRewardedVideoCustomEvent ()<PlayableAdsDelegate>

@property (nonatomic) PlayableAds *pAds;
@property NSString *appId;
@property NSString *adUnitId;

@end

@implementation MPPlayableAdMobRewardedVideoCustomEvent

- (void)initializeSdkWithParameters:(NSDictionary *)parameters {
}

- (void)requestRewardedVideoWithCustomEventInfo:(NSDictionary *)info {
    self.appId =  [info objectForKey:@"APPID"];
    self.adUnitId = [info objectForKey:@"AdUnitId"];
    self.pAds = [[PlayableAds alloc] initWithAdUnitID:self.adUnitId
                                                appID:self.appId
                                   rootViewController:nil];
    self.pAds.delegate = self;
    [self.pAds loadAd];
}

- (void)presentRewardedVideoFromViewController:(UIViewController *)viewController {
    [self.pAds present];
}

- (BOOL)hasAdAvailable {
    return self.pAds.ready;
}

- (void)playableAdsDidLoad:(PlayableAds *)ads {
    [self.delegate rewardedVideoDidLoadAdForCustomEvent:self];
}

- (void)playableAdsDidRewardUser:(PlayableAds *)ads {
    [self.delegate rewardedVideoDidExpireForCustomEvent:self];
}
#pragma mark - PlayableAdsDelegate
- (void)playableAds:(PlayableAds *)ads didFailToLoadWithError:(NSError *)error {
    NSLog(@"playableAds didFailToLoadWithError: %@", error);
    [self.delegate rewardedVideoDidFailToLoadAdForCustomEvent:self error:error];
}

@end
