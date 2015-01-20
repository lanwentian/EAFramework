//
//  EAAPI.m
//  我爱我门
//
//  Created by developer on 14-11-24.
//  Copyright (c) 2014年 com.datang. All rights reserved.
//

#import "EAAPI.h"

#define EAAPIErrorDomain @"ea.ios"

typedef enum {
    FAILED_DEFAULT = -1000,
    FAILED_INVALID_JSON,
    FAILED_CONNECTION
}EAAPIErrorFailed;

@implementation EAAPI

//切换到发布版本模式
+ (void)switchToReleaseMode
{
    IS_DEBUG = NO;
}

+ (NSString *)API_HOST
{
    return IS_DEBUG ? API_URL_DEBUG : API_URL_RELEASE;
}

//构建模块URL
+ (NSMutableString *)makeUrlWithModule:(NSString * const)module action:(NSString * const)action
{
    NSMutableString *url = [[NSMutableString alloc] initWithString:API_BASE_MODULE];
    [url appendString:module];
    [url appendString:action];
    
    return url;
}

- (NSString *)serializeUrl:(NSString *)url withParams:(NSDictionary *)params
{
    NSMutableString *pairs = [[NSMutableString alloc] initWithString:[EAAPI API_HOST]];
    [pairs appendString:url];
    [pairs appendString:@"?"];
    
    for (id key in params.allKeys) {
        NSString *value = [params objectForKey:key];
        NSString *keyValuePair = [NSString stringWithFormat:@"%@=%@&", key, value];
        [pairs appendString:keyValuePair];
    }
    
    [pairs deleteCharactersInRange:NSMakeRange([pairs length] - 1, 1)];
    
    return pairs;
}

- (void)getFromUrl:(NSString *)url
         withParms:(NSDictionary *)params
           success:(EASuccessBlock)success
           failure:(EAFailureBlock)failure
{
    [self requestWithMethod:METHOD_GET url:url params:params success:success failure:failure];
}

- (void)postToUrl:(NSString *)url
         withParms:(NSDictionary *)params
           success:(EASuccessBlock)success
           failure:(EAFailureBlock)failure
{
    [self requestWithMethod:METHOD_POST url:url params:params success:success failure:failure];
}

- (void)requestWithMethod:(NSString * const)method
                      url:(NSString *)url
                   params:(NSDictionary *)params
                  success:(EASuccessBlock)success
                  failure:(EAFailureBlock)failure
{
    [self beforeRequestWithMethod:method url:url params:params];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:[EAAPI API_HOST]]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //添加摘要认证信息
    /*
    NSURLCredential *credential;
    credential = [NSURLCredential credentialWithUser:@"18344502419"
                                            password:@"900903"
                                         persistence:NSURLCredentialPersistenceNone];
    manager.credential = credential;
    */
    
    if ([method isEqualToString:METHOD_GET]) {
        [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            //[self successWithOperation:operation responseObject:responseObject success:success failure:failure];
            
            success(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            failure(error);
            
        }];
    }
    else {
        [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            //[self successWithOperation:operation responseObject:responseObject success:success failure:failure];
            //success(operation.responseString);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            failure(error);
            
        }];
        
    }
}

/*
- (void)successWithOperation:(AFHTTPRequestOperation *)operation
              responseObject:(id)responseObject
                     success:(EASuccessBlock)success
                     failure:(EAFailureBlock)failure
{
    //NSString *responseString = [NSString replaceUnicode:operation.responseString];
    NSString *responseString = operation.responseString;
    
    NSDictionary *jsonDictionary;
    
    @try {
        jsonDictionary = [responseString objectFromJSONString];
        success(jsonDictionary);
    }
    @catch (NSException *exception) {
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:[exception reason] forKey:NSLocalizedDescriptionKey];
        NSError *error = [NSError errorWithDomain:EAAPIErrorDomain code:FAILED_INVALID_JSON userInfo:userInfo];
        
        failure(error);
    }

}
*/

- (void)beforeRequestWithMethod:(NSString * const)method
                            url:(NSString *)url
                         params:(NSDictionary *)params
{
    NSString *targetUrl = url;
    if ([method isEqualToString:METHOD_GET]) {
        targetUrl = [self serializeUrl:url withParams:params];
        EALog(@"[API GET]: %@", targetUrl);
    }
    else {
        targetUrl = [self serializeUrl:url withParams:nil];
        EALog(@"[API POST]: %@\n[PARAMS]: %@", targetUrl, params);
    }
}

@end
