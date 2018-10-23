//
//  Resume.m
//  PPDemo
//
//  Created by Sun Shijie on 2018/10/9.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "Resume.h"

@interface Resume ()<NSCopying>

@end

@implementation Resume

- (id)copyWithZone:(NSZone *)zone
{
    Resume *resumeCopy = [[[self class] allocWithZone:zone] init];
    
    [resumeCopy setName:[_name mutableCopy]];
    [resumeCopy setGender:[_gender mutableCopy]];
    [resumeCopy setAge:[_age mutableCopy]];
    [resumeCopy setUniversityInfo:[_universityInfo copy]];
    
    return resumeCopy;
}

- (NSString *)description{
    
    return [NSString stringWithFormat:@"\nresume object address:%p\nname:%@ | %p\ngender:%@ | %p\nage:%@ | %p\nuniversity name:%@| %p\nuniversity start year:%@ | %p\nuniversity end year:%@ | %p\nuniversity major:%@ | %p",self,_name,_name,_gender,_gender,_age,_age,_universityInfo.universityName,_universityInfo.universityName,_universityInfo.startYear,_universityInfo.startYear,_universityInfo.endYear,_universityInfo.endYear,_universityInfo.major,_universityInfo.major];
}

@end
