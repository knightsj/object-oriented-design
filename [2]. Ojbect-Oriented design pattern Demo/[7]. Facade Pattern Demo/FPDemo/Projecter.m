//
//  Projecter.m
//  FPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "Projecter.h"

@implementation Projecter

- (void)connetDVDPlayer:(DVDPlayer *)dvdPlayer{
    
    NSLog(@"%@ has connected DVDPlayer",[self class]);
}


- (void)disconnetDVDPlayer:(DVDPlayer *)dvdPlayer{
    
    NSLog(@"%@ has disconnected DVDPlayer",[self class]);
}

@end
