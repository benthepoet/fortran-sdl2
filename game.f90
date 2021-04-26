program game
    use kiwi
    use map
    implicit none

    integer, parameter :: WIN_WIDTH = 256
    integer, parameter :: WIN_HEIGHT = 224
    
    if (kiwi_init(WIN_WIDTH, WIN_HEIGHT, 2) .ne. 0) then
        stop
    end if

    call kiwi_load("tileset.bmp" // c_null_char)

    call map_init()

    main: do while (.true.)
        call kiwi_begin_frame()

        event: do while (kiwi_poll_event() > 0)
            select case (kiwi_event_type())
                case (EVENT_KEYUP)
                    select case (kiwi_event_key())
                        case (KEY_RIGHT)
                            print *, "Right"
                        case (KEY_LEFT)
                            print *, "Left"
                        case (KEY_DOWN)
                            print *, "Down"
                        case (KEY_UP)
                            print *, "Up"
                    end select
                case (EVENT_QUIT)
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
    use map

    integer :: i, j

    do j = 1, MAP_HEIGHT
        do i = 1, MAP_WIDTH
            call kiwi_copy(tiles(i, j), i * TILE_SIZE, j * TILE_SIZE)
        end do
    end do
end subroutine