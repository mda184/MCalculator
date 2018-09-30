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
#define POW 4

@interface ViewController : UIViewController
{
    double firstNum; //stores the first double value from the the numberInput when an opertaor is clicked
    double secondNum;//stores the second double value from the the numberInput when an operator is clicked
    double answer;//stores the answer after an operation on one or two numbers as a double value
    bool isOperatorClicked; //if an operator was clicked before
    NSInteger opValue; //first operator pressed
    //NSInteger nextOpValue; //if a second operator is pressed
    NSInteger tagNumValue; //tag for a number button
    NSInteger tagOpValue; //tag for an operator button
    NSString *numberInput; //string of the number inputed on the label
    IBOutlet UILabel *displayLabel; //the label that displays the numbers and the answers
}

@property double firstNum;
@property double secondNum;
@property NSInteger tagNumValue;
@property NSInteger tagOpValue;
@property double answer;
@property bool isOperatorClicked;
@property NSInteger opValue;
@property (strong, nonatomic) NSString *numberInput;
@property (strong, nonatomic) IBOutlet UILabel *displayLabel;

@end

