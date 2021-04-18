program game
    use kiwi
    implicit none

    integer, parameter :: QUIT_EVENT = int(z'100')

    logical :: done

    done = .false.
    
    if (kiwi_init(200, 200, 640, 480) .ne. 0) then
        stop
    end if

    main: do while (.not. done)
        call kiwi_begin_frame()

        event: do while (kiwi_poll_event() > 0)
            select case (kiwi_event_type())
                case (QUIT_EVENT)
                    done = .true.
                    print *, "H"
            end select
        end do event

        call kiwi_end_frame()
    end do main

end program game