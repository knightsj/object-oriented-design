```objc
//================== Employee.h ==================

@interface Employee : NSObject

//初始需求
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *employeeID;
```


```objc
//================== FinancialApartment.h ==================

#import "Employee.h"

//会计部门类
@interface FinancialApartment : NSObject

//计算薪水
- (double)calculateSalary:(Employee *)employee;

@end
```


```objc
//================== HRApartment.h ==================

#import "Employee.h"

//人事部门类
@interface HRApartment : NSObject

//今年是否晋升
- (BOOL)willGetPromotionThisYear:(Employee*)employee;

@end
```
