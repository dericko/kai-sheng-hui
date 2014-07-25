//
//  KSHEventManager.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/23/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHObjectManager.h"
#import "KSHEvent.h"

@interface KSHEventManager : KSHObjectManager

- (void)loadContentWithParameters:(NSDictionary *)parameters success:(void (^)(void))success failure:(void (^)(NSError *error))failure;

@end
