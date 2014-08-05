//
//  KSHDetailToolbarView.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/30/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHDetailToolbarView.h"

@interface KSHDetailToolbarView ()
@property (nonatomic, strong) UIButton *resizeButton;
@property (nonatomic, strong) UIButton *shareButton;

@end

@implementation KSHDetailToolbarView

- (id)initWithFrame:(CGRect)frame
{
    // Override input frame size
    self = [super initWithFrame:CGRectMake(0.0, 0.0, 150.0, 30.0)];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)addResizeButtonForTarget:(id)target action:(SEL)action
{
    // TODO: Open subview for multiple text sizes
    _resizeButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 5.0, 30.0, 30.0)];
    [_resizeButton setTitle:@"Aa" forState:UIControlStateNormal];
    [_resizeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [_resizeButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_resizeButton];
}

- (void)addShareButtonForTarget:(id)target action:(SEL)action
{
    _shareButton = [[UIButton alloc] initWithFrame:CGRectMake(60.0, 0.0, 30.0, 30.0)];
    [_shareButton setImage:[UIImage imageNamed:@"share-icon-wht.png"] forState:UIControlStateNormal];
    [_shareButton setImage:[UIImage imageNamed:@"share-icon-blk.png"] forState:UIControlStateSelected];
    
    [_shareButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_shareButton];

}

- (void)addFavoriteButtonForTarget:(id)target favorite:(SEL)favorite
{
    _favoriteButton = [[UIButton alloc] initWithFrame:CGRectMake(120.0, 0.0, 30.0, 30.0)];
    [_favoriteButton setImage:[UIImage imageNamed:@"star-deselected-icon.png"] forState:UIControlStateNormal];
    [_favoriteButton setImage:[UIImage imageNamed:@"star-selected-icon.png"] forState:UIControlStateSelected];
    
    [_favoriteButton addTarget:target action:favorite forControlEvents:UIControlEventTouchUpInside];
    [_favoriteButton addTarget:self action:@selector(toggleFavorite) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_favoriteButton];
}

- (void)toggleFavorite
{
    _favoriteButton.selected = !_favoriteButton.selected;
}

@end
