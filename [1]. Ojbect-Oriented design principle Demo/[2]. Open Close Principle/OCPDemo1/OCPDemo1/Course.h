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
@property (nonatomic, copy) NSString *content;             //课程内容


//新需求：视频课程
@property (nonatomic, copy) NSString *videoUrl;

//新需求：音频课程
@property (nonatomic, copy) NSString *audioUrl;

//新需求：直播课程
@property (nonatomic, copy) NSString *liveUrl;




@end
