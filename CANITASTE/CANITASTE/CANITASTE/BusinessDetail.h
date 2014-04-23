//
//  BusinessDetail.h
//
//  Created by   on 23/04/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BusinessDetails;

@interface BusinessDetail : NSObject <NSCoding>

@property (nonatomic, strong) BusinessDetails *businessDetails;

+ (BusinessDetail *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
