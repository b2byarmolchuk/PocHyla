//
//  SBMappingProvider+SBServiceModel.m
//  PocHyla
//
//  Created by Dima Yarmolchuk on 12/28/15.
//  Copyright © 2015 Dima Yarmolchuk. All rights reserved.
//

#import "SBMappingProvider+SBServiceModel.h"
#import "BSServiceModel.h"

@implementation SBMappingProvider (SBServiceModel)

+ (FEMMapping *)servicesMapping {
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[BSServiceModel class]];
    [mapping addAttributeWithProperty:@"name" keyPath:@"Name"];
    [mapping addAttributeWithProperty:@"url" keyPath:@"Url"];
    [mapping addAttributeWithProperty:@"image" keyPath:@"Image"];
    [mapping addAttributeWithProperty:@"uid" keyPath:@"uid"];
    
    return mapping;
}

@end
