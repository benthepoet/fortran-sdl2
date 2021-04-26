module map
    implicit none
    
    integer, parameter :: MAP_HEIGHT = 20
    integer, parameter :: MAP_WIDTH = 24

    integer, dimension(24, 20) :: tiles

contains
    subroutine map_init()
        tiles(:,:) = 65
    end subroutine

    function map_get()
        integer, dimension(24, 20) :: map_get
        map_get = tiles
    end function
end module map