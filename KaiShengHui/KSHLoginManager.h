//
//  KSHLoginManager.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/3/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"
#import "KSHLoginRequest.h"

extern NSString * const kLoginPath;

@interface KSHLoginManager : KSHObjectManager

- (void)loginWithEmail:(KSHLoginRequest *)loginEntity success:(void (^)(RKMappingResult *))success failure:(void (^)(RKObjectRequestOperation *, NSError *))failure;

@end
