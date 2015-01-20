//
//  EAAPIHotelGroupParser.m
//  EAFramework
//
//  Created by developer on 15-1-19.
//
//

#import "EAAPIHotelGroupParser.h"

@implementation EAAPIHotelGroupParser

@synthesize hotels;

- (void)handleResponse:(NSDictionary *)response
{
    NSArray *dataArray = [[response objectForKey:FIELD_DATA] objectForKey:FIELD_RECORDS];
    hotels = [[NSMutableArray alloc] initWithCapacity:[dataArray count]];
    
    for (NSDictionary *data in dataArray) {
        EAHotel *hotel = [[EAHotel alloc] initWithDictionary:data error:nil];
        [hotels addObject:hotel];
    }
}

@end
