//
//  EAAPIParser.h
//  我爱我门
//
//  Created by developer on 14-11-25.
//  
//

#import <Foundation/Foundation.h>


static NSString * const FIELD_STATUS = @"success";
static NSString * const FIELD_MESSAGE = @"message";
static NSString * const FIELD_DATA = @"data";
static NSString * const FIELD_RECORDS = @"records";
static NSString * const FIELD_ERROR = @"error";


@interface EAAPIParser : NSObject

@property(readonly, nonatomic) BOOL success;
@property(readonly, nonatomic) NSString *message;
@property(readonly, nonatomic) NSString *errorType;

- (EAAPIParser *)initWithResponse:(NSDictionary *)response;

@end


@interface EAAPIParser(ResponseHandler)

- (void)handleResponse:(NSDictionary *)response;

@end
