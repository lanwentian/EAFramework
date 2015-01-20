//
//  WMAPIParser.m
//  我爱我门
//
//  Created by developer on 14-11-25.
//  
//

#import "EAAPIParser.h"

@implementation EAAPIParser

@synthesize success;
@synthesize message;
@synthesize errorType;

- (EAAPIParser *)initWithResponse:(NSDictionary *)response
{
    if (self = [super init]) {
        success = [[response objectForKey:FIELD_STATUS] boolValue];
        
        if (success) {
            if ([self respondsToSelector:@selector(handleResponse:)]) {
                [self handleResponse:response];
            }
            message = nil;
        }
        else {
            errorType = [response objectForKey:FIELD_ERROR];
            message = [response objectForKey:FIELD_MESSAGE];
        }
    }
    
    return self;
}



@end
