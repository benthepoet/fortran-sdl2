program main
    use, intrinsic :: iso_c_binding
    use sdl
    implicit none
    
    type(c_ptr) :: ren, win
    type(sdl_event) :: evt

    integer :: x
    logical :: f

    integer(kind=c_int), parameter :: SDL_INIT_EVENTS         = int(z'00004000')

    integer(kind=1), parameter :: sdl_quit_c = int(z'ff', 1)

    f = .true.
    x = sdl_init(SDL_INIT_EVENTS)
    x = sdl_create_window_and_renderer(640, 480, 0, win, ren)

    do while (f)
        if (sdl_wait_event(evt) > 0) then
            print *, "A"
        end if
    end do

    call sdl_destroy_window(win)
    call sdl_quit()

end program main
