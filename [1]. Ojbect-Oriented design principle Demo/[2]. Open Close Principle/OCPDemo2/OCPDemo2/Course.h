//
//  Course.h
//  OCPDemo1
//
//  Created by J_Knight_ on 2018/9/1.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Course : NSObject

@property (nonatomic, copy) NSString *courseTitle;         //课程名称
@property (nonatomic, copy) NSString *courseIntroduction;  //课程介绍
@property (nonatomic, copy) NSString *teacherName;         //讲师姓名

@end
