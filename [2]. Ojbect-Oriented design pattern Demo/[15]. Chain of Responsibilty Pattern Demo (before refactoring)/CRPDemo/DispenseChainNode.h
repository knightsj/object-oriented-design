//
//  DispenseChain.h
//  CRPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DispenseProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DispenseChainNode : NSObject <DispenseProtocol>
{
    @protected DispenseChainNode *_nextChainNode;
}

- (void)setNextChainNode:(DispenseChainNode *)chainNode;


@end

NS_ASSUME_NONNULL_END
