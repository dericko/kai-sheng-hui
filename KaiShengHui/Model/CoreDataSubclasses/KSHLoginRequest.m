//
//  KSHLoginRequest.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/9/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHLoginRequest.h"

@interface KSHLoginRequest()

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

@end

@implementation KSHLoginRequest

- (id)initWithUsername:(NSString *)username withPassword:(NSString *)password
{
    self = [super init];
    
    self.username = username;
    self.password = password;
    
    return self;
}

@end
