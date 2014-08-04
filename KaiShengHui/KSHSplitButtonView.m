//
//  KSHSplitButtonView.m
//  
//
//  Created by Derick Olson on 7/30/14.
//
//

#import "KSHSplitButtonView.h"

@interface KSHSplitButtonView()
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIColor *darkTheme;
@property (nonatomic, strong) UIColor *lightTheme;

@end

@implementation KSHSplitButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _darkTheme = [UIColor blueColor];
        _lightTheme = [UIColor whiteColor];
    }
    return self;
}

- (void)addLeftButtonWithTitle:(NSString *)title forTarget:(id)target withAction:(SEL)action
{
    CGRect frame = CGRectMake(1, 1.0, 70.0, 22.0);
    _leftButton = [[UIButton alloc] initWithFrame:frame];
    _leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_leftButton setTitle:title forState:UIControlStateNormal];
    [_leftButton setTitleColor:_darkTheme forState:UIControlStateNormal];
    [_leftButton setTitleColor:_lightTheme forState:UIControlStateSelected];
    [_leftButton setBackgroundColor:_darkTheme];
    [_leftButton setSelected:YES];
    
    [_leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [_leftButton addTarget:self action:@selector(didClickLeftButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_leftButton];

}

- (void)addRightButtonWithTitle:(NSString *)title forTarget:(id)target withAction:(SEL)action
{
    CGRect frame = CGRectMake(71.0, 1.0, 70.0, 22.0);
    _rightButton = [[UIButton alloc] initWithFrame:frame];
    _rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_rightButton setTitle:title forState:UIControlStateNormal];
    [_rightButton setTitleColor:_darkTheme forState:UIControlStateNormal];
    [_rightButton setTitleColor:_lightTheme forState:UIControlStateSelected];
    [_rightButton setBackgroundColor:_lightTheme];
    [_rightButton setSelected:NO];
    
    [_rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [_rightButton addTarget:self action:@selector(didClickRightButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_rightButton];
    
}

- (void)didClickLeftButton
{
    if (!_leftButton.selected) {
        [_leftButton setSelected:YES];
        [_leftButton setBackgroundColor:_darkTheme];
        [_rightButton setSelected:NO];
        [_rightButton setBackgroundColor:_lightTheme];
    }
}

- (void)didClickRightButton
{
    if (!_rightButton.selected) {
        [_rightButton setSelected:YES];
        [_rightButton setBackgroundColor:_darkTheme];
        [_leftButton setSelected:NO];
        [_leftButton setBackgroundColor:_lightTheme];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
