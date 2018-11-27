//
//  Shape.h
//  BPDemo
//
//  Created by Sun Shijie on 2018/11/20.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Color.h"

@interface Shape : NSObject
{
    @protected Color *_color;
}

- (void)renderColor:(Color *)color;

- (void)show;

@end


