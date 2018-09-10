```objc
//================== Course.h ==================

@interface Course : NSObject

@property (nonatomic, copy) NSString *courseTitle;         //课程名称
@property (nonatomic, copy) NSString *courseIntroduction;  //课程介绍
@property (nonatomic, copy) NSString *teacherName;         //讲师姓名
```




```objc
//================== TextCourse.h ==================

@interface TextCourse : Course

@property (nonatomic, copy) NSString *content;             //文字内容

@end
```



```objc
//================== VideoCourse.h ==================

@interface VideoCourse : Course

@property (nonatomic, copy) NSString *videoUrl;            //视频地址

@end
```


```objc
//================== AudioCourse.h ==================

@interface AudioCourse : Course

@property (nonatomic, copy) NSString *audioUrl;            //音频地址

@end
```



```objc
//================== LiveCourse.h ==================

@interface LiveCourse : Course

@property (nonatomic, copy) NSString *liveUrl;             //直播地址

@end
```
