//
//  Blog2.m
//
//  Created by   on 19/04/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Blog2.h"
#import "Blog.h"


NSString *const kBlog2Blog = @"blog";


@interface Blog2 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Blog2

@synthesize blog = _blog;


+ (Blog2 *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Blog2 *instance = [[Blog2 alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedBlog = [dict objectForKey:kBlog2Blog];
    NSMutableArray *parsedBlog = [NSMutableArray array];
    if ([receivedBlog isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBlog) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBlog addObject:[Blog modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBlog isKindOfClass:[NSDictionary class]]) {
       [parsedBlog addObject:[Blog modelObjectWithDictionary:(NSDictionary *)receivedBlog]];
    }

    self.blog = [NSArray arrayWithArray:parsedBlog];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
NSMutableArray *tempArrayForBlog = [NSMutableArray array];
    for (NSObject *subArrayObject in self.blog) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBlog addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBlog addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBlog] forKey:@"kBlog2Blog"];

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

    self.blog = [aDecoder decodeObjectForKey:kBlog2Blog];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_blog forKey:kBlog2Blog];
}


@end
