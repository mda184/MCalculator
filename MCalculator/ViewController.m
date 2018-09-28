//
//  ViewController.m
//  MCalculator
//
//  Created by Maria on 2018-09-28.
//  Copyright © 2018 Maria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize firstNum,secondNum,tagValue,tagOpValue,answer,opValue,displayLabel,numberInput,isOperatorClicked;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setFirstNum:0];
    [self setSecondNum:0];
    [self setAnswer:0.0];
    [self setOpValue:ADD];
    [self setNumberInput:@""];
    [self setIsOperatorClicked:FALSE];
    [self setTagValue:100];
    [self setTagOpValue:0];
    
    [self printNumber];  //calling the method to initialize it
    
}

-(void)printNumber
{
    [displayLabel setText:numberInput]; //setting the numberInput on the displaylabel
}

//saving the first number when the operator is clicked
-(void)saveFirstNum
{
    firstNum = [numberInput integerValue];
    numberInput =@"";
    [self printNumber];
}

//saving the second number after the operator is clicked(including =)
-(void)saveSecondNum
{
    secondNum = [numberInput integerValue];
    numberInput =@"";
    [self printNumber];
}

//Reset the values
-(void)resetValues
{
    firstNum  = 0;
    secondNum = 0;
    answer    = 0.0;
    tagValue =100;
    tagOpValue =0;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

//eventhandlers for numbers pressed
-(IBAction)numberPressed:(id)sender
{
    tagValue = [sender tag];
    if (tagValue == 1)
    {
        numberInput = [numberInput stringByAppendingString:@"1"];
        [self printNumber]; //print it on the label
    }
    if (tagValue == 2)
    {
        numberInput = [numberInput stringByAppendingString:@"2"];
        [self printNumber]; //print it on the label
    }
    if (tagValue == 3)
    {
        numberInput = [numberInput stringByAppendingString:@"3"];
        [self printNumber]; //print it on the label
    }
    if (tagValue == 4)
    {
        numberInput = [numberInput stringByAppendingString:@"4"];
        [self printNumber]; //print it on the label
    }
    if (tagValue == 5)
    {
        numberInput = [numberInput stringByAppendingString:@"5"];
        [self printNumber]; //print it on the label
    }
    if (tagValue == 6)
    {
        numberInput = [numberInput stringByAppendingString:@"6"];
        [self printNumber]; //print it on the label
    }
    if (tagValue == 7)
    {
        numberInput = [numberInput stringByAppendingString:@"7"];
        [self printNumber]; //print it on the label
    }
    if (tagValue == 8)
    {
        numberInput = [numberInput stringByAppendingString:@"8"];
        [self printNumber]; //print it on the label
    }
    if (tagValue == 9)
    {
        numberInput = [numberInput stringByAppendingString:@"9"];
        [self printNumber]; //print it on the label
    }
    if (tagValue == 0)
    {
        numberInput = [numberInput stringByAppendingString:@"0"];
        [self printNumber]; //print it on the label
    }
    
}


//eventhandlers for operators
-(IBAction)setOperator:(id)sender
{
    tagOpValue = [sender tag];
    if (isOperatorClicked == FALSE)
    {   if (tagOpValue==10)opValue = ADD;
        else if (tagOpValue==11)opValue = SUB;
        else if (tagOpValue==12)opValue = MULTIPLY;
        else if (tagOpValue==13)opValue = DIVIDE;
        
        [self saveFirstNum];
        isOperatorClicked = TRUE;
    }
    
    //ADD OPERATOR
    else if (isOperatorClicked == TRUE && opValue==ADD)
    {
        [self saveSecondNum];
        answer = firstNum + secondNum;
        numberInput = [NSString stringWithFormat:@"%f",answer];
        [self printNumber]; //print it on the label
        firstNum  = answer;
        secondNum = 0;
        opValue = ADD;
        isOperatorClicked = TRUE;
    }
    
    //MINUS OPERATOR
    else if (isOperatorClicked == TRUE && opValue==SUB)
    {
        [self saveSecondNum];
        answer = firstNum - secondNum;
        numberInput = [NSString stringWithFormat:@"%f",answer];
        [self printNumber]; //print it on the label
        firstNum  = answer;
        secondNum = 0;
        opValue = SUB;
        isOperatorClicked = TRUE;
    }
    
    //MULTIPLY OPERATOR
    else if (isOperatorClicked == TRUE && opValue==MULTIPLY)
    {
        [self saveSecondNum];
        answer = firstNum * secondNum;
        numberInput = [NSString stringWithFormat:@"%f",answer];
        [self printNumber]; //print it on the label
        firstNum  = answer;
        secondNum = 1;
        opValue = MULTIPLY;
        isOperatorClicked = TRUE;
    }
    
    //DIVIDE OPERATOR
    else if (isOperatorClicked == TRUE && opValue==DIVIDE)
    {
        [self saveSecondNum];
        answer = firstNum / secondNum;
        numberInput = [NSString stringWithFormat:@"%f",answer];
        [self printNumber]; //print it on the label
        firstNum  = answer;
        secondNum = 1;
        opValue = DIVIDE;
        isOperatorClicked = TRUE;
    }
    [self setNumberInput:@""];
    
}

//additional functions
-(IBAction)additionalFunctions:(id)sender
{
    
    tagOpValue = [sender tag];
    if (tagOpValue == 15) // 1/x function
    {
        if (firstNum ==0) {
            [self saveFirstNum];
            answer = 1/firstNum;
            numberInput = [NSString stringWithFormat:@"%f",answer];
            [self printNumber]; //print it on the label
        }
        else if (firstNum!=0 && secondNum ==0)
        {
            [self saveSecondNum];
            secondNum = 1/secondNum;
            numberInput = [NSString stringWithFormat:@"%ld",secondNum];
            [self printNumber]; //print it on the label
        }
    }
    [self setNumberInput:@""];
}

//eventhandler for clear
-(IBAction)clearClicked:(id)sender
{
    [self resetValues];
    [self setNumberInput:@""];
    [self printNumber];
    [self setOpValue:0];
    [self setIsOperatorClicked:FALSE];
}

//eventhandler for clear
-(IBAction)deleteClicked:(id)sender
{
    if (firstNum!=0 && secondNum == 0)
    {
        [self resetValues];
        [self setNumberInput:@""];
        [self printNumber];
        [self setOpValue:0];
        [self setIsOperatorClicked:FALSE];
    }
    else
        if (firstNum!=0 && secondNum != 0)
        {
            secondNum =0;
        }
}

-(IBAction)equalPressed:(id)sender
{
    if (opValue == ADD) {
        [self saveSecondNum]; //MAYBE TAKE IT OUT AND PUT IT ABOVE
        answer = firstNum + secondNum;
    }
    
    else if (opValue == SUB) {
        [self saveSecondNum]; //MAYBE TAKE IT OUT AND PUT IT ABOVE
        answer = firstNum - secondNum;
    }
    
    else if (opValue == MULTIPLY) {
        [self saveSecondNum]; //MAYBE TAKE IT OUT AND PUT IT ABOVE
        answer = firstNum * secondNum;
    }
    
    else if (opValue == DIVIDE) {
        [self saveSecondNum]; //MAYBE TAKE IT OUT AND PUT IT ABOVE
        answer = firstNum / secondNum;
    }
    numberInput = [NSString stringWithFormat:@"%f",answer];
    [self printNumber]; //print it on the label
    [self resetValues];
}

@end
