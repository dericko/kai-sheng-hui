#import "KSHArticle.h"


@interface KSHArticle ()

@end


@implementation KSHArticle

@synthesize contentCleaned;

- (void)setImage:(UIImage *)image
{
    [self setValue:UIImagePNGRepresentation(image) forKey:@"imgFile"];
}

- (UIImage *)getImage
{
    return [UIImage imageWithData:[self valueForKey:@"imgFile"]];
}

#pragma mark - Override methods

-(void) awakeFromFetch // Called when instance fetched from Core Data
{
    [super awakeFromFetch];
    
    NSLog(@"Wake up: %@", self.title);
    // Compute derived values from the persisted properties
}

-(void) awakeFromInsert // Called when instance is added to Core Data
{
    [super awakeFromInsert];
    // Initialize default settings
}

- (void)setIndustryText
{
    switch (self.industryID.integerValue) {
        case 1:
            self.industry = @"快消零售";
            break;
        case 2:
            self.industry = @"通讯网络技术";
            break;
        case 3:
            self.industry = @"农业食品饮料";
            break;
        case 4:
            self.industry = @"能源矿产";
            break;
        case 5:
            self.industry = @"化工工业制造";
            break;
        case 6:
            self.industry = @"金融地产,";
            break;
        case 7:
            self.industry = @"医疗卫生";
            break;
        case 8:
            self.industry = @"汽车交通运输";
        default:
            self.industry = @"General";
            break;
    }
}

@end
