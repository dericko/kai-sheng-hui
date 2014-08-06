#import "KSHProject.h"


@interface KSHProject ()

// Private interface goes here.

@end


@implementation KSHProject

- (NSString *)getStatusName
{
    switch (self.status.integerValue) {
        case 1:
            return @"进行";
        case 2:
            return @"暂停";
        case 3:
            return @"关闭";
        default:
            return @"";
    }
}

- (NSString *)getPriorityName
{
    switch (self.type.integerValue) {
        case 1:
            return @"低";
        case 2:
            return @"中等";
        case 3:
            return @"高";
        default:
            return @"";
    }
}

- (NSString *)getTimeframeName
{
    switch (self.type.integerValue) {
        case 1:
            return @"星期";
        case 2:
            return @"月";
        case 3:
            return @"月多";
        default:
            return @"不知道";
    }
}

@end
