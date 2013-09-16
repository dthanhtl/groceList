//
//  MyLogInViewController.m
//  LogInAndSignUpDemo
//
//  Created by Mattieu Gamache-Asselin on 6/15/12.
//

#import "MyLogInViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MyLogInViewController ()
@property (nonatomic, strong) UIImageView *fieldsBackground;
@property (strong, nonatomic) UIButton *exitLoginBtn;
@property (nonatomic,strong) UIImageView *loginTFImageView;
@property (nonatomic,strong) UIView *loginTFView;
@property (strong,nonatomic) UIActivityIndicatorView *indi;

@end

@implementation MyLogInViewController

@synthesize fieldsBackground;
@synthesize loginTFView = _logInTFView;
@synthesize loginTFImageView = _loginTFImageView;
@synthesize exitLoginBtn = _exitLoginBtn;
@synthesize indi = _indi;


-(void)loginAsGuest{
    [self.indi startAnimating];
    [PFAnonymousUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (error) {
            [self.indi stopAnimating];
            NSLog(@"Anonymous login failed.");
        } else {
            [self.indi stopAnimating];
            [self dismissViewControllerAnimated:YES completion:NULL];
            NSLog(@"Anonymous user logged in.");
        }
    }];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.indi = [[UIActivityIndicatorView alloc] init];
    [self.logInView addSubview:self.indi];
    [self.logInView sendSubviewToBack:self.indi];
    [self.navigationController setNavigationBarHidden:YES];
    [self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    [self.logInView setLogo:nil];
    [self.logInView.dismissButton removeFromSuperview];    

    
    self.logInView.externalLogInLabel.textColor = [UIColor whiteColor];
    self.logInView.externalLogInLabel.text = @"You can also log in with:";
    self.logInView.signUpLabel.textColor = [UIColor whiteColor];
    self.logInView.signUpLabel.text = @"Don't have an account yet?";
    
    [self.logInView.facebookButton setImage:nil forState:UIControlStateNormal];
    [self.logInView.facebookButton setImage:nil forState:UIControlStateHighlighted];
    [self.logInView.facebookButton setBackgroundImage:[UIImage imageNamed:@"facebookIcon.png"] forState:UIControlStateHighlighted];
    [self.logInView.facebookButton setBackgroundImage:[UIImage imageNamed:@"facebookIcon.png"] forState:UIControlStateNormal];
    [self.logInView.facebookButton setTitle:@"" forState:UIControlStateNormal];
    [self.logInView.facebookButton setTitle:@"" forState:UIControlStateHighlighted];
    
    [self.logInView.twitterButton removeFromSuperview];
    [self.logInView.signUpButton setBackgroundImage:[UIImage imageNamed:@"signUpIcon.png"] forState:UIControlStateNormal];
    [self.logInView.signUpButton setBackgroundImage:[UIImage imageNamed:@"signUpIcon.png"] forState:UIControlStateHighlighted];
    [self.logInView.signUpButton setTitle:@"" forState:UIControlStateNormal];
    [self.logInView.signUpButton setTitle:@"" forState:UIControlStateHighlighted];
    
    // Add login field background
    fieldsBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginFieldBG.png"]];
    [self.logInView addSubview:self.fieldsBackground];
    [self.logInView sendSubviewToBack:self.fieldsBackground];
    
    self.exitLoginBtn = [[UIButton alloc] init];
    [self.exitLoginBtn setImage:[UIImage imageNamed:@"exitLogin.png"] forState:UIControlStateNormal];
    [self.exitLoginBtn setImage:[UIImage imageNamed:@"exitLogin.png"] forState:UIControlStateHighlighted];
    [self.exitLoginBtn addTarget:self action:@selector(loginAsGuest) forControlEvents:UIControlEventTouchUpInside];
    [self.logInView addSubview:self.exitLoginBtn];
    [self.logInView sendSubviewToBack:self.exitLoginBtn];

    
    self.loginTFImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_password.png"]];
    [self.logInView addSubview:self.loginTFImageView];
    [self.logInView sendSubviewToBack:self.loginTFImageView];
    // Remove text shadow
    CALayer *layer = self.logInView.usernameField.layer;
    layer.shadowOpacity = 0.0f;
    layer = self.logInView.passwordField.layer;
    layer.shadowOpacity = 0.0f;
    
    // Set field text color
    [self.logInView.usernameField setTextColor:[UIColor colorWithRed:135.0f/255.0f green:118.0f/255.0f blue:92.0f/255.0f alpha:1.0]];
    [self.logInView.passwordField setTextColor:[UIColor colorWithRed:135.0f/255.0f green:118.0f/255.0f blue:92.0f/255.0f alpha:1.0]];
    

    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Set frame for elements

    [self.logInView.facebookButton setFrame:CGRectMake(100, 287.0f, 120.0f, 40.0f)];
    
    [self.logInView.signUpButton setFrame:CGRectMake(35.0f, 385.0f, 250.0f, 40.0f)];
    
    [self.loginTFView setFrame:CGRectMake(35.0f, 145.0f, 275, 75)];
    [self.logInView.usernameField setFrame:CGRectMake(35.0f, 145.0f, 250.0f, 50.0f)];
    [self.logInView.passwordField setFrame:CGRectMake(35.0f, 195.0f, 250.0f, 50.0f)];
//    [self.fieldsBackground setFrame:CGRectMake(35.0f, 145.0f, 250.0f, 100.0f)];
    [self.loginTFImageView setFrame:CGRectMake(35.0f, 145.0f, 250.0f, 100.0f)];
    [self.exitLoginBtn setFrame:CGRectMake(230.0f, 6.0f, 85.0f, 45.0f)];
    [self.indi setFrame:CGRectMake(230.0f, 6.0f, 85.0f, 45.0f)];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
