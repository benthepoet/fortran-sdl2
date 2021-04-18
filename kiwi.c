#include <SDL2/SDL.h>

#define TICKS_PER_FRAME (1000 / 60)

SDL_Event event;
SDL_Renderer *renderer;
SDL_Window *window;
uint32_t next_tick = 0;

int kiwi_init(int x, int y, int width, int height)
{
    return SDL_CreateWindowAndRenderer(width, height, 0, &window, &renderer);
}

void kiwi_quit()
{
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

void kiwi_begin_frame()
{
    next_tick = SDL_GetTicks() + TICKS_PER_FRAME;
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
    SDL_RenderClear(renderer);
}

void kiwi_end_frame()
{
    SDL_RenderPresent(renderer);
    uint32_t current_tick = SDL_GetTicks();
    if (next_tick > current_tick)
    {
        SDL_Delay(next_tick - current_tick);
    }
}

int kiwi_poll_event()
{
    return SDL_PollEvent(&event);
}

uint32_t kiwi_event_type()
{
    return event.type;
}