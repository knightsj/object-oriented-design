//
//  LogManager.h
//  SPDemo
//
//  Created by Sun Shijie on 2018/10/6.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogManager : NSObject

+(instancetype)sharedInstance;

- (void)printLog:(NSString *)logMessage;

- (void)uploadLog:(NSString *)logMessage;

@end
