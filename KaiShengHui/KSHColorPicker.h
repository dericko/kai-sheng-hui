//
//  KSHColorPicker.h
//  KaiShengHui
//
//  Created by Derick Olson on 8/7/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSHColorPicker : NSObject

+ (UIColor *)colorForIndustry:(NSNumber *)industry;

+ (UIColor *)colorForPriority:(NSNumber *)priority;

+ (UIColor *)colorForTimeframe:(NSNumber *)timeframe;

+ (UIColor *)colorForStatus:(NSNumber *)status;

+ (UIColor *)colorForTaskStatus:(NSNumber *)status;

+ (UIColor *)colorForLocation:(NSString *)location;

@end
