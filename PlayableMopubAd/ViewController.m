//
//  ViewController.m
//  PlayableMopubAd
//
//  Created by lgd on 2017/11/2.
//  Copyright © 2017年 lgd. All rights reserved.
//
#import "ViewController.h"
#import "MoPub.h"
#import "MPRewardedVideo.h"

@interface ViewController () <MPRewardedVideoDelegate>

@property (nonatomic) MPRewardedVideo *mpRewardedVideo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[MoPub sharedInstance] initializeRewardedVideoWithGlobalMediationSettings:nil delegate:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)requestAd:(UIButton *)sender {
    [MPRewardedVideo loadRewardedVideoAdWithAdUnitID:@"cd7acdd3f1cf43999bb244d2890f9817"
                               withMediationSettings:nil];
}

- (IBAction)presentAd:(UIButton *)sender {
    [MPRewardedVideo presentRewardedVideoAdForAdUnitID:@"cd7acdd3f1cf43999bb244d2890f9817"
                                    fromViewController:self withReward:nil];
}

- (void)rewardedVideoAdDidLoadForAdUnitID:(NSString *)adUnitID {
    NSLog(@"=== rewardedVideoAdDidLoadForAdUnitID");
}

- (void)rewardedVideoAdDidFailToLoadForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    NSLog(@"=== rewardedVideoAdDidFailToLoadForAdUnitID %@", error);
}

- (void)rewardedVideoAdDidExpireForAdUnitID:(NSString *)adUnitID {
    NSLog(@"=== rewardedVideoAdDidExpireForAdUnitID");
}
@end
