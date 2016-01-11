//
//  ViewController.m
//  PocHyla
//
//  Created by Dima Yarmolchuk on 12/28/15.
//  Copyright © 2015 Dima Yarmolchuk. All rights reserved.
//

#import "MainViewController.h"
#import "BSHylaActivationViewController.h"
#import "BSServiceModel.h"
#import "BSHylaService.h"

@interface MainViewController ()

@property (strong, nonatomic) NSArray *listServices;
@property (strong, nonatomic) BSServiceModel *service;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settings];
}

- (void)settings {
    self.listServices = [NSArray array];
    
    [[BSHylaService sharedInstance] listServiceWithSuccess:^(NSArray *services) {
        self.listServices = services;
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (IBAction)actOpenContentByUrl:(id)sender {
    self.service = [self.listServices lastObject];
    
    [self performSegueWithIdentifier:@"open_content_by_url_segue" sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"open_content_by_url_segue"]) {
        BSHylaActivationViewController *hylaActivationViewController = (BSHylaActivationViewController *)[segue destinationViewController];
        hylaActivationViewController.service = self.service;
    }
}

@end
