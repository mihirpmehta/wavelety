//
//  Allpost.m
//
//  Created by mihir mehta on 15/04/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Allpost.h"


NSString *const kAllpostPostDateGmt = @"post_date_gmt";
NSString *const kAllpostPostType = @"post_type";
NSString *const kAllpostPostId = @"post_id";
NSString *const kAllpostId = @"id";
NSString *const kAllpostPostDate = @"post_date";
NSString *const kAllpostPostTitle = @"post_title";
NSString *const kAllpostPostStatus = @"post_status";
NSString *const kAllpostPostExcerpt = @"post_excerpt";
NSString *const kAllpostGuid = @"guid";
NSString *const kAllpostPostContent = @"post_content";


@interface Allpost ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Allpost

@synthesize postDateGmt = _postDateGmt;
@synthesize postType = _postType;
@synthesize postId = _postId;
@synthesize allpostIdentifier = _allpostIdentifier;
@synthesize postDate = _postDate;
@synthesize postTitle = _postTitle;
@synthesize postStatus = _postStatus;
@synthesize postExcerpt = _postExcerpt;
@synthesize guid = _guid;
@synthesize postContent = _postContent;


+ (Allpost *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Allpost *instance = [[Allpost alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.postDateGmt = [self objectOrNilForKey:kAllpostPostDateGmt fromDictionary:dict];
            self.postType = [self objectOrNilForKey:kAllpostPostType fromDictionary:dict];
            self.postId = [self objectOrNilForKey:kAllpostPostId fromDictionary:dict];
            self.allpostIdentifier = [[self objectOrNilForKey:kAllpostId fromDictionary:dict] doubleValue];
            self.postDate = [self objectOrNilForKey:kAllpostPostDate fromDictionary:dict];
            self.postTitle = [self objectOrNilForKey:kAllpostPostTitle fromDictionary:dict];
            self.postStatus = [self objectOrNilForKey:kAllpostPostStatus fromDictionary:dict];
            self.postExcerpt = [self objectOrNilForKey:kAllpostPostExcerpt fromDictionary:dict];
            self.guid = [self objectOrNilForKey:kAllpostGuid fromDictionary:dict];
            self.postContent = [self objectOrNilForKey:kAllpostPostContent fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.postDateGmt forKey:kAllpostPostDateGmt];
    [mutableDict setValue:self.postType forKey:kAllpostPostType];
    [mutableDict setValue:self.postId forKey:kAllpostPostId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.allpostIdentifier] forKey:kAllpostId];
    [mutableDict setValue:self.postDate forKey:kAllpostPostDate];
    [mutableDict setValue:self.postTitle forKey:kAllpostPostTitle];
    [mutableDict setValue:self.postStatus forKey:kAllpostPostStatus];
    [mutableDict setValue:self.postExcerpt forKey:kAllpostPostExcerpt];
    [mutableDict setValue:self.guid forKey:kAllpostGuid];
    [mutableDict setValue:self.postContent forKey:kAllpostPostContent];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.postDateGmt = [aDecoder decodeObjectForKey:kAllpostPostDateGmt];
    self.postType = [aDecoder decodeObjectForKey:kAllpostPostType];
    self.postId = [aDecoder decodeObjectForKey:kAllpostPostId];
    self.allpostIdentifier = [aDecoder decodeDoubleForKey:kAllpostId];
    self.postDate = [aDecoder decodeObjectForKey:kAllpostPostDate];
    self.postTitle = [aDecoder decodeObjectForKey:kAllpostPostTitle];
    self.postStatus = [aDecoder decodeObjectForKey:kAllpostPostStatus];
    self.postExcerpt = [aDecoder decodeObjectForKey:kAllpostPostExcerpt];
    self.guid = [aDecoder decodeObjectForKey:kAllpostGuid];
    self.postContent = [aDecoder decodeObjectForKey:kAllpostPostContent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_postDateGmt forKey:kAllpostPostDateGmt];
    [aCoder encodeObject:_postType forKey:kAllpostPostType];
    [aCoder encodeObject:_postId forKey:kAllpostPostId];
    [aCoder encodeDouble:_allpostIdentifier forKey:kAllpostId];
    [aCoder encodeObject:_postDate forKey:kAllpostPostDate];
    [aCoder encodeObject:_postTitle forKey:kAllpostPostTitle];
    [aCoder encodeObject:_postStatus forKey:kAllpostPostStatus];
    [aCoder encodeObject:_postExcerpt forKey:kAllpostPostExcerpt];
    [aCoder encodeObject:_guid forKey:kAllpostGuid];
    [aCoder encodeObject:_postContent forKey:kAllpostPostContent];
}


@end
