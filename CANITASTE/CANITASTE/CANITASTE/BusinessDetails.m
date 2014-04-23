//
//  BusinessDetails.m
//
//  Created by   on 23/04/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "BusinessDetails.h"


NSString *const kBusinessDetailsBusinessWebsite = @"business_website";
NSString *const kBusinessDetailsBusinessTitle = @"business_title";
NSString *const kBusinessDetailsSunday = @"sunday";
NSString *const kBusinessDetailsBusinessPhone = @"business_phone";
NSString *const kBusinessDetailsDescription = @"description";
NSString *const kBusinessDetailsSaturday = @"saturday";
NSString *const kBusinessDetailsBusinessExcerpt = @"business_excerpt";
NSString *const kBusinessDetailsThursday = @"thursday";
NSString *const kBusinessDetailsBusinessPermalink = @"business_permalink";
NSString *const kBusinessDetailsFriday = @"friday";
NSString *const kBusinessDetailsBusinessImage = @"business_image";
NSString *const kBusinessDetailsAddress = @"address";
NSString *const kBusinessDetailsBusinessId = @"business_id";
NSString *const kBusinessDetailsMonday = @"monday";
NSString *const kBusinessDetailsBusinessContent = @"business_content";
NSString *const kBusinessDetailsTuesday = @"tuesday";
NSString *const kBusinessDetailsWedneday = @"wedneday";
NSString *const kBusinessDetailsWebsite = @"website";
NSString *const kBusinessDetailsBusinessAddress = @"business_address";


@interface BusinessDetails ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BusinessDetails

@synthesize businessWebsite = _businessWebsite;
@synthesize businessTitle = _businessTitle;
@synthesize sunday = _sunday;
@synthesize businessPhone = _businessPhone;
@synthesize businessDetailsDescription = _businessDetailsDescription;
@synthesize saturday = _saturday;
@synthesize businessExcerpt = _businessExcerpt;
@synthesize thursday = _thursday;
@synthesize businessPermalink = _businessPermalink;
@synthesize friday = _friday;
@synthesize businessImage = _businessImage;
@synthesize address = _address;
@synthesize businessId = _businessId;
@synthesize monday = _monday;
@synthesize businessContent = _businessContent;
@synthesize tuesday = _tuesday;
@synthesize wedneday = _wedneday;
@synthesize website = _website;
@synthesize businessAddress = _businessAddress;


