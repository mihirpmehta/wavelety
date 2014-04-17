//
//  Allpost.h
//
//  Created by mihir mehta on 15/04/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Allpost : NSObject <NSCoding>

@property (nonatomic, strong) NSString *postDateGmt;
@property (nonatomic, strong) NSString *postType;
@property (nonatomic, strong) NSString *postId;
@property (nonatomic, assign) double allpostIdentifier;
@property (nonatomic, strong) NSString *postDate;
@property (nonatomic, strong) NSString *postTitle;
@property (nonatomic, strong) NSString *postStatus;
@property (nonatomic, strong) NSString *postExcerpt;
@property (nonatomic, strong) NSString *guid;
@property (nonatomic, strong) NSString *postContent;
@property (nonatomic, readwrite) BOOL isExpanded;


+ (Allpost *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
