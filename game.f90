program game
    use kiwi
    implicit none

    integer, parameter :: KEYDOWN_EVENT = int(z'300')
    integer, parameter :: KEYUP_EVENT = int(z'301')
    integer, parameter :: QUIT_EVENT = int(z'100')

    integer, parameter :: KEY_RIGHT = int(z'4000004f')

    integer, parameter :: WIN_WIDTH = 256
    integer, parameter :: WIN_HEIGHT = 224

    integer, dimension(WIN_WIDTH / 8, WIN_HEIGHT / 8) :: map

    map(:, :) = 0
    
    if (kiwi_init(WIN_WIDTH, WIN_HEIGHT, 2) .ne. 0) then
        stop
    end if

    call kiwi_load("tileset.bmp" // c_null_char)

    main: do while (.true.)
        call kiwi_begin_frame()

        event: do while (kiwi_poll_event() > 0)
            select case (kiwi_event_type())
                case (KEYDOWN_EVENT)
                    select case (kiwi_event_key())
                        case (KEY_RIGHT)
                            print *, "Right"
                    end select
                case (QUIT_EVENT)
                    exit main
            end select
        end do event

        call draw_tiles()

        call kiwi_end_frame()
    end do main

    call kiwi_quit()

end program game

subroutine draw_tiles()
    use kiwi

    integer :: i
    do i = 0, 39
        call kiwi_copy(i, i * 8, 0)
    end do
end subroutine