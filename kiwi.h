#include <stdint.h>

int kiwi_init(int width, int height, int scale);
void kiwi_quit();
void kiwi_load(const char *filename);
void kiwi_copy(int index, int x, int y);
void kiwi_begin_frame();
void kiwi_end_frame();
int kiwi_poll_event();
uint32_t kiwi_event_key();
uint32_t kiwi_event_type();