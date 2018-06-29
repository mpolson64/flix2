//
//  DetailViewController.m
//  Flix2
//
//  Created by Miles Olson on 6/28/18.
//  Copyright © 2018 codepath. All rights reserved.
//

#import "UIImageView+AFNetworking.h"

#import "DetailViewController.h"
#import "TrailerViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backdropImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation DetailViewController
- (IBAction)onBackdropTap:(id)sender {
    [self performSegueWithIdentifier:nil sender:@"toTrailer"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.posterImageView setImageWithURL:[NSURL URLWithString:[@"https://image.tmdb.org/t/p/w500" stringByAppendingString:self.movie[@"poster_path"]]]];
    [self.backdropImageView setImageWithURL:[NSURL URLWithString:[@"https://image.tmdb.org/t/p/w500" stringByAppendingString:self.movie[@"backdrop_path"]]]];
    
    self.titleLabel.text = self.movie[@"title"];
    self.releaseDateLabel.text = self.movie[@"release_date"];
    
    self.overviewLabel.text = self.movie[@"overview"];
    [self.overviewLabel sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.overviewLabel.frame.origin.y + self.overviewLabel.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    TrailerViewController *trailerViewController = [segue destinationViewController];
    trailerViewController.movie = self.movie;
}

@end
