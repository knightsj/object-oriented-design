//
//  Contex.h
//  SPDemo
//
//  Created by Sun Shijie on 2019/2/28.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TwoIntOperation;

@interface Context : NSObject

- (instancetype)initWithOperation: (TwoIntOperation *)operation;

- (void)setOperation:(TwoIntOperation *)operation;

- (int)excuteOperationOfInt1:(int)int1 int2:(int)int2;

@end

