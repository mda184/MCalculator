//
//  ViewController.h
//  MCalculator
//
//  Created by Maria on 2018-09-28.
//  Copyright © 2018 Maria. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ADD 0
#define SUB 1
#define MULTIPLY 2
#define DIVIDE 3

@interface ViewController : UIViewController
{
    NSInteger firstNum;
    NSInteger secondNum;
    double answer;
    bool isOperatorClicked;
    NSInteger opValue;
    NSInteger tagValue;
    NSInteger tagOpValue;
    NSString *numberInput; //string with the number inputed on the label
    IBOutlet UILabel *displayLabel;
}

@property NSInteger firstNum;
@property NSInteger secondNum;
@property NSInteger tagValue;
@property NSInteger tagOpValue;
@property double answer;
@property bool isOperatorClicked;
@property NSInteger opValue;
@property (strong, nonatomic) NSString *numberInput;
@property (strong, nonatomic) IBOutlet UILabel *displayLabel;

@end

