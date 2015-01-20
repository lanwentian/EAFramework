//
//  WMBaseEntity.h
//  我爱我门
//
//  Created by developer on 14-11-27.
//  
//

#import "JSONModel.h"

static NSString * const FIELD_STATUS = @"success";
static NSString * const FIELD_MESSAGE = @"message";
static NSString * const FIELD_DATA = @"data";
static NSString * const FIELD_RECORDS = @"records";
static NSString * const FIELD_ERROR = @"error";


@interface EAAPIEntry : NSObject

@property(readonly, nonatomic) BOOL success;
@property(readonly, nonatomic) NSString *message;
@property(readonly, nonatomic) NSString *errorType;
@property(readonly, nonatomic) NSDictionary *data;

- (instancetype)initWithResponse:(NSDictionary *)Response;

@end


@interface EAModel : JSONModel

@property(nonatomic, readonly) EAAPIEntry<Ignore> *apiEntry;

- (instancetype)initWithResponse:(NSDictionary *)response;

@end

@interface EAModel(ResponseHandler)

- (NSDictionary *)handleResponse:(NSDictionary *)response;

@end
