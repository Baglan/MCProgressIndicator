# MCProgressIndicator

MCProgressIndicator class helps build discrete (as in "step-by-step") progress indicators using images. Things like that:

[example]

## Installation

1. Copy files from the "Classes" folder to your project
    a. Optionally, copy image assets from the "Assets" folder to your project

## Usage

    #import "MCProgressIndicator.h"
    
    …
    
    MCProgressIndicator * progressIndicator = [[MCProgressIndicator alloc] init];
    
    // Set the pattern
    progressIndicator.pattern = @"*..*..*..*";
    
    // Set images for pattern "stops"
    [progressIndicator setOnImage:[UIImage imageNamed:@"star-on.png"] offImage:[UIImage imageNamed:@"star-off.png"] forPatternKey:@"*"];
    [progressIndicator setOnImage:[UIImage imageNamed:@"dot-on"] offImage:[UIImage imageNamed:@"dot-off"] forPatternKey:@"."];
    
    // Set the current step
    progressIndicator.step = 6;
    
    // Resize
    CGSize containerSize = self.view.frame.size;
    CGSize size = [progressIndicator recommentedSize];
    progressIndicator.frame = CGRectMake((containerSize.width - size.width) / 2, 100, size.width, size.height);

    [self.view addSubview:progressIndicator];

## License

This project is available under the MIT license.