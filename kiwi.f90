module kiwi
    use, intrinsic :: iso_c_binding
    implicit none
    
    interface
        function kiwi_init(width, height, scale) bind(c)
            import :: c_int

            integer(c_int), intent(in), value :: width
            integer(c_int), intent(in), value :: height
            integer(c_int), intent(in), value :: scale
            integer(c_int) :: kiwi_init
        end function

        subroutine kiwi_quit() bind(c)
        end subroutine

        subroutine kiwi_load(filename) bind(c)
            import :: c_char

            character(kind=c_char), intent(in) :: filename
        end subroutine

        subroutine kiwi_copy(index, x, y) bind(c)
            import :: c_int

            integer(c_int), intent(in), value :: index
            integer(c_int), intent(in), value :: x
            integer(c_int), intent(in), value :: y
        end subroutine

        subroutine kiwi_begin_frame() bind(c)
        end subroutine

        subroutine kiwi_end_frame() bind(c)
        end subroutine

        function kiwi_poll_event() bind(c)
            import :: c_int

            integer(c_int) :: kiwi_poll_event
        end function

        function kiwi_event_key() bind(c)
            import :: c_int

            integer(c_int) :: kiwi_event_key
        end function

        function kiwi_event_type() bind(c)
            import :: c_int

            integer(c_int) :: kiwi_event_type
        end function
    end interface

contains
    
end module kiwi