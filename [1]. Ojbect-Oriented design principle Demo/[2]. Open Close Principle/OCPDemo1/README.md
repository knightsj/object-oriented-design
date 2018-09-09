```objc
//================== Course.h ==================

@interface Course : NSObject

@property (nonatomic, copy) NSString *courseTitle;         //课程名称
@property (nonatomic, copy) NSString *courseIntroduction;  //课程介绍
@property (nonatomic, copy) NSString *teacherName;         //讲师姓名
@property (nonatomic, copy) NSString *content;             //文字内容


//新需求：视频课程
@property (nonatomic, copy) NSString *videoUrl;

//新需求：音频课程
@property (nonatomic, copy) NSString *audioUrl;

//新需求：直播课程
@property (nonatomic, copy) NSString *liveUrl;

@end
```
