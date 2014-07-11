//
//  KSHTextView.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/10/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHTextView.h"

@interface KSHTextView()
@property (nonatomic, strong) NSLayoutConstraint *heightConstraint;
@end

@implementation KSHTextView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
    CGSize size = [self sizeThatFits:CGSizeMake(self.bounds.size.width, FLT_MAX)];
    
    if (!self.heightConstraint) {
        self.heightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0f constant:size.height];
        [self addConstraint:self.heightConstraint];
    }
    
    self.heightConstraint.constant = size.height;
    [super updateConstraints];
}


@end
