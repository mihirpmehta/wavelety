//
//  Blog.m
//
//  Created by   on 19/04/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Blog.h"


NSString *const kBlogId = @"id";
NSString *const kBlogBlogView = @"blog_view";
NSString *const kBlogBlogDate = @"blog_date";
NSString *const kBlogBlogMonth = @"blog_month";
NSString *const kBlogBlogPermalink = @"blog_permalink";
NSString *const kBlogBlogDay = @"blog_day";
NSString *const kBlogPostType = @"post_type";
NSString *const kBlogBlogTitle = @"blog_title";
NSString *const kBlogBlogStatus = @"blog_status";
NSString *const kBlogBlogYear = @"blog_year";
NSString *const kBlogBlogThumbnail = @"blog_thumbnail";
NSString *const kBlogBlogComments = @"blog_comments";
NSString *const kBlogGuid = @"guid";
NSString *const kBlogBlogContent = @"blog_content";
NSString *const kBlogBlogId = @"blog_id";
NSString *const kBlogBlogExcerpt = @"blog_excerpt";


@interface Blog ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Blog

@synthesize blogIdentifier = _blogIdentifier;
@synthesize blogView = _blogView;
@synthesize blogDate = _blogDate;
@synthesize blogMonth = _blogMonth;
@synthesize blogPermalink = _blogPermalink;
@synthesize blogDay = _blogDay;
@synthesize postType = _postType;
@synthesize blogTitle = _blogTitle;
@synthesize blogStatus = _blogStatus;
@synthesize blogYear = _blogYear;
@synthesize blogThumbnail = _blogThumbnail;
@synthesize blogComments = _blogComments;
@synthesize guid = _guid;
@synthesize blogContent = _blogContent;
@synthesize blogId = _blogId;
@synthesize blogExcerpt = _blogExcerpt;


+ (Blog *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Blog *instance = [[Blog alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.blogIdentifier = [[self objectOrNilForKey:kBlogId fromDictionary:dict] doubleValue];
            self.blogView = [self objectOrNilForKey:kBlogBlogView fromDictionary:dict];
            self.blogDate = [self objectOrNilForKey:kBlogBlogDate fromDictionary:dict];
            self.blogMonth = [self objectOrNilForKey:kBlogBlogMonth fromDictionary:dict];
            self.blogPermalink = [self objectOrNilForKey:kBlogBlogPermalink fromDictionary:dict];
            self.blogDay = [self objectOrNilForKey:kBlogBlogDay fromDictionary:dict];
            self.postType = [self objectOrNilForKey:kBlogPostType fromDictionary:dict];
            self.blogTitle = [self objectOrNilForKey:kBlogBlogTitle fromDictionary:dict];
            self.blogStatus = [self objectOrNilForKey:kBlogBlogStatus fromDictionary:dict];
            self.blogYear = [self objectOrNilForKey:kBlogBlogYear fromDictionary:dict];
            self.blogThumbnail = [self objectOrNilForKey:kBlogBlogThumbnail fromDictionary:dict];
            self.blogComments = [self objectOrNilForKey:kBlogBlogComments fromDictionary:dict];
            self.guid = [self objectOrNilForKey:kBlogGuid fromDictionary:dict];
            self.blogContent = [self objectOrNilForKey:kBlogBlogContent fromDictionary:dict];
            self.blogId = [self objectOrNilForKey:kBlogBlogId fromDictionary:dict];
            self.blogExcerpt = [self objectOrNilForKey:kBlogBlogExcerpt fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.blogIdentifier] forKey:kBlogId];
    [mutableDict setValue:self.blogView forKey:kBlogBlogView];
    [mutableDict setValue:self.blogDate forKey:kBlogBlogDate];
    [mutableDict setValue:self.blogMonth forKey:kBlogBlogMonth];
    [mutableDict setValue:self.blogPermalink forKey:kBlogBlogPermalink];
    [mutableDict setValue:self.blogDay forKey:kBlogBlogDay];
    [mutableDict setValue:self.postType forKey:kBlogPostType];
    [mutableDict setValue:self.blogTitle forKey:kBlogBlogTitle];
    [mutableDict setValue:self.blogStatus forKey:kBlogBlogStatus];
    [mutableDict setValue:self.blogYear forKey:kBlogBlogYear];
    [mutableDict setValue:self.blogThumbnail forKey:kBlogBlogThumbnail];
    [mutableDict setValue:self.blogComments forKey:kBlogBlogComments];
    [mutableDict setValue:self.guid forKey:kBlogGuid];
    [mutableDict setValue:self.blogContent forKey:kBlogBlogContent];
    [mutableDict setValue:self.blogId forKey:kBlogBlogId];
    [mutableDict setValue:self.blogExcerpt forKey:kBlogBlogExcerpt];

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

    self.blogIdentifier = [aDecoder decodeDoubleForKey:kBlogId];
    self.blogView = [aDecoder decodeObjectForKey:kBlogBlogView];
    self.blogDate = [aDecoder decodeObjectForKey:kBlogBlogDate];
    self.blogMonth = [aDecoder decodeObjectForKey:kBlogBlogMonth];
    self.blogPermalink = [aDecoder decodeObjectForKey:kBlogBlogPermalink];
    self.blogDay = [aDecoder decodeObjectForKey:kBlogBlogDay];
    self.postType = [aDecoder decodeObjectForKey:kBlogPostType];
    self.blogTitle = [aDecoder decodeObjectForKey:kBlogBlogTitle];
    self.blogStatus = [aDecoder decodeObjectForKey:kBlogBlogStatus];
    self.blogYear = [aDecoder decodeObjectForKey:kBlogBlogYear];
    self.blogThumbnail = [aDecoder decodeObjectForKey:kBlogBlogThumbnail];
    self.blogComments = [aDecoder decodeObjectForKey:kBlogBlogComments];
    self.guid = [aDecoder decodeObjectForKey:kBlogGuid];
    self.blogContent = [aDecoder decodeObjectForKey:kBlogBlogContent];
    self.blogId = [aDecoder decodeObjectForKey:kBlogBlogId];
    self.blogExcerpt = [aDecoder decodeObjectForKey:kBlogBlogExcerpt];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_blogIdentifier forKey:kBlogId];
    [aCoder encodeObject:_blogView forKey:kBlogBlogView];
    [aCoder encodeObject:_blogDate forKey:kBlogBlogDate];
    [aCoder encodeObject:_blogMonth forKey:kBlogBlogMonth];
    [aCoder encodeObject:_blogPermalink forKey:kBlogBlogPermalink];
    [aCoder encodeObject:_blogDay forKey:kBlogBlogDay];
    [aCoder encodeObject:_postType forKey:kBlogPostType];
    [aCoder encodeObject:_blogTitle forKey:kBlogBlogTitle];
    [aCoder encodeObject:_blogStatus forKey:kBlogBlogStatus];
    [aCoder encodeObject:_blogYear forKey:kBlogBlogYear];
    [aCoder encodeObject:_blogThumbnail forKey:kBlogBlogThumbnail];
    [aCoder encodeObject:_blogComments forKey:kBlogBlogComments];
    [aCoder encodeObject:_guid forKey:kBlogGuid];
    [aCoder encodeObject:_blogContent forKey:kBlogBlogContent];
    [aCoder encodeObject:_blogId forKey:kBlogBlogId];
    [aCoder encodeObject:_blogExcerpt forKey:kBlogBlogExcerpt];
}


@end
