//
//  EAHotel.m
//  EAFramework
//
//  Created by developer on 15-1-18.
//
//

#import "EAHotel.h"

@implementation EAHotel

/*
+ (NSArray *)exportModelsFrom:(NSDictionary *)response
{
    NSMutableArray *modelArray = nil;
    EAAPIEntry *entry = [[EAAPIEntry alloc] initWithResponse:response];
    
    if (entry.success) {
        NSArray *recordArray = [entry.data objectForKey:FIELD_RECORDS];

        if ([recordArray count] > 0) {
            modelArray = [[NSMutableArray alloc] initWithCapacity:[recordArray count]];
            
            for (NSDictionary *record in recordArray) {
                EAHotel *hotel = [[EAHotel alloc] initWithDictionary:record error:nil];
                [modelArray addObject:hotel];
            }
        }
    }
    
    return modelArray;
}
 */

@end