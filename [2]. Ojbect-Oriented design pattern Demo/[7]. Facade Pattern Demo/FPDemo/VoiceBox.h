//
//  VoiceBox.h
//  FPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "HomeDevice.h"

@class CDPlayer;
@class DVDPlayer;

@interface VoiceBox : HomeDevice

- (void)connetCDPlayer:(CDPlayer *)cdPlayer;

- (void)disconnetCDPlayer:(CDPlayer *)cdPlayer;



- (void)connetDVDPlayer:(DVDPlayer *)dvdPlayer;

- (void)disconnetDVDPlayer:(DVDPlayer *)dvdPlayer;


@end


