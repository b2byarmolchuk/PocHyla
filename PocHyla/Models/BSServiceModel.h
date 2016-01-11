//
//  BSServiceModel.h
//  PocHyla
//
//  Created by Dima Yarmolchuk on 12/28/15.
//  Copyright © 2015 Dima Yarmolchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSServiceModel : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *url;
@property (strong, nonatomic) NSData *image;
@property (copy, nonatomic) NSString *uid;

@end
