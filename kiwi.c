#include <SDL2/SDL.h>

#define TICKS_PER_FRAME (1000 / 60)
#define TILE_WIDTH 8
#define SCREEN_RGBA 0, 0, 0, 255

SDL_Rect src = {
    .w = TILE_WIDTH,
    .h = TILE_WIDTH
};
SDL_Rect dst = {
    .w = TILE_WIDTH,
    .h = TILE_WIDTH
};

SDL_Event event;
SDL_Renderer *renderer;
SDL_Texture *texture;
SDL_Window *window;

uint32_t next_tick = 0;

static char tile_col[] = {0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120,0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120};
static char tile_row[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120};

int kiwi_init(int width, int height, int scale)
{
    if ((window = SDL_CreateWindow("", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, width * scale, height * scale, SDL_WINDOW_OPENGL)) == NULL) 
    {
        printf("SDL Error: %s\n", SDL_GetError());
        return 1;
    }

    if ((renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC)) == NULL) 
    {
        printf("SDL Error: %s\n", SDL_GetError());
        return 1;
    }
   
    if (SDL_RenderSetLogicalSize(renderer, width, height) < 0) 
    {
        printf("SDL Error: %s\n", SDL_GetError());
        return 1;
    }

    if (SDL_SetRenderDrawColor(renderer, SCREEN_RGBA) != 0)
    {
        printf("SDL Error: %s\n", SDL_GetError());
        return 1;
    }

    SDL_RendererInfo* renderer_info = malloc(sizeof(SDL_RendererInfo));
    SDL_GetRendererInfo(renderer, renderer_info);

    printf("SDL Renderer: %s\n", renderer_info->name);

    return 0;
}

void kiwi_quit()
{
    SDL_DestroyTexture(texture);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

void kiwi_load(const char *filename)
{
    SDL_Surface* surface;
    if ((surface = SDL_LoadBMP(filename)) == NULL) 
    {
        printf("Failed to load %s.\n", filename);
    }

    texture = SDL_CreateTextureFromSurface(renderer, surface);
    SDL_FreeSurface(surface);
}

void kiwi_copy(int tile, int x, int y)
{
    src.x = tile_col[tile];
    src.y = tile_row[tile];

    dst.x = x;
    dst.y = y;

    SDL_RenderCopy(renderer, texture, &src, &dst);
}

void kiwi_begin_frame()
{
    next_tick = SDL_GetTicks() + TICKS_PER_FRAME;
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

uint32_t kiwi_event_key()
{
    return event.key.keysym.sym;
}

uint32_t kiwi_event_type()
{
    return event.type;
}