//
//  Blog2.h
//
//  Created by   on 19/04/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Blog2 : NSObject <NSCoding>

@property (nonatomic, strong) NSArray *blog;

+ (Blog2 *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
