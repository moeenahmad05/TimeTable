//
//  About Us.m
//  TimeTable
//
//  Created by moeen ahmad on 5/13/15.
//  Copyright (c) 2015 ehdatheyat. All rights reserved.
//

#import "About Us.h"

@interface About_Us ()

@end

@implementation About_Us

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice]setValue:value forKey:@"orientation"];
}





@end
