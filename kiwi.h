#include <stdint.h>

int kiwi_init(int x, int y, int w, int h);
void kiwi_quit();
void kiwi_begin_frame();
void kiwi_end_frame();
int kiwi_poll_event();
uint32_t kiwi_event_type();