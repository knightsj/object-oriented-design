//
//  HomeDevice.h
//  FPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

//设备基类

@interface HomeDevice : NSObject

//连接电源
- (void)on;

//关闭电源
- (void)off;

@end


