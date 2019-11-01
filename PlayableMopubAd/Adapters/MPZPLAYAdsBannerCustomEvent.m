//
//  MPZPLAYAdsBannerCustomEvent.m
//  PlayableMopubAd
//
//  Created by Michael Tang on 2019/10/31.
//  Copyright © 2019 lgd. All rights reserved.
//

#import "MPZPLAYAdsBannerCustomEvent.h"
#import <PlayableAds/AtmosplayAdsBanner.h>

@interface MPZPLAYAdsBannerCustomEvent ()<AtmosplayAdsBannerDelegate>

@property (nonatomic)AtmosplayAdsBanner *banner;

@end

@implementation MPZPLAYAdsBannerCustomEvent

- (void)requestAdWithSize:(CGSize)size customEventInfo:(NSDictionary *)info adMarkup:(NSString *)adMarkup{
    NSString *appId =  [info objectForKey:@"APPID"];
    appId = [appId stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *adUnitId = [info objectForKey:@"AdUnitId"];
    adUnitId = [adUnitId stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    self.banner = [[AtmosplayAdsBanner alloc] initWithAdUnitID:adUnitId appID:appId rootViewController:[self.delegate viewControllerForPresentingModalView]];
    self.banner.delegate = self;
    self.banner.channelID = [info objectForKey:@"ChannelID"];
    if (size.width == 320) {
        self.banner.bannerSize = kAtmosplayAdsBanner320x50;
    }
    if (size.width == 728) {
        self.banner.bannerSize = kAtmosplayAdsBanner728x90;
    }
    
    [self.banner loadAd];
}

#pragma mark: AtmosplayAdsBannerDelegate
- (void)atmosplayAdsBannerViewDidLoad:(AtmosplayAdsBanner *)bannerView {
    if ([self.delegate respondsToSelector:@selector(bannerCustomEvent:didLoadAd:)]) {
        [self.delegate bannerCustomEvent:self didLoadAd:bannerView];
    }
}
/// Tells the delegate that a request failed.
- (void)atmosplayAdsBannerView:(AtmosplayAdsBanner *)bannerView didFailWithError:(NSError *)error {
    if ([self.delegate respondsToSelector:@selector(bannerCustomEvent:didFailToLoadAdWithError:)]) {
        [self.delegate bannerCustomEvent:self didFailToLoadAdWithError:error];
    }
}

/// Tells the delegate that the banner view has been clicked.
- (void)atmosplayAdsBannerViewDidClick:(AtmosplayAdsBanner *)bannerView {
    if ([self.delegate respondsToSelector:@selector(bannerCustomEventWillBeginAction:)]) {
        [self.delegate bannerCustomEventWillBeginAction:self];
    }
    if ([self.delegate respondsToSelector:@selector(bannerCustomEventDidFinishAction:)]) {
        [self.delegate bannerCustomEventDidFinishAction:self];
    }
}

@end
