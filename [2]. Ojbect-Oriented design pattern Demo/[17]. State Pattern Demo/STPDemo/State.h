//
//  State.h
//  STPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ActionProtocol.h"
#import "Coder.h"


@interface State : NSObject<ActionProtocol>
{
    @protected Coder *_coder;
}

- (instancetype)initWithCoder:(Coder *)coder;

@end
