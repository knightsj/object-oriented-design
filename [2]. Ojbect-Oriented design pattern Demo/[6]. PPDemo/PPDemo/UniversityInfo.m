//
//  UniversityInfo.m
//  PPDemo
//
//  Created by Sun Shijie on 2018/10/9.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "UniversityInfo.h"

@interface UniversityInfo()<NSCopying>

@end

@implementation UniversityInfo

- (id)copyWithZone:(NSZone *)zone
{
    UniversityInfo *infoCopy = [[[self class] allocWithZone:zone] init];
    
    [infoCopy setUniversityName:[_universityName mutableCopy]];
    [infoCopy setStartYear:[_startYear mutableCopy]];
    [infoCopy setEndYear:[_endYear mutableCopy]];
    [infoCopy setMajor:[_major mutableCopy]];
   
    return infoCopy;
}


@end
