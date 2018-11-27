//
//  FlowerFactory.h
//  Flyweight
//
//  Created by Carlo Chung on 11/29/10.
//  Copyright 2010 Carlo Chung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FlowerImageView;

typedef enum 
{
  kAnemone,
  kCosmos,
  kGerberas,
  kHollyhock,
  kJasmine,
  kZinnia,
  kTotalNumberOfFlowerTypes
    
} FlowerType;

@interface FlowerFactory : NSObject 


- (FlowerImageView *) flowerImageWithType:(FlowerType)type;
- (FlowerImageView *) newFlowerImageWithType:(FlowerType)type;

@end
