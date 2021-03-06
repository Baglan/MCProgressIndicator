//
//  ViewController.m
//  MCProgressIndicator
//
//  Created by Baglan on 10/19/12.
//  Copyright (c) 2012 MobileCreators. All rights reserved.
//

#import "ViewController.h"
#import "MCProgressIndicator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    MCProgressIndicator * progressIndicator = [[MCProgressIndicator alloc] init];
    
    // Set the pattern
    progressIndicator.pattern = @"*..*..*..*";
    
    // Set images for pattern "stops"
    [progressIndicator setOnImage:[UIImage imageNamed:@"star-on.png"] offImage:[UIImage imageNamed:@"star-off.png"] forPatternKey:@"*"];
    [progressIndicator setOnImage:[UIImage imageNamed:@"dot-on"] offImage:[UIImage imageNamed:@"dot-off"] forPatternKey:@"."];
    
    // Set the current step
    progressIndicator.step = 6;
    
    // Resize
    CGSize containerSize = self.view.frame.size;
    CGSize size = [progressIndicator recommentedSize];
    progressIndicator.frame = CGRectMake((containerSize.width - size.width) / 2, 100, size.width, size.height);

    [self.view addSubview:progressIndicator];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
