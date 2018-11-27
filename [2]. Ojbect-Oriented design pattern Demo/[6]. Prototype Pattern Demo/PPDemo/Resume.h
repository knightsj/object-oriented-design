//
//  Resume.h
//  PPDemo
//
//  Created by Sun Shijie on 2018/10/9.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UniversityInfo.h"


@interface Resume : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *age;

@property (nonatomic, strong) UniversityInfo *universityInfo;

@end
