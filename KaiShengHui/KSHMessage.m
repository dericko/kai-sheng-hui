//
//  KSHMessage.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/4/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHMessage.h"

@implementation KSHMessage

+ (void)displayErrorAlert:(NSString *)title withSubtitle:(NSString *)subtitle
{
    [TSMessage showNotificationWithTitle:title
                                subtitle:subtitle
                                    type:TSMessageNotificationTypeError];
}

+ (void)displayMessageAlert:(NSString *)title withSubtitle:(NSString *)subtitle
{
    [TSMessage showNotificationWithTitle:title
                                subtitle:subtitle
                                    type:TSMessageNotificationTypeMessage];
}

+ (void)displayMessageAlert:(NSString *)title withSubtitle:(NSString *)subtitle withButton:(NSString *)buttonTitle forCallbackBlock:(void(^)(void))callback
{
    [TSMessage showNotificationInViewController:[TSMessage defaultViewController]
                                          title:NSLocalizedString(title, nil)
                                       subtitle:NSLocalizedString(subtitle, nil)
                                          image:nil
                                           type:TSMessageNotificationTypeMessage
                                       duration:TSMessageNotificationDurationEndless
                                       callback:nil
                                    buttonTitle:NSLocalizedString(buttonTitle, nil)
                                 buttonCallback:^(){
                                     callback();
                                 }
                                     atPosition:TSMessageNotificationPositionBottom
                           canBeDismissedByUser:YES];
}

+ (void)displaySuccessAlert:(NSString *)title withSubtitle:(NSString *)subtitle
{
    [TSMessage showNotificationWithTitle:title
                                subtitle:subtitle
                                    type:TSMessageNotificationTypeSuccess];
}

+ (void)displayWarningAlert:(NSString *)title withSubtitle:(NSString *)subtitle
{
    [TSMessage showNotificationWithTitle:title
                                subtitle:subtitle
                                    type:TSMessageNotificationTypeWarning];
}
@end
