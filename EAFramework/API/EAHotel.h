//
//  EAHotel.h
//  EAFramework
//
//  Created by developer on 15-1-18.
//
//

#import "JSONModel.h"

@interface EAHotel : JSONModel

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *tel;
@property (nonatomic, retain) NSString<Optional> *otherTel;
@property (nonatomic, retain) NSString<Ignore> *address;

//+ (NSArray *)exportModelsFrom:(NSDictionary *)response;

@end
