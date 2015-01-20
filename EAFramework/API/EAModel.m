//
//  WMBaseEntity.m
//  我爱我门
//
//  Created by developer on 14-11-27.
//  
//

#import "EAModel.h"

@implementation EAAPIEntry

- (instancetype)initWithResponse:(NSDictionary *)Response
{
    if (self = [super init]) {
        _success = [[Response objectForKey:FIELD_STATUS] boolValue];
        _data = [Response objectForKey:FIELD_DATA];
        _errorType = [Response objectForKey:FIELD_ERROR];
        _message = [Response objectForKey:FIELD_MESSAGE];
    }
    
    return self;
}

@end

@implementation EAModel

@synthesize apiEntry;

- (instancetype)initWithResponse:(NSDictionary *)response
{
    NSDictionary *dataDictionary;
    
    apiEntry = [[EAAPIEntry alloc] initWithResponse:response];
    
    if (apiEntry.success) {
        if ([self respondsToSelector:@selector(handleResponse:)]) {
            dataDictionary = [self handleResponse:response];
        }
        else {
            dataDictionary = apiEntry.data;
        }
    }
    
    return [self initWithDictionary:dataDictionary error:nil];
}

@end
