# 原型模式代码示例

首先定义学历对象：

```objc
//================== UniversityInfo.h ==================
@interface UniversityInfo : NSObject<NSCopying>

@property (nonatomic, copy) NSString *universityName;
@property (nonatomic, copy) NSString *startYear;
@property (nonatomic, copy) NSString *endYear;
@property (nonatomic, copy) NSString *major;

- (id)copyWithZone:(NSZone *)zone;

@end



//================== UniversityInfo.m ==================
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
```

> 因为学历对象是支持复制的，因此需要遵从``<NSCopying>``协议并实现``copyWithZone:``方法。而且支持的是深复制，所以在复制NSString的过程中需要使用``mutableCopy``来实现。



接着我们看一下简历对象:



```objc
//================== Resume.h ==================
#import "UniversityInfo.h"

@interface Resume : NSObject<NSCopying>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *age;

@property (nonatomic, strong) UniversityInfo *universityInfo;

@end



//================== Resume.m ==================
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

@end
```

> 同样地，简历对象也需要遵从``<NSCopying>``协议并实现``copyWithZone:``方法。



最后我们看一下复制的效果有没有达到我们的预期（被复制对象和复制对象的地址和它们所有的属性对象的地址都不相同）

```objc
//================== Using by client ==================


//resume for LiLei
Resume *resume = [[Resume alloc] init];
resume.name = @"LiLei";
resume.gender = @"male";
resume.age = @"24";
    
UniversityInfo *info = [[UniversityInfo alloc] init];
info.universityName = @"X";
info.startYear = @"2014";
info.endYear = @"2018";
info.major = @"CS";
    
resume.universityInfo = info;
    
    
//resume_copy for HanMeiMei
Resume *resume_copy = [resume copy];
    
NSLog(@"\n\n\n======== original resume ======== %@\n\n\n======== copy resume ======== %@",resume,resume_copy);
    
resume_copy.name = @"HanMeiMei";
resume_copy.gender = @"female";
resume_copy.universityInfo.major = @"TeleCommunication";
    
NSLog(@"\n\n\n======== original resume ======== %@\n\n\n======== revised copy resume ======== %@",resume,resume_copy);
```

> 上面的代码模拟了这样一个场景：李雷同学写了一份自己的简历，然后韩梅梅复制了一份并修改了姓名，性别和专业这三个和李雷不同的信息。



这里我们重写了``Resume``的``description``方法来看一下所有属性的值及其内存地址。最后来看一下resume对象和resume_copy对象打印的结果：

```
//================== Output log ==================

======== original resume ======== 
resume object address:0x604000247d10
name:LiLei | 0x10bc0c0b0
gender:male | 0x10bc0c0d0
age:24 | 0x10bc0c0f0
university name:X| 0x10bc0c110
university start year:2014 | 0x10bc0c130
university end year:2018 | 0x10bc0c150
university major:CS | 0x10bc0c170


======== copy resume ======== 
resume object address:0x604000247da0
name:LiLei | 0xa000069654c694c5
gender:male | 0xa000000656c616d4
age:24 | 0xa000000000034322
university name:X| 0xa000000000000581
university start year:2014 | 0xa000000343130324
university end year:2018 | 0xa000000383130324
university major:CS | 0xa000000000053432





======== original resume ======== 
resume object address:0x604000247d10
name:LiLei | 0x10bc0c0b0
gender:male | 0x10bc0c0d0
age:24 | 0x10bc0c0f0
university name:X| 0x10bc0c110
university start year:2014 | 0x10bc0c130
university end year:2018 | 0x10bc0c150
university major:CS | 0x10bc0c170


======== revised copy resume ======== 
resume object address:0x604000247da0
name:HanMeiMei | 0x10bc0c1b0
gender:female | 0x10bc0c1d0
age:24 | 0xa000000000034322
university name:X| 0xa000000000000581
university start year:2014 | 0xa000000343130324
university end year:2018 | 0xa000000383130324
university major:TeleCommunication | 0x10bc0c1f0

```

> - 上面两个是原resume和刚被复制后的 copy resume的信息，可以看出来无论是这两个对象的地址还是它们的值对应的地址都是不同的，说明成功地实现了深复制。
> - 下面两个是原resume和被修改后的 copy_resume的信息，可以看出来新的copy_resume的值发生了变化，而且值所对应的地址还是和原resume的不同。