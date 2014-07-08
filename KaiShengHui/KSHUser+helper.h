//
//  KSHUser+helper.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/7/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHUser.h"

@interface KSHUser (helper)

+ (instancetype)currentUser;

- (void)setImage:(UIImage *)image;

@end
