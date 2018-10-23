//
//  PhoneFactory.m
//  SFPDemo
//
//  Created by Sun Shijie on 2018/10/3.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "PhoneFactory.h"
#import "IPhone.h"
#import "MIPhone.h"
#import "HWPhone.h"

@implementation PhoneFactory

+ (Phone *)createPhoneWithTag:(NSString *)tag{
    
    if ([tag isEqualToString:@"i"]) {
        
        IPhone *iphone = [[IPhone alloc] init];
        return iphone;
        
    }else if ([tag isEqualToString:@"MI"]){
        
        MIPhone *miPhone = [[MIPhone alloc] init];
        return miPhone;
        
    }else if ([tag isEqualToString:@"HW"]){
        
        HWPhone *hwPhone = [[HWPhone alloc] init];
        return hwPhone;
        
    }else{
        
        return nil;
    }
    
}
@end
