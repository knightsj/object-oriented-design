//
//  Projecter.h
//  FPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "HomeDevice.h"

@class DVDPlayer;

//投影仪类

@interface Projecter : HomeDevice

- (void)connetDVDPlayer:(DVDPlayer *)dvdPlayer;

- (void)disconnetDVDPlayer:(DVDPlayer *)dvdPlayer;

@end


