//
//  EAAPI.h
//  我爱我门
//
//  Created by developer on 14-11-24.
//  Copyright (c) 2014年 com.datang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

static NSString * const API_URL_DEBUG =     @"http://192.168.0.108";
static NSString * const API_URL_RELEASE =   @"http://192.168.0.108";

static NSString * const API_BASE_MODULE =   @"/arche/api.php";

// 文件参数的前缀
static NSString * const PARAM_PREFIX_FILE = @"file:///";
static NSString * const API_DATA_FORMAT =   @"json";

static NSString * const METHOD_POST =       @"post";
static NSString * const METHOD_GET =        @"get";

static NSString * const ACTION_SHOW =       @"/show";
static NSString * const ACTION_SEARCH =     @"/search";

static NSString * const APP_IPHONE =        @"ios-phone";
static NSString * const APP_IPAD =          @"ios-pad";

static int const INVALID_ID = -555;

// get rid of unused warning
static BOOL IS_DEBUG __attribute__((unused)) = true;


//API Response Block
typedef void(^EASuccessBlock)(NSDictionary *response);
typedef void(^EAFailureBlock)(NSError *error);

//////////////////////////////////////////////////////////////////

@interface EAAPI : NSObject

//切换到发布版本模式
+ (void)switchToReleaseMode;

//构建模块URL
+ (NSMutableString *)makeUrlWithModule:(NSString * const)module action:(NSString * const)action;

//发送GET请求, Block方式
- (void)getFromUrl:(NSString *)url
         withParms:(NSDictionary *)params
           success:(EASuccessBlock)success
           failure:(EAFailureBlock)failure;

//发送POST请求, Block方式
- (void)postToUrl:(NSString *)url
        withParms:(NSDictionary *)params
          success:(EASuccessBlock)success
          failure:(EAFailureBlock)failure;

@end
