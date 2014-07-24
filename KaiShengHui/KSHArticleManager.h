//
//  KSHArticleManager.h
//  KaiShengHui
//
//  Created by Derick Olson on 6/24/14.
//  Copyright (c) 2014 Capvision. All rights reserved.
//

#import "KSHContentManager.h"
#import "KSHArticle.h"

/**
 'KSHArticleManager' Defines articleObject-specific request and response behavior. It handles interactions with an object mapping provider to map network responses to an article model.
 @see 'KSHObjectManager'
 */
@interface KSHArticleManager : KSHContentManager

/** Wrapper for a RestKit network request.
 Loads Article JSON from API and executes provided success: and failure: blocks.
 
 Note: The internal RestKit automatically checks for Core Data by checking response descriptors
 for an EntityMapping object (from KSHMappingProvider) and returns an RKManagedObjectRequestOperation if so. 
 Be sure to implement similar behaviour if switching away from Restkit.
 */

@end
