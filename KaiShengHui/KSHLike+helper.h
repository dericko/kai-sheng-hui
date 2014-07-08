//
//  KSHLike+helper.h
//  KaiShengHui
//
//  Created by Derick Olson on 7/8/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHLike.h"

@interface KSHLike (helper)

- (void)likeWithUser:(KSHUser *)user forTag:(KSHTag *)tag;
- (void)likeWithUser:(KSHUser *)user forArticle:(KSHArticle *)article;

@end
