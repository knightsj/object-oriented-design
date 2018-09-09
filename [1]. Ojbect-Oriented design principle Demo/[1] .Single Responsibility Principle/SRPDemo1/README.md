```objc
//================== Employee.h ==================

@interface Employee : NSObject

//============ 初始需求 ============
@property (nonatomic, copy) NSString *name;       //员工姓名
@property (nonatomic, copy) NSString *address;    //员工住址
@property (nonatomic, copy) NSString *employeeID; //员工ID
 
 
 
//============ 新需求 ============
//计算薪水
- (double)calculateSalary;

//今年是否晋升
- (BOOL)willGetPromotionThisYear;

@end
```