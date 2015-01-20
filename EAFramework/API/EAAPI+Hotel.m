//
//  EAAPI+Hotel.m
//  EAFramework
//
//  Created by developer on 15-1-18.
//
//

#import "EAAPI+Hotel.h"

static NSString *const MODULE = @"/hotel";

@implementation EAAPI (Hotel)

- (void)batchHotelsWithPageIndex:(NSUInteger)pageIndex
                         success:(EASuccessBlock)success
                         failure:(EAFailureBlock)failure
{
    NSString *url = [EAAPI makeUrlWithModule:MODULE action:@"/all"];
    
    [self getFromUrl:url withParms:nil success:success failure:failure];
}

- (void)fetchHotelDetailWithHotelId:(NSUInteger)hotelId
                      success:(EASuccessBlock)success
                      failure:(EAFailureBlock)failure
{
    NSString *url = [EAAPI makeUrlWithModule:MODULE action:@"/detail"];
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:
                           [NSNumber numberWithUnsignedInteger:hotelId], @"id",
                           nil];
    
    [self getFromUrl:url withParms:params success:success failure:failure];
}

@end
