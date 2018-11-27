//
//  FlowerFactory.m
//  Flyweight
//
//  Created by Carlo Chung on 11/29/10.
//  Copyright 2010 Carlo Chung. All rights reserved.
//

#import "FlowerFactory.h"
#import "FlowerImageView.h"

@implementation FlowerFactory
{
    NSMutableDictionary *_flowersPool;
}

- (FlowerImageView *) flowerImageWithType:(FlowerType)type
{
    
  if (_flowersPool == nil){
      
     _flowersPool = [[NSMutableDictionary alloc] initWithCapacity:kTotalNumberOfFlowerTypes];
  }
  
  //尝试获取传入类型对应的花内部图片对象
  UIImage *flowerImage = [_flowersPool objectForKey:[NSNumber numberWithInt:type]];
  
  //如果没有对应类型的图片，则生成一个
  if (flowerImage == nil){
    
    NSLog(@"create new flower image with type:%u",type);
      
    switch (type){
            
      case kAnemone:
        flowerImage = [UIImage imageNamed:@"anemone.png"];
        break;
      case kCosmos:
        flowerImage = [UIImage imageNamed:@"cosmos.png"];
        break;
      case kGerberas:
        flowerImage = [UIImage imageNamed:@"gerberas.png"];
        break;
      case kHollyhock:
        flowerImage = [UIImage imageNamed:@"hollyhock.png"];
        break;
      case kJasmine:
        flowerImage = [UIImage imageNamed:@"jasmine.png"];
        break;
      case kZinnia:
        flowerImage = [UIImage imageNamed:@"zinnia.png"];
        break;
      default:
        flowerImage = nil;
        break;
    
    }
      
    [_flowersPool setObject:flowerImage forKey:[NSNumber numberWithInt:type]];
      
  }else{
      //如果有对应类型的图片，则直接使用
      NSLog(@"reuse flower image with type:%u",type);
  }
    
  //创建花对象，将上面拿到的花内部图片对象赋值并返回
  FlowerImageView *flowerImageView = [[FlowerImageView alloc] initWithImage:flowerImage];
    
  return flowerImageView;
}


- (UIImage *) newFlowerImageWithType:(FlowerType)type{
    
    UIImage *flowerImage = nil;

        
        switch (type){
                
            case kAnemone:
                flowerImage = [UIImage imageNamed:@"anemone.png"];
                break;
            case kCosmos:
                flowerImage = [UIImage imageNamed:@"cosmos.png"];
                break;
            case kGerberas:
                flowerImage = [UIImage imageNamed:@"gerberas.png"];
                break;
            case kHollyhock:
                flowerImage = [UIImage imageNamed:@"hollyhock.png"];
                break;
            case kJasmine:
                flowerImage = [UIImage imageNamed:@"jasmine.png"];
                break;
            case kZinnia:
                flowerImage = [UIImage imageNamed:@"zinnia.png"];
                break;
            default:
                flowerImage = nil;
                break;
        }

    return flowerImage;
    
}
@end
