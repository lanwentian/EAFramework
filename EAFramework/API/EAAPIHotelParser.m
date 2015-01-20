//
//  EAAPIHotelParser.m
//  EAFramework
//
//  Created by developer on 15-1-19.
//
//

#import "EAAPIHotelParser.h"

@implementation EAAPIHotelParser

@synthesize hotel;

- (void)handleResponse:(NSDictionary *)dataDictionary
{
    hotel = [[EAHotel alloc] initWithDictionary:dataDictionary error:nil];
}

@end
