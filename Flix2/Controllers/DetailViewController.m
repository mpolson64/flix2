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
#import "PosterViewController.h"

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
- (IBAction)onPosterTap:(id)sender {
    [self performSegueWithIdentifier:nil sender:@"toPoster"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.posterImageView setImageWithURL:[NSURL URLWithString:[@"https://image.tmdb.org/t/p/w500" stringByAppendingString:self.movie[@"poster_path"]]]];
    [self.backdropImageView setImageWithURL:[NSURL URLWithString:[@"https://image.tmdb.org/t/p/w500" stringByAppendingString:self.movie[@"backdrop_path"]]]];
    
    self.titleLabel.text = self.movie[@"title"];
    self.releaseDateLabel.text = [self readableDate:self.movie[@"release_date"]];
    
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
    
    PosterViewController *posterViewController = [segue destinationViewController];
    posterViewController.movie = self.movie;
}

-(NSString*)readableDate:(NSString *)inString {
    NSString *year = [inString substringWithRange:NSMakeRange(0, 4)];
    NSString *monthNum = [inString substringWithRange:NSMakeRange(5, 2)];
    NSString *day = [inString substringWithRange:NSMakeRange(8, 2)];
    
    NSString *outString = @"";
    if(monthNum == @"01") {
        outString = [outString stringByAppendingString:@"Jan. "];
    } else if([monthNum isEqualToString:@"02"]) {
        outString = [outString stringByAppendingString:@"Feb. "];
    } else if([monthNum isEqualToString:@"03"]) {
        outString = [outString stringByAppendingString:@"Mar. "];
    } else if([monthNum isEqualToString:@"04"]) {
        outString = [outString stringByAppendingString:@"Apr. "];
    } else if([monthNum isEqualToString:@"05"]) {
        outString = [outString stringByAppendingString:@"May "];
    } else if([monthNum isEqualToString:@"06"]) {
        outString = [outString stringByAppendingString:@"Jun. "];
    } else if([monthNum isEqualToString:@"07"]) {
        outString = [outString stringByAppendingString:@"Jul. "];
    } else if([monthNum isEqualToString:@"08"]) {
        outString = [outString stringByAppendingString:@"Aug. "];
    } else if([monthNum isEqualToString:@"09"]) {
        outString = [outString stringByAppendingString:@"Sept. "];
    } else if([monthNum isEqualToString:@"10"]) {
        outString = [outString stringByAppendingString:@"Oct. "];
    } else if([monthNum isEqualToString:@"11"]) {
        outString = [outString stringByAppendingString:@"Nov. "];
    } else if([monthNum isEqualToString:@"12"]) {
        outString = [outString stringByAppendingString:@"Dec. "];
    }
    
    outString = [outString stringByAppendingString:day];
    outString = [outString stringByAppendingString:[NSString stringWithFormat:@", %@", year]];
    return outString;
}

@end
