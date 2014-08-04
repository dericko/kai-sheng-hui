//
//  KSHSplitButtonView.h
//  
//
//  Created by Derick Olson on 7/30/14.
//
//

#import <UIKit/UIKit.h>

@interface KSHSplitButtonView : UIView

- (void)addLeftButtonWithTitle:title forTarget:(id)target withAction:(SEL)action;

- (void)addRightButtonWithTitle:title forTarget:(id)target withAction:(SEL)action;

- (void)didClickLeftButton;

- (void)didClickRightButton;

@end
