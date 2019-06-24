# SwiftCodingStyleSample

## This sample demonstrate the order of a class

* Order 1: Protocol, Enum, Struct, class... for outter used
* Order 2: Class defination

  Constants, variable:
    * Order 3: Protocol, Enum, Struct, class... for inner used
    * Order 4: IBOutlet
    * Order 5: Internal constants, variable
    * Order 6: Local constants, variable

  Function:
    * Order 7: Init / Deinit function(If it has)
    * Order 8: Override function
    * Order 9: Fuction for intialization

* Order 10: Protocol to extension - Native class
* Order 11: Protocol to extension - Custom class
* Order 12: IBAction function
* Order 13: Group of specific outer function
* Order 14: Group of specific inner function


> Sameple in CaculatorBookListViewController.swift
