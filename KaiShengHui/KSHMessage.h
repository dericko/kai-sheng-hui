//
//  KSHMessage.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/4/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TSMessages/TSMessage.h>

@interface KSHMessage : TSMessage

+ (void)displayErrorAlert:(NSString *)title withSubtitle:(NSString *)subtitle;

+ (void)displayMessageAlert:(NSString *)title withSubtitle:(NSString *)subtitle;

+ (void)displayMessageAlert:(NSString *)title withSubtitle:(NSString *)subtitle withButton:(NSString *)buttonTitle forCallbackBlock:(void(^)(void))callback;

+ (void)displaySuccessAlert:(NSString *)title withSubtitle:(NSString *)subtitle;

+ (void)displayWarningAlert:(NSString *)title withSubtitle:(NSString *)subtitle;

@end
