//
//  ViewController.m
//  FWPD
//
//  Created by Sun Shijie on 2018/11/18.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "FlowerFactory.h"
#import "FlowerImageView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *_flowerList;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //首先建造一个生产花内部图片对象的工厂
    FlowerFactory *factory = [[FlowerFactory alloc] init];
    
    for (int i = 0; i < 500; ++i)
    {
        //随机传入一个花的类型，让工厂返回该类型对应花类型的花对象
        FlowerType flowerType = arc4random() % kTotalNumberOfFlowerTypes;
        FlowerImageView *flowerImageView = [factory flowerImageWithType:flowerType];
        
        
        // 创建花对象的外部属性值（随机的位置和大小）
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        CGFloat x = (arc4random() % (NSInteger)screenBounds.size.width);
        CGFloat y = (arc4random() % (NSInteger)screenBounds.size.height);
        NSInteger minSize = 10;
        NSInteger maxSize = 50;
        CGFloat size = (arc4random() % (maxSize - minSize + 1)) + minSize;
        
        //将位置和大小赋予花对象
        flowerImageView.frame = CGRectMake(x, y, size, size);
        
        //展示这个花对象
        [self.view addSubview:flowerImageView];
    }
}


@end