+ (BusinessDetails *)modelObjectWithDictionary:(NSDictionary *)dict
{
    BusinessDetails *instance = [[BusinessDetails alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.businessWebsite = [self objectOrNilForKey:kBusinessDetailsBusinessWebsite fromDictionary:dict];
            self.businessTitle = [self objectOrNilForKey:kBusinessDetailsBusinessTitle fromDictionary:dict];
            self.sunday = [self objectOrNilForKey:kBusinessDetailsSunday fromDictionary:dict];
            self.businessPhone = [self objectOrNilForKey:kBusinessDetailsBusinessPhone fromDictionary:dict];
            self.businessDetailsDescription = [self objectOrNilForKey:kBusinessDetailsDescription fromDictionary:dict];
            self.saturday = [self objectOrNilForKey:kBusinessDetailsSaturday fromDictionary:dict];
            self.businessExcerpt = [self objectOrNilForKey:kBusinessDetailsBusinessExcerpt fromDictionary:dict];
            self.thursday = [self objectOrNilForKey:kBusinessDetailsThursday fromDictionary:dict];
            self.businessPermalink = [self objectOrNilForKey:kBusinessDetailsBusinessPermalink fromDictionary:dict];
            self.friday = [self objectOrNilForKey:kBusinessDetailsFriday fromDictionary:dict];
            self.businessImage = [self objectOrNilForKey:kBusinessDetailsBusinessImage fromDictionary:dict];
            self.address = [self objectOrNilForKey:kBusinessDetailsAddress fromDictionary:dict];
            self.businessId = [self objectOrNilForKey:kBusinessDetailsBusinessId fromDictionary:dict];
            self.monday = [self objectOrNilForKey:kBusinessDetailsMonday fromDictionary:dict];
            self.businessContent = [self objectOrNilForKey:kBusinessDetailsBusinessContent fromDictionary:dict];
            self.tuesday = [self objectOrNilForKey:kBusinessDetailsTuesday fromDictionary:dict];
            self.wedneday = [self objectOrNilForKey:kBusinessDetailsWedneday fromDictionary:dict];
            self.website = [self objectOrNilForKey:kBusinessDetailsWebsite fromDictionary:dict];
            self.businessAddress = [self objectOrNilForKey:kBusinessDetailsBusinessAddress fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.businessWebsite forKey:kBusinessDetailsBusinessWebsite];
    [mutableDict setValue:self.businessTitle forKey:kBusinessDetailsBusinessTitle];
    [mutableDict setValue:self.sunday forKey:kBusinessDetailsSunday];
    [mutableDict setValue:self.businessPhone forKey:kBusinessDetailsBusinessPhone];
    [mutableDict setValue:self.businessDetailsDescription forKey:kBusinessDetailsDescription];
    [mutableDict setValue:self.saturday forKey:kBusinessDetailsSaturday];
    [mutableDict setValue:self.businessExcerpt forKey:kBusinessDetailsBusinessExcerpt];
    [mutableDict setValue:self.thursday forKey:kBusinessDetailsThursday];
    [mutableDict setValue:self.businessPermalink forKey:kBusinessDetailsBusinessPermalink];
    [mutableDict setValue:self.friday forKey:kBusinessDetailsFriday];
    [mutableDict setValue:self.businessImage forKey:kBusinessDetailsBusinessImage];
    [mutableDict setValue:self.address forKey:kBusinessDetailsAddress];
    [mutableDict setValue:self.businessId forKey:kBusinessDetailsBusinessId];
    [mutableDict setValue:self.monday forKey:kBusinessDetailsMonday];
    [mutableDict setValue:self.businessContent forKey:kBusinessDetailsBusinessContent];
    [mutableDict setValue:self.tuesday forKey:kBusinessDetailsTuesday];
    [mutableDict setValue:self.wedneday forKey:kBusinessDetailsWedneday];
    [mutableDict setValue:self.website forKey:kBusinessDetailsWebsite];
    [mutableDict setValue:self.businessAddress forKey:kBusinessDetailsBusinessAddress];

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

    self.businessWebsite = [aDecoder decodeObjectForKey:kBusinessDetailsBusinessWebsite];
    self.businessTitle = [aDecoder decodeObjectForKey:kBusinessDetailsBusinessTitle];
    self.sunday = [aDecoder decodeObjectForKey:kBusinessDetailsSunday];
    self.businessPhone = [aDecoder decodeObjectForKey:kBusinessDetailsBusinessPhone];
    self.businessDetailsDescription = [aDecoder decodeObjectForKey:kBusinessDetailsDescription];
    self.saturday = [aDecoder decodeObjectForKey:kBusinessDetailsSaturday];
    self.businessExcerpt = [aDecoder decodeObjectForKey:kBusinessDetailsBusinessExcerpt];
    self.thursday = [aDecoder decodeObjectForKey:kBusinessDetailsThursday];
    self.businessPermalink = [aDecoder decodeObjectForKey:kBusinessDetailsBusinessPermalink];
    self.friday = [aDecoder decodeObjectForKey:kBusinessDetailsFriday];
    self.businessImage = [aDecoder decodeObjectForKey:kBusinessDetailsBusinessImage];
    self.address = [aDecoder decodeObjectForKey:kBusinessDetailsAddress];
    self.businessId = [aDecoder decodeObjectForKey:kBusinessDetailsBusinessId];
    self.monday = [aDecoder decodeObjectForKey:kBusinessDetailsMonday];
    self.businessContent = [aDecoder decodeObjectForKey:kBusinessDetailsBusinessContent];
    self.tuesday = [aDecoder decodeObjectForKey:kBusinessDetailsTuesday];
    self.wedneday = [aDecoder decodeObjectForKey:kBusinessDetailsWedneday];
    self.website = [aDecoder decodeObjectForKey:kBusinessDetailsWebsite];
    self.businessAddress = [aDecoder decodeObjectForKey:kBusinessDetailsBusinessAddress];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_businessWebsite forKey:kBusinessDetailsBusinessWebsite];
    [aCoder encodeObject:_businessTitle forKey:kBusinessDetailsBusinessTitle];
    [aCoder encodeObject:_sunday forKey:kBusinessDetailsSunday];
    [aCoder encodeObject:_businessPhone forKey:kBusinessDetailsBusinessPhone];
    [aCoder encodeObject:_businessDetailsDescription forKey:kBusinessDetailsDescription];
    [aCoder encodeObject:_saturday forKey:kBusinessDetailsSaturday];
    [aCoder encodeObject:_businessExcerpt forKey:kBusinessDetailsBusinessExcerpt];
    [aCoder encodeObject:_thursday forKey:kBusinessDetailsThursday];
    [aCoder encodeObject:_businessPermalink forKey:kBusinessDetailsBusinessPermalink];
    [aCoder encodeObject:_friday forKey:kBusinessDetailsFriday];
    [aCoder encodeObject:_businessImage forKey:kBusinessDetailsBusinessImage];
    [aCoder encodeObject:_address forKey:kBusinessDetailsAddress];
    [aCoder encodeObject:_businessId forKey:kBusinessDetailsBusinessId];
    [aCoder encodeObject:_monday forKey:kBusinessDetailsMonday];
    [aCoder encodeObject:_businessContent forKey:kBusinessDetailsBusinessContent];
    [aCoder encodeObject:_tuesday forKey:kBusinessDetailsTuesday];
    [aCoder encodeObject:_wedneday forKey:kBusinessDetailsWedneday];
    [aCoder encodeObject:_website forKey:kBusinessDetailsWebsite];
    [aCoder encodeObject:_businessAddress forKey:kBusinessDetailsBusinessAddress];
}


@end
