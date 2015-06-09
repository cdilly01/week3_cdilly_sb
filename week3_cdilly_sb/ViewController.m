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
    
    // get array of notes
    NSMutableArray *notes = [noteSvcCache retrieveAllNotes];
    
    // instantiate new note with sender note
    Note *note = [[Note alloc] init];
    note.noteText = _noteInputText.text;
    
    // find index...
    NSUInteger index = [notes indexOfObject: note ];
    
    // add note if doesn't exist
    if (index == NSNotFound){
        NSLog(@"saveNote: adding new note");
        [noteSvcCache createNote:note];
    }
    else{
        // if note exists, delete then add
        [notes removeObjectAtIndex: index];
        NSLog(@"deleteNote: note deleted");
        
        // now add...
        NSLog(@"saveNote: adding new note");
    }
    
    [self.tableView reloadData];
    NSLog(@"saveNote: note saved");
}

- (IBAction)deleteNote:(id)sender {
    NSLog(@"deleteNote");
    
    // get array of notes
    NSMutableArray *notes = [noteSvcCache retrieveAllNotes];
    
    // instantiate new note with sender note
    Note *note = [[Note alloc] init];
    note.noteText = _noteInputText.text;
    NSUInteger index = [notes indexOfObject: note ];
    
    if (index != NSNotFound){
        [notes removeObjectAtIndex: index];
        [self.tableView reloadData];
        NSLog(@"deleteNote: note deleted");
    }
}
@end
