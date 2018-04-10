//
//  InterstitialViewController.h
//  PlayableMopubAd
//
//  Created by lgd on 2018/4/10.
//  Copyright © 2018年 lgd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPInterstitialAdController.h"

@interface InterstitialViewController : UIViewController <MPInterstitialAdControllerDelegate>

@property (nonatomic, retain) MPInterstitialAdController *interstitial;

@end
