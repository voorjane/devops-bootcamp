#include <fcgi_stdio.h>
#include <stdlib.h>
#include <stdio.h>

int main(void) {
    FCGX_Init();
    FCGX_Request request;
    if (FCGX_InitRequest(&request, 0, FCGI_FAIL_ACCEPT_ON_INTR) != 0) return 1;
    while (FCGX_Accept_r(&request) == 0) {
        FCGX_FPrintF(request.out , "Content-type: text/html\r\n\r\n<H1>Hello, world!</H1>\n");
        FCGX_Finish_r(&request);
    }
    return 0;
}

