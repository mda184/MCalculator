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
#define SQUARE 4
#define SQUARERT 5
#define CUBE 6
#define POW 7
#define DIVBYX 8

@interface ViewController : UIViewController
{
    double firstNum;
    double secondNum;
    double answer;
    bool isOperatorClicked;
    NSInteger opValue;
    NSInteger tagValue;
    NSInteger tagOpValue;
    NSString *numberInput; //string with the number inputed on the label
    IBOutlet UILabel *displayLabel;
}

@property double firstNum;
@property double secondNum;
@property NSInteger tagValue;
@property NSInteger tagOpValue;
@property double answer;
@property bool isOperatorClicked;
@property NSInteger opValue;
@property (strong, nonatomic) NSString *numberInput;
@property (strong, nonatomic) IBOutlet UILabel *displayLabel;

@end

