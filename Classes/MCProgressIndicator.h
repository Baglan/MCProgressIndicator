//
//  MCCoffeeProgressIndicator.h
//  Coffee
//
//  Created by Baglan on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCProgressIndicator : UIView

@property (nonatomic, copy) NSString * pattern;
@property (nonatomic, assign) NSUInteger step;

- (void)setOnImage:(UIImage *)onImage offImage:(UIImage *)offImage forPatternKey:(NSString *)key;
- (CGSize)recommentedSize;

@end
