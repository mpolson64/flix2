//
//  PosterViewController.m
//  Flix2
//
//  Created by Miles Olson on 6/29/18.
//  Copyright © 2018 codepath. All rights reserved.
//
#import "UIImageView+AFNetworking.h"

#import "PosterViewController.h"

@interface PosterViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;

@end

@implementation PosterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.posterImageView setImageWithURL:[NSURL URLWithString:[@"https://image.tmdb.org/t/p/w500" stringByAppendingString:self.movie[@"poster_path"]]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
