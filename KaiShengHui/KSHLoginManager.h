//
//  KSHLoginManager.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/3/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"

extern NSString * const kLoginPath;

@interface KSHLoginManager : KSHObjectManager

-(void)loginWithEmail:(NSString *)email password:(NSString*)password success:(void (^)(RKMappingResult *))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;

@end
