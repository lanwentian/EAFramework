//
//  EAAPI+Hotel.h
//  EAFramework
//
//  Created by developer on 15-1-18.
//
//

#import "EAAPI.h"

@interface EAAPI (Hotel)

- (void)batchHotelsWithPageIndex:(NSUInteger)pageIndex
                         success:(EASuccessBlock)success
                         failure:(EAFailureBlock)failure;

- (void)fetchHotelDetailWithHotelId:(NSUInteger)hotelId
                            success:(EASuccessBlock)success
                            failure:(EAFailureBlock)failure;

@end
