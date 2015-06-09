//
//  ViewController.m
//  week3_cdilly_sb
//
//  Created by A Student on 6/9/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "ViewController.h"
#import "Note.h"
#import "NoteSvcCache.h"

@interface ViewController ()

@end

@implementation ViewController

 NoteSvcCache *noteSvcCache = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Save Note
- (IBAction)addNote:(id)sender {
    [self.view endEditing:YES];
 
    // instantiate new note with sender note
    Note *note = [[Note alloc] init];
    note.noteText = _noteInputText.text;
    
    [noteSvcCache addNote:note];
    
    [self.tableView reloadData];
    NSLog(@"saveNote: note saved");
}

// Delete Note
- (IBAction)deleteNote:(id)sender {
    NSLog(@"deleteNote");
    
    // instantiate new note with sender note
    Note *note = [[Note alloc] init];
    note.noteText = _noteInputText.text;
    
    [noteSvcCache deleteNote:note];
    
    [self.tableView reloadData];
    NSLog(@"deleteNote: note deleted");
}
@end
