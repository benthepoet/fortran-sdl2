module sdl
    use, intrinsic :: iso_c_binding
    implicit none
    
    public :: sdl_create_window
    public :: sdl_create_window_and_renderer
    public :: sdl_delay
    public :: sdl_destroy_window
    public :: sdl_init
    public :: sdl_poll_event
    public :: sdl_wait_event
    public :: sdl_render_clear
    public :: sdl_render_present
    public :: sdl_set_render_draw_color
    public :: sdl_quit

    public :: sdl_event

    type, bind(c) :: sdl_event
        integer(kind=c_int) :: type
    end type sdl_event

    interface
        function sdl_create_window(title, x, y, w, h, flags) bind(c, name='SDL_CreateWindow')
            import :: c_char, c_int, c_ptr

            character(c_char), intent(in) :: title
            integer(c_int), intent(in), value :: x
            integer(c_int), intent(in), value :: y
            integer(c_int), intent(in), value :: w
            integer(c_int), intent(in), value :: h
            integer(c_int), intent(in), value :: flags
            type(c_ptr) :: sdl_create_window
        end function

        function sdl_create_window_and_renderer(width, height, flags, window, renderer) bind(c, name='SDL_CreateWindowAndRenderer')
            import :: c_int, c_ptr

            integer(c_int), intent(in), value :: width
            integer(c_int), intent(in), value :: height
            integer(c_int), intent(in), value :: flags
            type(c_ptr), intent(in) :: window
            type(c_ptr), intent(in) :: renderer
            integer(c_int) :: sdl_create_window_and_renderer
        end function

        subroutine sdl_delay(ms) bind(c, name='SDL_Delay')
            import :: c_int

            integer(c_int), intent(in), value :: ms
        end subroutine

        subroutine sdl_destroy_window(window) bind(c, name='SDL_DestroyWindow')
            import :: c_ptr

            type(c_ptr), intent(in), value :: window
        end subroutine

        function sdl_init(flags) bind(c, name='SDL_Init')
            import :: c_int

            integer(c_int), intent(in), value :: flags
            integer(c_int) :: sdl_init
        end function

        function sdl_poll_event(event) bind(c, name='SDL_PollEvent')
            import :: c_int, sdl_event

            type(sdl_event), intent(inout) :: event
            integer(c_int) :: sdl_poll_event
        end function

        function sdl_wait_event(event) bind(c, name='SDL_WaitEvent')
            import :: c_int, sdl_event

            type(sdl_event), intent(inout) :: event
            integer(c_int) :: sdl_wait_event
        end function

        subroutine sdl_render_clear(renderer) bind(c, name='SDL_RenderClear')
            import :: c_ptr

            type(c_ptr), intent(in), value :: renderer
        end subroutine

        subroutine sdl_render_present(renderer) bind(c, name='SDL_RenderPresent')
            import :: c_ptr

            type(c_ptr), intent(in), value :: renderer
        end subroutine

        subroutine sdl_set_render_draw_color(renderer, r, g, b, a) bind(c, name='SDL_SetRenderDrawColor')
            import :: c_ptr, c_int8_t

            type(c_ptr), intent(in), value :: renderer
            integer(c_int8_t), intent(in), value :: r
            integer(c_int8_t), intent(in), value :: g
            integer(c_int8_t), intent(in), value :: b
            integer(c_int8_t), intent(in), value :: a
        end subroutine

        subroutine sdl_quit() bind(c, name='SDL_Quit')
        end subroutine
    end interface

contains

end module sdl