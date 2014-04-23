//
//  BusinessDetail.m
//
//  Created by   on 23/04/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "BusinessDetail.h"
#import "BusinessDetails.h"


NSString *const kBusinessDetailBusinessDetails = @"business-details";


@interface BusinessDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BusinessDetail

@synthesize businessDetails = _businessDetails;


+ (BusinessDetail *)modelObjectWithDictionary:(NSDictionary *)dict
{
    BusinessDetail *instance = [[BusinessDetail alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.businessDetails = [BusinessDetails modelObjectWithDictionary:[dict objectForKey:kBusinessDetailBusinessDetails]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.businessDetails dictionaryRepresentation] forKey:kBusinessDetailBusinessDetails];

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

    self.businessDetails = [aDecoder decodeObjectForKey:kBusinessDetailBusinessDetails];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_businessDetails forKey:kBusinessDetailBusinessDetails];
}


@end
