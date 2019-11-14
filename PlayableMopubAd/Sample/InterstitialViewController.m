//
//  InterstitialViewController.m
//  PlayableMopubAd
//
//  Created by lgd on 2018/4/10.
//  Copyright © 2018年 lgd. All rights reserved.
//

#import "InterstitialViewController.h"

@interface InterstitialViewController ()

@property (weak, nonatomic) IBOutlet UILabel *mLog;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadInterstitial {
    // Instantiate the interstitial using the class convenience method.
    self.interstitial = [MPInterstitialAdController
                         interstitialAdControllerForAdUnitId:@"5d50f8affae04961a88834e5fe9c6dc6"];
    self.interstitial.delegate = self;
    
    // Fetch the interstitial ad.
    [self.interstitial loadAd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)requestAd:(id)sender {
    _mLog.text = @"";
    [self addLog:@"start request ad"];
    [self loadInterstitial];
}

- (IBAction)presentAd:(id)sender {
    if (self.interstitial.ready) {
        [self.interstitial showFromViewController:self];
    } else {
        [self addLog:@"ad not ready"];
    }
}

- (void)addLog:(NSString*)msg {
    _mLog.text = [_mLog.text stringByAppendingFormat:@"\n%@", msg];
}

#pragma mark MPInterstitialAdControllerDelegate
- (void)interstitialDidLoadAd:(MPInterstitialAdController *)interstitial {
    [self addLog:@"interstitialDidLoadAd"];
}

- (void)interstitialDidFailToLoadAd:(MPInterstitialAdController *)interstitial withError:(NSError *)error{
     NSString *errorMsg = [NSString stringWithFormat:@"interstitialDidFailToLoadAd === %@",error];
    [self addLog:errorMsg];
}

- (void)interstitialWillAppear:(MPInterstitialAdController *)interstitial {
    [self addLog:@"interstitialWillAppear"];
}

- (void)interstitialDidAppear:(MPInterstitialAdController *)interstitial {
    [self addLog:@"interstitialDidAppear"];
}

- (void)interstitialWillDisappear:(MPInterstitialAdController *)interstitial {
    [self addLog:@"interstitialWillDisappear"];
}

- (void)interstitialDidDisappear:(MPInterstitialAdController *)interstitial {
    [self addLog:@"interstitialDidDisappear"];
}

- (void)interstitialDidExpire:(MPInterstitialAdController *)interstitial {
    [self addLog:@"interstitialDidExpire"];
}

- (void)interstitialDidReceiveTapEvent:(MPInterstitialAdController *)interstitial {
    [self addLog:@"interstitialDidReceiveTapEvent"];
}

@end
