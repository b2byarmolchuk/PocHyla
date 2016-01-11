//
//  SBMappingProvider+BSInjectJsModel.m
//  PocHyla
//
//  Created by Dima Yarmolchuk on 12/29/15.
//  Copyright © 2015 Dima Yarmolchuk. All rights reserved.
//

#import "SBMappingProvider+BSInjectJsModel.h"
#import "BSInjectJsModel.h"

@implementation SBMappingProvider (BSInjectJsModel)

+ (FEMMapping *)injectJsMapping {
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[BSInjectJsModel class]];
    [mapping addAttributeWithProperty:@"js" keyPath:@"js"];
    [mapping addAttributeWithProperty:@"uid" keyPath:@"uid"];
    
    return mapping;
}

@end
