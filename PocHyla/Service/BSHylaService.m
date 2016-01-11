//
//  BSHylaService.m
//  PocHyla
//
//  Created by Dima Yarmolchuk on 12/28/15.
//  Copyright © 2015 Dima Yarmolchuk. All rights reserved.
//

#import "BSHylaService.h"
#import "BSHTTPManager.h"
#import "BSInjectJsModel.h"

#import "SBMappingProvider.h"
#import "SBMappingProvider+SBServiceModel.h"
#import "SBMappingProvider+BSInjectJsModel.h"

@implementation BSHylaService

+ (BSHylaService *)sharedInstance {
    static BSHylaService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [BSHylaService new];
    });
    return sharedInstance;
}

- (void)listServiceWithSuccess:(void (^)(NSArray *listSrvices))success failure:(void (^)(NSError *error))failure {
    
    NSString *urlStr = [NSString stringWithFormat:@"api/actions"];
    
    [[BSHTTPManager sharedInstance] receiveDataByLink:urlStr withSuccess:^(id response) {
        NSArray *services = [FEMObjectDeserializer collectionFromRepresentation:response mapping:[SBMappingProvider servicesMapping]];
        
        if (success) {
            success(services);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)linkInjectjsWithServiceCode:(NSString *)code withSuccess:(void (^)(BSInjectJsModel *injectJsModel))success failure:(void (^)(NSError *error))failure {
    
    NSString *urlStr = [NSString stringWithFormat:@"api/injectjs?code=%@", code];
    
    [[BSHTTPManager sharedInstance] receiveDataByLink:urlStr withSuccess:^(id response) {
        BSInjectJsModel *injectJsModel = [FEMObjectDeserializer objectFromRepresentation:response mapping:[SBMappingProvider injectJsMapping]];
        
        if (success) {
            success(injectJsModel);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


@end
