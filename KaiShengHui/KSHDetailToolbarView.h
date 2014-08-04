//
//  KSHDetailToolbarView.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/30/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSHDetailToolbarView : UIView

- (void)addResizeButtonForTarget:(id)target action:(SEL)action;

- (void)addShareButtonForTarget:(id)target action:(SEL)action;

- (void)addFavoriteButtonForTarget:(id)target favorite:(SEL)favorite unfavorite:(SEL)unfavorite;

@end
