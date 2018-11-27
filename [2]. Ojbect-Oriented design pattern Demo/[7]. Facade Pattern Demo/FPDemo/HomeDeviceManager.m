//
//  HomeDeviceManager.m
//  FPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "HomeDeviceManager.h"

#import "AirConditioner.h"
#import "CDPlayer.h"
#import "DVDPlayer.h"
#import "VoiceBox.h"
#import "Projecter.h"


@implementation HomeDeviceManager
{
    NSMutableArray *_registeredDevices;//所有注册(被管理的)的家用电器
    AirConditioner *_airconditioner;
    CDPlayer *_cdPlayer;
    DVDPlayer *_dvdPlayer;
    VoiceBox *_voiceBox;
    Projecter *_projecter;
    
}

- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        _airconditioner = [[AirConditioner alloc] init];
        _cdPlayer = [[CDPlayer alloc] init];
        _dvdPlayer = [[DVDPlayer alloc] init];
        _voiceBox = [[VoiceBox alloc] init];
        _projecter = [[Projecter alloc] init];
        
        _registeredDevices = [NSMutableArray arrayWithArray:@[_airconditioner,
                                                              _cdPlayer,
                                                              _dvdPlayer,
                                                              _voiceBox,
                                                              _projecter]];
    }
    return self;
}


//空调吹冷风
- (void)coolWind{
    
    [_airconditioner on];
    [_airconditioner startLowTemperatureMode];
    
}


//空调吹热风
- (void)warmWind{
    
    [_airconditioner on];
    [_airconditioner startHighTemperatureMode];
}


- (void)playMusic{
    
    //1. 开启CDPlayer开关
    [_cdPlayer on];
    
    //2. 开启音箱
    [_voiceBox on];
    
    //3. 音响与CDPlayer连接
    [_voiceBox connetCDPlayer:_cdPlayer];
    
    //4. 播放CDPlayer
    [_cdPlayer playMusic];
}

//关掉音乐
- (void)offMusic{
    
    //1. 切掉与音箱的连接
    [_voiceBox disconnetCDPlayer:_cdPlayer];
    
    //2. 关掉音箱
    [_voiceBox off];
    
    //3. 关掉CDPlayer
    [_cdPlayer off];
}


- (void)playMovie{
    
    //1. 开启DVD player
    [_dvdPlayer on];
    
    //2. 开启音箱
    [_voiceBox on];
    
    
    //3. 音响与DVDPlayer连接
    [_voiceBox connetDVDPlayer:_dvdPlayer];
    
    //4. 开启投影仪
    [_projecter on];
    
    //5.投影仪与DVDPlayer连接
    [_projecter connetDVDPlayer:_dvdPlayer];
    
    //6. 播放DVDPlayer
    [_dvdPlayer playMovie];
    
}


- (void)offMoive{

    //1. 切掉音箱与DVDPlayer连接
    [_voiceBox disconnetDVDPlayer:_dvdPlayer];
    
    //2. 关掉音箱
    [_voiceBox off];
    
    //3. 切掉投影仪与DVDPlayer连接
    [_projecter disconnetDVDPlayer:_dvdPlayer];
    
    //4. 关掉投影仪
    [_projecter off];
    
    //5. 关掉DVDPlayer
    [_dvdPlayer off];
    
}

//打开全部家用电器
- (void)allDeviceOn{
    
    [_registeredDevices enumerateObjectsUsingBlock:^(HomeDevice *device, NSUInteger idx, BOOL * _Nonnull stop) {
        [device on];
    }];
}


//关闭所有家用电器
- (void)allDeviceOff{
    
    [_registeredDevices enumerateObjectsUsingBlock:^(HomeDevice *device, NSUInteger idx, BOOL * _Nonnull stop) {
        [device off];
    }];
}


@end
