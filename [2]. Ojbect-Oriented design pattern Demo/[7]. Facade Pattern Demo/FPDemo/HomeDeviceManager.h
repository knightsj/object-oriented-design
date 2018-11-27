//
//  HomeDeviceManager.h
//  FPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>
//
//@class AirConditioner;
//@class CDPlayer;
//@class DVDPlayer;
//@class VoiceBox;
//@class Projecter;
//


@interface HomeDeviceManager : NSObject


//空调吹冷风
- (void)coolWind;


//空调吹热风
- (void)warmWind;


//播放CD
- (void)playMusic;

//关掉音乐
- (void)offMusic;


//播放DVD
- (void)playMovie;

//关闭DVD
- (void)offMoive;

//打开全部家用电器
- (void)allDeviceOn;


//关闭所有家用电器
- (void)allDeviceOff;


@end


