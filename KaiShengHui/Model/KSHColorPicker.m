//
//  KSHColorPicker.m
//  KaiShengHui
//
//  Created by Derick Olson on 8/7/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHColorPicker.h"

static CGFloat hue = 0;
static CGFloat saturation = 1.0;
static CGFloat brightness = 1.0;
static CGFloat alpha = 1.0;

@implementation KSHColorPicker

+ (UIColor *)colorForIndustry:(NSNumber *)industry
{
    alpha = 1.0;
    saturation = 1.0;
    brightness = 0.8;
    
    switch (industry.integerValue) {
        case 1: // blue
            hue = .60;
            break;
        case 2: // green
            hue = .45;
            break;
        case 3: // yellow
            hue = .17;
            break;
        case 4: // orange
            hue = .08;
            break;
        case 5: // red
            hue = .03;
            break;
        case 6: // purple
            hue = .70;
            brightness = 1.0;
            break;
        case 7: // light purple
            hue = .80;
            break;
        case 8: // pink
            hue = .95;
            brightness = 1.0;
            break;
        default:
            return [UIColor blackColor];
    }
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

+ (UIColor *)colorForPriority:(NSNumber *)priority
{
    alpha = 1.0;
    saturation = 1.0;
    brightness = 0.8;
    
    switch (priority.integerValue) {
        case 1:
            hue = .17;
            alpha = 0.6;
            break;
        case 2:
            hue = .08;
            alpha = 0.7;
            break;
        case 3:
            hue = .03;
            break;
        default:
            return [UIColor grayColor];
    }
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

+ (UIColor *)colorForTimeframe:(NSNumber *)timeframe
{
    alpha = 1.0;
    saturation = 1.0;
    brightness = 1.0;
    hue = 0.60;
    
    switch (timeframe.integerValue) {
        case 1:
            alpha = 0.5;
            break;
        case 2:
            alpha = 0.7;
            break;
        case 3:
            alpha = 0.9;
            break;
        default:
            return [UIColor grayColor];
    }
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

+ (UIColor *)colorForStatus:(NSNumber *)status
{
    alpha = 1.0;
    saturation = 1.0;
    brightness = 1.0;
    
    switch (status.integerValue) {
        case 1:
            hue = .45;
            break;
        case 2:
            hue = 0.70;
            break;
        case 3:
            hue = 0.0;
            saturation = 0.5;
            alpha = 0.8;
            break;
        default:
            return [UIColor grayColor];
    }
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

+ (UIColor *)colorForTaskStatus:(NSNumber *)status
{
    alpha = 1.0;
    saturation = 1.0;
    brightness = 0.8;
    
    switch (status.integerValue) {
        case 1: // blue
            hue = .60;
            break;
        case 2: // green
            hue = .45;
            break;
        case 3: // yellow
            hue = .17;
            break;
        case 4: // orange
            hue = .08;
            break;
        case 5: // red
            hue = .03;
            break;
        case 6: // purple
            hue = .70;
            brightness = 1.0;
            break;
        default:
            return [UIColor blackColor];
    }
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

+ (UIColor *)colorForLocation:(NSString *)location
{
    if ([location isEqualToString:@"北京"]) {
        return [UIColor redColor];
    } else if ([location isEqualToString:@"上海"]) {
        return [UIColor orangeColor];
    }
    return [UIColor purpleColor];
}


@end
