#import "KSHArticle.h"


@interface KSHArticle ()

// Private interface goes here.

@end


@implementation KSHArticle

- (void)setImage:(UIImage *)image
{
    [self setValue:UIImagePNGRepresentation(image) forKey:@"imgFile"];
}

- (UIImage *)getImage
{
    return [UIImage imageWithData:[self valueForKey:@"imgFile"]];
}

@end
