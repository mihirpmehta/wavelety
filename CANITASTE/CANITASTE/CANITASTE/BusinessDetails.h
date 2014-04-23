//
//  BusinessDetails.h
//
//  Created by   on 23/04/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BusinessDetails : NSObject <NSCoding>

@property (nonatomic, strong) NSString *businessWebsite;
@property (nonatomic, strong) NSString *businessTitle;
@property (nonatomic, strong) NSString *sunday;
@property (nonatomic, strong) NSString *businessPhone;
@property (nonatomic, strong) NSString *businessDetailsDescription;
@property (nonatomic, strong) NSString *saturday;
@property (nonatomic, strong) NSString *businessExcerpt;
@property (nonatomic, strong) NSString *thursday;
@property (nonatomic, strong) NSString *businessPermalink;
@property (nonatomic, strong) NSString *friday;
@property (nonatomic, strong) NSString *businessImage;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *businessId;
@property (nonatomic, strong) NSString *monday;
@property (nonatomic, strong) NSString *businessContent;
@property (nonatomic, strong) NSString *tuesday;
@property (nonatomic, strong) NSString *wedneday;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) NSString *businessAddress;

+ (BusinessDetails *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
