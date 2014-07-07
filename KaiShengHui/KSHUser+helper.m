//
//  KSHUser+helper.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/7/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHUser+helper.h"

static KSHUser *sharedUser = nil;

@implementation KSHUser (helper)

+ (instancetype)sharedUser
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUser = [[self alloc] init];
    });
    
    return sharedUser;
}

- (id)init
{
    self = [super init];
    if (self){
    }
    return self;
}

 - (void)setImage:(UIImage *)image
{
    [self setValue:UIImagePNGRepresentation(image) forKey:@"imgFile"];
}

@end
