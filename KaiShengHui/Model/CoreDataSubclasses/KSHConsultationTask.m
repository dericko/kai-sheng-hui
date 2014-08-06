#import "KSHConsultationTask.h"


@interface KSHConsultationTask ()

// Private interface goes here.

@end


@implementation KSHConsultationTask

- (NSString *)getInterviewTypeName
{
    switch (self.interviewType.integerValue) {
        case 1:
            return @"电话";
        case 2:
            return @"见面";
        case 3:
            return @"Roadshow";
        case 4:
            return @"电话－Ex";
        case 5:
            return @"电话－Conf";
        case 6:
            return @"Data";
        case 7:
            return @"Survey";
        default:
            return @"";
    }
}

@end
