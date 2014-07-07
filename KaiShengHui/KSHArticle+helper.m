//
//  KSHArticle+helper.m
//  KaiShengHui
//
//  Created by Derick Olson on 7/7/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHArticle+helper.h"

@implementation KSHArticle (helper)

- (void)setImage:(UIImage *)image
{
    [self setValue:UIImagePNGRepresentation(image) forKey:@"imgFile"];
}

- (UIImage *)getImage
{
    return [UIImage imageWithData:[self valueForKey:@"imgFile"]];
}

@end
