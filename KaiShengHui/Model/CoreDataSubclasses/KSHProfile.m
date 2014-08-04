#import "KSHProfile.h"


@interface KSHProfile ()

// Private interface goes here.

@end


@implementation KSHProfile

- (NSString *)getIndustryName
{
    switch (self.industry.integerValue) {
        case 1:
            return @"快消零售";
        case 2:
            return @"通讯网络技术";
        case 3:
            return @"农业食品饮料";
        case 4:
            return @"能源矿产";
        case 5:
            return @"化工工业制造";
        case 6:
            return @"金融地产,";
        case 7:
            return @"医疗卫生";
        case 8:
            return @"汽车交通运输";
        default:
            return @"General";
    }
}

@end
