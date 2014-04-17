//
//  BaseClass.m
//
//  Created by mihir mehta on 15/04/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "Allpost.h"


NSString *const kBaseClassAllpost = @"allpost";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize allpost = _allpost;


+ (BaseClass *)modelObjectWithDictionary:(NSDictionary *)dict
{
    BaseClass *instance = [[BaseClass alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedAllpost = [dict objectForKey:kBaseClassAllpost];
    NSMutableArray *parsedAllpost = [NSMutableArray array];
    if ([receivedAllpost isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAllpost) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAllpost addObject:[Allpost modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAllpost isKindOfClass:[NSDictionary class]]) {
       [parsedAllpost addObject:[Allpost modelObjectWithDictionary:(NSDictionary *)receivedAllpost]];
    }

    self.allpost = [NSArray arrayWithArray:parsedAllpost];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
NSMutableArray *tempArrayForAllpost = [NSMutableArray array];
    for (NSObject *subArrayObject in self.allpost) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAllpost addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAllpost addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAllpost] forKey:@"kBaseClassAllpost"];

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

    self.allpost = [aDecoder decodeObjectForKey:kBaseClassAllpost];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_allpost forKey:kBaseClassAllpost];
}


@end
