//
//  KSHMessage.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/4/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TSMessages/TSMessage.h>

/** Wrapper class for TSMessages Library. Displays Alerts (yellow), Errors (red),
 Messages (white), with an option for Message w/ button + callback
 @see 'TSMessage'
 */
@interface KSHMessage : TSMessage

+ (void)displayErrorAlert:(NSString *)title withSubtitle:(NSString *)subtitle forViewController:(UIViewController *)viewController;

+ (void)displayMessageAlert:(NSString *)title withSubtitle:(NSString *)subtitle forViewController:(UIViewController *)viewController;

+ (void)displayMessageAlert:(NSString *)title withSubtitle:(NSString *)subtitle withButton:(NSString *)buttonTitle forCallbackBlock:(void(^)(void))callback forViewController:(UIViewController *)viewController;

+ (void)displaySuccessAlert:(NSString *)title withSubtitle:(NSString *)subtitle forViewController:(UIViewController *)viewController;

+ (void)displayWarningAlert:(NSString *)title withSubtitle:(NSString *)subtitle forViewController:(UIViewController *)viewController;

@end
