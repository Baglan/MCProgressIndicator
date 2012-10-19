//
//  MCCoffeeProgressIndicator.m
//  Coffee
//
//  Created by Baglan on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MCProgressIndicator.h"

@interface MCProgressIndicator () {
    __strong NSMutableArray *_views;
    __strong NSMutableDictionary *_onImages;
    __strong NSMutableDictionary *_offImages;
}

@end

@implementation MCProgressIndicator

- (CGSize)recommentedSize
{
    CGSize size = CGSizeZero;
    
    for (int i=0; i<_pattern.length; i++) {
        NSString *substring = [_pattern substringWithRange:NSMakeRange(i, 1)];
        NSDictionary *source = i < _step ? _onImages : _offImages;
        UIImage *image = (UIImage *)source[substring];
        size.width += image.size.width;
        size.height = size.height < image.size.height ? image.size.height : size.height;
    }
    
    return size;
}

- (void)setPattern:(NSString *)pattern
{
    _pattern = [pattern copy];
    [self setNeedsLayout];    
}

- (void)setStep:(NSUInteger)step
{
    _step = step;
    [self setNeedsLayout];
}


- (void)setOnImage:(UIImage *)onImage offImage:(UIImage *)offImage forPatternKey:(id)key
{
    _onImages[key] = onImage;
    _offImages[key] = offImage;
}

- (void)layoutSubviews
{
    // Clear existing views
    [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [(UIView *)obj removeFromSuperview];
    }];
    
    // Draw new views
    CGFloat offset = 0;
    for (int i=0; i<_pattern.length; i++) {
        NSString *substring = [_pattern substringWithRange:NSMakeRange(i, 1)];
        NSDictionary *source = i < _step ? _onImages : _offImages;
        UIImage *image = (UIImage *)source[substring];
        UIImageView *view = [[UIImageView alloc] initWithImage:image];
        [view setFrame:CGRectMake(offset, 0, image.size.width, image.size.height)];
        offset += image.size.width;
        [self addSubview:view];
    }
}

#pragma mark -
#pragma mark Init

- (void)commonInit
{
    _views = [NSMutableArray array];
    _onImages = [NSMutableDictionary dictionary];
    _offImages = [NSMutableDictionary dictionary];
}

- (id)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self commonInit];
    }
    return self;
}


@end
