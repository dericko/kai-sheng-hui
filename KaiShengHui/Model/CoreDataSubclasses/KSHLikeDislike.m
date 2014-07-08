#import "KSHLikeDislike.h"


@interface KSHLikeDislike ()

// Private interface goes here.

@end


@implementation KSHLikeDislike

- (void) awakeFromInsert
{
    [super awakeFromInsert];
    [self setCreatedAt:[NSDate date]];
}

- (void)didTurnIntoFault
{
    [super didTurnIntoFault];
    [self setDeletedAt:[NSDate date]];
}

@end
