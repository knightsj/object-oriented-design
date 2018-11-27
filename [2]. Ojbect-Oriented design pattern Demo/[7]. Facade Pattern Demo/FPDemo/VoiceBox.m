//
//  VoiceBox.m
//  FPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "VoiceBox.h"
#import "CDPlayer.h"
#import "DVDPlayer.h"


@implementation VoiceBox

- (void)connetCDPlayer:(CDPlayer *)cdPlayer{
    
    NSLog(@"%@ has connected CDPlayer",[self class]);
}

- (void)disconnetCDPlayer:(CDPlayer *)cdPlayer{
    
    NSLog(@"%@ has disconnected CDPlayer",[self class]);
}

- (void)connetDVDPlayer:(DVDPlayer *)dvdPlayer{
    
   NSLog(@"%@ has connected DVDPlayer",[self class]);
}

- (void)disconnetDVDPlayer:(DVDPlayer *)dvdPlayer{
    
    NSLog(@"%@ has disconnected DVDPlayer",[self class]);
}
@end
