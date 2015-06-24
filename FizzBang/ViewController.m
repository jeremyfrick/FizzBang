//
//  ViewController.m
//  FizzBang
//
//  Created by Jeremy Frick on 6/24/15.
//  Copyright (c) 2015 Red Anchor Software. All rights reserved.
//

#import "ViewController.h"
#import "FizzBang.h"
#import "NumberCheck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberBox;
@property (weak, nonatomic) IBOutlet UIButton *whatIsItButton;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (weak, nonatomic) IBOutlet UIButton *infoViewCloseButton;
@property (weak, nonatomic) IBOutlet UILabel *infoViewLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //setup game info popup view
    self.infoView.alpha = 0.0;
    self.infoView.layer.cornerRadius = 5;
    self.infoView.layer.masksToBounds = true;
    self.infoView.layer.borderWidth = 1.0;
    self.infoViewCloseButton.alpha = 0.0;
    self.infoViewLabel.alpha = 0.0;
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)whatIsItButtonPressed:(id)sender {
    //verify that the entry in the text box is an actual number
    NumberCheck *checkTextEntry = [[NumberCheck alloc]init];
    if ([checkTextEntry stringIsNumeric:self.numberBox.text]) {
        //If it is a number then process throught the FizzBang class to get the displayed result
        FizzBang *numberTest = [[FizzBang alloc]init];
        NSString *result = [numberTest process:[self.numberBox.text intValue]];
        self.resultLabel.text = result;
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Uh Oh!" message:@"What you entered was not a number!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            self.numberBox.text = @"";
        }];
        [alertController addAction:defaultAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
}

- (IBAction)infoButtonPressed:(id)sender {
    [UIView animateWithDuration:1.0 animations: ^{
        self.infoView.alpha = 0.75;
        self.infoViewLabel.alpha = 1.0;
        self.infoViewCloseButton.alpha = 1.0;
    }];
}

- (IBAction)infoViewCloseButtonPressed:(id)sender {
    [UIView animateWithDuration:1.0 animations: ^{
        self.infoView.alpha = 0.0;
        self.infoViewLabel.alpha = 0.0;
        self.infoViewCloseButton.alpha = 0.0;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
