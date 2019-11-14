
# Directory

- [Directory](#directory)
- [1. Apply for APP ID and Ad Unit ID on ZPLAY Ads platform](#1-apply-for-app-id-and-ad-unit-id-on-zplay-ads-platform)
  - [1.1 Click *ADD NEW APP* button in Application Management page](#11-click-add-new-app-button-in-application-management-page)
  - [1.2 Fill in app information, and click *Save* button, then go back to Application Management](#12-fill-in-app-information-and-click-save-button-then-go-back-to-application-management)
  - [1.3 Obtain your APP ID in Application Management page](#13-obtain-your-app-id-in-application-management-page)
  - [1.4 Click *ADD NEW ADUNIT* button in app list, or you are also available to do this in AdUnit Management page](#14-click-add-new-adunit-button-in-app-list-or-you-are-also-available-to-do-this-in-adunit-management-page)
  - [1.5 Fill in adunit information, and click *Save* button, then go back to AdUnit Management](#15-fill-in-adunit-information-and-click-save-button-then-go-back-to-adunit-management)
  - [1.6 Obtain your adunit ID in AdUnit Management page](#16-obtain-your-adunit-id-in-adunit-management-page)
- [2. Add MoPub SDK and ZPLAY Ads SDK as below](#2-add-mopub-sdk-and-zplay-ads-sdk-as-below)
  - [2.1 Add dependencies in Podfile file](#21-add-dependencies-in-podfile-file)
  - [2.2 Run the following command in Terminal](#22-Run-the-following-command-in-Terminal)
- [3. Set ad unit for ZPLAY Ads on MoPub](#4-set-ad-unit-for-zplay-ads-on-mopub)
  - [3.1 Create new adunit for ZPLAY Ads](#31-create-new-adunit-for-zplay-ads)
  - [3.2 Obtain the existed adunit ID](#32-obtain-the-existed-adunit-id)
- [4. Add ZPLAY Ads as a new network on MoPub](#5-add-zplay-ads-as-a-new-network-on-mopub)
  - [4.1 Open Networks page, click *New network* button](#41-open-networks-page-click-new-network-button)
  - [4.2 Click *Custom SDK network* link](#42-click-custom-sdk-network-link)
  - [4.3 Set up the title as ZPLAY Ads Network, and configure ZPLAY Ads in the adunits which were applied in step 3(image 1 and 2)](#43-set-up-the-title-as-zplay-ads-network-and-configure-zplay-ads-in-the-adunits-which-were-applied-in-step-3image-1-and-2)
- [5. Turn on ZPLAY Ads network on MoPub](#5-turn-on-zplay-ads-network-on-mopub)
  - [5.1 Open Segments page, and click Global Segment](#51-open-segments-page-and-click-global-segment)
  - [5.2 Find the app and adunit which have been integrated to ZPLAY Ads Network（as the PlayableMopubAd in screenshot below), turn on ZPLAY Ads Network(as the turn on button in screenshot below)](#52-find-the-app-and-adunit-which-have-been-integrated-to-zplay-ads-networkas-the-playablemopubad-in-screenshot-below-turn-on-zplay-ads-networkas-the-turn-on-button-in-screenshot-below)
- [6. Confirm the configuration of ZPLAY Ads](#6-confirm-the-configuration-of-zplay-ads)
- [7. Use MoPub to request ZPLAY Ads in project](#7-use-mopub-to-request-zplay-ads-in-project)
- [8. Sample](#9-sample)
- [9. Test](#10-Test)

## 1. Apply for APP ID and Ad Unit ID on ZPLAY Ads platform

### 1.1 Click *ADD NEW APP* button in [Application Management](https://sellers.zplayads.com/#/app/appList/) page

![Application management](imgs/024.png)

### 1.2 Fill in app information, and click *Save* button, then go back to Application Management

a. If your APP is online, you can fill in download address to get APP information

![Add an app](imgs/025-2.png)

b. If your APP is not online, you should fill in APP information manually

![Add an app](imgs/025.png)

### 1.3 Obtain your APP ID in Application Management page

![Application list](imgs/026.png)

### 1.4 Click *ADD NEW ADUNIT* button in app list, or you are also available to do this in [AdUnit Management](https://sellers.zplayads.com/#/ad/placeList/) page

![Create adunit](imgs/027.png)

### 1.5 Fill in adunit information, and click *Save* button, then go back to AdUnit Management

![Add an adunit](imgs/028.png)

### 1.6 Obtain your adunit ID in AdUnit Management page

![Obtain adunit ID](imgs/029.png)

> Note: You are available to use the following ID when testing(not charge). Please switch to the ID you applied in production mode.

## 2. Add MopubMobileAdsMediationZplayAds SDK as below

How to use [Cocoapods](https://guides.cocoapods.org/using/getting-started.html)

### 2.1 Add dependencies in Podfile file

```ruby
pod 'MopubMobileAdsMediationZplayAds'
```

![Dependencies](imgs/007.png)

### 2.2 Run the following command in Terminal

```ruby
$ pod repo update
$ pod install
```
![Dependencies](imgs/008.png)

Turn off Xcode after installation, and open .xcworkspace file in the root of project:

![Dependencies](imgs/009.png)

> Note:Zplay Ads is integrated via CocoaPods in the sample. If you want manual integration, please refer to [HERE](https://github.com/zplayads/PlayableAdsDemo-iOS/blob/master/README-EN.md).

## 3. Set ad unit for ZPLAY Ads on [MoPub](https://app.mopub.com/apps)

### 3.1 Create new adunit for ZPLAY Ads

- Choose your app, click *New ad unit* button

![new add unit](imgs/011.png)

- Choose Rewarded video or Fullscreen when creating adunit, then click *Save* button, take Rewarded video as an example here

![Rewarded video](imgs/012.png) 

- Obtain the new adunit ID

![New add unit](imgs/013.png)

### 3.2 Obtain the existed adunit ID

- Choose your app and enter adunit list.Click the adunit, and click *Edit an unit*, then choose *View code integration* button.

![view code integration](imgs/014.png)

- Obtain the adunit ID

![Obtain new adunit ID](imgs/015.png)

## 4. Add ZPLAY Ads as a new network on [MoPub](https://app.mopub.com/networks)

### 4.1 Open Networks page, click *New network* button

![add a network](imgs/016.png)

### 4.2 Click *Custom SDK network* link

![custom native network](imgs/017.png)

### 4.3 Set up the title as ZPLAY Ads Network, and configure ZPLAY Ads in the adunits which were applied in step 3(image 1 and 2)

![Configuration](imgs/018-1.png)
![Configuration](imgs/018-2.png)
![Configuration](imgs/018-3.png)

- Add the followings code to mark 1 of above image:

```objective-c
MPZPLAYAdsRewardedVideoCustomEvent
```

**Note: MPZPLAYAdsRewardedVideoCustomEvent is the file name of adaptor(no file extension), and you are available to modify it as you want. Please make sure the content you filled in image 1 remains the same as the file name of adaptor(no file extension).**

- Add the adunits you applied on ZPLAY Ads Platform to image 2 as the following format:

```objective-c
{
    "APPID": "A650AB0D-7BFC-2A81-3066-D3170947C3DA",
    "AdUnitId": "BAE5DAAC-04A2-2591-D5B0-38FA846E45E7"
}
```

> Note: Please remember to change test APP ID "A650AB0D-7BFC-2A81-3066-D3170947C3DA" to the APP ID you applied on ZPLAY Ads Platform, and change test Ad Unit ID "BAE5DAAC-04A2-2591-D5B0-38FA846E45E7" to the Ad Unit ID you applied on ZPLAY Ads Platform.

## 5. Turn on ZPLAY Ads network on [MoPub](https://app.mopub.com/segments)

### 5.1  Open Segments page, and click Global Segment

![Global Segment](imgs/019.png)

#### 5.2 Find the app and adunit which have been integrated to ZPLAY Ads Network（as the PlayableMopubAd in screenshot below), turn on ZPLAY Ads Network(as the turn on button in screenshot below)

![turn on](imgs/020.png)

## 6. Confirm the configuration of ZPLAY Ads

After step 5.2, the ZPLAY Ads Network has been available already. Enter AdUnit Management page, the ad sources list will be shown as below if configuration is successful. If not, please check setting according to the previous steps.

![Confirm the configuration of ZPLAY Ads](imgs/021.png)

## 7. Use MoPub to request ZPLAY Ads in project

Here are the configurations:

![Configuration](imgs/code1.png)![Configuration](imgs/code2.png)

- Image 1: Import MoPub-needed files
- Image 2: Add the statement of MoPub callback
- Image 3: Initialize MoPub SDK
- Image 4: Request ad, please fill in the adunit ID applied on MoPub correctly(view step 4 for details).
- Image 5: Show ad, please fill in the adunit ID applied on MoPub correctly(view step 4 for details).
- Image 6: Add MoPub callback interface

## 8. Sample

View [Demo](https://github.com/zplayads/PlayableMopubAdDemo-iOS)

> Note: Please execute ```pod install --repo-update``` in the root of project in Terminal before operating demo.

## 9. Test

You are available to use the following ID when testing(not charge). Please switch to the ID you applied in production mode.

| OS   | Ad Type      | App_ID                               | Ad_Unit_id                           |
| ---- | ------------ | ------------------------------------ | ------------------------------------ |
| iOS  | Reward Video | A650AB0D-7BFC-2A81-3066-D3170947C3DA | BAE5DAAC-04A2-2591-D5B0-38FA846E45E7 |
| iOS  | Interstitial | A650AB0D-7BFC-2A81-3066-D3170947C3DA | 0868EBC0-7768-40CA-4226-F9924221C8EB |
| iOS  | Banner | A650AB0D-7BFC-2A81-3066-D3170947C3DA | A49521F3-339D-994F-FC80-F9C4170AA0CF |
