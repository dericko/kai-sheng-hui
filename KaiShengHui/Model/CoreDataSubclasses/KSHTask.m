#import "KSHTask.h"


@interface KSHTask ()

// Private interface goes here.

@end


@implementation KSHTask

// Custom logic goes here.
- (NSString *)getStatusName
{
    switch (self.status.integerValue) {
        case 1:
            return @"待申请";
        case 2:
            return @"审核中";
        case 3:
            return @"待激动";
        case 4:
            return @"审核失败";
        case 5:
            return @"邀请延误";
        case 6:
            return @"邀请成功";
        default:
            return @"";
    }
}

@end
