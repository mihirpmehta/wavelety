//
//  Blog.h
//
//  Created by   on 19/04/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Blog : NSObject <NSCoding>

@property (nonatomic, assign) double blogIdentifier;
@property (nonatomic, strong) NSString *blogView;
@property (nonatomic, strong) NSString *blogDate;
@property (nonatomic, strong) NSString *blogMonth;
@property (nonatomic, strong) NSString *blogPermalink;
@property (nonatomic, strong) NSString *blogDay;
@property (nonatomic, strong) NSString *postType;
@property (nonatomic, strong) NSString *blogTitle;
@property (nonatomic, strong) NSString *blogStatus;
@property (nonatomic, strong) NSString *blogYear;
@property (nonatomic, strong) NSString *blogThumbnail;
@property (nonatomic, strong) NSString *blogComments;
@property (nonatomic, strong) NSString *guid;
@property (nonatomic, strong) NSString *blogContent;
@property (nonatomic, strong) NSString *blogId;
@property (nonatomic, strong) NSString *blogExcerpt;

+ (Blog *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
