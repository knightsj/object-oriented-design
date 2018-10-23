//
//  ViewController.m
//  PPDemo
//
//  Created by Sun Shijie on 2018/10/9.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "Resume.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Resume *resume = [[Resume alloc] init];
    resume.name = @"LiLei";
    resume.gender = @"male";
    resume.age = @"24";
    
    UniversityInfo *info = [[UniversityInfo alloc] init];
    info.universityName = @"X";
    info.startYear = @"2014";
    info.endYear = @"2018";
    info.major = @"CS";
    
    resume.universityInfo = info;
    
    
    //do copy
    Resume *resume_copy = [resume copy];
    
    NSLog(@"\n\n\n======== original resume ======== %@\n\n\n======== copy resume ======== %@",resume,resume_copy);
    
    resume_copy.name = @"HanMeiMei";
    resume_copy.gender = @"female";
    resume_copy.universityInfo.major = @"TeleCommunication";
    
    NSLog(@"\n\n\n======== original resume ======== %@\n\n\n======== revised copy resume ======== %@",resume,resume_copy);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
