# README

* Ruby Version - 2.5.1
* Rails Version - 5.2.2

Input:

A text file containing several hundreds of invoice numbers in the following form:

      _  _     _  _  _  _  _  (line 1)
    | _| _||_||_ |_   ||_||_| (line 2)
    ||_  _|  | _||_|  ||_| _| (line 3)
                              (line 4)
      _  _  _  _  _  _     _  (line 5)
  |_||_|| ||_||_   |  |  ||_  (line 6)
    | _||_||_||_|  |  |  | _| (line 7)
                              (line 8)
Invoice number format:

Each invoice number is constructed of 9 digits [0..9]
Invoice number is written using _ and | characters.
Invoice number input takes 4 lines.
The first 3 lines contain 27 characters.
The fourth line is blank.


