program test
    implicit none
    
    integer(1) :: x1, x2
    integer(2) :: y

    y = 255
    x1 = transfer(y, x1)
    y = 200
    x2 = transfer(y, x2)

    print "(z5)", x2 - x1

end program test