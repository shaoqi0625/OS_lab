
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	f3 0f 1e fb          	endbr32 
  100004:	55                   	push   %ebp
  100005:	89 e5                	mov    %esp,%ebp
  100007:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  10000a:	b8 20 1d 11 00       	mov    $0x111d20,%eax
  10000f:	2d 16 0a 11 00       	sub    $0x110a16,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 0a 11 00 	movl   $0x110a16,(%esp)
  100027:	e8 17 2f 00 00       	call   102f43 <memset>

    cons_init();                // init the console
  10002c:	e8 16 16 00 00       	call   101647 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 80 37 10 00 	movl   $0x103780,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 9c 37 10 00 	movl   $0x10379c,(%esp)
  100046:	e8 49 02 00 00       	call   100294 <cprintf>

    print_kerninfo();
  10004b:	e8 07 09 00 00       	call   100957 <print_kerninfo>

    grade_backtrace();
  100050:	e8 9a 00 00 00       	call   1000ef <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 98 2b 00 00       	call   102bf2 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 3d 17 00 00       	call   10179c <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 e2 18 00 00       	call   101946 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 63 0d 00 00       	call   100dcc <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 7a 18 00 00       	call   1018e8 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  10006e:	e8 87 01 00 00       	call   1001fa <lab1_switch_test>

    /* do nothing */
    while (1);
  100073:	eb fe                	jmp    100073 <kern_init+0x73>

00100075 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100075:	f3 0f 1e fb          	endbr32 
  100079:	55                   	push   %ebp
  10007a:	89 e5                	mov    %esp,%ebp
  10007c:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100086:	00 
  100087:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10008e:	00 
  10008f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100096:	e8 1b 0d 00 00       	call   100db6 <mon_backtrace>
}
  10009b:	90                   	nop
  10009c:	c9                   	leave  
  10009d:	c3                   	ret    

0010009e <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10009e:	f3 0f 1e fb          	endbr32 
  1000a2:	55                   	push   %ebp
  1000a3:	89 e5                	mov    %esp,%ebp
  1000a5:	53                   	push   %ebx
  1000a6:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a9:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000ac:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000af:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b5:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b9:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000bd:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000c1:	89 04 24             	mov    %eax,(%esp)
  1000c4:	e8 ac ff ff ff       	call   100075 <grade_backtrace2>
}
  1000c9:	90                   	nop
  1000ca:	83 c4 14             	add    $0x14,%esp
  1000cd:	5b                   	pop    %ebx
  1000ce:	5d                   	pop    %ebp
  1000cf:	c3                   	ret    

001000d0 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000d0:	f3 0f 1e fb          	endbr32 
  1000d4:	55                   	push   %ebp
  1000d5:	89 e5                	mov    %esp,%ebp
  1000d7:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000da:	8b 45 10             	mov    0x10(%ebp),%eax
  1000dd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1000e4:	89 04 24             	mov    %eax,(%esp)
  1000e7:	e8 b2 ff ff ff       	call   10009e <grade_backtrace1>
}
  1000ec:	90                   	nop
  1000ed:	c9                   	leave  
  1000ee:	c3                   	ret    

001000ef <grade_backtrace>:

void
grade_backtrace(void) {
  1000ef:	f3 0f 1e fb          	endbr32 
  1000f3:	55                   	push   %ebp
  1000f4:	89 e5                	mov    %esp,%ebp
  1000f6:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000f9:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000fe:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  100105:	ff 
  100106:	89 44 24 04          	mov    %eax,0x4(%esp)
  10010a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100111:	e8 ba ff ff ff       	call   1000d0 <grade_backtrace0>
}
  100116:	90                   	nop
  100117:	c9                   	leave  
  100118:	c3                   	ret    

00100119 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100119:	f3 0f 1e fb          	endbr32 
  10011d:	55                   	push   %ebp
  10011e:	89 e5                	mov    %esp,%ebp
  100120:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100123:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100126:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100129:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10012c:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10012f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100133:	83 e0 03             	and    $0x3,%eax
  100136:	89 c2                	mov    %eax,%edx
  100138:	a1 20 0a 11 00       	mov    0x110a20,%eax
  10013d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100141:	89 44 24 04          	mov    %eax,0x4(%esp)
  100145:	c7 04 24 a1 37 10 00 	movl   $0x1037a1,(%esp)
  10014c:	e8 43 01 00 00       	call   100294 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100151:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100155:	89 c2                	mov    %eax,%edx
  100157:	a1 20 0a 11 00       	mov    0x110a20,%eax
  10015c:	89 54 24 08          	mov    %edx,0x8(%esp)
  100160:	89 44 24 04          	mov    %eax,0x4(%esp)
  100164:	c7 04 24 af 37 10 00 	movl   $0x1037af,(%esp)
  10016b:	e8 24 01 00 00       	call   100294 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100170:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100174:	89 c2                	mov    %eax,%edx
  100176:	a1 20 0a 11 00       	mov    0x110a20,%eax
  10017b:	89 54 24 08          	mov    %edx,0x8(%esp)
  10017f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100183:	c7 04 24 bd 37 10 00 	movl   $0x1037bd,(%esp)
  10018a:	e8 05 01 00 00       	call   100294 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10018f:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100193:	89 c2                	mov    %eax,%edx
  100195:	a1 20 0a 11 00       	mov    0x110a20,%eax
  10019a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10019e:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001a2:	c7 04 24 cb 37 10 00 	movl   $0x1037cb,(%esp)
  1001a9:	e8 e6 00 00 00       	call   100294 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  1001ae:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001b2:	89 c2                	mov    %eax,%edx
  1001b4:	a1 20 0a 11 00       	mov    0x110a20,%eax
  1001b9:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001c1:	c7 04 24 d9 37 10 00 	movl   $0x1037d9,(%esp)
  1001c8:	e8 c7 00 00 00       	call   100294 <cprintf>
    round ++;
  1001cd:	a1 20 0a 11 00       	mov    0x110a20,%eax
  1001d2:	40                   	inc    %eax
  1001d3:	a3 20 0a 11 00       	mov    %eax,0x110a20
}
  1001d8:	90                   	nop
  1001d9:	c9                   	leave  
  1001da:	c3                   	ret    

001001db <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001db:	f3 0f 1e fb          	endbr32 
  1001df:	55                   	push   %ebp
  1001e0:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
    //无特权级转化时的压栈
    asm volatile(
  1001e2:	83 ec 08             	sub    $0x8,%esp
  1001e5:	cd 78                	int    $0x78
  1001e7:	89 ec                	mov    %ebp,%esp
        "int %0 \n" //使用int指令产生软中断
        "movl %%ebp, %%esp \n"
        :
        :"i"(T_SWITCH_TOU)
    );
}
  1001e9:	90                   	nop
  1001ea:	5d                   	pop    %ebp
  1001eb:	c3                   	ret    

001001ec <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001ec:	f3 0f 1e fb          	endbr32 
  1001f0:	55                   	push   %ebp
  1001f1:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
    //低特权级向高特权级切换的压栈
    asm volatile(
  1001f3:	cd 79                	int    $0x79
  1001f5:	89 ec                	mov    %ebp,%esp
        "int %0 \n" //使用int指令产生软中断
        "movl %%ebp, %%esp \n"
        :
        :"i"(T_SWITCH_TOK)
    );
}
  1001f7:	90                   	nop
  1001f8:	5d                   	pop    %ebp
  1001f9:	c3                   	ret    

001001fa <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001fa:	f3 0f 1e fb          	endbr32 
  1001fe:	55                   	push   %ebp
  1001ff:	89 e5                	mov    %esp,%ebp
  100201:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  100204:	e8 10 ff ff ff       	call   100119 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  100209:	c7 04 24 e8 37 10 00 	movl   $0x1037e8,(%esp)
  100210:	e8 7f 00 00 00       	call   100294 <cprintf>
    lab1_switch_to_user();
  100215:	e8 c1 ff ff ff       	call   1001db <lab1_switch_to_user>
    lab1_print_cur_status();
  10021a:	e8 fa fe ff ff       	call   100119 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10021f:	c7 04 24 08 38 10 00 	movl   $0x103808,(%esp)
  100226:	e8 69 00 00 00       	call   100294 <cprintf>
    lab1_switch_to_kernel();
  10022b:	e8 bc ff ff ff       	call   1001ec <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100230:	e8 e4 fe ff ff       	call   100119 <lab1_print_cur_status>
}
  100235:	90                   	nop
  100236:	c9                   	leave  
  100237:	c3                   	ret    

00100238 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100238:	f3 0f 1e fb          	endbr32 
  10023c:	55                   	push   %ebp
  10023d:	89 e5                	mov    %esp,%ebp
  10023f:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100242:	8b 45 08             	mov    0x8(%ebp),%eax
  100245:	89 04 24             	mov    %eax,(%esp)
  100248:	e8 2b 14 00 00       	call   101678 <cons_putc>
    (*cnt) ++;
  10024d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100250:	8b 00                	mov    (%eax),%eax
  100252:	8d 50 01             	lea    0x1(%eax),%edx
  100255:	8b 45 0c             	mov    0xc(%ebp),%eax
  100258:	89 10                	mov    %edx,(%eax)
}
  10025a:	90                   	nop
  10025b:	c9                   	leave  
  10025c:	c3                   	ret    

0010025d <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  10025d:	f3 0f 1e fb          	endbr32 
  100261:	55                   	push   %ebp
  100262:	89 e5                	mov    %esp,%ebp
  100264:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100267:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  10026e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100271:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100275:	8b 45 08             	mov    0x8(%ebp),%eax
  100278:	89 44 24 08          	mov    %eax,0x8(%esp)
  10027c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10027f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100283:	c7 04 24 38 02 10 00 	movl   $0x100238,(%esp)
  10028a:	e8 20 30 00 00       	call   1032af <vprintfmt>
    return cnt;
  10028f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100292:	c9                   	leave  
  100293:	c3                   	ret    

00100294 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100294:	f3 0f 1e fb          	endbr32 
  100298:	55                   	push   %ebp
  100299:	89 e5                	mov    %esp,%ebp
  10029b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10029e:	8d 45 0c             	lea    0xc(%ebp),%eax
  1002a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  1002a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ae:	89 04 24             	mov    %eax,(%esp)
  1002b1:	e8 a7 ff ff ff       	call   10025d <vcprintf>
  1002b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1002b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002bc:	c9                   	leave  
  1002bd:	c3                   	ret    

001002be <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  1002be:	f3 0f 1e fb          	endbr32 
  1002c2:	55                   	push   %ebp
  1002c3:	89 e5                	mov    %esp,%ebp
  1002c5:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002cb:	89 04 24             	mov    %eax,(%esp)
  1002ce:	e8 a5 13 00 00       	call   101678 <cons_putc>
}
  1002d3:	90                   	nop
  1002d4:	c9                   	leave  
  1002d5:	c3                   	ret    

001002d6 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002d6:	f3 0f 1e fb          	endbr32 
  1002da:	55                   	push   %ebp
  1002db:	89 e5                	mov    %esp,%ebp
  1002dd:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002e0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002e7:	eb 13                	jmp    1002fc <cputs+0x26>
        cputch(c, &cnt);
  1002e9:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002ed:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002f0:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002f4:	89 04 24             	mov    %eax,(%esp)
  1002f7:	e8 3c ff ff ff       	call   100238 <cputch>
    while ((c = *str ++) != '\0') {
  1002fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ff:	8d 50 01             	lea    0x1(%eax),%edx
  100302:	89 55 08             	mov    %edx,0x8(%ebp)
  100305:	0f b6 00             	movzbl (%eax),%eax
  100308:	88 45 f7             	mov    %al,-0x9(%ebp)
  10030b:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  10030f:	75 d8                	jne    1002e9 <cputs+0x13>
    }
    cputch('\n', &cnt);
  100311:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100314:	89 44 24 04          	mov    %eax,0x4(%esp)
  100318:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  10031f:	e8 14 ff ff ff       	call   100238 <cputch>
    return cnt;
  100324:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100327:	c9                   	leave  
  100328:	c3                   	ret    

00100329 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  100329:	f3 0f 1e fb          	endbr32 
  10032d:	55                   	push   %ebp
  10032e:	89 e5                	mov    %esp,%ebp
  100330:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  100333:	90                   	nop
  100334:	e8 6d 13 00 00       	call   1016a6 <cons_getc>
  100339:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10033c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100340:	74 f2                	je     100334 <getchar+0xb>
        /* do nothing */;
    return c;
  100342:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100345:	c9                   	leave  
  100346:	c3                   	ret    

00100347 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100347:	f3 0f 1e fb          	endbr32 
  10034b:	55                   	push   %ebp
  10034c:	89 e5                	mov    %esp,%ebp
  10034e:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100351:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100355:	74 13                	je     10036a <readline+0x23>
        cprintf("%s", prompt);
  100357:	8b 45 08             	mov    0x8(%ebp),%eax
  10035a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10035e:	c7 04 24 27 38 10 00 	movl   $0x103827,(%esp)
  100365:	e8 2a ff ff ff       	call   100294 <cprintf>
    }
    int i = 0, c;
  10036a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100371:	e8 b3 ff ff ff       	call   100329 <getchar>
  100376:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100379:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10037d:	79 07                	jns    100386 <readline+0x3f>
            return NULL;
  10037f:	b8 00 00 00 00       	mov    $0x0,%eax
  100384:	eb 78                	jmp    1003fe <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100386:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10038a:	7e 28                	jle    1003b4 <readline+0x6d>
  10038c:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100393:	7f 1f                	jg     1003b4 <readline+0x6d>
            cputchar(c);
  100395:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100398:	89 04 24             	mov    %eax,(%esp)
  10039b:	e8 1e ff ff ff       	call   1002be <cputchar>
            buf[i ++] = c;
  1003a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003a3:	8d 50 01             	lea    0x1(%eax),%edx
  1003a6:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1003a9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1003ac:	88 90 40 0a 11 00    	mov    %dl,0x110a40(%eax)
  1003b2:	eb 45                	jmp    1003f9 <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  1003b4:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  1003b8:	75 16                	jne    1003d0 <readline+0x89>
  1003ba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003be:	7e 10                	jle    1003d0 <readline+0x89>
            cputchar(c);
  1003c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003c3:	89 04 24             	mov    %eax,(%esp)
  1003c6:	e8 f3 fe ff ff       	call   1002be <cputchar>
            i --;
  1003cb:	ff 4d f4             	decl   -0xc(%ebp)
  1003ce:	eb 29                	jmp    1003f9 <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  1003d0:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1003d4:	74 06                	je     1003dc <readline+0x95>
  1003d6:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1003da:	75 95                	jne    100371 <readline+0x2a>
            cputchar(c);
  1003dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003df:	89 04 24             	mov    %eax,(%esp)
  1003e2:	e8 d7 fe ff ff       	call   1002be <cputchar>
            buf[i] = '\0';
  1003e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ea:	05 40 0a 11 00       	add    $0x110a40,%eax
  1003ef:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003f2:	b8 40 0a 11 00       	mov    $0x110a40,%eax
  1003f7:	eb 05                	jmp    1003fe <readline+0xb7>
        c = getchar();
  1003f9:	e9 73 ff ff ff       	jmp    100371 <readline+0x2a>
        }
    }
}
  1003fe:	c9                   	leave  
  1003ff:	c3                   	ret    

00100400 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100400:	f3 0f 1e fb          	endbr32 
  100404:	55                   	push   %ebp
  100405:	89 e5                	mov    %esp,%ebp
  100407:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  10040a:	a1 40 0e 11 00       	mov    0x110e40,%eax
  10040f:	85 c0                	test   %eax,%eax
  100411:	75 5b                	jne    10046e <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  100413:	c7 05 40 0e 11 00 01 	movl   $0x1,0x110e40
  10041a:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  10041d:	8d 45 14             	lea    0x14(%ebp),%eax
  100420:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100423:	8b 45 0c             	mov    0xc(%ebp),%eax
  100426:	89 44 24 08          	mov    %eax,0x8(%esp)
  10042a:	8b 45 08             	mov    0x8(%ebp),%eax
  10042d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100431:	c7 04 24 2a 38 10 00 	movl   $0x10382a,(%esp)
  100438:	e8 57 fe ff ff       	call   100294 <cprintf>
    vcprintf(fmt, ap);
  10043d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100440:	89 44 24 04          	mov    %eax,0x4(%esp)
  100444:	8b 45 10             	mov    0x10(%ebp),%eax
  100447:	89 04 24             	mov    %eax,(%esp)
  10044a:	e8 0e fe ff ff       	call   10025d <vcprintf>
    cprintf("\n");
  10044f:	c7 04 24 46 38 10 00 	movl   $0x103846,(%esp)
  100456:	e8 39 fe ff ff       	call   100294 <cprintf>
    
    cprintf("stack trackback:\n");
  10045b:	c7 04 24 48 38 10 00 	movl   $0x103848,(%esp)
  100462:	e8 2d fe ff ff       	call   100294 <cprintf>
    print_stackframe();
  100467:	e8 3d 06 00 00       	call   100aa9 <print_stackframe>
  10046c:	eb 01                	jmp    10046f <__panic+0x6f>
        goto panic_dead;
  10046e:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10046f:	e8 80 14 00 00       	call   1018f4 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100474:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10047b:	e8 5d 08 00 00       	call   100cdd <kmonitor>
  100480:	eb f2                	jmp    100474 <__panic+0x74>

00100482 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100482:	f3 0f 1e fb          	endbr32 
  100486:	55                   	push   %ebp
  100487:	89 e5                	mov    %esp,%ebp
  100489:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  10048c:	8d 45 14             	lea    0x14(%ebp),%eax
  10048f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100492:	8b 45 0c             	mov    0xc(%ebp),%eax
  100495:	89 44 24 08          	mov    %eax,0x8(%esp)
  100499:	8b 45 08             	mov    0x8(%ebp),%eax
  10049c:	89 44 24 04          	mov    %eax,0x4(%esp)
  1004a0:	c7 04 24 5a 38 10 00 	movl   $0x10385a,(%esp)
  1004a7:	e8 e8 fd ff ff       	call   100294 <cprintf>
    vcprintf(fmt, ap);
  1004ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004af:	89 44 24 04          	mov    %eax,0x4(%esp)
  1004b3:	8b 45 10             	mov    0x10(%ebp),%eax
  1004b6:	89 04 24             	mov    %eax,(%esp)
  1004b9:	e8 9f fd ff ff       	call   10025d <vcprintf>
    cprintf("\n");
  1004be:	c7 04 24 46 38 10 00 	movl   $0x103846,(%esp)
  1004c5:	e8 ca fd ff ff       	call   100294 <cprintf>
    va_end(ap);
}
  1004ca:	90                   	nop
  1004cb:	c9                   	leave  
  1004cc:	c3                   	ret    

001004cd <is_kernel_panic>:

bool
is_kernel_panic(void) {
  1004cd:	f3 0f 1e fb          	endbr32 
  1004d1:	55                   	push   %ebp
  1004d2:	89 e5                	mov    %esp,%ebp
    return is_panic;
  1004d4:	a1 40 0e 11 00       	mov    0x110e40,%eax
}
  1004d9:	5d                   	pop    %ebp
  1004da:	c3                   	ret    

001004db <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1004db:	f3 0f 1e fb          	endbr32 
  1004df:	55                   	push   %ebp
  1004e0:	89 e5                	mov    %esp,%ebp
  1004e2:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1004e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004e8:	8b 00                	mov    (%eax),%eax
  1004ea:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004ed:	8b 45 10             	mov    0x10(%ebp),%eax
  1004f0:	8b 00                	mov    (%eax),%eax
  1004f2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004fc:	e9 ca 00 00 00       	jmp    1005cb <stab_binsearch+0xf0>
        int true_m = (l + r) / 2, m = true_m;
  100501:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100504:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100507:	01 d0                	add    %edx,%eax
  100509:	89 c2                	mov    %eax,%edx
  10050b:	c1 ea 1f             	shr    $0x1f,%edx
  10050e:	01 d0                	add    %edx,%eax
  100510:	d1 f8                	sar    %eax
  100512:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100515:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100518:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10051b:	eb 03                	jmp    100520 <stab_binsearch+0x45>
            m --;
  10051d:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100520:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100523:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100526:	7c 1f                	jl     100547 <stab_binsearch+0x6c>
  100528:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10052b:	89 d0                	mov    %edx,%eax
  10052d:	01 c0                	add    %eax,%eax
  10052f:	01 d0                	add    %edx,%eax
  100531:	c1 e0 02             	shl    $0x2,%eax
  100534:	89 c2                	mov    %eax,%edx
  100536:	8b 45 08             	mov    0x8(%ebp),%eax
  100539:	01 d0                	add    %edx,%eax
  10053b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10053f:	0f b6 c0             	movzbl %al,%eax
  100542:	39 45 14             	cmp    %eax,0x14(%ebp)
  100545:	75 d6                	jne    10051d <stab_binsearch+0x42>
        }
        if (m < l) {    // no match in [l, m]
  100547:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10054a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10054d:	7d 09                	jge    100558 <stab_binsearch+0x7d>
            l = true_m + 1;
  10054f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100552:	40                   	inc    %eax
  100553:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100556:	eb 73                	jmp    1005cb <stab_binsearch+0xf0>
        }

        // actual binary search
        any_matches = 1;
  100558:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10055f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100562:	89 d0                	mov    %edx,%eax
  100564:	01 c0                	add    %eax,%eax
  100566:	01 d0                	add    %edx,%eax
  100568:	c1 e0 02             	shl    $0x2,%eax
  10056b:	89 c2                	mov    %eax,%edx
  10056d:	8b 45 08             	mov    0x8(%ebp),%eax
  100570:	01 d0                	add    %edx,%eax
  100572:	8b 40 08             	mov    0x8(%eax),%eax
  100575:	39 45 18             	cmp    %eax,0x18(%ebp)
  100578:	76 11                	jbe    10058b <stab_binsearch+0xb0>
            *region_left = m;
  10057a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10057d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100580:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100582:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100585:	40                   	inc    %eax
  100586:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100589:	eb 40                	jmp    1005cb <stab_binsearch+0xf0>
        } else if (stabs[m].n_value > addr) {
  10058b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10058e:	89 d0                	mov    %edx,%eax
  100590:	01 c0                	add    %eax,%eax
  100592:	01 d0                	add    %edx,%eax
  100594:	c1 e0 02             	shl    $0x2,%eax
  100597:	89 c2                	mov    %eax,%edx
  100599:	8b 45 08             	mov    0x8(%ebp),%eax
  10059c:	01 d0                	add    %edx,%eax
  10059e:	8b 40 08             	mov    0x8(%eax),%eax
  1005a1:	39 45 18             	cmp    %eax,0x18(%ebp)
  1005a4:	73 14                	jae    1005ba <stab_binsearch+0xdf>
            *region_right = m - 1;
  1005a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005a9:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005ac:	8b 45 10             	mov    0x10(%ebp),%eax
  1005af:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1005b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005b4:	48                   	dec    %eax
  1005b5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005b8:	eb 11                	jmp    1005cb <stab_binsearch+0xf0>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1005ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005bd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005c0:	89 10                	mov    %edx,(%eax)
            l = m;
  1005c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005c5:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1005c8:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1005cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1005ce:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1005d1:	0f 8e 2a ff ff ff    	jle    100501 <stab_binsearch+0x26>
        }
    }

    if (!any_matches) {
  1005d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1005db:	75 0f                	jne    1005ec <stab_binsearch+0x111>
        *region_right = *region_left - 1;
  1005dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e0:	8b 00                	mov    (%eax),%eax
  1005e2:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005e5:	8b 45 10             	mov    0x10(%ebp),%eax
  1005e8:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1005ea:	eb 3e                	jmp    10062a <stab_binsearch+0x14f>
        l = *region_right;
  1005ec:	8b 45 10             	mov    0x10(%ebp),%eax
  1005ef:	8b 00                	mov    (%eax),%eax
  1005f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005f4:	eb 03                	jmp    1005f9 <stab_binsearch+0x11e>
  1005f6:	ff 4d fc             	decl   -0x4(%ebp)
  1005f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fc:	8b 00                	mov    (%eax),%eax
  1005fe:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  100601:	7e 1f                	jle    100622 <stab_binsearch+0x147>
  100603:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100606:	89 d0                	mov    %edx,%eax
  100608:	01 c0                	add    %eax,%eax
  10060a:	01 d0                	add    %edx,%eax
  10060c:	c1 e0 02             	shl    $0x2,%eax
  10060f:	89 c2                	mov    %eax,%edx
  100611:	8b 45 08             	mov    0x8(%ebp),%eax
  100614:	01 d0                	add    %edx,%eax
  100616:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10061a:	0f b6 c0             	movzbl %al,%eax
  10061d:	39 45 14             	cmp    %eax,0x14(%ebp)
  100620:	75 d4                	jne    1005f6 <stab_binsearch+0x11b>
        *region_left = l;
  100622:	8b 45 0c             	mov    0xc(%ebp),%eax
  100625:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100628:	89 10                	mov    %edx,(%eax)
}
  10062a:	90                   	nop
  10062b:	c9                   	leave  
  10062c:	c3                   	ret    

0010062d <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10062d:	f3 0f 1e fb          	endbr32 
  100631:	55                   	push   %ebp
  100632:	89 e5                	mov    %esp,%ebp
  100634:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100637:	8b 45 0c             	mov    0xc(%ebp),%eax
  10063a:	c7 00 78 38 10 00    	movl   $0x103878,(%eax)
    info->eip_line = 0;
  100640:	8b 45 0c             	mov    0xc(%ebp),%eax
  100643:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10064a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10064d:	c7 40 08 78 38 10 00 	movl   $0x103878,0x8(%eax)
    info->eip_fn_namelen = 9;
  100654:	8b 45 0c             	mov    0xc(%ebp),%eax
  100657:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10065e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100661:	8b 55 08             	mov    0x8(%ebp),%edx
  100664:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100667:	8b 45 0c             	mov    0xc(%ebp),%eax
  10066a:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100671:	c7 45 f4 ec 40 10 00 	movl   $0x1040ec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100678:	c7 45 f0 f0 cf 10 00 	movl   $0x10cff0,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10067f:	c7 45 ec f1 cf 10 00 	movl   $0x10cff1,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100686:	c7 45 e8 de f0 10 00 	movl   $0x10f0de,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10068d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100690:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100693:	76 0b                	jbe    1006a0 <debuginfo_eip+0x73>
  100695:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100698:	48                   	dec    %eax
  100699:	0f b6 00             	movzbl (%eax),%eax
  10069c:	84 c0                	test   %al,%al
  10069e:	74 0a                	je     1006aa <debuginfo_eip+0x7d>
        return -1;
  1006a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006a5:	e9 ab 02 00 00       	jmp    100955 <debuginfo_eip+0x328>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  1006aa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1006b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006b4:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1006b7:	c1 f8 02             	sar    $0x2,%eax
  1006ba:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1006c0:	48                   	dec    %eax
  1006c1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1006c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1006c7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006cb:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1006d2:	00 
  1006d3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1006d6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006da:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1006dd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006e4:	89 04 24             	mov    %eax,(%esp)
  1006e7:	e8 ef fd ff ff       	call   1004db <stab_binsearch>
    if (lfile == 0)
  1006ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006ef:	85 c0                	test   %eax,%eax
  1006f1:	75 0a                	jne    1006fd <debuginfo_eip+0xd0>
        return -1;
  1006f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006f8:	e9 58 02 00 00       	jmp    100955 <debuginfo_eip+0x328>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100700:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100703:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100706:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  100709:	8b 45 08             	mov    0x8(%ebp),%eax
  10070c:	89 44 24 10          	mov    %eax,0x10(%esp)
  100710:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100717:	00 
  100718:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10071b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10071f:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100722:	89 44 24 04          	mov    %eax,0x4(%esp)
  100726:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100729:	89 04 24             	mov    %eax,(%esp)
  10072c:	e8 aa fd ff ff       	call   1004db <stab_binsearch>

    if (lfun <= rfun) {
  100731:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100734:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100737:	39 c2                	cmp    %eax,%edx
  100739:	7f 78                	jg     1007b3 <debuginfo_eip+0x186>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10073b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10073e:	89 c2                	mov    %eax,%edx
  100740:	89 d0                	mov    %edx,%eax
  100742:	01 c0                	add    %eax,%eax
  100744:	01 d0                	add    %edx,%eax
  100746:	c1 e0 02             	shl    $0x2,%eax
  100749:	89 c2                	mov    %eax,%edx
  10074b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10074e:	01 d0                	add    %edx,%eax
  100750:	8b 10                	mov    (%eax),%edx
  100752:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100755:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100758:	39 c2                	cmp    %eax,%edx
  10075a:	73 22                	jae    10077e <debuginfo_eip+0x151>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10075c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10075f:	89 c2                	mov    %eax,%edx
  100761:	89 d0                	mov    %edx,%eax
  100763:	01 c0                	add    %eax,%eax
  100765:	01 d0                	add    %edx,%eax
  100767:	c1 e0 02             	shl    $0x2,%eax
  10076a:	89 c2                	mov    %eax,%edx
  10076c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10076f:	01 d0                	add    %edx,%eax
  100771:	8b 10                	mov    (%eax),%edx
  100773:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100776:	01 c2                	add    %eax,%edx
  100778:	8b 45 0c             	mov    0xc(%ebp),%eax
  10077b:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10077e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100781:	89 c2                	mov    %eax,%edx
  100783:	89 d0                	mov    %edx,%eax
  100785:	01 c0                	add    %eax,%eax
  100787:	01 d0                	add    %edx,%eax
  100789:	c1 e0 02             	shl    $0x2,%eax
  10078c:	89 c2                	mov    %eax,%edx
  10078e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100791:	01 d0                	add    %edx,%eax
  100793:	8b 50 08             	mov    0x8(%eax),%edx
  100796:	8b 45 0c             	mov    0xc(%ebp),%eax
  100799:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10079c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10079f:	8b 40 10             	mov    0x10(%eax),%eax
  1007a2:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  1007a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007a8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  1007ab:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007ae:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1007b1:	eb 15                	jmp    1007c8 <debuginfo_eip+0x19b>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1007b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007b6:	8b 55 08             	mov    0x8(%ebp),%edx
  1007b9:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1007bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007bf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1007c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007c5:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1007c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007cb:	8b 40 08             	mov    0x8(%eax),%eax
  1007ce:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1007d5:	00 
  1007d6:	89 04 24             	mov    %eax,(%esp)
  1007d9:	e8 d9 25 00 00       	call   102db7 <strfind>
  1007de:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007e1:	8b 52 08             	mov    0x8(%edx),%edx
  1007e4:	29 d0                	sub    %edx,%eax
  1007e6:	89 c2                	mov    %eax,%edx
  1007e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007eb:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1007f1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007f5:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007fc:	00 
  1007fd:	8d 45 d0             	lea    -0x30(%ebp),%eax
  100800:	89 44 24 08          	mov    %eax,0x8(%esp)
  100804:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  100807:	89 44 24 04          	mov    %eax,0x4(%esp)
  10080b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10080e:	89 04 24             	mov    %eax,(%esp)
  100811:	e8 c5 fc ff ff       	call   1004db <stab_binsearch>
    if (lline <= rline) {
  100816:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100819:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10081c:	39 c2                	cmp    %eax,%edx
  10081e:	7f 23                	jg     100843 <debuginfo_eip+0x216>
        info->eip_line = stabs[rline].n_desc;
  100820:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100823:	89 c2                	mov    %eax,%edx
  100825:	89 d0                	mov    %edx,%eax
  100827:	01 c0                	add    %eax,%eax
  100829:	01 d0                	add    %edx,%eax
  10082b:	c1 e0 02             	shl    $0x2,%eax
  10082e:	89 c2                	mov    %eax,%edx
  100830:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100833:	01 d0                	add    %edx,%eax
  100835:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100839:	89 c2                	mov    %eax,%edx
  10083b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10083e:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100841:	eb 11                	jmp    100854 <debuginfo_eip+0x227>
        return -1;
  100843:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100848:	e9 08 01 00 00       	jmp    100955 <debuginfo_eip+0x328>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  10084d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100850:	48                   	dec    %eax
  100851:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100854:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100857:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10085a:	39 c2                	cmp    %eax,%edx
  10085c:	7c 56                	jl     1008b4 <debuginfo_eip+0x287>
           && stabs[lline].n_type != N_SOL
  10085e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100861:	89 c2                	mov    %eax,%edx
  100863:	89 d0                	mov    %edx,%eax
  100865:	01 c0                	add    %eax,%eax
  100867:	01 d0                	add    %edx,%eax
  100869:	c1 e0 02             	shl    $0x2,%eax
  10086c:	89 c2                	mov    %eax,%edx
  10086e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100871:	01 d0                	add    %edx,%eax
  100873:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100877:	3c 84                	cmp    $0x84,%al
  100879:	74 39                	je     1008b4 <debuginfo_eip+0x287>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10087b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10087e:	89 c2                	mov    %eax,%edx
  100880:	89 d0                	mov    %edx,%eax
  100882:	01 c0                	add    %eax,%eax
  100884:	01 d0                	add    %edx,%eax
  100886:	c1 e0 02             	shl    $0x2,%eax
  100889:	89 c2                	mov    %eax,%edx
  10088b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10088e:	01 d0                	add    %edx,%eax
  100890:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100894:	3c 64                	cmp    $0x64,%al
  100896:	75 b5                	jne    10084d <debuginfo_eip+0x220>
  100898:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10089b:	89 c2                	mov    %eax,%edx
  10089d:	89 d0                	mov    %edx,%eax
  10089f:	01 c0                	add    %eax,%eax
  1008a1:	01 d0                	add    %edx,%eax
  1008a3:	c1 e0 02             	shl    $0x2,%eax
  1008a6:	89 c2                	mov    %eax,%edx
  1008a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008ab:	01 d0                	add    %edx,%eax
  1008ad:	8b 40 08             	mov    0x8(%eax),%eax
  1008b0:	85 c0                	test   %eax,%eax
  1008b2:	74 99                	je     10084d <debuginfo_eip+0x220>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1008b4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1008ba:	39 c2                	cmp    %eax,%edx
  1008bc:	7c 42                	jl     100900 <debuginfo_eip+0x2d3>
  1008be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008c1:	89 c2                	mov    %eax,%edx
  1008c3:	89 d0                	mov    %edx,%eax
  1008c5:	01 c0                	add    %eax,%eax
  1008c7:	01 d0                	add    %edx,%eax
  1008c9:	c1 e0 02             	shl    $0x2,%eax
  1008cc:	89 c2                	mov    %eax,%edx
  1008ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008d1:	01 d0                	add    %edx,%eax
  1008d3:	8b 10                	mov    (%eax),%edx
  1008d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008d8:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1008db:	39 c2                	cmp    %eax,%edx
  1008dd:	73 21                	jae    100900 <debuginfo_eip+0x2d3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1008df:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008e2:	89 c2                	mov    %eax,%edx
  1008e4:	89 d0                	mov    %edx,%eax
  1008e6:	01 c0                	add    %eax,%eax
  1008e8:	01 d0                	add    %edx,%eax
  1008ea:	c1 e0 02             	shl    $0x2,%eax
  1008ed:	89 c2                	mov    %eax,%edx
  1008ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008f2:	01 d0                	add    %edx,%eax
  1008f4:	8b 10                	mov    (%eax),%edx
  1008f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008f9:	01 c2                	add    %eax,%edx
  1008fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008fe:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  100900:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100903:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100906:	39 c2                	cmp    %eax,%edx
  100908:	7d 46                	jge    100950 <debuginfo_eip+0x323>
        for (lline = lfun + 1;
  10090a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10090d:	40                   	inc    %eax
  10090e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100911:	eb 16                	jmp    100929 <debuginfo_eip+0x2fc>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100913:	8b 45 0c             	mov    0xc(%ebp),%eax
  100916:	8b 40 14             	mov    0x14(%eax),%eax
  100919:	8d 50 01             	lea    0x1(%eax),%edx
  10091c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10091f:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100922:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100925:	40                   	inc    %eax
  100926:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100929:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10092c:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  10092f:	39 c2                	cmp    %eax,%edx
  100931:	7d 1d                	jge    100950 <debuginfo_eip+0x323>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100933:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100936:	89 c2                	mov    %eax,%edx
  100938:	89 d0                	mov    %edx,%eax
  10093a:	01 c0                	add    %eax,%eax
  10093c:	01 d0                	add    %edx,%eax
  10093e:	c1 e0 02             	shl    $0x2,%eax
  100941:	89 c2                	mov    %eax,%edx
  100943:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100946:	01 d0                	add    %edx,%eax
  100948:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10094c:	3c a0                	cmp    $0xa0,%al
  10094e:	74 c3                	je     100913 <debuginfo_eip+0x2e6>
        }
    }
    return 0;
  100950:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100955:	c9                   	leave  
  100956:	c3                   	ret    

00100957 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100957:	f3 0f 1e fb          	endbr32 
  10095b:	55                   	push   %ebp
  10095c:	89 e5                	mov    %esp,%ebp
  10095e:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100961:	c7 04 24 82 38 10 00 	movl   $0x103882,(%esp)
  100968:	e8 27 f9 ff ff       	call   100294 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10096d:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100974:	00 
  100975:	c7 04 24 9b 38 10 00 	movl   $0x10389b,(%esp)
  10097c:	e8 13 f9 ff ff       	call   100294 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100981:	c7 44 24 04 67 37 10 	movl   $0x103767,0x4(%esp)
  100988:	00 
  100989:	c7 04 24 b3 38 10 00 	movl   $0x1038b3,(%esp)
  100990:	e8 ff f8 ff ff       	call   100294 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100995:	c7 44 24 04 16 0a 11 	movl   $0x110a16,0x4(%esp)
  10099c:	00 
  10099d:	c7 04 24 cb 38 10 00 	movl   $0x1038cb,(%esp)
  1009a4:	e8 eb f8 ff ff       	call   100294 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  1009a9:	c7 44 24 04 20 1d 11 	movl   $0x111d20,0x4(%esp)
  1009b0:	00 
  1009b1:	c7 04 24 e3 38 10 00 	movl   $0x1038e3,(%esp)
  1009b8:	e8 d7 f8 ff ff       	call   100294 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1009bd:	b8 20 1d 11 00       	mov    $0x111d20,%eax
  1009c2:	2d 00 00 10 00       	sub    $0x100000,%eax
  1009c7:	05 ff 03 00 00       	add    $0x3ff,%eax
  1009cc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1009d2:	85 c0                	test   %eax,%eax
  1009d4:	0f 48 c2             	cmovs  %edx,%eax
  1009d7:	c1 f8 0a             	sar    $0xa,%eax
  1009da:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009de:	c7 04 24 fc 38 10 00 	movl   $0x1038fc,(%esp)
  1009e5:	e8 aa f8 ff ff       	call   100294 <cprintf>
}
  1009ea:	90                   	nop
  1009eb:	c9                   	leave  
  1009ec:	c3                   	ret    

001009ed <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009ed:	f3 0f 1e fb          	endbr32 
  1009f1:	55                   	push   %ebp
  1009f2:	89 e5                	mov    %esp,%ebp
  1009f4:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009fa:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a01:	8b 45 08             	mov    0x8(%ebp),%eax
  100a04:	89 04 24             	mov    %eax,(%esp)
  100a07:	e8 21 fc ff ff       	call   10062d <debuginfo_eip>
  100a0c:	85 c0                	test   %eax,%eax
  100a0e:	74 15                	je     100a25 <print_debuginfo+0x38>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100a10:	8b 45 08             	mov    0x8(%ebp),%eax
  100a13:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a17:	c7 04 24 26 39 10 00 	movl   $0x103926,(%esp)
  100a1e:	e8 71 f8 ff ff       	call   100294 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100a23:	eb 6c                	jmp    100a91 <print_debuginfo+0xa4>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a25:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a2c:	eb 1b                	jmp    100a49 <print_debuginfo+0x5c>
            fnname[j] = info.eip_fn_name[j];
  100a2e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100a31:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a34:	01 d0                	add    %edx,%eax
  100a36:	0f b6 10             	movzbl (%eax),%edx
  100a39:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a42:	01 c8                	add    %ecx,%eax
  100a44:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a46:	ff 45 f4             	incl   -0xc(%ebp)
  100a49:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a4c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a4f:	7c dd                	jl     100a2e <print_debuginfo+0x41>
        fnname[j] = '\0';
  100a51:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a5a:	01 d0                	add    %edx,%eax
  100a5c:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a5f:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a62:	8b 55 08             	mov    0x8(%ebp),%edx
  100a65:	89 d1                	mov    %edx,%ecx
  100a67:	29 c1                	sub    %eax,%ecx
  100a69:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a6c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a6f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a73:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a79:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a7d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a81:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a85:	c7 04 24 42 39 10 00 	movl   $0x103942,(%esp)
  100a8c:	e8 03 f8 ff ff       	call   100294 <cprintf>
}
  100a91:	90                   	nop
  100a92:	c9                   	leave  
  100a93:	c3                   	ret    

00100a94 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a94:	f3 0f 1e fb          	endbr32 
  100a98:	55                   	push   %ebp
  100a99:	89 e5                	mov    %esp,%ebp
  100a9b:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a9e:	8b 45 04             	mov    0x4(%ebp),%eax
  100aa1:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100aa4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100aa7:	c9                   	leave  
  100aa8:	c3                   	ret    

00100aa9 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100aa9:	f3 0f 1e fb          	endbr32 
  100aad:	55                   	push   %ebp
  100aae:	89 e5                	mov    %esp,%ebp
  100ab0:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100ab3:	89 e8                	mov    %ebp,%eax
  100ab5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100ab8:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
      uint32_t ebp=read_ebp();
  100abb:	89 45 f4             	mov    %eax,-0xc(%ebp)
      uint32_t eip=read_eip();
  100abe:	e8 d1 ff ff ff       	call   100a94 <read_eip>
  100ac3:	89 45 f0             	mov    %eax,-0x10(%ebp)
      for(int i=0;i<STACKFRAME_DEPTH&&ebp!=0;i++)
  100ac6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100acd:	e9 84 00 00 00       	jmp    100b56 <print_stackframe+0xad>
      {
        cprintf("ebp:0x%08x eip:0x%08x ",ebp,eip);//printf value of ebp, eip
  100ad2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ad5:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ad9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100adc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ae0:	c7 04 24 54 39 10 00 	movl   $0x103954,(%esp)
  100ae7:	e8 a8 f7 ff ff       	call   100294 <cprintf>
        uint32_t* callarg =(uint32_t*) ebp+2;
  100aec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aef:	83 c0 08             	add    $0x8,%eax
  100af2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for(int j=0;j<4;j++)
  100af5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100afc:	eb 24                	jmp    100b22 <print_stackframe+0x79>
        {
            cprintf("callarg:0x%08x",callarg[j]);
  100afe:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100b01:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b08:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100b0b:	01 d0                	add    %edx,%eax
  100b0d:	8b 00                	mov    (%eax),%eax
  100b0f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b13:	c7 04 24 6b 39 10 00 	movl   $0x10396b,(%esp)
  100b1a:	e8 75 f7 ff ff       	call   100294 <cprintf>
        for(int j=0;j<4;j++)
  100b1f:	ff 45 e8             	incl   -0x18(%ebp)
  100b22:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100b26:	7e d6                	jle    100afe <print_stackframe+0x55>
        }
        cprintf("\n");
  100b28:	c7 04 24 7a 39 10 00 	movl   $0x10397a,(%esp)
  100b2f:	e8 60 f7 ff ff       	call   100294 <cprintf>
        print_debuginfo(eip-1);
  100b34:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b37:	48                   	dec    %eax
  100b38:	89 04 24             	mov    %eax,(%esp)
  100b3b:	e8 ad fe ff ff       	call   1009ed <print_debuginfo>
        eip=((uint32_t *)ebp)[1];//eip指向返回地址
  100b40:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b43:	83 c0 04             	add    $0x4,%eax
  100b46:	8b 00                	mov    (%eax),%eax
  100b48:	89 45 f0             	mov    %eax,-0x10(%ebp)
		ebp=((uint32_t *)ebp)[0];//ebp指向原ebp的位置
  100b4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b4e:	8b 00                	mov    (%eax),%eax
  100b50:	89 45 f4             	mov    %eax,-0xc(%ebp)
      for(int i=0;i<STACKFRAME_DEPTH&&ebp!=0;i++)
  100b53:	ff 45 ec             	incl   -0x14(%ebp)
  100b56:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b5a:	7f 0a                	jg     100b66 <print_stackframe+0xbd>
  100b5c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b60:	0f 85 6c ff ff ff    	jne    100ad2 <print_stackframe+0x29>
      }
}
  100b66:	90                   	nop
  100b67:	c9                   	leave  
  100b68:	c3                   	ret    

00100b69 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b69:	f3 0f 1e fb          	endbr32 
  100b6d:	55                   	push   %ebp
  100b6e:	89 e5                	mov    %esp,%ebp
  100b70:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b73:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b7a:	eb 0c                	jmp    100b88 <parse+0x1f>
            *buf ++ = '\0';
  100b7c:	8b 45 08             	mov    0x8(%ebp),%eax
  100b7f:	8d 50 01             	lea    0x1(%eax),%edx
  100b82:	89 55 08             	mov    %edx,0x8(%ebp)
  100b85:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b88:	8b 45 08             	mov    0x8(%ebp),%eax
  100b8b:	0f b6 00             	movzbl (%eax),%eax
  100b8e:	84 c0                	test   %al,%al
  100b90:	74 1d                	je     100baf <parse+0x46>
  100b92:	8b 45 08             	mov    0x8(%ebp),%eax
  100b95:	0f b6 00             	movzbl (%eax),%eax
  100b98:	0f be c0             	movsbl %al,%eax
  100b9b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b9f:	c7 04 24 fc 39 10 00 	movl   $0x1039fc,(%esp)
  100ba6:	e8 d6 21 00 00       	call   102d81 <strchr>
  100bab:	85 c0                	test   %eax,%eax
  100bad:	75 cd                	jne    100b7c <parse+0x13>
        }
        if (*buf == '\0') {
  100baf:	8b 45 08             	mov    0x8(%ebp),%eax
  100bb2:	0f b6 00             	movzbl (%eax),%eax
  100bb5:	84 c0                	test   %al,%al
  100bb7:	74 65                	je     100c1e <parse+0xb5>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100bb9:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100bbd:	75 14                	jne    100bd3 <parse+0x6a>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100bbf:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100bc6:	00 
  100bc7:	c7 04 24 01 3a 10 00 	movl   $0x103a01,(%esp)
  100bce:	e8 c1 f6 ff ff       	call   100294 <cprintf>
        }
        argv[argc ++] = buf;
  100bd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bd6:	8d 50 01             	lea    0x1(%eax),%edx
  100bd9:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100bdc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100be3:	8b 45 0c             	mov    0xc(%ebp),%eax
  100be6:	01 c2                	add    %eax,%edx
  100be8:	8b 45 08             	mov    0x8(%ebp),%eax
  100beb:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bed:	eb 03                	jmp    100bf2 <parse+0x89>
            buf ++;
  100bef:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bf2:	8b 45 08             	mov    0x8(%ebp),%eax
  100bf5:	0f b6 00             	movzbl (%eax),%eax
  100bf8:	84 c0                	test   %al,%al
  100bfa:	74 8c                	je     100b88 <parse+0x1f>
  100bfc:	8b 45 08             	mov    0x8(%ebp),%eax
  100bff:	0f b6 00             	movzbl (%eax),%eax
  100c02:	0f be c0             	movsbl %al,%eax
  100c05:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c09:	c7 04 24 fc 39 10 00 	movl   $0x1039fc,(%esp)
  100c10:	e8 6c 21 00 00       	call   102d81 <strchr>
  100c15:	85 c0                	test   %eax,%eax
  100c17:	74 d6                	je     100bef <parse+0x86>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100c19:	e9 6a ff ff ff       	jmp    100b88 <parse+0x1f>
            break;
  100c1e:	90                   	nop
        }
    }
    return argc;
  100c1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100c22:	c9                   	leave  
  100c23:	c3                   	ret    

00100c24 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100c24:	f3 0f 1e fb          	endbr32 
  100c28:	55                   	push   %ebp
  100c29:	89 e5                	mov    %esp,%ebp
  100c2b:	53                   	push   %ebx
  100c2c:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100c2f:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c32:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c36:	8b 45 08             	mov    0x8(%ebp),%eax
  100c39:	89 04 24             	mov    %eax,(%esp)
  100c3c:	e8 28 ff ff ff       	call   100b69 <parse>
  100c41:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100c44:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c48:	75 0a                	jne    100c54 <runcmd+0x30>
        return 0;
  100c4a:	b8 00 00 00 00       	mov    $0x0,%eax
  100c4f:	e9 83 00 00 00       	jmp    100cd7 <runcmd+0xb3>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c54:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c5b:	eb 5a                	jmp    100cb7 <runcmd+0x93>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c5d:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c60:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c63:	89 d0                	mov    %edx,%eax
  100c65:	01 c0                	add    %eax,%eax
  100c67:	01 d0                	add    %edx,%eax
  100c69:	c1 e0 02             	shl    $0x2,%eax
  100c6c:	05 00 00 11 00       	add    $0x110000,%eax
  100c71:	8b 00                	mov    (%eax),%eax
  100c73:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c77:	89 04 24             	mov    %eax,(%esp)
  100c7a:	e8 5e 20 00 00       	call   102cdd <strcmp>
  100c7f:	85 c0                	test   %eax,%eax
  100c81:	75 31                	jne    100cb4 <runcmd+0x90>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c83:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c86:	89 d0                	mov    %edx,%eax
  100c88:	01 c0                	add    %eax,%eax
  100c8a:	01 d0                	add    %edx,%eax
  100c8c:	c1 e0 02             	shl    $0x2,%eax
  100c8f:	05 08 00 11 00       	add    $0x110008,%eax
  100c94:	8b 10                	mov    (%eax),%edx
  100c96:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c99:	83 c0 04             	add    $0x4,%eax
  100c9c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c9f:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100ca2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100ca5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100ca9:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cad:	89 1c 24             	mov    %ebx,(%esp)
  100cb0:	ff d2                	call   *%edx
  100cb2:	eb 23                	jmp    100cd7 <runcmd+0xb3>
    for (i = 0; i < NCOMMANDS; i ++) {
  100cb4:	ff 45 f4             	incl   -0xc(%ebp)
  100cb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cba:	83 f8 02             	cmp    $0x2,%eax
  100cbd:	76 9e                	jbe    100c5d <runcmd+0x39>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100cbf:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100cc2:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cc6:	c7 04 24 1f 3a 10 00 	movl   $0x103a1f,(%esp)
  100ccd:	e8 c2 f5 ff ff       	call   100294 <cprintf>
    return 0;
  100cd2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cd7:	83 c4 64             	add    $0x64,%esp
  100cda:	5b                   	pop    %ebx
  100cdb:	5d                   	pop    %ebp
  100cdc:	c3                   	ret    

00100cdd <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100cdd:	f3 0f 1e fb          	endbr32 
  100ce1:	55                   	push   %ebp
  100ce2:	89 e5                	mov    %esp,%ebp
  100ce4:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100ce7:	c7 04 24 38 3a 10 00 	movl   $0x103a38,(%esp)
  100cee:	e8 a1 f5 ff ff       	call   100294 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100cf3:	c7 04 24 60 3a 10 00 	movl   $0x103a60,(%esp)
  100cfa:	e8 95 f5 ff ff       	call   100294 <cprintf>

    if (tf != NULL) {
  100cff:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100d03:	74 0b                	je     100d10 <kmonitor+0x33>
        print_trapframe(tf);
  100d05:	8b 45 08             	mov    0x8(%ebp),%eax
  100d08:	89 04 24             	mov    %eax,(%esp)
  100d0b:	e8 fb 0d 00 00       	call   101b0b <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100d10:	c7 04 24 85 3a 10 00 	movl   $0x103a85,(%esp)
  100d17:	e8 2b f6 ff ff       	call   100347 <readline>
  100d1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d1f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d23:	74 eb                	je     100d10 <kmonitor+0x33>
            if (runcmd(buf, tf) < 0) {
  100d25:	8b 45 08             	mov    0x8(%ebp),%eax
  100d28:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d2f:	89 04 24             	mov    %eax,(%esp)
  100d32:	e8 ed fe ff ff       	call   100c24 <runcmd>
  100d37:	85 c0                	test   %eax,%eax
  100d39:	78 02                	js     100d3d <kmonitor+0x60>
        if ((buf = readline("K> ")) != NULL) {
  100d3b:	eb d3                	jmp    100d10 <kmonitor+0x33>
                break;
  100d3d:	90                   	nop
            }
        }
    }
}
  100d3e:	90                   	nop
  100d3f:	c9                   	leave  
  100d40:	c3                   	ret    

00100d41 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100d41:	f3 0f 1e fb          	endbr32 
  100d45:	55                   	push   %ebp
  100d46:	89 e5                	mov    %esp,%ebp
  100d48:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100d52:	eb 3d                	jmp    100d91 <mon_help+0x50>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100d54:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d57:	89 d0                	mov    %edx,%eax
  100d59:	01 c0                	add    %eax,%eax
  100d5b:	01 d0                	add    %edx,%eax
  100d5d:	c1 e0 02             	shl    $0x2,%eax
  100d60:	05 04 00 11 00       	add    $0x110004,%eax
  100d65:	8b 08                	mov    (%eax),%ecx
  100d67:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d6a:	89 d0                	mov    %edx,%eax
  100d6c:	01 c0                	add    %eax,%eax
  100d6e:	01 d0                	add    %edx,%eax
  100d70:	c1 e0 02             	shl    $0x2,%eax
  100d73:	05 00 00 11 00       	add    $0x110000,%eax
  100d78:	8b 00                	mov    (%eax),%eax
  100d7a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d7e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d82:	c7 04 24 89 3a 10 00 	movl   $0x103a89,(%esp)
  100d89:	e8 06 f5 ff ff       	call   100294 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d8e:	ff 45 f4             	incl   -0xc(%ebp)
  100d91:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d94:	83 f8 02             	cmp    $0x2,%eax
  100d97:	76 bb                	jbe    100d54 <mon_help+0x13>
    }
    return 0;
  100d99:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d9e:	c9                   	leave  
  100d9f:	c3                   	ret    

00100da0 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100da0:	f3 0f 1e fb          	endbr32 
  100da4:	55                   	push   %ebp
  100da5:	89 e5                	mov    %esp,%ebp
  100da7:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100daa:	e8 a8 fb ff ff       	call   100957 <print_kerninfo>
    return 0;
  100daf:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100db4:	c9                   	leave  
  100db5:	c3                   	ret    

00100db6 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100db6:	f3 0f 1e fb          	endbr32 
  100dba:	55                   	push   %ebp
  100dbb:	89 e5                	mov    %esp,%ebp
  100dbd:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100dc0:	e8 e4 fc ff ff       	call   100aa9 <print_stackframe>
    return 0;
  100dc5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100dca:	c9                   	leave  
  100dcb:	c3                   	ret    

00100dcc <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100dcc:	f3 0f 1e fb          	endbr32 
  100dd0:	55                   	push   %ebp
  100dd1:	89 e5                	mov    %esp,%ebp
  100dd3:	83 ec 28             	sub    $0x28,%esp
  100dd6:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100ddc:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100de0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100de4:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100de8:	ee                   	out    %al,(%dx)
}
  100de9:	90                   	nop
  100dea:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100df0:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100df4:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100df8:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100dfc:	ee                   	out    %al,(%dx)
}
  100dfd:	90                   	nop
  100dfe:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100e04:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e08:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100e0c:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100e10:	ee                   	out    %al,(%dx)
}
  100e11:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100e12:	c7 05 08 19 11 00 00 	movl   $0x0,0x111908
  100e19:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100e1c:	c7 04 24 92 3a 10 00 	movl   $0x103a92,(%esp)
  100e23:	e8 6c f4 ff ff       	call   100294 <cprintf>
    pic_enable(IRQ_TIMER);
  100e28:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100e2f:	e8 31 09 00 00       	call   101765 <pic_enable>
}
  100e34:	90                   	nop
  100e35:	c9                   	leave  
  100e36:	c3                   	ret    

00100e37 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100e37:	f3 0f 1e fb          	endbr32 
  100e3b:	55                   	push   %ebp
  100e3c:	89 e5                	mov    %esp,%ebp
  100e3e:	83 ec 10             	sub    $0x10,%esp
  100e41:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e47:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e4b:	89 c2                	mov    %eax,%edx
  100e4d:	ec                   	in     (%dx),%al
  100e4e:	88 45 f1             	mov    %al,-0xf(%ebp)
  100e51:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e57:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e5b:	89 c2                	mov    %eax,%edx
  100e5d:	ec                   	in     (%dx),%al
  100e5e:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e61:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e67:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e6b:	89 c2                	mov    %eax,%edx
  100e6d:	ec                   	in     (%dx),%al
  100e6e:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e71:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e77:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e7b:	89 c2                	mov    %eax,%edx
  100e7d:	ec                   	in     (%dx),%al
  100e7e:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e81:	90                   	nop
  100e82:	c9                   	leave  
  100e83:	c3                   	ret    

00100e84 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e84:	f3 0f 1e fb          	endbr32 
  100e88:	55                   	push   %ebp
  100e89:	89 e5                	mov    %esp,%ebp
  100e8b:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e8e:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e95:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e98:	0f b7 00             	movzwl (%eax),%eax
  100e9b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e9f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ea2:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100ea7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100eaa:	0f b7 00             	movzwl (%eax),%eax
  100ead:	0f b7 c0             	movzwl %ax,%eax
  100eb0:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100eb5:	74 12                	je     100ec9 <cga_init+0x45>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100eb7:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100ebe:	66 c7 05 66 0e 11 00 	movw   $0x3b4,0x110e66
  100ec5:	b4 03 
  100ec7:	eb 13                	jmp    100edc <cga_init+0x58>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100ec9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ecc:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100ed0:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100ed3:	66 c7 05 66 0e 11 00 	movw   $0x3d4,0x110e66
  100eda:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100edc:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  100ee3:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100ee7:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eeb:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100eef:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ef3:	ee                   	out    %al,(%dx)
}
  100ef4:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100ef5:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  100efc:	40                   	inc    %eax
  100efd:	0f b7 c0             	movzwl %ax,%eax
  100f00:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f04:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100f08:	89 c2                	mov    %eax,%edx
  100f0a:	ec                   	in     (%dx),%al
  100f0b:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100f0e:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f12:	0f b6 c0             	movzbl %al,%eax
  100f15:	c1 e0 08             	shl    $0x8,%eax
  100f18:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100f1b:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  100f22:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100f26:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f2a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f2e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f32:	ee                   	out    %al,(%dx)
}
  100f33:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100f34:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  100f3b:	40                   	inc    %eax
  100f3c:	0f b7 c0             	movzwl %ax,%eax
  100f3f:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f43:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f47:	89 c2                	mov    %eax,%edx
  100f49:	ec                   	in     (%dx),%al
  100f4a:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100f4d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f51:	0f b6 c0             	movzbl %al,%eax
  100f54:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100f57:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f5a:	a3 60 0e 11 00       	mov    %eax,0x110e60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100f5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f62:	0f b7 c0             	movzwl %ax,%eax
  100f65:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
}
  100f6b:	90                   	nop
  100f6c:	c9                   	leave  
  100f6d:	c3                   	ret    

00100f6e <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f6e:	f3 0f 1e fb          	endbr32 
  100f72:	55                   	push   %ebp
  100f73:	89 e5                	mov    %esp,%ebp
  100f75:	83 ec 48             	sub    $0x48,%esp
  100f78:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f7e:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f82:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f86:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f8a:	ee                   	out    %al,(%dx)
}
  100f8b:	90                   	nop
  100f8c:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f92:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f96:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f9a:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f9e:	ee                   	out    %al,(%dx)
}
  100f9f:	90                   	nop
  100fa0:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100fa6:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100faa:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100fae:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100fb2:	ee                   	out    %al,(%dx)
}
  100fb3:	90                   	nop
  100fb4:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100fba:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fbe:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100fc2:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100fc6:	ee                   	out    %al,(%dx)
}
  100fc7:	90                   	nop
  100fc8:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100fce:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fd2:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100fd6:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100fda:	ee                   	out    %al,(%dx)
}
  100fdb:	90                   	nop
  100fdc:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100fe2:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fe6:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100fea:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100fee:	ee                   	out    %al,(%dx)
}
  100fef:	90                   	nop
  100ff0:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100ff6:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ffa:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ffe:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101002:	ee                   	out    %al,(%dx)
}
  101003:	90                   	nop
  101004:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10100a:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  10100e:	89 c2                	mov    %eax,%edx
  101010:	ec                   	in     (%dx),%al
  101011:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  101014:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  101018:	3c ff                	cmp    $0xff,%al
  10101a:	0f 95 c0             	setne  %al
  10101d:	0f b6 c0             	movzbl %al,%eax
  101020:	a3 68 0e 11 00       	mov    %eax,0x110e68
  101025:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10102b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10102f:	89 c2                	mov    %eax,%edx
  101031:	ec                   	in     (%dx),%al
  101032:	88 45 f1             	mov    %al,-0xf(%ebp)
  101035:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10103b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10103f:	89 c2                	mov    %eax,%edx
  101041:	ec                   	in     (%dx),%al
  101042:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101045:	a1 68 0e 11 00       	mov    0x110e68,%eax
  10104a:	85 c0                	test   %eax,%eax
  10104c:	74 0c                	je     10105a <serial_init+0xec>
        pic_enable(IRQ_COM1);
  10104e:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101055:	e8 0b 07 00 00       	call   101765 <pic_enable>
    }
}
  10105a:	90                   	nop
  10105b:	c9                   	leave  
  10105c:	c3                   	ret    

0010105d <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  10105d:	f3 0f 1e fb          	endbr32 
  101061:	55                   	push   %ebp
  101062:	89 e5                	mov    %esp,%ebp
  101064:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101067:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10106e:	eb 08                	jmp    101078 <lpt_putc_sub+0x1b>
        delay();
  101070:	e8 c2 fd ff ff       	call   100e37 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101075:	ff 45 fc             	incl   -0x4(%ebp)
  101078:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  10107e:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101082:	89 c2                	mov    %eax,%edx
  101084:	ec                   	in     (%dx),%al
  101085:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101088:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10108c:	84 c0                	test   %al,%al
  10108e:	78 09                	js     101099 <lpt_putc_sub+0x3c>
  101090:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101097:	7e d7                	jle    101070 <lpt_putc_sub+0x13>
    }
    outb(LPTPORT + 0, c);
  101099:	8b 45 08             	mov    0x8(%ebp),%eax
  10109c:	0f b6 c0             	movzbl %al,%eax
  10109f:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  1010a5:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010a8:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1010ac:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1010b0:	ee                   	out    %al,(%dx)
}
  1010b1:	90                   	nop
  1010b2:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  1010b8:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010bc:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1010c0:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1010c4:	ee                   	out    %al,(%dx)
}
  1010c5:	90                   	nop
  1010c6:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  1010cc:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010d0:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1010d4:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1010d8:	ee                   	out    %al,(%dx)
}
  1010d9:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  1010da:	90                   	nop
  1010db:	c9                   	leave  
  1010dc:	c3                   	ret    

001010dd <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1010dd:	f3 0f 1e fb          	endbr32 
  1010e1:	55                   	push   %ebp
  1010e2:	89 e5                	mov    %esp,%ebp
  1010e4:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1010e7:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1010eb:	74 0d                	je     1010fa <lpt_putc+0x1d>
        lpt_putc_sub(c);
  1010ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f0:	89 04 24             	mov    %eax,(%esp)
  1010f3:	e8 65 ff ff ff       	call   10105d <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1010f8:	eb 24                	jmp    10111e <lpt_putc+0x41>
        lpt_putc_sub('\b');
  1010fa:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101101:	e8 57 ff ff ff       	call   10105d <lpt_putc_sub>
        lpt_putc_sub(' ');
  101106:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10110d:	e8 4b ff ff ff       	call   10105d <lpt_putc_sub>
        lpt_putc_sub('\b');
  101112:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101119:	e8 3f ff ff ff       	call   10105d <lpt_putc_sub>
}
  10111e:	90                   	nop
  10111f:	c9                   	leave  
  101120:	c3                   	ret    

00101121 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101121:	f3 0f 1e fb          	endbr32 
  101125:	55                   	push   %ebp
  101126:	89 e5                	mov    %esp,%ebp
  101128:	53                   	push   %ebx
  101129:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10112c:	8b 45 08             	mov    0x8(%ebp),%eax
  10112f:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101134:	85 c0                	test   %eax,%eax
  101136:	75 07                	jne    10113f <cga_putc+0x1e>
        c |= 0x0700;
  101138:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10113f:	8b 45 08             	mov    0x8(%ebp),%eax
  101142:	0f b6 c0             	movzbl %al,%eax
  101145:	83 f8 0d             	cmp    $0xd,%eax
  101148:	74 72                	je     1011bc <cga_putc+0x9b>
  10114a:	83 f8 0d             	cmp    $0xd,%eax
  10114d:	0f 8f a3 00 00 00    	jg     1011f6 <cga_putc+0xd5>
  101153:	83 f8 08             	cmp    $0x8,%eax
  101156:	74 0a                	je     101162 <cga_putc+0x41>
  101158:	83 f8 0a             	cmp    $0xa,%eax
  10115b:	74 4c                	je     1011a9 <cga_putc+0x88>
  10115d:	e9 94 00 00 00       	jmp    1011f6 <cga_putc+0xd5>
    case '\b':
        if (crt_pos > 0) {
  101162:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  101169:	85 c0                	test   %eax,%eax
  10116b:	0f 84 af 00 00 00    	je     101220 <cga_putc+0xff>
            crt_pos --;
  101171:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  101178:	48                   	dec    %eax
  101179:	0f b7 c0             	movzwl %ax,%eax
  10117c:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101182:	8b 45 08             	mov    0x8(%ebp),%eax
  101185:	98                   	cwtl   
  101186:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10118b:	98                   	cwtl   
  10118c:	83 c8 20             	or     $0x20,%eax
  10118f:	98                   	cwtl   
  101190:	8b 15 60 0e 11 00    	mov    0x110e60,%edx
  101196:	0f b7 0d 64 0e 11 00 	movzwl 0x110e64,%ecx
  10119d:	01 c9                	add    %ecx,%ecx
  10119f:	01 ca                	add    %ecx,%edx
  1011a1:	0f b7 c0             	movzwl %ax,%eax
  1011a4:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1011a7:	eb 77                	jmp    101220 <cga_putc+0xff>
    case '\n':
        crt_pos += CRT_COLS;
  1011a9:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  1011b0:	83 c0 50             	add    $0x50,%eax
  1011b3:	0f b7 c0             	movzwl %ax,%eax
  1011b6:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1011bc:	0f b7 1d 64 0e 11 00 	movzwl 0x110e64,%ebx
  1011c3:	0f b7 0d 64 0e 11 00 	movzwl 0x110e64,%ecx
  1011ca:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  1011cf:	89 c8                	mov    %ecx,%eax
  1011d1:	f7 e2                	mul    %edx
  1011d3:	c1 ea 06             	shr    $0x6,%edx
  1011d6:	89 d0                	mov    %edx,%eax
  1011d8:	c1 e0 02             	shl    $0x2,%eax
  1011db:	01 d0                	add    %edx,%eax
  1011dd:	c1 e0 04             	shl    $0x4,%eax
  1011e0:	29 c1                	sub    %eax,%ecx
  1011e2:	89 c8                	mov    %ecx,%eax
  1011e4:	0f b7 c0             	movzwl %ax,%eax
  1011e7:	29 c3                	sub    %eax,%ebx
  1011e9:	89 d8                	mov    %ebx,%eax
  1011eb:	0f b7 c0             	movzwl %ax,%eax
  1011ee:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
        break;
  1011f4:	eb 2b                	jmp    101221 <cga_putc+0x100>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1011f6:	8b 0d 60 0e 11 00    	mov    0x110e60,%ecx
  1011fc:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  101203:	8d 50 01             	lea    0x1(%eax),%edx
  101206:	0f b7 d2             	movzwl %dx,%edx
  101209:	66 89 15 64 0e 11 00 	mov    %dx,0x110e64
  101210:	01 c0                	add    %eax,%eax
  101212:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101215:	8b 45 08             	mov    0x8(%ebp),%eax
  101218:	0f b7 c0             	movzwl %ax,%eax
  10121b:	66 89 02             	mov    %ax,(%edx)
        break;
  10121e:	eb 01                	jmp    101221 <cga_putc+0x100>
        break;
  101220:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101221:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  101228:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  10122d:	76 5d                	jbe    10128c <cga_putc+0x16b>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10122f:	a1 60 0e 11 00       	mov    0x110e60,%eax
  101234:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10123a:	a1 60 0e 11 00       	mov    0x110e60,%eax
  10123f:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101246:	00 
  101247:	89 54 24 04          	mov    %edx,0x4(%esp)
  10124b:	89 04 24             	mov    %eax,(%esp)
  10124e:	e8 33 1d 00 00       	call   102f86 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101253:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  10125a:	eb 14                	jmp    101270 <cga_putc+0x14f>
            crt_buf[i] = 0x0700 | ' ';
  10125c:	a1 60 0e 11 00       	mov    0x110e60,%eax
  101261:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101264:	01 d2                	add    %edx,%edx
  101266:	01 d0                	add    %edx,%eax
  101268:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10126d:	ff 45 f4             	incl   -0xc(%ebp)
  101270:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101277:	7e e3                	jle    10125c <cga_putc+0x13b>
        }
        crt_pos -= CRT_COLS;
  101279:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  101280:	83 e8 50             	sub    $0x50,%eax
  101283:	0f b7 c0             	movzwl %ax,%eax
  101286:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10128c:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  101293:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101297:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10129b:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10129f:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1012a3:	ee                   	out    %al,(%dx)
}
  1012a4:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  1012a5:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  1012ac:	c1 e8 08             	shr    $0x8,%eax
  1012af:	0f b7 c0             	movzwl %ax,%eax
  1012b2:	0f b6 c0             	movzbl %al,%eax
  1012b5:	0f b7 15 66 0e 11 00 	movzwl 0x110e66,%edx
  1012bc:	42                   	inc    %edx
  1012bd:	0f b7 d2             	movzwl %dx,%edx
  1012c0:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012c4:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012c7:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1012cb:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012cf:	ee                   	out    %al,(%dx)
}
  1012d0:	90                   	nop
    outb(addr_6845, 15);
  1012d1:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  1012d8:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1012dc:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012e0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1012e4:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012e8:	ee                   	out    %al,(%dx)
}
  1012e9:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  1012ea:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  1012f1:	0f b6 c0             	movzbl %al,%eax
  1012f4:	0f b7 15 66 0e 11 00 	movzwl 0x110e66,%edx
  1012fb:	42                   	inc    %edx
  1012fc:	0f b7 d2             	movzwl %dx,%edx
  1012ff:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  101303:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101306:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10130a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10130e:	ee                   	out    %al,(%dx)
}
  10130f:	90                   	nop
}
  101310:	90                   	nop
  101311:	83 c4 34             	add    $0x34,%esp
  101314:	5b                   	pop    %ebx
  101315:	5d                   	pop    %ebp
  101316:	c3                   	ret    

00101317 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101317:	f3 0f 1e fb          	endbr32 
  10131b:	55                   	push   %ebp
  10131c:	89 e5                	mov    %esp,%ebp
  10131e:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101321:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101328:	eb 08                	jmp    101332 <serial_putc_sub+0x1b>
        delay();
  10132a:	e8 08 fb ff ff       	call   100e37 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10132f:	ff 45 fc             	incl   -0x4(%ebp)
  101332:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101338:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10133c:	89 c2                	mov    %eax,%edx
  10133e:	ec                   	in     (%dx),%al
  10133f:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101342:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101346:	0f b6 c0             	movzbl %al,%eax
  101349:	83 e0 20             	and    $0x20,%eax
  10134c:	85 c0                	test   %eax,%eax
  10134e:	75 09                	jne    101359 <serial_putc_sub+0x42>
  101350:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101357:	7e d1                	jle    10132a <serial_putc_sub+0x13>
    }
    outb(COM1 + COM_TX, c);
  101359:	8b 45 08             	mov    0x8(%ebp),%eax
  10135c:	0f b6 c0             	movzbl %al,%eax
  10135f:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101365:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101368:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10136c:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101370:	ee                   	out    %al,(%dx)
}
  101371:	90                   	nop
}
  101372:	90                   	nop
  101373:	c9                   	leave  
  101374:	c3                   	ret    

00101375 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101375:	f3 0f 1e fb          	endbr32 
  101379:	55                   	push   %ebp
  10137a:	89 e5                	mov    %esp,%ebp
  10137c:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10137f:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101383:	74 0d                	je     101392 <serial_putc+0x1d>
        serial_putc_sub(c);
  101385:	8b 45 08             	mov    0x8(%ebp),%eax
  101388:	89 04 24             	mov    %eax,(%esp)
  10138b:	e8 87 ff ff ff       	call   101317 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101390:	eb 24                	jmp    1013b6 <serial_putc+0x41>
        serial_putc_sub('\b');
  101392:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101399:	e8 79 ff ff ff       	call   101317 <serial_putc_sub>
        serial_putc_sub(' ');
  10139e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1013a5:	e8 6d ff ff ff       	call   101317 <serial_putc_sub>
        serial_putc_sub('\b');
  1013aa:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1013b1:	e8 61 ff ff ff       	call   101317 <serial_putc_sub>
}
  1013b6:	90                   	nop
  1013b7:	c9                   	leave  
  1013b8:	c3                   	ret    

001013b9 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1013b9:	f3 0f 1e fb          	endbr32 
  1013bd:	55                   	push   %ebp
  1013be:	89 e5                	mov    %esp,%ebp
  1013c0:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1013c3:	eb 33                	jmp    1013f8 <cons_intr+0x3f>
        if (c != 0) {
  1013c5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1013c9:	74 2d                	je     1013f8 <cons_intr+0x3f>
            cons.buf[cons.wpos ++] = c;
  1013cb:	a1 84 10 11 00       	mov    0x111084,%eax
  1013d0:	8d 50 01             	lea    0x1(%eax),%edx
  1013d3:	89 15 84 10 11 00    	mov    %edx,0x111084
  1013d9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013dc:	88 90 80 0e 11 00    	mov    %dl,0x110e80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1013e2:	a1 84 10 11 00       	mov    0x111084,%eax
  1013e7:	3d 00 02 00 00       	cmp    $0x200,%eax
  1013ec:	75 0a                	jne    1013f8 <cons_intr+0x3f>
                cons.wpos = 0;
  1013ee:	c7 05 84 10 11 00 00 	movl   $0x0,0x111084
  1013f5:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1013f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1013fb:	ff d0                	call   *%eax
  1013fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101400:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101404:	75 bf                	jne    1013c5 <cons_intr+0xc>
            }
        }
    }
}
  101406:	90                   	nop
  101407:	90                   	nop
  101408:	c9                   	leave  
  101409:	c3                   	ret    

0010140a <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10140a:	f3 0f 1e fb          	endbr32 
  10140e:	55                   	push   %ebp
  10140f:	89 e5                	mov    %esp,%ebp
  101411:	83 ec 10             	sub    $0x10,%esp
  101414:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10141a:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10141e:	89 c2                	mov    %eax,%edx
  101420:	ec                   	in     (%dx),%al
  101421:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101424:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101428:	0f b6 c0             	movzbl %al,%eax
  10142b:	83 e0 01             	and    $0x1,%eax
  10142e:	85 c0                	test   %eax,%eax
  101430:	75 07                	jne    101439 <serial_proc_data+0x2f>
        return -1;
  101432:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101437:	eb 2a                	jmp    101463 <serial_proc_data+0x59>
  101439:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10143f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101443:	89 c2                	mov    %eax,%edx
  101445:	ec                   	in     (%dx),%al
  101446:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101449:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10144d:	0f b6 c0             	movzbl %al,%eax
  101450:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101453:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101457:	75 07                	jne    101460 <serial_proc_data+0x56>
        c = '\b';
  101459:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101460:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101463:	c9                   	leave  
  101464:	c3                   	ret    

00101465 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101465:	f3 0f 1e fb          	endbr32 
  101469:	55                   	push   %ebp
  10146a:	89 e5                	mov    %esp,%ebp
  10146c:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10146f:	a1 68 0e 11 00       	mov    0x110e68,%eax
  101474:	85 c0                	test   %eax,%eax
  101476:	74 0c                	je     101484 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101478:	c7 04 24 0a 14 10 00 	movl   $0x10140a,(%esp)
  10147f:	e8 35 ff ff ff       	call   1013b9 <cons_intr>
    }
}
  101484:	90                   	nop
  101485:	c9                   	leave  
  101486:	c3                   	ret    

00101487 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101487:	f3 0f 1e fb          	endbr32 
  10148b:	55                   	push   %ebp
  10148c:	89 e5                	mov    %esp,%ebp
  10148e:	83 ec 38             	sub    $0x38,%esp
  101491:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101497:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10149a:	89 c2                	mov    %eax,%edx
  10149c:	ec                   	in     (%dx),%al
  10149d:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1014a0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1014a4:	0f b6 c0             	movzbl %al,%eax
  1014a7:	83 e0 01             	and    $0x1,%eax
  1014aa:	85 c0                	test   %eax,%eax
  1014ac:	75 0a                	jne    1014b8 <kbd_proc_data+0x31>
        return -1;
  1014ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1014b3:	e9 56 01 00 00       	jmp    10160e <kbd_proc_data+0x187>
  1014b8:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1014be:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1014c1:	89 c2                	mov    %eax,%edx
  1014c3:	ec                   	in     (%dx),%al
  1014c4:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1014c7:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1014cb:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1014ce:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1014d2:	75 17                	jne    1014eb <kbd_proc_data+0x64>
        // E0 escape character
        shift |= E0ESC;
  1014d4:	a1 88 10 11 00       	mov    0x111088,%eax
  1014d9:	83 c8 40             	or     $0x40,%eax
  1014dc:	a3 88 10 11 00       	mov    %eax,0x111088
        return 0;
  1014e1:	b8 00 00 00 00       	mov    $0x0,%eax
  1014e6:	e9 23 01 00 00       	jmp    10160e <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  1014eb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ef:	84 c0                	test   %al,%al
  1014f1:	79 45                	jns    101538 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1014f3:	a1 88 10 11 00       	mov    0x111088,%eax
  1014f8:	83 e0 40             	and    $0x40,%eax
  1014fb:	85 c0                	test   %eax,%eax
  1014fd:	75 08                	jne    101507 <kbd_proc_data+0x80>
  1014ff:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101503:	24 7f                	and    $0x7f,%al
  101505:	eb 04                	jmp    10150b <kbd_proc_data+0x84>
  101507:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10150b:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10150e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101512:	0f b6 80 40 00 11 00 	movzbl 0x110040(%eax),%eax
  101519:	0c 40                	or     $0x40,%al
  10151b:	0f b6 c0             	movzbl %al,%eax
  10151e:	f7 d0                	not    %eax
  101520:	89 c2                	mov    %eax,%edx
  101522:	a1 88 10 11 00       	mov    0x111088,%eax
  101527:	21 d0                	and    %edx,%eax
  101529:	a3 88 10 11 00       	mov    %eax,0x111088
        return 0;
  10152e:	b8 00 00 00 00       	mov    $0x0,%eax
  101533:	e9 d6 00 00 00       	jmp    10160e <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101538:	a1 88 10 11 00       	mov    0x111088,%eax
  10153d:	83 e0 40             	and    $0x40,%eax
  101540:	85 c0                	test   %eax,%eax
  101542:	74 11                	je     101555 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101544:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101548:	a1 88 10 11 00       	mov    0x111088,%eax
  10154d:	83 e0 bf             	and    $0xffffffbf,%eax
  101550:	a3 88 10 11 00       	mov    %eax,0x111088
    }

    shift |= shiftcode[data];
  101555:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101559:	0f b6 80 40 00 11 00 	movzbl 0x110040(%eax),%eax
  101560:	0f b6 d0             	movzbl %al,%edx
  101563:	a1 88 10 11 00       	mov    0x111088,%eax
  101568:	09 d0                	or     %edx,%eax
  10156a:	a3 88 10 11 00       	mov    %eax,0x111088
    shift ^= togglecode[data];
  10156f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101573:	0f b6 80 40 01 11 00 	movzbl 0x110140(%eax),%eax
  10157a:	0f b6 d0             	movzbl %al,%edx
  10157d:	a1 88 10 11 00       	mov    0x111088,%eax
  101582:	31 d0                	xor    %edx,%eax
  101584:	a3 88 10 11 00       	mov    %eax,0x111088

    c = charcode[shift & (CTL | SHIFT)][data];
  101589:	a1 88 10 11 00       	mov    0x111088,%eax
  10158e:	83 e0 03             	and    $0x3,%eax
  101591:	8b 14 85 40 05 11 00 	mov    0x110540(,%eax,4),%edx
  101598:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10159c:	01 d0                	add    %edx,%eax
  10159e:	0f b6 00             	movzbl (%eax),%eax
  1015a1:	0f b6 c0             	movzbl %al,%eax
  1015a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1015a7:	a1 88 10 11 00       	mov    0x111088,%eax
  1015ac:	83 e0 08             	and    $0x8,%eax
  1015af:	85 c0                	test   %eax,%eax
  1015b1:	74 22                	je     1015d5 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1015b3:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1015b7:	7e 0c                	jle    1015c5 <kbd_proc_data+0x13e>
  1015b9:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1015bd:	7f 06                	jg     1015c5 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1015bf:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1015c3:	eb 10                	jmp    1015d5 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1015c5:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1015c9:	7e 0a                	jle    1015d5 <kbd_proc_data+0x14e>
  1015cb:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1015cf:	7f 04                	jg     1015d5 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1015d1:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1015d5:	a1 88 10 11 00       	mov    0x111088,%eax
  1015da:	f7 d0                	not    %eax
  1015dc:	83 e0 06             	and    $0x6,%eax
  1015df:	85 c0                	test   %eax,%eax
  1015e1:	75 28                	jne    10160b <kbd_proc_data+0x184>
  1015e3:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1015ea:	75 1f                	jne    10160b <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  1015ec:	c7 04 24 ad 3a 10 00 	movl   $0x103aad,(%esp)
  1015f3:	e8 9c ec ff ff       	call   100294 <cprintf>
  1015f8:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015fe:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101602:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101606:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101609:	ee                   	out    %al,(%dx)
}
  10160a:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10160b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10160e:	c9                   	leave  
  10160f:	c3                   	ret    

00101610 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101610:	f3 0f 1e fb          	endbr32 
  101614:	55                   	push   %ebp
  101615:	89 e5                	mov    %esp,%ebp
  101617:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10161a:	c7 04 24 87 14 10 00 	movl   $0x101487,(%esp)
  101621:	e8 93 fd ff ff       	call   1013b9 <cons_intr>
}
  101626:	90                   	nop
  101627:	c9                   	leave  
  101628:	c3                   	ret    

00101629 <kbd_init>:

static void
kbd_init(void) {
  101629:	f3 0f 1e fb          	endbr32 
  10162d:	55                   	push   %ebp
  10162e:	89 e5                	mov    %esp,%ebp
  101630:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101633:	e8 d8 ff ff ff       	call   101610 <kbd_intr>
    pic_enable(IRQ_KBD);
  101638:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10163f:	e8 21 01 00 00       	call   101765 <pic_enable>
}
  101644:	90                   	nop
  101645:	c9                   	leave  
  101646:	c3                   	ret    

00101647 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101647:	f3 0f 1e fb          	endbr32 
  10164b:	55                   	push   %ebp
  10164c:	89 e5                	mov    %esp,%ebp
  10164e:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101651:	e8 2e f8 ff ff       	call   100e84 <cga_init>
    serial_init();
  101656:	e8 13 f9 ff ff       	call   100f6e <serial_init>
    kbd_init();
  10165b:	e8 c9 ff ff ff       	call   101629 <kbd_init>
    if (!serial_exists) {
  101660:	a1 68 0e 11 00       	mov    0x110e68,%eax
  101665:	85 c0                	test   %eax,%eax
  101667:	75 0c                	jne    101675 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101669:	c7 04 24 b9 3a 10 00 	movl   $0x103ab9,(%esp)
  101670:	e8 1f ec ff ff       	call   100294 <cprintf>
    }
}
  101675:	90                   	nop
  101676:	c9                   	leave  
  101677:	c3                   	ret    

00101678 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101678:	f3 0f 1e fb          	endbr32 
  10167c:	55                   	push   %ebp
  10167d:	89 e5                	mov    %esp,%ebp
  10167f:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101682:	8b 45 08             	mov    0x8(%ebp),%eax
  101685:	89 04 24             	mov    %eax,(%esp)
  101688:	e8 50 fa ff ff       	call   1010dd <lpt_putc>
    cga_putc(c);
  10168d:	8b 45 08             	mov    0x8(%ebp),%eax
  101690:	89 04 24             	mov    %eax,(%esp)
  101693:	e8 89 fa ff ff       	call   101121 <cga_putc>
    serial_putc(c);
  101698:	8b 45 08             	mov    0x8(%ebp),%eax
  10169b:	89 04 24             	mov    %eax,(%esp)
  10169e:	e8 d2 fc ff ff       	call   101375 <serial_putc>
}
  1016a3:	90                   	nop
  1016a4:	c9                   	leave  
  1016a5:	c3                   	ret    

001016a6 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1016a6:	f3 0f 1e fb          	endbr32 
  1016aa:	55                   	push   %ebp
  1016ab:	89 e5                	mov    %esp,%ebp
  1016ad:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1016b0:	e8 b0 fd ff ff       	call   101465 <serial_intr>
    kbd_intr();
  1016b5:	e8 56 ff ff ff       	call   101610 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1016ba:	8b 15 80 10 11 00    	mov    0x111080,%edx
  1016c0:	a1 84 10 11 00       	mov    0x111084,%eax
  1016c5:	39 c2                	cmp    %eax,%edx
  1016c7:	74 36                	je     1016ff <cons_getc+0x59>
        c = cons.buf[cons.rpos ++];
  1016c9:	a1 80 10 11 00       	mov    0x111080,%eax
  1016ce:	8d 50 01             	lea    0x1(%eax),%edx
  1016d1:	89 15 80 10 11 00    	mov    %edx,0x111080
  1016d7:	0f b6 80 80 0e 11 00 	movzbl 0x110e80(%eax),%eax
  1016de:	0f b6 c0             	movzbl %al,%eax
  1016e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1016e4:	a1 80 10 11 00       	mov    0x111080,%eax
  1016e9:	3d 00 02 00 00       	cmp    $0x200,%eax
  1016ee:	75 0a                	jne    1016fa <cons_getc+0x54>
            cons.rpos = 0;
  1016f0:	c7 05 80 10 11 00 00 	movl   $0x0,0x111080
  1016f7:	00 00 00 
        }
        return c;
  1016fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1016fd:	eb 05                	jmp    101704 <cons_getc+0x5e>
    }
    return 0;
  1016ff:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101704:	c9                   	leave  
  101705:	c3                   	ret    

00101706 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101706:	f3 0f 1e fb          	endbr32 
  10170a:	55                   	push   %ebp
  10170b:	89 e5                	mov    %esp,%ebp
  10170d:	83 ec 14             	sub    $0x14,%esp
  101710:	8b 45 08             	mov    0x8(%ebp),%eax
  101713:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101717:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10171a:	66 a3 50 05 11 00    	mov    %ax,0x110550
    if (did_init) {
  101720:	a1 8c 10 11 00       	mov    0x11108c,%eax
  101725:	85 c0                	test   %eax,%eax
  101727:	74 39                	je     101762 <pic_setmask+0x5c>
        outb(IO_PIC1 + 1, mask);
  101729:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10172c:	0f b6 c0             	movzbl %al,%eax
  10172f:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101735:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101738:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10173c:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101740:	ee                   	out    %al,(%dx)
}
  101741:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  101742:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101746:	c1 e8 08             	shr    $0x8,%eax
  101749:	0f b7 c0             	movzwl %ax,%eax
  10174c:	0f b6 c0             	movzbl %al,%eax
  10174f:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101755:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101758:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10175c:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101760:	ee                   	out    %al,(%dx)
}
  101761:	90                   	nop
    }
}
  101762:	90                   	nop
  101763:	c9                   	leave  
  101764:	c3                   	ret    

00101765 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101765:	f3 0f 1e fb          	endbr32 
  101769:	55                   	push   %ebp
  10176a:	89 e5                	mov    %esp,%ebp
  10176c:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10176f:	8b 45 08             	mov    0x8(%ebp),%eax
  101772:	ba 01 00 00 00       	mov    $0x1,%edx
  101777:	88 c1                	mov    %al,%cl
  101779:	d3 e2                	shl    %cl,%edx
  10177b:	89 d0                	mov    %edx,%eax
  10177d:	98                   	cwtl   
  10177e:	f7 d0                	not    %eax
  101780:	0f bf d0             	movswl %ax,%edx
  101783:	0f b7 05 50 05 11 00 	movzwl 0x110550,%eax
  10178a:	98                   	cwtl   
  10178b:	21 d0                	and    %edx,%eax
  10178d:	98                   	cwtl   
  10178e:	0f b7 c0             	movzwl %ax,%eax
  101791:	89 04 24             	mov    %eax,(%esp)
  101794:	e8 6d ff ff ff       	call   101706 <pic_setmask>
}
  101799:	90                   	nop
  10179a:	c9                   	leave  
  10179b:	c3                   	ret    

0010179c <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10179c:	f3 0f 1e fb          	endbr32 
  1017a0:	55                   	push   %ebp
  1017a1:	89 e5                	mov    %esp,%ebp
  1017a3:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1017a6:	c7 05 8c 10 11 00 01 	movl   $0x1,0x11108c
  1017ad:	00 00 00 
  1017b0:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1017b6:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ba:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017be:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017c2:	ee                   	out    %al,(%dx)
}
  1017c3:	90                   	nop
  1017c4:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1017ca:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ce:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017d2:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017d6:	ee                   	out    %al,(%dx)
}
  1017d7:	90                   	nop
  1017d8:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1017de:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017e2:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017e6:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017ea:	ee                   	out    %al,(%dx)
}
  1017eb:	90                   	nop
  1017ec:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  1017f2:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017f6:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017fa:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017fe:	ee                   	out    %al,(%dx)
}
  1017ff:	90                   	nop
  101800:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101806:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10180a:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10180e:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101812:	ee                   	out    %al,(%dx)
}
  101813:	90                   	nop
  101814:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  10181a:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10181e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101822:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101826:	ee                   	out    %al,(%dx)
}
  101827:	90                   	nop
  101828:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  10182e:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101832:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101836:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  10183a:	ee                   	out    %al,(%dx)
}
  10183b:	90                   	nop
  10183c:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101842:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101846:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10184a:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10184e:	ee                   	out    %al,(%dx)
}
  10184f:	90                   	nop
  101850:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101856:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10185a:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10185e:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101862:	ee                   	out    %al,(%dx)
}
  101863:	90                   	nop
  101864:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10186a:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10186e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101872:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101876:	ee                   	out    %al,(%dx)
}
  101877:	90                   	nop
  101878:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  10187e:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101882:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101886:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10188a:	ee                   	out    %al,(%dx)
}
  10188b:	90                   	nop
  10188c:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101892:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101896:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10189a:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10189e:	ee                   	out    %al,(%dx)
}
  10189f:	90                   	nop
  1018a0:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  1018a6:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018aa:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1018ae:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1018b2:	ee                   	out    %al,(%dx)
}
  1018b3:	90                   	nop
  1018b4:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1018ba:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018be:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1018c2:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1018c6:	ee                   	out    %al,(%dx)
}
  1018c7:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1018c8:	0f b7 05 50 05 11 00 	movzwl 0x110550,%eax
  1018cf:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1018d4:	74 0f                	je     1018e5 <pic_init+0x149>
        pic_setmask(irq_mask);
  1018d6:	0f b7 05 50 05 11 00 	movzwl 0x110550,%eax
  1018dd:	89 04 24             	mov    %eax,(%esp)
  1018e0:	e8 21 fe ff ff       	call   101706 <pic_setmask>
    }
}
  1018e5:	90                   	nop
  1018e6:	c9                   	leave  
  1018e7:	c3                   	ret    

001018e8 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1018e8:	f3 0f 1e fb          	endbr32 
  1018ec:	55                   	push   %ebp
  1018ed:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1018ef:	fb                   	sti    
}
  1018f0:	90                   	nop
    sti();
}
  1018f1:	90                   	nop
  1018f2:	5d                   	pop    %ebp
  1018f3:	c3                   	ret    

001018f4 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1018f4:	f3 0f 1e fb          	endbr32 
  1018f8:	55                   	push   %ebp
  1018f9:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  1018fb:	fa                   	cli    
}
  1018fc:	90                   	nop
    cli();
}
  1018fd:	90                   	nop
  1018fe:	5d                   	pop    %ebp
  1018ff:	c3                   	ret    

00101900 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101900:	f3 0f 1e fb          	endbr32 
  101904:	55                   	push   %ebp
  101905:	89 e5                	mov    %esp,%ebp
  101907:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10190a:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101911:	00 
  101912:	c7 04 24 e0 3a 10 00 	movl   $0x103ae0,(%esp)
  101919:	e8 76 e9 ff ff       	call   100294 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  10191e:	c7 04 24 ea 3a 10 00 	movl   $0x103aea,(%esp)
  101925:	e8 6a e9 ff ff       	call   100294 <cprintf>
    panic("EOT: kernel seems ok.");
  10192a:	c7 44 24 08 f8 3a 10 	movl   $0x103af8,0x8(%esp)
  101931:	00 
  101932:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
  101939:	00 
  10193a:	c7 04 24 0e 3b 10 00 	movl   $0x103b0e,(%esp)
  101941:	e8 ba ea ff ff       	call   100400 <__panic>

00101946 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {  //初始化IDT表
  101946:	f3 0f 1e fb          	endbr32 
  10194a:	55                   	push   %ebp
  10194b:	89 e5                	mov    %esp,%ebp
  10194d:	83 ec 10             	sub    $0x10,%esp
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
      extern uintptr_t __vectors[];   
      for(int i=0;i<sizeof(idt)/sizeof(struct gatedesc);i++)//idt个数
  101950:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101957:	e9 c4 00 00 00       	jmp    101a20 <idt_init+0xda>
      {
        //使用SETGATE宏，对中断描述符表中的每一个表项进行设置
        SETGATE(idt[i],0,GD_KTEXT,__vectors[i],DPL_KERNEL);//在中断门描述符表中通过建立中断门描述符
  10195c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10195f:	8b 04 85 e0 05 11 00 	mov    0x1105e0(,%eax,4),%eax
  101966:	0f b7 d0             	movzwl %ax,%edx
  101969:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10196c:	66 89 14 c5 a0 10 11 	mov    %dx,0x1110a0(,%eax,8)
  101973:	00 
  101974:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101977:	66 c7 04 c5 a2 10 11 	movw   $0x8,0x1110a2(,%eax,8)
  10197e:	00 08 00 
  101981:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101984:	0f b6 14 c5 a4 10 11 	movzbl 0x1110a4(,%eax,8),%edx
  10198b:	00 
  10198c:	80 e2 e0             	and    $0xe0,%dl
  10198f:	88 14 c5 a4 10 11 00 	mov    %dl,0x1110a4(,%eax,8)
  101996:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101999:	0f b6 14 c5 a4 10 11 	movzbl 0x1110a4(,%eax,8),%edx
  1019a0:	00 
  1019a1:	80 e2 1f             	and    $0x1f,%dl
  1019a4:	88 14 c5 a4 10 11 00 	mov    %dl,0x1110a4(,%eax,8)
  1019ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019ae:	0f b6 14 c5 a5 10 11 	movzbl 0x1110a5(,%eax,8),%edx
  1019b5:	00 
  1019b6:	80 e2 f0             	and    $0xf0,%dl
  1019b9:	80 ca 0e             	or     $0xe,%dl
  1019bc:	88 14 c5 a5 10 11 00 	mov    %dl,0x1110a5(,%eax,8)
  1019c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019c6:	0f b6 14 c5 a5 10 11 	movzbl 0x1110a5(,%eax,8),%edx
  1019cd:	00 
  1019ce:	80 e2 ef             	and    $0xef,%dl
  1019d1:	88 14 c5 a5 10 11 00 	mov    %dl,0x1110a5(,%eax,8)
  1019d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019db:	0f b6 14 c5 a5 10 11 	movzbl 0x1110a5(,%eax,8),%edx
  1019e2:	00 
  1019e3:	80 e2 9f             	and    $0x9f,%dl
  1019e6:	88 14 c5 a5 10 11 00 	mov    %dl,0x1110a5(,%eax,8)
  1019ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019f0:	0f b6 14 c5 a5 10 11 	movzbl 0x1110a5(,%eax,8),%edx
  1019f7:	00 
  1019f8:	80 ca 80             	or     $0x80,%dl
  1019fb:	88 14 c5 a5 10 11 00 	mov    %dl,0x1110a5(,%eax,8)
  101a02:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a05:	8b 04 85 e0 05 11 00 	mov    0x1105e0(,%eax,4),%eax
  101a0c:	c1 e8 10             	shr    $0x10,%eax
  101a0f:	0f b7 d0             	movzwl %ax,%edx
  101a12:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a15:	66 89 14 c5 a6 10 11 	mov    %dx,0x1110a6(,%eax,8)
  101a1c:	00 
      for(int i=0;i<sizeof(idt)/sizeof(struct gatedesc);i++)//idt个数
  101a1d:	ff 45 fc             	incl   -0x4(%ebp)
  101a20:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a23:	3d ff 00 00 00       	cmp    $0xff,%eax
  101a28:	0f 86 2e ff ff ff    	jbe    10195c <idt_init+0x16>
        //存储了中断处理例程的代码段GD_KTEXT和偏移量__vectors[i]，特权级为DPL_KERNEL
        //这样通过查询idt[i]就可定位到中断服务例程的起始地址
      }
      SETGATE(idt[T_SWITCH_TOK],0,GD_KTEXT,__vectors[T_SWITCH_TOK],DPL_USER);//权限为用户态权限
  101a2e:	a1 c4 07 11 00       	mov    0x1107c4,%eax
  101a33:	0f b7 c0             	movzwl %ax,%eax
  101a36:	66 a3 68 14 11 00    	mov    %ax,0x111468
  101a3c:	66 c7 05 6a 14 11 00 	movw   $0x8,0x11146a
  101a43:	08 00 
  101a45:	0f b6 05 6c 14 11 00 	movzbl 0x11146c,%eax
  101a4c:	24 e0                	and    $0xe0,%al
  101a4e:	a2 6c 14 11 00       	mov    %al,0x11146c
  101a53:	0f b6 05 6c 14 11 00 	movzbl 0x11146c,%eax
  101a5a:	24 1f                	and    $0x1f,%al
  101a5c:	a2 6c 14 11 00       	mov    %al,0x11146c
  101a61:	0f b6 05 6d 14 11 00 	movzbl 0x11146d,%eax
  101a68:	24 f0                	and    $0xf0,%al
  101a6a:	0c 0e                	or     $0xe,%al
  101a6c:	a2 6d 14 11 00       	mov    %al,0x11146d
  101a71:	0f b6 05 6d 14 11 00 	movzbl 0x11146d,%eax
  101a78:	24 ef                	and    $0xef,%al
  101a7a:	a2 6d 14 11 00       	mov    %al,0x11146d
  101a7f:	0f b6 05 6d 14 11 00 	movzbl 0x11146d,%eax
  101a86:	0c 60                	or     $0x60,%al
  101a88:	a2 6d 14 11 00       	mov    %al,0x11146d
  101a8d:	0f b6 05 6d 14 11 00 	movzbl 0x11146d,%eax
  101a94:	0c 80                	or     $0x80,%al
  101a96:	a2 6d 14 11 00       	mov    %al,0x11146d
  101a9b:	a1 c4 07 11 00       	mov    0x1107c4,%eax
  101aa0:	c1 e8 10             	shr    $0x10,%eax
  101aa3:	0f b7 c0             	movzwl %ax,%eax
  101aa6:	66 a3 6e 14 11 00    	mov    %ax,0x11146e
  101aac:	c7 45 f8 60 05 11 00 	movl   $0x110560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101ab3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101ab6:	0f 01 18             	lidtl  (%eax)
}
  101ab9:	90                   	nop
      lidt(&idt_pd);//存放idt地址
}
  101aba:	90                   	nop
  101abb:	c9                   	leave  
  101abc:	c3                   	ret    

00101abd <trapname>:

static const char *
trapname(int trapno) {
  101abd:	f3 0f 1e fb          	endbr32 
  101ac1:	55                   	push   %ebp
  101ac2:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101ac4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac7:	83 f8 13             	cmp    $0x13,%eax
  101aca:	77 0c                	ja     101ad8 <trapname+0x1b>
        return excnames[trapno];
  101acc:	8b 45 08             	mov    0x8(%ebp),%eax
  101acf:	8b 04 85 a0 3e 10 00 	mov    0x103ea0(,%eax,4),%eax
  101ad6:	eb 18                	jmp    101af0 <trapname+0x33>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101ad8:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101adc:	7e 0d                	jle    101aeb <trapname+0x2e>
  101ade:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101ae2:	7f 07                	jg     101aeb <trapname+0x2e>
        return "Hardware Interrupt";
  101ae4:	b8 1f 3b 10 00       	mov    $0x103b1f,%eax
  101ae9:	eb 05                	jmp    101af0 <trapname+0x33>
    }
    return "(unknown trap)";
  101aeb:	b8 32 3b 10 00       	mov    $0x103b32,%eax
}
  101af0:	5d                   	pop    %ebp
  101af1:	c3                   	ret    

00101af2 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101af2:	f3 0f 1e fb          	endbr32 
  101af6:	55                   	push   %ebp
  101af7:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101af9:	8b 45 08             	mov    0x8(%ebp),%eax
  101afc:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b00:	83 f8 08             	cmp    $0x8,%eax
  101b03:	0f 94 c0             	sete   %al
  101b06:	0f b6 c0             	movzbl %al,%eax
}
  101b09:	5d                   	pop    %ebp
  101b0a:	c3                   	ret    

00101b0b <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101b0b:	f3 0f 1e fb          	endbr32 
  101b0f:	55                   	push   %ebp
  101b10:	89 e5                	mov    %esp,%ebp
  101b12:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101b15:	8b 45 08             	mov    0x8(%ebp),%eax
  101b18:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b1c:	c7 04 24 73 3b 10 00 	movl   $0x103b73,(%esp)
  101b23:	e8 6c e7 ff ff       	call   100294 <cprintf>
    print_regs(&tf->tf_regs);
  101b28:	8b 45 08             	mov    0x8(%ebp),%eax
  101b2b:	89 04 24             	mov    %eax,(%esp)
  101b2e:	e8 8d 01 00 00       	call   101cc0 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101b33:	8b 45 08             	mov    0x8(%ebp),%eax
  101b36:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101b3a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b3e:	c7 04 24 84 3b 10 00 	movl   $0x103b84,(%esp)
  101b45:	e8 4a e7 ff ff       	call   100294 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101b4a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b4d:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101b51:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b55:	c7 04 24 97 3b 10 00 	movl   $0x103b97,(%esp)
  101b5c:	e8 33 e7 ff ff       	call   100294 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101b61:	8b 45 08             	mov    0x8(%ebp),%eax
  101b64:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101b68:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b6c:	c7 04 24 aa 3b 10 00 	movl   $0x103baa,(%esp)
  101b73:	e8 1c e7 ff ff       	call   100294 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101b78:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7b:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101b7f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b83:	c7 04 24 bd 3b 10 00 	movl   $0x103bbd,(%esp)
  101b8a:	e8 05 e7 ff ff       	call   100294 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101b8f:	8b 45 08             	mov    0x8(%ebp),%eax
  101b92:	8b 40 30             	mov    0x30(%eax),%eax
  101b95:	89 04 24             	mov    %eax,(%esp)
  101b98:	e8 20 ff ff ff       	call   101abd <trapname>
  101b9d:	8b 55 08             	mov    0x8(%ebp),%edx
  101ba0:	8b 52 30             	mov    0x30(%edx),%edx
  101ba3:	89 44 24 08          	mov    %eax,0x8(%esp)
  101ba7:	89 54 24 04          	mov    %edx,0x4(%esp)
  101bab:	c7 04 24 d0 3b 10 00 	movl   $0x103bd0,(%esp)
  101bb2:	e8 dd e6 ff ff       	call   100294 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101bb7:	8b 45 08             	mov    0x8(%ebp),%eax
  101bba:	8b 40 34             	mov    0x34(%eax),%eax
  101bbd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc1:	c7 04 24 e2 3b 10 00 	movl   $0x103be2,(%esp)
  101bc8:	e8 c7 e6 ff ff       	call   100294 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101bcd:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd0:	8b 40 38             	mov    0x38(%eax),%eax
  101bd3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bd7:	c7 04 24 f1 3b 10 00 	movl   $0x103bf1,(%esp)
  101bde:	e8 b1 e6 ff ff       	call   100294 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101be3:	8b 45 08             	mov    0x8(%ebp),%eax
  101be6:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101bea:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bee:	c7 04 24 00 3c 10 00 	movl   $0x103c00,(%esp)
  101bf5:	e8 9a e6 ff ff       	call   100294 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101bfa:	8b 45 08             	mov    0x8(%ebp),%eax
  101bfd:	8b 40 40             	mov    0x40(%eax),%eax
  101c00:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c04:	c7 04 24 13 3c 10 00 	movl   $0x103c13,(%esp)
  101c0b:	e8 84 e6 ff ff       	call   100294 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c10:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101c17:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101c1e:	eb 3d                	jmp    101c5d <print_trapframe+0x152>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101c20:	8b 45 08             	mov    0x8(%ebp),%eax
  101c23:	8b 50 40             	mov    0x40(%eax),%edx
  101c26:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c29:	21 d0                	and    %edx,%eax
  101c2b:	85 c0                	test   %eax,%eax
  101c2d:	74 28                	je     101c57 <print_trapframe+0x14c>
  101c2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c32:	8b 04 85 80 05 11 00 	mov    0x110580(,%eax,4),%eax
  101c39:	85 c0                	test   %eax,%eax
  101c3b:	74 1a                	je     101c57 <print_trapframe+0x14c>
            cprintf("%s,", IA32flags[i]);
  101c3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c40:	8b 04 85 80 05 11 00 	mov    0x110580(,%eax,4),%eax
  101c47:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c4b:	c7 04 24 22 3c 10 00 	movl   $0x103c22,(%esp)
  101c52:	e8 3d e6 ff ff       	call   100294 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c57:	ff 45 f4             	incl   -0xc(%ebp)
  101c5a:	d1 65 f0             	shll   -0x10(%ebp)
  101c5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c60:	83 f8 17             	cmp    $0x17,%eax
  101c63:	76 bb                	jbe    101c20 <print_trapframe+0x115>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101c65:	8b 45 08             	mov    0x8(%ebp),%eax
  101c68:	8b 40 40             	mov    0x40(%eax),%eax
  101c6b:	c1 e8 0c             	shr    $0xc,%eax
  101c6e:	83 e0 03             	and    $0x3,%eax
  101c71:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c75:	c7 04 24 26 3c 10 00 	movl   $0x103c26,(%esp)
  101c7c:	e8 13 e6 ff ff       	call   100294 <cprintf>

    if (!trap_in_kernel(tf)) {
  101c81:	8b 45 08             	mov    0x8(%ebp),%eax
  101c84:	89 04 24             	mov    %eax,(%esp)
  101c87:	e8 66 fe ff ff       	call   101af2 <trap_in_kernel>
  101c8c:	85 c0                	test   %eax,%eax
  101c8e:	75 2d                	jne    101cbd <print_trapframe+0x1b2>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101c90:	8b 45 08             	mov    0x8(%ebp),%eax
  101c93:	8b 40 44             	mov    0x44(%eax),%eax
  101c96:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c9a:	c7 04 24 2f 3c 10 00 	movl   $0x103c2f,(%esp)
  101ca1:	e8 ee e5 ff ff       	call   100294 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101ca6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ca9:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101cad:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cb1:	c7 04 24 3e 3c 10 00 	movl   $0x103c3e,(%esp)
  101cb8:	e8 d7 e5 ff ff       	call   100294 <cprintf>
    }
}
  101cbd:	90                   	nop
  101cbe:	c9                   	leave  
  101cbf:	c3                   	ret    

00101cc0 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101cc0:	f3 0f 1e fb          	endbr32 
  101cc4:	55                   	push   %ebp
  101cc5:	89 e5                	mov    %esp,%ebp
  101cc7:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101cca:	8b 45 08             	mov    0x8(%ebp),%eax
  101ccd:	8b 00                	mov    (%eax),%eax
  101ccf:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cd3:	c7 04 24 51 3c 10 00 	movl   $0x103c51,(%esp)
  101cda:	e8 b5 e5 ff ff       	call   100294 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101cdf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce2:	8b 40 04             	mov    0x4(%eax),%eax
  101ce5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ce9:	c7 04 24 60 3c 10 00 	movl   $0x103c60,(%esp)
  101cf0:	e8 9f e5 ff ff       	call   100294 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101cf5:	8b 45 08             	mov    0x8(%ebp),%eax
  101cf8:	8b 40 08             	mov    0x8(%eax),%eax
  101cfb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cff:	c7 04 24 6f 3c 10 00 	movl   $0x103c6f,(%esp)
  101d06:	e8 89 e5 ff ff       	call   100294 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101d0b:	8b 45 08             	mov    0x8(%ebp),%eax
  101d0e:	8b 40 0c             	mov    0xc(%eax),%eax
  101d11:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d15:	c7 04 24 7e 3c 10 00 	movl   $0x103c7e,(%esp)
  101d1c:	e8 73 e5 ff ff       	call   100294 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101d21:	8b 45 08             	mov    0x8(%ebp),%eax
  101d24:	8b 40 10             	mov    0x10(%eax),%eax
  101d27:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d2b:	c7 04 24 8d 3c 10 00 	movl   $0x103c8d,(%esp)
  101d32:	e8 5d e5 ff ff       	call   100294 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101d37:	8b 45 08             	mov    0x8(%ebp),%eax
  101d3a:	8b 40 14             	mov    0x14(%eax),%eax
  101d3d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d41:	c7 04 24 9c 3c 10 00 	movl   $0x103c9c,(%esp)
  101d48:	e8 47 e5 ff ff       	call   100294 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101d4d:	8b 45 08             	mov    0x8(%ebp),%eax
  101d50:	8b 40 18             	mov    0x18(%eax),%eax
  101d53:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d57:	c7 04 24 ab 3c 10 00 	movl   $0x103cab,(%esp)
  101d5e:	e8 31 e5 ff ff       	call   100294 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101d63:	8b 45 08             	mov    0x8(%ebp),%eax
  101d66:	8b 40 1c             	mov    0x1c(%eax),%eax
  101d69:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d6d:	c7 04 24 ba 3c 10 00 	movl   $0x103cba,(%esp)
  101d74:	e8 1b e5 ff ff       	call   100294 <cprintf>
}
  101d79:	90                   	nop
  101d7a:	c9                   	leave  
  101d7b:	c3                   	ret    

00101d7c <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101d7c:	f3 0f 1e fb          	endbr32 
  101d80:	55                   	push   %ebp
  101d81:	89 e5                	mov    %esp,%ebp
  101d83:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101d86:	8b 45 08             	mov    0x8(%ebp),%eax
  101d89:	8b 40 30             	mov    0x30(%eax),%eax
  101d8c:	83 f8 79             	cmp    $0x79,%eax
  101d8f:	0f 84 f7 01 00 00    	je     101f8c <trap_dispatch+0x210>
  101d95:	83 f8 79             	cmp    $0x79,%eax
  101d98:	0f 87 2f 02 00 00    	ja     101fcd <trap_dispatch+0x251>
  101d9e:	83 f8 78             	cmp    $0x78,%eax
  101da1:	0f 84 92 01 00 00    	je     101f39 <trap_dispatch+0x1bd>
  101da7:	83 f8 78             	cmp    $0x78,%eax
  101daa:	0f 87 1d 02 00 00    	ja     101fcd <trap_dispatch+0x251>
  101db0:	83 f8 2f             	cmp    $0x2f,%eax
  101db3:	0f 87 14 02 00 00    	ja     101fcd <trap_dispatch+0x251>
  101db9:	83 f8 2e             	cmp    $0x2e,%eax
  101dbc:	0f 83 40 02 00 00    	jae    102002 <trap_dispatch+0x286>
  101dc2:	83 f8 24             	cmp    $0x24,%eax
  101dc5:	74 5e                	je     101e25 <trap_dispatch+0xa9>
  101dc7:	83 f8 24             	cmp    $0x24,%eax
  101dca:	0f 87 fd 01 00 00    	ja     101fcd <trap_dispatch+0x251>
  101dd0:	83 f8 20             	cmp    $0x20,%eax
  101dd3:	74 0a                	je     101ddf <trap_dispatch+0x63>
  101dd5:	83 f8 21             	cmp    $0x21,%eax
  101dd8:	74 74                	je     101e4e <trap_dispatch+0xd2>
  101dda:	e9 ee 01 00 00       	jmp    101fcd <trap_dispatch+0x251>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks ++;
  101ddf:	a1 08 19 11 00       	mov    0x111908,%eax
  101de4:	40                   	inc    %eax
  101de5:	a3 08 19 11 00       	mov    %eax,0x111908
        if(ticks % TICK_NUM==0)
  101dea:	8b 0d 08 19 11 00    	mov    0x111908,%ecx
  101df0:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101df5:	89 c8                	mov    %ecx,%eax
  101df7:	f7 e2                	mul    %edx
  101df9:	c1 ea 05             	shr    $0x5,%edx
  101dfc:	89 d0                	mov    %edx,%eax
  101dfe:	c1 e0 02             	shl    $0x2,%eax
  101e01:	01 d0                	add    %edx,%eax
  101e03:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101e0a:	01 d0                	add    %edx,%eax
  101e0c:	c1 e0 02             	shl    $0x2,%eax
  101e0f:	29 c1                	sub    %eax,%ecx
  101e11:	89 ca                	mov    %ecx,%edx
  101e13:	85 d2                	test   %edx,%edx
  101e15:	0f 85 ea 01 00 00    	jne    102005 <trap_dispatch+0x289>
        {
            print_ticks();
  101e1b:	e8 e0 fa ff ff       	call   101900 <print_ticks>
        }
        break;
  101e20:	e9 e0 01 00 00       	jmp    102005 <trap_dispatch+0x289>

    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101e25:	e8 7c f8 ff ff       	call   1016a6 <cons_getc>
  101e2a:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101e2d:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101e31:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e35:	89 54 24 08          	mov    %edx,0x8(%esp)
  101e39:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e3d:	c7 04 24 c9 3c 10 00 	movl   $0x103cc9,(%esp)
  101e44:	e8 4b e4 ff ff       	call   100294 <cprintf>
        break;
  101e49:	e9 c1 01 00 00       	jmp    10200f <trap_dispatch+0x293>
        
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101e4e:	e8 53 f8 ff ff       	call   1016a6 <cons_getc>
  101e53:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101e56:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101e5a:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e5e:	89 54 24 08          	mov    %edx,0x8(%esp)
  101e62:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e66:	c7 04 24 db 3c 10 00 	movl   $0x103cdb,(%esp)
  101e6d:	e8 22 e4 ff ff       	call   100294 <cprintf>
        if(c=='0'&&(tf->tf_cs&3)!=0)
  101e72:	80 7d f7 30          	cmpb   $0x30,-0x9(%ebp)
  101e76:	75 52                	jne    101eca <trap_dispatch+0x14e>
  101e78:	8b 45 08             	mov    0x8(%ebp),%eax
  101e7b:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e7f:	83 e0 03             	and    $0x3,%eax
  101e82:	85 c0                	test   %eax,%eax
  101e84:	74 44                	je     101eca <trap_dispatch+0x14e>
        {  
            cprintf("Input 0 to switch to kernel\n");
  101e86:	c7 04 24 ea 3c 10 00 	movl   $0x103cea,(%esp)
  101e8d:	e8 02 e4 ff ff       	call   100294 <cprintf>
            tf->tf_cs=KERNEL_CS;
  101e92:	8b 45 08             	mov    0x8(%ebp),%eax
  101e95:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds=tf->tf_es=KERNEL_DS;
  101e9b:	8b 45 08             	mov    0x8(%ebp),%eax
  101e9e:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101ea4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ea7:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101eab:	8b 45 08             	mov    0x8(%ebp),%eax
  101eae:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags &= ~FL_IOPL_MASK;
  101eb2:	8b 45 08             	mov    0x8(%ebp),%eax
  101eb5:	8b 40 40             	mov    0x40(%eax),%eax
  101eb8:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101ebd:	89 c2                	mov    %eax,%edx
  101ebf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ec2:	89 50 40             	mov    %edx,0x40(%eax)
            cprintf("Input 3 to switch to user\n");
            tf->tf_cs=USER_CS;
            tf->tf_ds=tf->tf_es=tf->tf_ss=USER_DS;
            tf->tf_eflags |= FL_IOPL_MASK;
        } 
        break;
  101ec5:	e9 3e 01 00 00       	jmp    102008 <trap_dispatch+0x28c>
        else if(c=='3'&&(tf->tf_cs&3)!=3)
  101eca:	80 7d f7 33          	cmpb   $0x33,-0x9(%ebp)
  101ece:	0f 85 34 01 00 00    	jne    102008 <trap_dispatch+0x28c>
  101ed4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ed7:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101edb:	83 e0 03             	and    $0x3,%eax
  101ede:	83 f8 03             	cmp    $0x3,%eax
  101ee1:	0f 84 21 01 00 00    	je     102008 <trap_dispatch+0x28c>
            cprintf("Input 3 to switch to user\n");
  101ee7:	c7 04 24 07 3d 10 00 	movl   $0x103d07,(%esp)
  101eee:	e8 a1 e3 ff ff       	call   100294 <cprintf>
            tf->tf_cs=USER_CS;
  101ef3:	8b 45 08             	mov    0x8(%ebp),%eax
  101ef6:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
            tf->tf_ds=tf->tf_es=tf->tf_ss=USER_DS;
  101efc:	8b 45 08             	mov    0x8(%ebp),%eax
  101eff:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
  101f05:	8b 45 08             	mov    0x8(%ebp),%eax
  101f08:	0f b7 50 48          	movzwl 0x48(%eax),%edx
  101f0c:	8b 45 08             	mov    0x8(%ebp),%eax
  101f0f:	66 89 50 28          	mov    %dx,0x28(%eax)
  101f13:	8b 45 08             	mov    0x8(%ebp),%eax
  101f16:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101f1a:	8b 45 08             	mov    0x8(%ebp),%eax
  101f1d:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags |= FL_IOPL_MASK;
  101f21:	8b 45 08             	mov    0x8(%ebp),%eax
  101f24:	8b 40 40             	mov    0x40(%eax),%eax
  101f27:	0d 00 30 00 00       	or     $0x3000,%eax
  101f2c:	89 c2                	mov    %eax,%edx
  101f2e:	8b 45 08             	mov    0x8(%ebp),%eax
  101f31:	89 50 40             	mov    %edx,0x40(%eax)
        break;
  101f34:	e9 cf 00 00 00       	jmp    102008 <trap_dispatch+0x28c>

    //LAB1 CHALLENGE 1 : 2011188 you should modify below codes.
    case T_SWITCH_TOU:
        if(tf->tf_cs!=USER_CS)//检查是否为用户态
  101f39:	8b 45 08             	mov    0x8(%ebp),%eax
  101f3c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101f40:	83 f8 1b             	cmp    $0x1b,%eax
  101f43:	0f 84 c2 00 00 00    	je     10200b <trap_dispatch+0x28f>
        {
            //用户态对应cs,ds,es,ss四个寄存器
            tf->tf_cs=USER_CS;
  101f49:	8b 45 08             	mov    0x8(%ebp),%eax
  101f4c:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
            tf->tf_ds=tf->tf_es=tf->tf_ss=USER_DS;
  101f52:	8b 45 08             	mov    0x8(%ebp),%eax
  101f55:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
  101f5b:	8b 45 08             	mov    0x8(%ebp),%eax
  101f5e:	0f b7 50 48          	movzwl 0x48(%eax),%edx
  101f62:	8b 45 08             	mov    0x8(%ebp),%eax
  101f65:	66 89 50 28          	mov    %dx,0x28(%eax)
  101f69:	8b 45 08             	mov    0x8(%ebp),%eax
  101f6c:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101f70:	8b 45 08             	mov    0x8(%ebp),%eax
  101f73:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags|=FL_IOPL_MASK;
  101f77:	8b 45 08             	mov    0x8(%ebp),%eax
  101f7a:	8b 40 40             	mov    0x40(%eax),%eax
  101f7d:	0d 00 30 00 00       	or     $0x3000,%eax
  101f82:	89 c2                	mov    %eax,%edx
  101f84:	8b 45 08             	mov    0x8(%ebp),%eax
  101f87:	89 50 40             	mov    %edx,0x40(%eax)
        }
        break;
  101f8a:	eb 7f                	jmp    10200b <trap_dispatch+0x28f>

    case T_SWITCH_TOK:
        if(tf->tf_cs!=KERNEL_CS)//检查是否为内核态
  101f8c:	8b 45 08             	mov    0x8(%ebp),%eax
  101f8f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101f93:	83 f8 08             	cmp    $0x8,%eax
  101f96:	74 76                	je     10200e <trap_dispatch+0x292>
        {
            //内核态对应cs,ds,es三个寄存器
            tf->tf_cs=KERNEL_CS;
  101f98:	8b 45 08             	mov    0x8(%ebp),%eax
  101f9b:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds=tf->tf_es=KERNEL_DS;
  101fa1:	8b 45 08             	mov    0x8(%ebp),%eax
  101fa4:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101faa:	8b 45 08             	mov    0x8(%ebp),%eax
  101fad:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101fb1:	8b 45 08             	mov    0x8(%ebp),%eax
  101fb4:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags&=~FL_IOPL_MASK;
  101fb8:	8b 45 08             	mov    0x8(%ebp),%eax
  101fbb:	8b 40 40             	mov    0x40(%eax),%eax
  101fbe:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101fc3:	89 c2                	mov    %eax,%edx
  101fc5:	8b 45 08             	mov    0x8(%ebp),%eax
  101fc8:	89 50 40             	mov    %edx,0x40(%eax)
        }
        break;
  101fcb:	eb 41                	jmp    10200e <trap_dispatch+0x292>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101fcd:	8b 45 08             	mov    0x8(%ebp),%eax
  101fd0:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101fd4:	83 e0 03             	and    $0x3,%eax
  101fd7:	85 c0                	test   %eax,%eax
  101fd9:	75 34                	jne    10200f <trap_dispatch+0x293>
            print_trapframe(tf);
  101fdb:	8b 45 08             	mov    0x8(%ebp),%eax
  101fde:	89 04 24             	mov    %eax,(%esp)
  101fe1:	e8 25 fb ff ff       	call   101b0b <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101fe6:	c7 44 24 08 22 3d 10 	movl   $0x103d22,0x8(%esp)
  101fed:	00 
  101fee:	c7 44 24 04 dc 00 00 	movl   $0xdc,0x4(%esp)
  101ff5:	00 
  101ff6:	c7 04 24 0e 3b 10 00 	movl   $0x103b0e,(%esp)
  101ffd:	e8 fe e3 ff ff       	call   100400 <__panic>
        break;
  102002:	90                   	nop
  102003:	eb 0a                	jmp    10200f <trap_dispatch+0x293>
        break;
  102005:	90                   	nop
  102006:	eb 07                	jmp    10200f <trap_dispatch+0x293>
        break;
  102008:	90                   	nop
  102009:	eb 04                	jmp    10200f <trap_dispatch+0x293>
        break;
  10200b:	90                   	nop
  10200c:	eb 01                	jmp    10200f <trap_dispatch+0x293>
        break;
  10200e:	90                   	nop
        }
    }
}
  10200f:	90                   	nop
  102010:	c9                   	leave  
  102011:	c3                   	ret    

00102012 <trap>:
/* *
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void trap(struct trapframe *tf) {
  102012:	f3 0f 1e fb          	endbr32 
  102016:	55                   	push   %ebp
  102017:	89 e5                	mov    %esp,%ebp
  102019:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  10201c:	8b 45 08             	mov    0x8(%ebp),%eax
  10201f:	89 04 24             	mov    %eax,(%esp)
  102022:	e8 55 fd ff ff       	call   101d7c <trap_dispatch>
}
  102027:	90                   	nop
  102028:	c9                   	leave  
  102029:	c3                   	ret    

0010202a <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  10202a:	6a 00                	push   $0x0
  pushl $0
  10202c:	6a 00                	push   $0x0
  jmp __alltraps
  10202e:	e9 69 0a 00 00       	jmp    102a9c <__alltraps>

00102033 <vector1>:
.globl vector1
vector1:
  pushl $0
  102033:	6a 00                	push   $0x0
  pushl $1
  102035:	6a 01                	push   $0x1
  jmp __alltraps
  102037:	e9 60 0a 00 00       	jmp    102a9c <__alltraps>

0010203c <vector2>:
.globl vector2
vector2:
  pushl $0
  10203c:	6a 00                	push   $0x0
  pushl $2
  10203e:	6a 02                	push   $0x2
  jmp __alltraps
  102040:	e9 57 0a 00 00       	jmp    102a9c <__alltraps>

00102045 <vector3>:
.globl vector3
vector3:
  pushl $0
  102045:	6a 00                	push   $0x0
  pushl $3
  102047:	6a 03                	push   $0x3
  jmp __alltraps
  102049:	e9 4e 0a 00 00       	jmp    102a9c <__alltraps>

0010204e <vector4>:
.globl vector4
vector4:
  pushl $0
  10204e:	6a 00                	push   $0x0
  pushl $4
  102050:	6a 04                	push   $0x4
  jmp __alltraps
  102052:	e9 45 0a 00 00       	jmp    102a9c <__alltraps>

00102057 <vector5>:
.globl vector5
vector5:
  pushl $0
  102057:	6a 00                	push   $0x0
  pushl $5
  102059:	6a 05                	push   $0x5
  jmp __alltraps
  10205b:	e9 3c 0a 00 00       	jmp    102a9c <__alltraps>

00102060 <vector6>:
.globl vector6
vector6:
  pushl $0
  102060:	6a 00                	push   $0x0
  pushl $6
  102062:	6a 06                	push   $0x6
  jmp __alltraps
  102064:	e9 33 0a 00 00       	jmp    102a9c <__alltraps>

00102069 <vector7>:
.globl vector7
vector7:
  pushl $0
  102069:	6a 00                	push   $0x0
  pushl $7
  10206b:	6a 07                	push   $0x7
  jmp __alltraps
  10206d:	e9 2a 0a 00 00       	jmp    102a9c <__alltraps>

00102072 <vector8>:
.globl vector8
vector8:
  pushl $8
  102072:	6a 08                	push   $0x8
  jmp __alltraps
  102074:	e9 23 0a 00 00       	jmp    102a9c <__alltraps>

00102079 <vector9>:
.globl vector9
vector9:
  pushl $0
  102079:	6a 00                	push   $0x0
  pushl $9
  10207b:	6a 09                	push   $0x9
  jmp __alltraps
  10207d:	e9 1a 0a 00 00       	jmp    102a9c <__alltraps>

00102082 <vector10>:
.globl vector10
vector10:
  pushl $10
  102082:	6a 0a                	push   $0xa
  jmp __alltraps
  102084:	e9 13 0a 00 00       	jmp    102a9c <__alltraps>

00102089 <vector11>:
.globl vector11
vector11:
  pushl $11
  102089:	6a 0b                	push   $0xb
  jmp __alltraps
  10208b:	e9 0c 0a 00 00       	jmp    102a9c <__alltraps>

00102090 <vector12>:
.globl vector12
vector12:
  pushl $12
  102090:	6a 0c                	push   $0xc
  jmp __alltraps
  102092:	e9 05 0a 00 00       	jmp    102a9c <__alltraps>

00102097 <vector13>:
.globl vector13
vector13:
  pushl $13
  102097:	6a 0d                	push   $0xd
  jmp __alltraps
  102099:	e9 fe 09 00 00       	jmp    102a9c <__alltraps>

0010209e <vector14>:
.globl vector14
vector14:
  pushl $14
  10209e:	6a 0e                	push   $0xe
  jmp __alltraps
  1020a0:	e9 f7 09 00 00       	jmp    102a9c <__alltraps>

001020a5 <vector15>:
.globl vector15
vector15:
  pushl $0
  1020a5:	6a 00                	push   $0x0
  pushl $15
  1020a7:	6a 0f                	push   $0xf
  jmp __alltraps
  1020a9:	e9 ee 09 00 00       	jmp    102a9c <__alltraps>

001020ae <vector16>:
.globl vector16
vector16:
  pushl $0
  1020ae:	6a 00                	push   $0x0
  pushl $16
  1020b0:	6a 10                	push   $0x10
  jmp __alltraps
  1020b2:	e9 e5 09 00 00       	jmp    102a9c <__alltraps>

001020b7 <vector17>:
.globl vector17
vector17:
  pushl $17
  1020b7:	6a 11                	push   $0x11
  jmp __alltraps
  1020b9:	e9 de 09 00 00       	jmp    102a9c <__alltraps>

001020be <vector18>:
.globl vector18
vector18:
  pushl $0
  1020be:	6a 00                	push   $0x0
  pushl $18
  1020c0:	6a 12                	push   $0x12
  jmp __alltraps
  1020c2:	e9 d5 09 00 00       	jmp    102a9c <__alltraps>

001020c7 <vector19>:
.globl vector19
vector19:
  pushl $0
  1020c7:	6a 00                	push   $0x0
  pushl $19
  1020c9:	6a 13                	push   $0x13
  jmp __alltraps
  1020cb:	e9 cc 09 00 00       	jmp    102a9c <__alltraps>

001020d0 <vector20>:
.globl vector20
vector20:
  pushl $0
  1020d0:	6a 00                	push   $0x0
  pushl $20
  1020d2:	6a 14                	push   $0x14
  jmp __alltraps
  1020d4:	e9 c3 09 00 00       	jmp    102a9c <__alltraps>

001020d9 <vector21>:
.globl vector21
vector21:
  pushl $0
  1020d9:	6a 00                	push   $0x0
  pushl $21
  1020db:	6a 15                	push   $0x15
  jmp __alltraps
  1020dd:	e9 ba 09 00 00       	jmp    102a9c <__alltraps>

001020e2 <vector22>:
.globl vector22
vector22:
  pushl $0
  1020e2:	6a 00                	push   $0x0
  pushl $22
  1020e4:	6a 16                	push   $0x16
  jmp __alltraps
  1020e6:	e9 b1 09 00 00       	jmp    102a9c <__alltraps>

001020eb <vector23>:
.globl vector23
vector23:
  pushl $0
  1020eb:	6a 00                	push   $0x0
  pushl $23
  1020ed:	6a 17                	push   $0x17
  jmp __alltraps
  1020ef:	e9 a8 09 00 00       	jmp    102a9c <__alltraps>

001020f4 <vector24>:
.globl vector24
vector24:
  pushl $0
  1020f4:	6a 00                	push   $0x0
  pushl $24
  1020f6:	6a 18                	push   $0x18
  jmp __alltraps
  1020f8:	e9 9f 09 00 00       	jmp    102a9c <__alltraps>

001020fd <vector25>:
.globl vector25
vector25:
  pushl $0
  1020fd:	6a 00                	push   $0x0
  pushl $25
  1020ff:	6a 19                	push   $0x19
  jmp __alltraps
  102101:	e9 96 09 00 00       	jmp    102a9c <__alltraps>

00102106 <vector26>:
.globl vector26
vector26:
  pushl $0
  102106:	6a 00                	push   $0x0
  pushl $26
  102108:	6a 1a                	push   $0x1a
  jmp __alltraps
  10210a:	e9 8d 09 00 00       	jmp    102a9c <__alltraps>

0010210f <vector27>:
.globl vector27
vector27:
  pushl $0
  10210f:	6a 00                	push   $0x0
  pushl $27
  102111:	6a 1b                	push   $0x1b
  jmp __alltraps
  102113:	e9 84 09 00 00       	jmp    102a9c <__alltraps>

00102118 <vector28>:
.globl vector28
vector28:
  pushl $0
  102118:	6a 00                	push   $0x0
  pushl $28
  10211a:	6a 1c                	push   $0x1c
  jmp __alltraps
  10211c:	e9 7b 09 00 00       	jmp    102a9c <__alltraps>

00102121 <vector29>:
.globl vector29
vector29:
  pushl $0
  102121:	6a 00                	push   $0x0
  pushl $29
  102123:	6a 1d                	push   $0x1d
  jmp __alltraps
  102125:	e9 72 09 00 00       	jmp    102a9c <__alltraps>

0010212a <vector30>:
.globl vector30
vector30:
  pushl $0
  10212a:	6a 00                	push   $0x0
  pushl $30
  10212c:	6a 1e                	push   $0x1e
  jmp __alltraps
  10212e:	e9 69 09 00 00       	jmp    102a9c <__alltraps>

00102133 <vector31>:
.globl vector31
vector31:
  pushl $0
  102133:	6a 00                	push   $0x0
  pushl $31
  102135:	6a 1f                	push   $0x1f
  jmp __alltraps
  102137:	e9 60 09 00 00       	jmp    102a9c <__alltraps>

0010213c <vector32>:
.globl vector32
vector32:
  pushl $0
  10213c:	6a 00                	push   $0x0
  pushl $32
  10213e:	6a 20                	push   $0x20
  jmp __alltraps
  102140:	e9 57 09 00 00       	jmp    102a9c <__alltraps>

00102145 <vector33>:
.globl vector33
vector33:
  pushl $0
  102145:	6a 00                	push   $0x0
  pushl $33
  102147:	6a 21                	push   $0x21
  jmp __alltraps
  102149:	e9 4e 09 00 00       	jmp    102a9c <__alltraps>

0010214e <vector34>:
.globl vector34
vector34:
  pushl $0
  10214e:	6a 00                	push   $0x0
  pushl $34
  102150:	6a 22                	push   $0x22
  jmp __alltraps
  102152:	e9 45 09 00 00       	jmp    102a9c <__alltraps>

00102157 <vector35>:
.globl vector35
vector35:
  pushl $0
  102157:	6a 00                	push   $0x0
  pushl $35
  102159:	6a 23                	push   $0x23
  jmp __alltraps
  10215b:	e9 3c 09 00 00       	jmp    102a9c <__alltraps>

00102160 <vector36>:
.globl vector36
vector36:
  pushl $0
  102160:	6a 00                	push   $0x0
  pushl $36
  102162:	6a 24                	push   $0x24
  jmp __alltraps
  102164:	e9 33 09 00 00       	jmp    102a9c <__alltraps>

00102169 <vector37>:
.globl vector37
vector37:
  pushl $0
  102169:	6a 00                	push   $0x0
  pushl $37
  10216b:	6a 25                	push   $0x25
  jmp __alltraps
  10216d:	e9 2a 09 00 00       	jmp    102a9c <__alltraps>

00102172 <vector38>:
.globl vector38
vector38:
  pushl $0
  102172:	6a 00                	push   $0x0
  pushl $38
  102174:	6a 26                	push   $0x26
  jmp __alltraps
  102176:	e9 21 09 00 00       	jmp    102a9c <__alltraps>

0010217b <vector39>:
.globl vector39
vector39:
  pushl $0
  10217b:	6a 00                	push   $0x0
  pushl $39
  10217d:	6a 27                	push   $0x27
  jmp __alltraps
  10217f:	e9 18 09 00 00       	jmp    102a9c <__alltraps>

00102184 <vector40>:
.globl vector40
vector40:
  pushl $0
  102184:	6a 00                	push   $0x0
  pushl $40
  102186:	6a 28                	push   $0x28
  jmp __alltraps
  102188:	e9 0f 09 00 00       	jmp    102a9c <__alltraps>

0010218d <vector41>:
.globl vector41
vector41:
  pushl $0
  10218d:	6a 00                	push   $0x0
  pushl $41
  10218f:	6a 29                	push   $0x29
  jmp __alltraps
  102191:	e9 06 09 00 00       	jmp    102a9c <__alltraps>

00102196 <vector42>:
.globl vector42
vector42:
  pushl $0
  102196:	6a 00                	push   $0x0
  pushl $42
  102198:	6a 2a                	push   $0x2a
  jmp __alltraps
  10219a:	e9 fd 08 00 00       	jmp    102a9c <__alltraps>

0010219f <vector43>:
.globl vector43
vector43:
  pushl $0
  10219f:	6a 00                	push   $0x0
  pushl $43
  1021a1:	6a 2b                	push   $0x2b
  jmp __alltraps
  1021a3:	e9 f4 08 00 00       	jmp    102a9c <__alltraps>

001021a8 <vector44>:
.globl vector44
vector44:
  pushl $0
  1021a8:	6a 00                	push   $0x0
  pushl $44
  1021aa:	6a 2c                	push   $0x2c
  jmp __alltraps
  1021ac:	e9 eb 08 00 00       	jmp    102a9c <__alltraps>

001021b1 <vector45>:
.globl vector45
vector45:
  pushl $0
  1021b1:	6a 00                	push   $0x0
  pushl $45
  1021b3:	6a 2d                	push   $0x2d
  jmp __alltraps
  1021b5:	e9 e2 08 00 00       	jmp    102a9c <__alltraps>

001021ba <vector46>:
.globl vector46
vector46:
  pushl $0
  1021ba:	6a 00                	push   $0x0
  pushl $46
  1021bc:	6a 2e                	push   $0x2e
  jmp __alltraps
  1021be:	e9 d9 08 00 00       	jmp    102a9c <__alltraps>

001021c3 <vector47>:
.globl vector47
vector47:
  pushl $0
  1021c3:	6a 00                	push   $0x0
  pushl $47
  1021c5:	6a 2f                	push   $0x2f
  jmp __alltraps
  1021c7:	e9 d0 08 00 00       	jmp    102a9c <__alltraps>

001021cc <vector48>:
.globl vector48
vector48:
  pushl $0
  1021cc:	6a 00                	push   $0x0
  pushl $48
  1021ce:	6a 30                	push   $0x30
  jmp __alltraps
  1021d0:	e9 c7 08 00 00       	jmp    102a9c <__alltraps>

001021d5 <vector49>:
.globl vector49
vector49:
  pushl $0
  1021d5:	6a 00                	push   $0x0
  pushl $49
  1021d7:	6a 31                	push   $0x31
  jmp __alltraps
  1021d9:	e9 be 08 00 00       	jmp    102a9c <__alltraps>

001021de <vector50>:
.globl vector50
vector50:
  pushl $0
  1021de:	6a 00                	push   $0x0
  pushl $50
  1021e0:	6a 32                	push   $0x32
  jmp __alltraps
  1021e2:	e9 b5 08 00 00       	jmp    102a9c <__alltraps>

001021e7 <vector51>:
.globl vector51
vector51:
  pushl $0
  1021e7:	6a 00                	push   $0x0
  pushl $51
  1021e9:	6a 33                	push   $0x33
  jmp __alltraps
  1021eb:	e9 ac 08 00 00       	jmp    102a9c <__alltraps>

001021f0 <vector52>:
.globl vector52
vector52:
  pushl $0
  1021f0:	6a 00                	push   $0x0
  pushl $52
  1021f2:	6a 34                	push   $0x34
  jmp __alltraps
  1021f4:	e9 a3 08 00 00       	jmp    102a9c <__alltraps>

001021f9 <vector53>:
.globl vector53
vector53:
  pushl $0
  1021f9:	6a 00                	push   $0x0
  pushl $53
  1021fb:	6a 35                	push   $0x35
  jmp __alltraps
  1021fd:	e9 9a 08 00 00       	jmp    102a9c <__alltraps>

00102202 <vector54>:
.globl vector54
vector54:
  pushl $0
  102202:	6a 00                	push   $0x0
  pushl $54
  102204:	6a 36                	push   $0x36
  jmp __alltraps
  102206:	e9 91 08 00 00       	jmp    102a9c <__alltraps>

0010220b <vector55>:
.globl vector55
vector55:
  pushl $0
  10220b:	6a 00                	push   $0x0
  pushl $55
  10220d:	6a 37                	push   $0x37
  jmp __alltraps
  10220f:	e9 88 08 00 00       	jmp    102a9c <__alltraps>

00102214 <vector56>:
.globl vector56
vector56:
  pushl $0
  102214:	6a 00                	push   $0x0
  pushl $56
  102216:	6a 38                	push   $0x38
  jmp __alltraps
  102218:	e9 7f 08 00 00       	jmp    102a9c <__alltraps>

0010221d <vector57>:
.globl vector57
vector57:
  pushl $0
  10221d:	6a 00                	push   $0x0
  pushl $57
  10221f:	6a 39                	push   $0x39
  jmp __alltraps
  102221:	e9 76 08 00 00       	jmp    102a9c <__alltraps>

00102226 <vector58>:
.globl vector58
vector58:
  pushl $0
  102226:	6a 00                	push   $0x0
  pushl $58
  102228:	6a 3a                	push   $0x3a
  jmp __alltraps
  10222a:	e9 6d 08 00 00       	jmp    102a9c <__alltraps>

0010222f <vector59>:
.globl vector59
vector59:
  pushl $0
  10222f:	6a 00                	push   $0x0
  pushl $59
  102231:	6a 3b                	push   $0x3b
  jmp __alltraps
  102233:	e9 64 08 00 00       	jmp    102a9c <__alltraps>

00102238 <vector60>:
.globl vector60
vector60:
  pushl $0
  102238:	6a 00                	push   $0x0
  pushl $60
  10223a:	6a 3c                	push   $0x3c
  jmp __alltraps
  10223c:	e9 5b 08 00 00       	jmp    102a9c <__alltraps>

00102241 <vector61>:
.globl vector61
vector61:
  pushl $0
  102241:	6a 00                	push   $0x0
  pushl $61
  102243:	6a 3d                	push   $0x3d
  jmp __alltraps
  102245:	e9 52 08 00 00       	jmp    102a9c <__alltraps>

0010224a <vector62>:
.globl vector62
vector62:
  pushl $0
  10224a:	6a 00                	push   $0x0
  pushl $62
  10224c:	6a 3e                	push   $0x3e
  jmp __alltraps
  10224e:	e9 49 08 00 00       	jmp    102a9c <__alltraps>

00102253 <vector63>:
.globl vector63
vector63:
  pushl $0
  102253:	6a 00                	push   $0x0
  pushl $63
  102255:	6a 3f                	push   $0x3f
  jmp __alltraps
  102257:	e9 40 08 00 00       	jmp    102a9c <__alltraps>

0010225c <vector64>:
.globl vector64
vector64:
  pushl $0
  10225c:	6a 00                	push   $0x0
  pushl $64
  10225e:	6a 40                	push   $0x40
  jmp __alltraps
  102260:	e9 37 08 00 00       	jmp    102a9c <__alltraps>

00102265 <vector65>:
.globl vector65
vector65:
  pushl $0
  102265:	6a 00                	push   $0x0
  pushl $65
  102267:	6a 41                	push   $0x41
  jmp __alltraps
  102269:	e9 2e 08 00 00       	jmp    102a9c <__alltraps>

0010226e <vector66>:
.globl vector66
vector66:
  pushl $0
  10226e:	6a 00                	push   $0x0
  pushl $66
  102270:	6a 42                	push   $0x42
  jmp __alltraps
  102272:	e9 25 08 00 00       	jmp    102a9c <__alltraps>

00102277 <vector67>:
.globl vector67
vector67:
  pushl $0
  102277:	6a 00                	push   $0x0
  pushl $67
  102279:	6a 43                	push   $0x43
  jmp __alltraps
  10227b:	e9 1c 08 00 00       	jmp    102a9c <__alltraps>

00102280 <vector68>:
.globl vector68
vector68:
  pushl $0
  102280:	6a 00                	push   $0x0
  pushl $68
  102282:	6a 44                	push   $0x44
  jmp __alltraps
  102284:	e9 13 08 00 00       	jmp    102a9c <__alltraps>

00102289 <vector69>:
.globl vector69
vector69:
  pushl $0
  102289:	6a 00                	push   $0x0
  pushl $69
  10228b:	6a 45                	push   $0x45
  jmp __alltraps
  10228d:	e9 0a 08 00 00       	jmp    102a9c <__alltraps>

00102292 <vector70>:
.globl vector70
vector70:
  pushl $0
  102292:	6a 00                	push   $0x0
  pushl $70
  102294:	6a 46                	push   $0x46
  jmp __alltraps
  102296:	e9 01 08 00 00       	jmp    102a9c <__alltraps>

0010229b <vector71>:
.globl vector71
vector71:
  pushl $0
  10229b:	6a 00                	push   $0x0
  pushl $71
  10229d:	6a 47                	push   $0x47
  jmp __alltraps
  10229f:	e9 f8 07 00 00       	jmp    102a9c <__alltraps>

001022a4 <vector72>:
.globl vector72
vector72:
  pushl $0
  1022a4:	6a 00                	push   $0x0
  pushl $72
  1022a6:	6a 48                	push   $0x48
  jmp __alltraps
  1022a8:	e9 ef 07 00 00       	jmp    102a9c <__alltraps>

001022ad <vector73>:
.globl vector73
vector73:
  pushl $0
  1022ad:	6a 00                	push   $0x0
  pushl $73
  1022af:	6a 49                	push   $0x49
  jmp __alltraps
  1022b1:	e9 e6 07 00 00       	jmp    102a9c <__alltraps>

001022b6 <vector74>:
.globl vector74
vector74:
  pushl $0
  1022b6:	6a 00                	push   $0x0
  pushl $74
  1022b8:	6a 4a                	push   $0x4a
  jmp __alltraps
  1022ba:	e9 dd 07 00 00       	jmp    102a9c <__alltraps>

001022bf <vector75>:
.globl vector75
vector75:
  pushl $0
  1022bf:	6a 00                	push   $0x0
  pushl $75
  1022c1:	6a 4b                	push   $0x4b
  jmp __alltraps
  1022c3:	e9 d4 07 00 00       	jmp    102a9c <__alltraps>

001022c8 <vector76>:
.globl vector76
vector76:
  pushl $0
  1022c8:	6a 00                	push   $0x0
  pushl $76
  1022ca:	6a 4c                	push   $0x4c
  jmp __alltraps
  1022cc:	e9 cb 07 00 00       	jmp    102a9c <__alltraps>

001022d1 <vector77>:
.globl vector77
vector77:
  pushl $0
  1022d1:	6a 00                	push   $0x0
  pushl $77
  1022d3:	6a 4d                	push   $0x4d
  jmp __alltraps
  1022d5:	e9 c2 07 00 00       	jmp    102a9c <__alltraps>

001022da <vector78>:
.globl vector78
vector78:
  pushl $0
  1022da:	6a 00                	push   $0x0
  pushl $78
  1022dc:	6a 4e                	push   $0x4e
  jmp __alltraps
  1022de:	e9 b9 07 00 00       	jmp    102a9c <__alltraps>

001022e3 <vector79>:
.globl vector79
vector79:
  pushl $0
  1022e3:	6a 00                	push   $0x0
  pushl $79
  1022e5:	6a 4f                	push   $0x4f
  jmp __alltraps
  1022e7:	e9 b0 07 00 00       	jmp    102a9c <__alltraps>

001022ec <vector80>:
.globl vector80
vector80:
  pushl $0
  1022ec:	6a 00                	push   $0x0
  pushl $80
  1022ee:	6a 50                	push   $0x50
  jmp __alltraps
  1022f0:	e9 a7 07 00 00       	jmp    102a9c <__alltraps>

001022f5 <vector81>:
.globl vector81
vector81:
  pushl $0
  1022f5:	6a 00                	push   $0x0
  pushl $81
  1022f7:	6a 51                	push   $0x51
  jmp __alltraps
  1022f9:	e9 9e 07 00 00       	jmp    102a9c <__alltraps>

001022fe <vector82>:
.globl vector82
vector82:
  pushl $0
  1022fe:	6a 00                	push   $0x0
  pushl $82
  102300:	6a 52                	push   $0x52
  jmp __alltraps
  102302:	e9 95 07 00 00       	jmp    102a9c <__alltraps>

00102307 <vector83>:
.globl vector83
vector83:
  pushl $0
  102307:	6a 00                	push   $0x0
  pushl $83
  102309:	6a 53                	push   $0x53
  jmp __alltraps
  10230b:	e9 8c 07 00 00       	jmp    102a9c <__alltraps>

00102310 <vector84>:
.globl vector84
vector84:
  pushl $0
  102310:	6a 00                	push   $0x0
  pushl $84
  102312:	6a 54                	push   $0x54
  jmp __alltraps
  102314:	e9 83 07 00 00       	jmp    102a9c <__alltraps>

00102319 <vector85>:
.globl vector85
vector85:
  pushl $0
  102319:	6a 00                	push   $0x0
  pushl $85
  10231b:	6a 55                	push   $0x55
  jmp __alltraps
  10231d:	e9 7a 07 00 00       	jmp    102a9c <__alltraps>

00102322 <vector86>:
.globl vector86
vector86:
  pushl $0
  102322:	6a 00                	push   $0x0
  pushl $86
  102324:	6a 56                	push   $0x56
  jmp __alltraps
  102326:	e9 71 07 00 00       	jmp    102a9c <__alltraps>

0010232b <vector87>:
.globl vector87
vector87:
  pushl $0
  10232b:	6a 00                	push   $0x0
  pushl $87
  10232d:	6a 57                	push   $0x57
  jmp __alltraps
  10232f:	e9 68 07 00 00       	jmp    102a9c <__alltraps>

00102334 <vector88>:
.globl vector88
vector88:
  pushl $0
  102334:	6a 00                	push   $0x0
  pushl $88
  102336:	6a 58                	push   $0x58
  jmp __alltraps
  102338:	e9 5f 07 00 00       	jmp    102a9c <__alltraps>

0010233d <vector89>:
.globl vector89
vector89:
  pushl $0
  10233d:	6a 00                	push   $0x0
  pushl $89
  10233f:	6a 59                	push   $0x59
  jmp __alltraps
  102341:	e9 56 07 00 00       	jmp    102a9c <__alltraps>

00102346 <vector90>:
.globl vector90
vector90:
  pushl $0
  102346:	6a 00                	push   $0x0
  pushl $90
  102348:	6a 5a                	push   $0x5a
  jmp __alltraps
  10234a:	e9 4d 07 00 00       	jmp    102a9c <__alltraps>

0010234f <vector91>:
.globl vector91
vector91:
  pushl $0
  10234f:	6a 00                	push   $0x0
  pushl $91
  102351:	6a 5b                	push   $0x5b
  jmp __alltraps
  102353:	e9 44 07 00 00       	jmp    102a9c <__alltraps>

00102358 <vector92>:
.globl vector92
vector92:
  pushl $0
  102358:	6a 00                	push   $0x0
  pushl $92
  10235a:	6a 5c                	push   $0x5c
  jmp __alltraps
  10235c:	e9 3b 07 00 00       	jmp    102a9c <__alltraps>

00102361 <vector93>:
.globl vector93
vector93:
  pushl $0
  102361:	6a 00                	push   $0x0
  pushl $93
  102363:	6a 5d                	push   $0x5d
  jmp __alltraps
  102365:	e9 32 07 00 00       	jmp    102a9c <__alltraps>

0010236a <vector94>:
.globl vector94
vector94:
  pushl $0
  10236a:	6a 00                	push   $0x0
  pushl $94
  10236c:	6a 5e                	push   $0x5e
  jmp __alltraps
  10236e:	e9 29 07 00 00       	jmp    102a9c <__alltraps>

00102373 <vector95>:
.globl vector95
vector95:
  pushl $0
  102373:	6a 00                	push   $0x0
  pushl $95
  102375:	6a 5f                	push   $0x5f
  jmp __alltraps
  102377:	e9 20 07 00 00       	jmp    102a9c <__alltraps>

0010237c <vector96>:
.globl vector96
vector96:
  pushl $0
  10237c:	6a 00                	push   $0x0
  pushl $96
  10237e:	6a 60                	push   $0x60
  jmp __alltraps
  102380:	e9 17 07 00 00       	jmp    102a9c <__alltraps>

00102385 <vector97>:
.globl vector97
vector97:
  pushl $0
  102385:	6a 00                	push   $0x0
  pushl $97
  102387:	6a 61                	push   $0x61
  jmp __alltraps
  102389:	e9 0e 07 00 00       	jmp    102a9c <__alltraps>

0010238e <vector98>:
.globl vector98
vector98:
  pushl $0
  10238e:	6a 00                	push   $0x0
  pushl $98
  102390:	6a 62                	push   $0x62
  jmp __alltraps
  102392:	e9 05 07 00 00       	jmp    102a9c <__alltraps>

00102397 <vector99>:
.globl vector99
vector99:
  pushl $0
  102397:	6a 00                	push   $0x0
  pushl $99
  102399:	6a 63                	push   $0x63
  jmp __alltraps
  10239b:	e9 fc 06 00 00       	jmp    102a9c <__alltraps>

001023a0 <vector100>:
.globl vector100
vector100:
  pushl $0
  1023a0:	6a 00                	push   $0x0
  pushl $100
  1023a2:	6a 64                	push   $0x64
  jmp __alltraps
  1023a4:	e9 f3 06 00 00       	jmp    102a9c <__alltraps>

001023a9 <vector101>:
.globl vector101
vector101:
  pushl $0
  1023a9:	6a 00                	push   $0x0
  pushl $101
  1023ab:	6a 65                	push   $0x65
  jmp __alltraps
  1023ad:	e9 ea 06 00 00       	jmp    102a9c <__alltraps>

001023b2 <vector102>:
.globl vector102
vector102:
  pushl $0
  1023b2:	6a 00                	push   $0x0
  pushl $102
  1023b4:	6a 66                	push   $0x66
  jmp __alltraps
  1023b6:	e9 e1 06 00 00       	jmp    102a9c <__alltraps>

001023bb <vector103>:
.globl vector103
vector103:
  pushl $0
  1023bb:	6a 00                	push   $0x0
  pushl $103
  1023bd:	6a 67                	push   $0x67
  jmp __alltraps
  1023bf:	e9 d8 06 00 00       	jmp    102a9c <__alltraps>

001023c4 <vector104>:
.globl vector104
vector104:
  pushl $0
  1023c4:	6a 00                	push   $0x0
  pushl $104
  1023c6:	6a 68                	push   $0x68
  jmp __alltraps
  1023c8:	e9 cf 06 00 00       	jmp    102a9c <__alltraps>

001023cd <vector105>:
.globl vector105
vector105:
  pushl $0
  1023cd:	6a 00                	push   $0x0
  pushl $105
  1023cf:	6a 69                	push   $0x69
  jmp __alltraps
  1023d1:	e9 c6 06 00 00       	jmp    102a9c <__alltraps>

001023d6 <vector106>:
.globl vector106
vector106:
  pushl $0
  1023d6:	6a 00                	push   $0x0
  pushl $106
  1023d8:	6a 6a                	push   $0x6a
  jmp __alltraps
  1023da:	e9 bd 06 00 00       	jmp    102a9c <__alltraps>

001023df <vector107>:
.globl vector107
vector107:
  pushl $0
  1023df:	6a 00                	push   $0x0
  pushl $107
  1023e1:	6a 6b                	push   $0x6b
  jmp __alltraps
  1023e3:	e9 b4 06 00 00       	jmp    102a9c <__alltraps>

001023e8 <vector108>:
.globl vector108
vector108:
  pushl $0
  1023e8:	6a 00                	push   $0x0
  pushl $108
  1023ea:	6a 6c                	push   $0x6c
  jmp __alltraps
  1023ec:	e9 ab 06 00 00       	jmp    102a9c <__alltraps>

001023f1 <vector109>:
.globl vector109
vector109:
  pushl $0
  1023f1:	6a 00                	push   $0x0
  pushl $109
  1023f3:	6a 6d                	push   $0x6d
  jmp __alltraps
  1023f5:	e9 a2 06 00 00       	jmp    102a9c <__alltraps>

001023fa <vector110>:
.globl vector110
vector110:
  pushl $0
  1023fa:	6a 00                	push   $0x0
  pushl $110
  1023fc:	6a 6e                	push   $0x6e
  jmp __alltraps
  1023fe:	e9 99 06 00 00       	jmp    102a9c <__alltraps>

00102403 <vector111>:
.globl vector111
vector111:
  pushl $0
  102403:	6a 00                	push   $0x0
  pushl $111
  102405:	6a 6f                	push   $0x6f
  jmp __alltraps
  102407:	e9 90 06 00 00       	jmp    102a9c <__alltraps>

0010240c <vector112>:
.globl vector112
vector112:
  pushl $0
  10240c:	6a 00                	push   $0x0
  pushl $112
  10240e:	6a 70                	push   $0x70
  jmp __alltraps
  102410:	e9 87 06 00 00       	jmp    102a9c <__alltraps>

00102415 <vector113>:
.globl vector113
vector113:
  pushl $0
  102415:	6a 00                	push   $0x0
  pushl $113
  102417:	6a 71                	push   $0x71
  jmp __alltraps
  102419:	e9 7e 06 00 00       	jmp    102a9c <__alltraps>

0010241e <vector114>:
.globl vector114
vector114:
  pushl $0
  10241e:	6a 00                	push   $0x0
  pushl $114
  102420:	6a 72                	push   $0x72
  jmp __alltraps
  102422:	e9 75 06 00 00       	jmp    102a9c <__alltraps>

00102427 <vector115>:
.globl vector115
vector115:
  pushl $0
  102427:	6a 00                	push   $0x0
  pushl $115
  102429:	6a 73                	push   $0x73
  jmp __alltraps
  10242b:	e9 6c 06 00 00       	jmp    102a9c <__alltraps>

00102430 <vector116>:
.globl vector116
vector116:
  pushl $0
  102430:	6a 00                	push   $0x0
  pushl $116
  102432:	6a 74                	push   $0x74
  jmp __alltraps
  102434:	e9 63 06 00 00       	jmp    102a9c <__alltraps>

00102439 <vector117>:
.globl vector117
vector117:
  pushl $0
  102439:	6a 00                	push   $0x0
  pushl $117
  10243b:	6a 75                	push   $0x75
  jmp __alltraps
  10243d:	e9 5a 06 00 00       	jmp    102a9c <__alltraps>

00102442 <vector118>:
.globl vector118
vector118:
  pushl $0
  102442:	6a 00                	push   $0x0
  pushl $118
  102444:	6a 76                	push   $0x76
  jmp __alltraps
  102446:	e9 51 06 00 00       	jmp    102a9c <__alltraps>

0010244b <vector119>:
.globl vector119
vector119:
  pushl $0
  10244b:	6a 00                	push   $0x0
  pushl $119
  10244d:	6a 77                	push   $0x77
  jmp __alltraps
  10244f:	e9 48 06 00 00       	jmp    102a9c <__alltraps>

00102454 <vector120>:
.globl vector120
vector120:
  pushl $0
  102454:	6a 00                	push   $0x0
  pushl $120
  102456:	6a 78                	push   $0x78
  jmp __alltraps
  102458:	e9 3f 06 00 00       	jmp    102a9c <__alltraps>

0010245d <vector121>:
.globl vector121
vector121:
  pushl $0
  10245d:	6a 00                	push   $0x0
  pushl $121
  10245f:	6a 79                	push   $0x79
  jmp __alltraps
  102461:	e9 36 06 00 00       	jmp    102a9c <__alltraps>

00102466 <vector122>:
.globl vector122
vector122:
  pushl $0
  102466:	6a 00                	push   $0x0
  pushl $122
  102468:	6a 7a                	push   $0x7a
  jmp __alltraps
  10246a:	e9 2d 06 00 00       	jmp    102a9c <__alltraps>

0010246f <vector123>:
.globl vector123
vector123:
  pushl $0
  10246f:	6a 00                	push   $0x0
  pushl $123
  102471:	6a 7b                	push   $0x7b
  jmp __alltraps
  102473:	e9 24 06 00 00       	jmp    102a9c <__alltraps>

00102478 <vector124>:
.globl vector124
vector124:
  pushl $0
  102478:	6a 00                	push   $0x0
  pushl $124
  10247a:	6a 7c                	push   $0x7c
  jmp __alltraps
  10247c:	e9 1b 06 00 00       	jmp    102a9c <__alltraps>

00102481 <vector125>:
.globl vector125
vector125:
  pushl $0
  102481:	6a 00                	push   $0x0
  pushl $125
  102483:	6a 7d                	push   $0x7d
  jmp __alltraps
  102485:	e9 12 06 00 00       	jmp    102a9c <__alltraps>

0010248a <vector126>:
.globl vector126
vector126:
  pushl $0
  10248a:	6a 00                	push   $0x0
  pushl $126
  10248c:	6a 7e                	push   $0x7e
  jmp __alltraps
  10248e:	e9 09 06 00 00       	jmp    102a9c <__alltraps>

00102493 <vector127>:
.globl vector127
vector127:
  pushl $0
  102493:	6a 00                	push   $0x0
  pushl $127
  102495:	6a 7f                	push   $0x7f
  jmp __alltraps
  102497:	e9 00 06 00 00       	jmp    102a9c <__alltraps>

0010249c <vector128>:
.globl vector128
vector128:
  pushl $0
  10249c:	6a 00                	push   $0x0
  pushl $128
  10249e:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1024a3:	e9 f4 05 00 00       	jmp    102a9c <__alltraps>

001024a8 <vector129>:
.globl vector129
vector129:
  pushl $0
  1024a8:	6a 00                	push   $0x0
  pushl $129
  1024aa:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1024af:	e9 e8 05 00 00       	jmp    102a9c <__alltraps>

001024b4 <vector130>:
.globl vector130
vector130:
  pushl $0
  1024b4:	6a 00                	push   $0x0
  pushl $130
  1024b6:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  1024bb:	e9 dc 05 00 00       	jmp    102a9c <__alltraps>

001024c0 <vector131>:
.globl vector131
vector131:
  pushl $0
  1024c0:	6a 00                	push   $0x0
  pushl $131
  1024c2:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  1024c7:	e9 d0 05 00 00       	jmp    102a9c <__alltraps>

001024cc <vector132>:
.globl vector132
vector132:
  pushl $0
  1024cc:	6a 00                	push   $0x0
  pushl $132
  1024ce:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1024d3:	e9 c4 05 00 00       	jmp    102a9c <__alltraps>

001024d8 <vector133>:
.globl vector133
vector133:
  pushl $0
  1024d8:	6a 00                	push   $0x0
  pushl $133
  1024da:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1024df:	e9 b8 05 00 00       	jmp    102a9c <__alltraps>

001024e4 <vector134>:
.globl vector134
vector134:
  pushl $0
  1024e4:	6a 00                	push   $0x0
  pushl $134
  1024e6:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1024eb:	e9 ac 05 00 00       	jmp    102a9c <__alltraps>

001024f0 <vector135>:
.globl vector135
vector135:
  pushl $0
  1024f0:	6a 00                	push   $0x0
  pushl $135
  1024f2:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1024f7:	e9 a0 05 00 00       	jmp    102a9c <__alltraps>

001024fc <vector136>:
.globl vector136
vector136:
  pushl $0
  1024fc:	6a 00                	push   $0x0
  pushl $136
  1024fe:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102503:	e9 94 05 00 00       	jmp    102a9c <__alltraps>

00102508 <vector137>:
.globl vector137
vector137:
  pushl $0
  102508:	6a 00                	push   $0x0
  pushl $137
  10250a:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10250f:	e9 88 05 00 00       	jmp    102a9c <__alltraps>

00102514 <vector138>:
.globl vector138
vector138:
  pushl $0
  102514:	6a 00                	push   $0x0
  pushl $138
  102516:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  10251b:	e9 7c 05 00 00       	jmp    102a9c <__alltraps>

00102520 <vector139>:
.globl vector139
vector139:
  pushl $0
  102520:	6a 00                	push   $0x0
  pushl $139
  102522:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102527:	e9 70 05 00 00       	jmp    102a9c <__alltraps>

0010252c <vector140>:
.globl vector140
vector140:
  pushl $0
  10252c:	6a 00                	push   $0x0
  pushl $140
  10252e:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102533:	e9 64 05 00 00       	jmp    102a9c <__alltraps>

00102538 <vector141>:
.globl vector141
vector141:
  pushl $0
  102538:	6a 00                	push   $0x0
  pushl $141
  10253a:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10253f:	e9 58 05 00 00       	jmp    102a9c <__alltraps>

00102544 <vector142>:
.globl vector142
vector142:
  pushl $0
  102544:	6a 00                	push   $0x0
  pushl $142
  102546:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  10254b:	e9 4c 05 00 00       	jmp    102a9c <__alltraps>

00102550 <vector143>:
.globl vector143
vector143:
  pushl $0
  102550:	6a 00                	push   $0x0
  pushl $143
  102552:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102557:	e9 40 05 00 00       	jmp    102a9c <__alltraps>

0010255c <vector144>:
.globl vector144
vector144:
  pushl $0
  10255c:	6a 00                	push   $0x0
  pushl $144
  10255e:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102563:	e9 34 05 00 00       	jmp    102a9c <__alltraps>

00102568 <vector145>:
.globl vector145
vector145:
  pushl $0
  102568:	6a 00                	push   $0x0
  pushl $145
  10256a:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10256f:	e9 28 05 00 00       	jmp    102a9c <__alltraps>

00102574 <vector146>:
.globl vector146
vector146:
  pushl $0
  102574:	6a 00                	push   $0x0
  pushl $146
  102576:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  10257b:	e9 1c 05 00 00       	jmp    102a9c <__alltraps>

00102580 <vector147>:
.globl vector147
vector147:
  pushl $0
  102580:	6a 00                	push   $0x0
  pushl $147
  102582:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102587:	e9 10 05 00 00       	jmp    102a9c <__alltraps>

0010258c <vector148>:
.globl vector148
vector148:
  pushl $0
  10258c:	6a 00                	push   $0x0
  pushl $148
  10258e:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102593:	e9 04 05 00 00       	jmp    102a9c <__alltraps>

00102598 <vector149>:
.globl vector149
vector149:
  pushl $0
  102598:	6a 00                	push   $0x0
  pushl $149
  10259a:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10259f:	e9 f8 04 00 00       	jmp    102a9c <__alltraps>

001025a4 <vector150>:
.globl vector150
vector150:
  pushl $0
  1025a4:	6a 00                	push   $0x0
  pushl $150
  1025a6:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1025ab:	e9 ec 04 00 00       	jmp    102a9c <__alltraps>

001025b0 <vector151>:
.globl vector151
vector151:
  pushl $0
  1025b0:	6a 00                	push   $0x0
  pushl $151
  1025b2:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1025b7:	e9 e0 04 00 00       	jmp    102a9c <__alltraps>

001025bc <vector152>:
.globl vector152
vector152:
  pushl $0
  1025bc:	6a 00                	push   $0x0
  pushl $152
  1025be:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1025c3:	e9 d4 04 00 00       	jmp    102a9c <__alltraps>

001025c8 <vector153>:
.globl vector153
vector153:
  pushl $0
  1025c8:	6a 00                	push   $0x0
  pushl $153
  1025ca:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1025cf:	e9 c8 04 00 00       	jmp    102a9c <__alltraps>

001025d4 <vector154>:
.globl vector154
vector154:
  pushl $0
  1025d4:	6a 00                	push   $0x0
  pushl $154
  1025d6:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1025db:	e9 bc 04 00 00       	jmp    102a9c <__alltraps>

001025e0 <vector155>:
.globl vector155
vector155:
  pushl $0
  1025e0:	6a 00                	push   $0x0
  pushl $155
  1025e2:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1025e7:	e9 b0 04 00 00       	jmp    102a9c <__alltraps>

001025ec <vector156>:
.globl vector156
vector156:
  pushl $0
  1025ec:	6a 00                	push   $0x0
  pushl $156
  1025ee:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1025f3:	e9 a4 04 00 00       	jmp    102a9c <__alltraps>

001025f8 <vector157>:
.globl vector157
vector157:
  pushl $0
  1025f8:	6a 00                	push   $0x0
  pushl $157
  1025fa:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1025ff:	e9 98 04 00 00       	jmp    102a9c <__alltraps>

00102604 <vector158>:
.globl vector158
vector158:
  pushl $0
  102604:	6a 00                	push   $0x0
  pushl $158
  102606:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  10260b:	e9 8c 04 00 00       	jmp    102a9c <__alltraps>

00102610 <vector159>:
.globl vector159
vector159:
  pushl $0
  102610:	6a 00                	push   $0x0
  pushl $159
  102612:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102617:	e9 80 04 00 00       	jmp    102a9c <__alltraps>

0010261c <vector160>:
.globl vector160
vector160:
  pushl $0
  10261c:	6a 00                	push   $0x0
  pushl $160
  10261e:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102623:	e9 74 04 00 00       	jmp    102a9c <__alltraps>

00102628 <vector161>:
.globl vector161
vector161:
  pushl $0
  102628:	6a 00                	push   $0x0
  pushl $161
  10262a:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10262f:	e9 68 04 00 00       	jmp    102a9c <__alltraps>

00102634 <vector162>:
.globl vector162
vector162:
  pushl $0
  102634:	6a 00                	push   $0x0
  pushl $162
  102636:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  10263b:	e9 5c 04 00 00       	jmp    102a9c <__alltraps>

00102640 <vector163>:
.globl vector163
vector163:
  pushl $0
  102640:	6a 00                	push   $0x0
  pushl $163
  102642:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102647:	e9 50 04 00 00       	jmp    102a9c <__alltraps>

0010264c <vector164>:
.globl vector164
vector164:
  pushl $0
  10264c:	6a 00                	push   $0x0
  pushl $164
  10264e:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102653:	e9 44 04 00 00       	jmp    102a9c <__alltraps>

00102658 <vector165>:
.globl vector165
vector165:
  pushl $0
  102658:	6a 00                	push   $0x0
  pushl $165
  10265a:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10265f:	e9 38 04 00 00       	jmp    102a9c <__alltraps>

00102664 <vector166>:
.globl vector166
vector166:
  pushl $0
  102664:	6a 00                	push   $0x0
  pushl $166
  102666:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  10266b:	e9 2c 04 00 00       	jmp    102a9c <__alltraps>

00102670 <vector167>:
.globl vector167
vector167:
  pushl $0
  102670:	6a 00                	push   $0x0
  pushl $167
  102672:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102677:	e9 20 04 00 00       	jmp    102a9c <__alltraps>

0010267c <vector168>:
.globl vector168
vector168:
  pushl $0
  10267c:	6a 00                	push   $0x0
  pushl $168
  10267e:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102683:	e9 14 04 00 00       	jmp    102a9c <__alltraps>

00102688 <vector169>:
.globl vector169
vector169:
  pushl $0
  102688:	6a 00                	push   $0x0
  pushl $169
  10268a:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10268f:	e9 08 04 00 00       	jmp    102a9c <__alltraps>

00102694 <vector170>:
.globl vector170
vector170:
  pushl $0
  102694:	6a 00                	push   $0x0
  pushl $170
  102696:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10269b:	e9 fc 03 00 00       	jmp    102a9c <__alltraps>

001026a0 <vector171>:
.globl vector171
vector171:
  pushl $0
  1026a0:	6a 00                	push   $0x0
  pushl $171
  1026a2:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1026a7:	e9 f0 03 00 00       	jmp    102a9c <__alltraps>

001026ac <vector172>:
.globl vector172
vector172:
  pushl $0
  1026ac:	6a 00                	push   $0x0
  pushl $172
  1026ae:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1026b3:	e9 e4 03 00 00       	jmp    102a9c <__alltraps>

001026b8 <vector173>:
.globl vector173
vector173:
  pushl $0
  1026b8:	6a 00                	push   $0x0
  pushl $173
  1026ba:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1026bf:	e9 d8 03 00 00       	jmp    102a9c <__alltraps>

001026c4 <vector174>:
.globl vector174
vector174:
  pushl $0
  1026c4:	6a 00                	push   $0x0
  pushl $174
  1026c6:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1026cb:	e9 cc 03 00 00       	jmp    102a9c <__alltraps>

001026d0 <vector175>:
.globl vector175
vector175:
  pushl $0
  1026d0:	6a 00                	push   $0x0
  pushl $175
  1026d2:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1026d7:	e9 c0 03 00 00       	jmp    102a9c <__alltraps>

001026dc <vector176>:
.globl vector176
vector176:
  pushl $0
  1026dc:	6a 00                	push   $0x0
  pushl $176
  1026de:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1026e3:	e9 b4 03 00 00       	jmp    102a9c <__alltraps>

001026e8 <vector177>:
.globl vector177
vector177:
  pushl $0
  1026e8:	6a 00                	push   $0x0
  pushl $177
  1026ea:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1026ef:	e9 a8 03 00 00       	jmp    102a9c <__alltraps>

001026f4 <vector178>:
.globl vector178
vector178:
  pushl $0
  1026f4:	6a 00                	push   $0x0
  pushl $178
  1026f6:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1026fb:	e9 9c 03 00 00       	jmp    102a9c <__alltraps>

00102700 <vector179>:
.globl vector179
vector179:
  pushl $0
  102700:	6a 00                	push   $0x0
  pushl $179
  102702:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102707:	e9 90 03 00 00       	jmp    102a9c <__alltraps>

0010270c <vector180>:
.globl vector180
vector180:
  pushl $0
  10270c:	6a 00                	push   $0x0
  pushl $180
  10270e:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102713:	e9 84 03 00 00       	jmp    102a9c <__alltraps>

00102718 <vector181>:
.globl vector181
vector181:
  pushl $0
  102718:	6a 00                	push   $0x0
  pushl $181
  10271a:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10271f:	e9 78 03 00 00       	jmp    102a9c <__alltraps>

00102724 <vector182>:
.globl vector182
vector182:
  pushl $0
  102724:	6a 00                	push   $0x0
  pushl $182
  102726:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  10272b:	e9 6c 03 00 00       	jmp    102a9c <__alltraps>

00102730 <vector183>:
.globl vector183
vector183:
  pushl $0
  102730:	6a 00                	push   $0x0
  pushl $183
  102732:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102737:	e9 60 03 00 00       	jmp    102a9c <__alltraps>

0010273c <vector184>:
.globl vector184
vector184:
  pushl $0
  10273c:	6a 00                	push   $0x0
  pushl $184
  10273e:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102743:	e9 54 03 00 00       	jmp    102a9c <__alltraps>

00102748 <vector185>:
.globl vector185
vector185:
  pushl $0
  102748:	6a 00                	push   $0x0
  pushl $185
  10274a:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10274f:	e9 48 03 00 00       	jmp    102a9c <__alltraps>

00102754 <vector186>:
.globl vector186
vector186:
  pushl $0
  102754:	6a 00                	push   $0x0
  pushl $186
  102756:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  10275b:	e9 3c 03 00 00       	jmp    102a9c <__alltraps>

00102760 <vector187>:
.globl vector187
vector187:
  pushl $0
  102760:	6a 00                	push   $0x0
  pushl $187
  102762:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102767:	e9 30 03 00 00       	jmp    102a9c <__alltraps>

0010276c <vector188>:
.globl vector188
vector188:
  pushl $0
  10276c:	6a 00                	push   $0x0
  pushl $188
  10276e:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102773:	e9 24 03 00 00       	jmp    102a9c <__alltraps>

00102778 <vector189>:
.globl vector189
vector189:
  pushl $0
  102778:	6a 00                	push   $0x0
  pushl $189
  10277a:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10277f:	e9 18 03 00 00       	jmp    102a9c <__alltraps>

00102784 <vector190>:
.globl vector190
vector190:
  pushl $0
  102784:	6a 00                	push   $0x0
  pushl $190
  102786:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10278b:	e9 0c 03 00 00       	jmp    102a9c <__alltraps>

00102790 <vector191>:
.globl vector191
vector191:
  pushl $0
  102790:	6a 00                	push   $0x0
  pushl $191
  102792:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102797:	e9 00 03 00 00       	jmp    102a9c <__alltraps>

0010279c <vector192>:
.globl vector192
vector192:
  pushl $0
  10279c:	6a 00                	push   $0x0
  pushl $192
  10279e:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1027a3:	e9 f4 02 00 00       	jmp    102a9c <__alltraps>

001027a8 <vector193>:
.globl vector193
vector193:
  pushl $0
  1027a8:	6a 00                	push   $0x0
  pushl $193
  1027aa:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1027af:	e9 e8 02 00 00       	jmp    102a9c <__alltraps>

001027b4 <vector194>:
.globl vector194
vector194:
  pushl $0
  1027b4:	6a 00                	push   $0x0
  pushl $194
  1027b6:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1027bb:	e9 dc 02 00 00       	jmp    102a9c <__alltraps>

001027c0 <vector195>:
.globl vector195
vector195:
  pushl $0
  1027c0:	6a 00                	push   $0x0
  pushl $195
  1027c2:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1027c7:	e9 d0 02 00 00       	jmp    102a9c <__alltraps>

001027cc <vector196>:
.globl vector196
vector196:
  pushl $0
  1027cc:	6a 00                	push   $0x0
  pushl $196
  1027ce:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1027d3:	e9 c4 02 00 00       	jmp    102a9c <__alltraps>

001027d8 <vector197>:
.globl vector197
vector197:
  pushl $0
  1027d8:	6a 00                	push   $0x0
  pushl $197
  1027da:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1027df:	e9 b8 02 00 00       	jmp    102a9c <__alltraps>

001027e4 <vector198>:
.globl vector198
vector198:
  pushl $0
  1027e4:	6a 00                	push   $0x0
  pushl $198
  1027e6:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1027eb:	e9 ac 02 00 00       	jmp    102a9c <__alltraps>

001027f0 <vector199>:
.globl vector199
vector199:
  pushl $0
  1027f0:	6a 00                	push   $0x0
  pushl $199
  1027f2:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1027f7:	e9 a0 02 00 00       	jmp    102a9c <__alltraps>

001027fc <vector200>:
.globl vector200
vector200:
  pushl $0
  1027fc:	6a 00                	push   $0x0
  pushl $200
  1027fe:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102803:	e9 94 02 00 00       	jmp    102a9c <__alltraps>

00102808 <vector201>:
.globl vector201
vector201:
  pushl $0
  102808:	6a 00                	push   $0x0
  pushl $201
  10280a:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10280f:	e9 88 02 00 00       	jmp    102a9c <__alltraps>

00102814 <vector202>:
.globl vector202
vector202:
  pushl $0
  102814:	6a 00                	push   $0x0
  pushl $202
  102816:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  10281b:	e9 7c 02 00 00       	jmp    102a9c <__alltraps>

00102820 <vector203>:
.globl vector203
vector203:
  pushl $0
  102820:	6a 00                	push   $0x0
  pushl $203
  102822:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102827:	e9 70 02 00 00       	jmp    102a9c <__alltraps>

0010282c <vector204>:
.globl vector204
vector204:
  pushl $0
  10282c:	6a 00                	push   $0x0
  pushl $204
  10282e:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102833:	e9 64 02 00 00       	jmp    102a9c <__alltraps>

00102838 <vector205>:
.globl vector205
vector205:
  pushl $0
  102838:	6a 00                	push   $0x0
  pushl $205
  10283a:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10283f:	e9 58 02 00 00       	jmp    102a9c <__alltraps>

00102844 <vector206>:
.globl vector206
vector206:
  pushl $0
  102844:	6a 00                	push   $0x0
  pushl $206
  102846:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  10284b:	e9 4c 02 00 00       	jmp    102a9c <__alltraps>

00102850 <vector207>:
.globl vector207
vector207:
  pushl $0
  102850:	6a 00                	push   $0x0
  pushl $207
  102852:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102857:	e9 40 02 00 00       	jmp    102a9c <__alltraps>

0010285c <vector208>:
.globl vector208
vector208:
  pushl $0
  10285c:	6a 00                	push   $0x0
  pushl $208
  10285e:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102863:	e9 34 02 00 00       	jmp    102a9c <__alltraps>

00102868 <vector209>:
.globl vector209
vector209:
  pushl $0
  102868:	6a 00                	push   $0x0
  pushl $209
  10286a:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10286f:	e9 28 02 00 00       	jmp    102a9c <__alltraps>

00102874 <vector210>:
.globl vector210
vector210:
  pushl $0
  102874:	6a 00                	push   $0x0
  pushl $210
  102876:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  10287b:	e9 1c 02 00 00       	jmp    102a9c <__alltraps>

00102880 <vector211>:
.globl vector211
vector211:
  pushl $0
  102880:	6a 00                	push   $0x0
  pushl $211
  102882:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102887:	e9 10 02 00 00       	jmp    102a9c <__alltraps>

0010288c <vector212>:
.globl vector212
vector212:
  pushl $0
  10288c:	6a 00                	push   $0x0
  pushl $212
  10288e:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102893:	e9 04 02 00 00       	jmp    102a9c <__alltraps>

00102898 <vector213>:
.globl vector213
vector213:
  pushl $0
  102898:	6a 00                	push   $0x0
  pushl $213
  10289a:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10289f:	e9 f8 01 00 00       	jmp    102a9c <__alltraps>

001028a4 <vector214>:
.globl vector214
vector214:
  pushl $0
  1028a4:	6a 00                	push   $0x0
  pushl $214
  1028a6:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1028ab:	e9 ec 01 00 00       	jmp    102a9c <__alltraps>

001028b0 <vector215>:
.globl vector215
vector215:
  pushl $0
  1028b0:	6a 00                	push   $0x0
  pushl $215
  1028b2:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1028b7:	e9 e0 01 00 00       	jmp    102a9c <__alltraps>

001028bc <vector216>:
.globl vector216
vector216:
  pushl $0
  1028bc:	6a 00                	push   $0x0
  pushl $216
  1028be:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1028c3:	e9 d4 01 00 00       	jmp    102a9c <__alltraps>

001028c8 <vector217>:
.globl vector217
vector217:
  pushl $0
  1028c8:	6a 00                	push   $0x0
  pushl $217
  1028ca:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1028cf:	e9 c8 01 00 00       	jmp    102a9c <__alltraps>

001028d4 <vector218>:
.globl vector218
vector218:
  pushl $0
  1028d4:	6a 00                	push   $0x0
  pushl $218
  1028d6:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1028db:	e9 bc 01 00 00       	jmp    102a9c <__alltraps>

001028e0 <vector219>:
.globl vector219
vector219:
  pushl $0
  1028e0:	6a 00                	push   $0x0
  pushl $219
  1028e2:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1028e7:	e9 b0 01 00 00       	jmp    102a9c <__alltraps>

001028ec <vector220>:
.globl vector220
vector220:
  pushl $0
  1028ec:	6a 00                	push   $0x0
  pushl $220
  1028ee:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1028f3:	e9 a4 01 00 00       	jmp    102a9c <__alltraps>

001028f8 <vector221>:
.globl vector221
vector221:
  pushl $0
  1028f8:	6a 00                	push   $0x0
  pushl $221
  1028fa:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1028ff:	e9 98 01 00 00       	jmp    102a9c <__alltraps>

00102904 <vector222>:
.globl vector222
vector222:
  pushl $0
  102904:	6a 00                	push   $0x0
  pushl $222
  102906:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  10290b:	e9 8c 01 00 00       	jmp    102a9c <__alltraps>

00102910 <vector223>:
.globl vector223
vector223:
  pushl $0
  102910:	6a 00                	push   $0x0
  pushl $223
  102912:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102917:	e9 80 01 00 00       	jmp    102a9c <__alltraps>

0010291c <vector224>:
.globl vector224
vector224:
  pushl $0
  10291c:	6a 00                	push   $0x0
  pushl $224
  10291e:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102923:	e9 74 01 00 00       	jmp    102a9c <__alltraps>

00102928 <vector225>:
.globl vector225
vector225:
  pushl $0
  102928:	6a 00                	push   $0x0
  pushl $225
  10292a:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10292f:	e9 68 01 00 00       	jmp    102a9c <__alltraps>

00102934 <vector226>:
.globl vector226
vector226:
  pushl $0
  102934:	6a 00                	push   $0x0
  pushl $226
  102936:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  10293b:	e9 5c 01 00 00       	jmp    102a9c <__alltraps>

00102940 <vector227>:
.globl vector227
vector227:
  pushl $0
  102940:	6a 00                	push   $0x0
  pushl $227
  102942:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102947:	e9 50 01 00 00       	jmp    102a9c <__alltraps>

0010294c <vector228>:
.globl vector228
vector228:
  pushl $0
  10294c:	6a 00                	push   $0x0
  pushl $228
  10294e:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102953:	e9 44 01 00 00       	jmp    102a9c <__alltraps>

00102958 <vector229>:
.globl vector229
vector229:
  pushl $0
  102958:	6a 00                	push   $0x0
  pushl $229
  10295a:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10295f:	e9 38 01 00 00       	jmp    102a9c <__alltraps>

00102964 <vector230>:
.globl vector230
vector230:
  pushl $0
  102964:	6a 00                	push   $0x0
  pushl $230
  102966:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  10296b:	e9 2c 01 00 00       	jmp    102a9c <__alltraps>

00102970 <vector231>:
.globl vector231
vector231:
  pushl $0
  102970:	6a 00                	push   $0x0
  pushl $231
  102972:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102977:	e9 20 01 00 00       	jmp    102a9c <__alltraps>

0010297c <vector232>:
.globl vector232
vector232:
  pushl $0
  10297c:	6a 00                	push   $0x0
  pushl $232
  10297e:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102983:	e9 14 01 00 00       	jmp    102a9c <__alltraps>

00102988 <vector233>:
.globl vector233
vector233:
  pushl $0
  102988:	6a 00                	push   $0x0
  pushl $233
  10298a:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10298f:	e9 08 01 00 00       	jmp    102a9c <__alltraps>

00102994 <vector234>:
.globl vector234
vector234:
  pushl $0
  102994:	6a 00                	push   $0x0
  pushl $234
  102996:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10299b:	e9 fc 00 00 00       	jmp    102a9c <__alltraps>

001029a0 <vector235>:
.globl vector235
vector235:
  pushl $0
  1029a0:	6a 00                	push   $0x0
  pushl $235
  1029a2:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1029a7:	e9 f0 00 00 00       	jmp    102a9c <__alltraps>

001029ac <vector236>:
.globl vector236
vector236:
  pushl $0
  1029ac:	6a 00                	push   $0x0
  pushl $236
  1029ae:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1029b3:	e9 e4 00 00 00       	jmp    102a9c <__alltraps>

001029b8 <vector237>:
.globl vector237
vector237:
  pushl $0
  1029b8:	6a 00                	push   $0x0
  pushl $237
  1029ba:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1029bf:	e9 d8 00 00 00       	jmp    102a9c <__alltraps>

001029c4 <vector238>:
.globl vector238
vector238:
  pushl $0
  1029c4:	6a 00                	push   $0x0
  pushl $238
  1029c6:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1029cb:	e9 cc 00 00 00       	jmp    102a9c <__alltraps>

001029d0 <vector239>:
.globl vector239
vector239:
  pushl $0
  1029d0:	6a 00                	push   $0x0
  pushl $239
  1029d2:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1029d7:	e9 c0 00 00 00       	jmp    102a9c <__alltraps>

001029dc <vector240>:
.globl vector240
vector240:
  pushl $0
  1029dc:	6a 00                	push   $0x0
  pushl $240
  1029de:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1029e3:	e9 b4 00 00 00       	jmp    102a9c <__alltraps>

001029e8 <vector241>:
.globl vector241
vector241:
  pushl $0
  1029e8:	6a 00                	push   $0x0
  pushl $241
  1029ea:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1029ef:	e9 a8 00 00 00       	jmp    102a9c <__alltraps>

001029f4 <vector242>:
.globl vector242
vector242:
  pushl $0
  1029f4:	6a 00                	push   $0x0
  pushl $242
  1029f6:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1029fb:	e9 9c 00 00 00       	jmp    102a9c <__alltraps>

00102a00 <vector243>:
.globl vector243
vector243:
  pushl $0
  102a00:	6a 00                	push   $0x0
  pushl $243
  102a02:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102a07:	e9 90 00 00 00       	jmp    102a9c <__alltraps>

00102a0c <vector244>:
.globl vector244
vector244:
  pushl $0
  102a0c:	6a 00                	push   $0x0
  pushl $244
  102a0e:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102a13:	e9 84 00 00 00       	jmp    102a9c <__alltraps>

00102a18 <vector245>:
.globl vector245
vector245:
  pushl $0
  102a18:	6a 00                	push   $0x0
  pushl $245
  102a1a:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102a1f:	e9 78 00 00 00       	jmp    102a9c <__alltraps>

00102a24 <vector246>:
.globl vector246
vector246:
  pushl $0
  102a24:	6a 00                	push   $0x0
  pushl $246
  102a26:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102a2b:	e9 6c 00 00 00       	jmp    102a9c <__alltraps>

00102a30 <vector247>:
.globl vector247
vector247:
  pushl $0
  102a30:	6a 00                	push   $0x0
  pushl $247
  102a32:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102a37:	e9 60 00 00 00       	jmp    102a9c <__alltraps>

00102a3c <vector248>:
.globl vector248
vector248:
  pushl $0
  102a3c:	6a 00                	push   $0x0
  pushl $248
  102a3e:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102a43:	e9 54 00 00 00       	jmp    102a9c <__alltraps>

00102a48 <vector249>:
.globl vector249
vector249:
  pushl $0
  102a48:	6a 00                	push   $0x0
  pushl $249
  102a4a:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102a4f:	e9 48 00 00 00       	jmp    102a9c <__alltraps>

00102a54 <vector250>:
.globl vector250
vector250:
  pushl $0
  102a54:	6a 00                	push   $0x0
  pushl $250
  102a56:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102a5b:	e9 3c 00 00 00       	jmp    102a9c <__alltraps>

00102a60 <vector251>:
.globl vector251
vector251:
  pushl $0
  102a60:	6a 00                	push   $0x0
  pushl $251
  102a62:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102a67:	e9 30 00 00 00       	jmp    102a9c <__alltraps>

00102a6c <vector252>:
.globl vector252
vector252:
  pushl $0
  102a6c:	6a 00                	push   $0x0
  pushl $252
  102a6e:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102a73:	e9 24 00 00 00       	jmp    102a9c <__alltraps>

00102a78 <vector253>:
.globl vector253
vector253:
  pushl $0
  102a78:	6a 00                	push   $0x0
  pushl $253
  102a7a:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102a7f:	e9 18 00 00 00       	jmp    102a9c <__alltraps>

00102a84 <vector254>:
.globl vector254
vector254:
  pushl $0
  102a84:	6a 00                	push   $0x0
  pushl $254
  102a86:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102a8b:	e9 0c 00 00 00       	jmp    102a9c <__alltraps>

00102a90 <vector255>:
.globl vector255
vector255:
  pushl $0
  102a90:	6a 00                	push   $0x0
  pushl $255
  102a92:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102a97:	e9 00 00 00 00       	jmp    102a9c <__alltraps>

00102a9c <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102a9c:	1e                   	push   %ds
    pushl %es
  102a9d:	06                   	push   %es
    pushl %fs
  102a9e:	0f a0                	push   %fs
    pushl %gs
  102aa0:	0f a8                	push   %gs
    pushal
  102aa2:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102aa3:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102aa8:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102aaa:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102aac:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102aad:	e8 60 f5 ff ff       	call   102012 <trap>

    # pop the pushed stack pointer
    popl %esp
  102ab2:	5c                   	pop    %esp

00102ab3 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102ab3:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102ab4:	0f a9                	pop    %gs
    popl %fs
  102ab6:	0f a1                	pop    %fs
    popl %es
  102ab8:	07                   	pop    %es
    popl %ds
  102ab9:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102aba:	83 c4 08             	add    $0x8,%esp
    iret
  102abd:	cf                   	iret   

00102abe <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102abe:	55                   	push   %ebp
  102abf:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102ac1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac4:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102ac7:	b8 23 00 00 00       	mov    $0x23,%eax
  102acc:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102ace:	b8 23 00 00 00       	mov    $0x23,%eax
  102ad3:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102ad5:	b8 10 00 00 00       	mov    $0x10,%eax
  102ada:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102adc:	b8 10 00 00 00       	mov    $0x10,%eax
  102ae1:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102ae3:	b8 10 00 00 00       	mov    $0x10,%eax
  102ae8:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102aea:	ea f1 2a 10 00 08 00 	ljmp   $0x8,$0x102af1
}
  102af1:	90                   	nop
  102af2:	5d                   	pop    %ebp
  102af3:	c3                   	ret    

00102af4 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102af4:	f3 0f 1e fb          	endbr32 
  102af8:	55                   	push   %ebp
  102af9:	89 e5                	mov    %esp,%ebp
  102afb:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102afe:	b8 20 19 11 00       	mov    $0x111920,%eax
  102b03:	05 00 04 00 00       	add    $0x400,%eax
  102b08:	a3 a4 18 11 00       	mov    %eax,0x1118a4
    ts.ts_ss0 = KERNEL_DS;
  102b0d:	66 c7 05 a8 18 11 00 	movw   $0x10,0x1118a8
  102b14:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102b16:	66 c7 05 08 0a 11 00 	movw   $0x68,0x110a08
  102b1d:	68 00 
  102b1f:	b8 a0 18 11 00       	mov    $0x1118a0,%eax
  102b24:	0f b7 c0             	movzwl %ax,%eax
  102b27:	66 a3 0a 0a 11 00    	mov    %ax,0x110a0a
  102b2d:	b8 a0 18 11 00       	mov    $0x1118a0,%eax
  102b32:	c1 e8 10             	shr    $0x10,%eax
  102b35:	a2 0c 0a 11 00       	mov    %al,0x110a0c
  102b3a:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102b41:	24 f0                	and    $0xf0,%al
  102b43:	0c 09                	or     $0x9,%al
  102b45:	a2 0d 0a 11 00       	mov    %al,0x110a0d
  102b4a:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102b51:	0c 10                	or     $0x10,%al
  102b53:	a2 0d 0a 11 00       	mov    %al,0x110a0d
  102b58:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102b5f:	24 9f                	and    $0x9f,%al
  102b61:	a2 0d 0a 11 00       	mov    %al,0x110a0d
  102b66:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102b6d:	0c 80                	or     $0x80,%al
  102b6f:	a2 0d 0a 11 00       	mov    %al,0x110a0d
  102b74:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102b7b:	24 f0                	and    $0xf0,%al
  102b7d:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102b82:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102b89:	24 ef                	and    $0xef,%al
  102b8b:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102b90:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102b97:	24 df                	and    $0xdf,%al
  102b99:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102b9e:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102ba5:	0c 40                	or     $0x40,%al
  102ba7:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102bac:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102bb3:	24 7f                	and    $0x7f,%al
  102bb5:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102bba:	b8 a0 18 11 00       	mov    $0x1118a0,%eax
  102bbf:	c1 e8 18             	shr    $0x18,%eax
  102bc2:	a2 0f 0a 11 00       	mov    %al,0x110a0f
    gdt[SEG_TSS].sd_s = 0;
  102bc7:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102bce:	24 ef                	and    $0xef,%al
  102bd0:	a2 0d 0a 11 00       	mov    %al,0x110a0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102bd5:	c7 04 24 10 0a 11 00 	movl   $0x110a10,(%esp)
  102bdc:	e8 dd fe ff ff       	call   102abe <lgdt>
  102be1:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102be7:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102beb:	0f 00 d8             	ltr    %ax
}
  102bee:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102bef:	90                   	nop
  102bf0:	c9                   	leave  
  102bf1:	c3                   	ret    

00102bf2 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102bf2:	f3 0f 1e fb          	endbr32 
  102bf6:	55                   	push   %ebp
  102bf7:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102bf9:	e8 f6 fe ff ff       	call   102af4 <gdt_init>
}
  102bfe:	90                   	nop
  102bff:	5d                   	pop    %ebp
  102c00:	c3                   	ret    

00102c01 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102c01:	f3 0f 1e fb          	endbr32 
  102c05:	55                   	push   %ebp
  102c06:	89 e5                	mov    %esp,%ebp
  102c08:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102c0b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102c12:	eb 03                	jmp    102c17 <strlen+0x16>
        cnt ++;
  102c14:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  102c17:	8b 45 08             	mov    0x8(%ebp),%eax
  102c1a:	8d 50 01             	lea    0x1(%eax),%edx
  102c1d:	89 55 08             	mov    %edx,0x8(%ebp)
  102c20:	0f b6 00             	movzbl (%eax),%eax
  102c23:	84 c0                	test   %al,%al
  102c25:	75 ed                	jne    102c14 <strlen+0x13>
    }
    return cnt;
  102c27:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102c2a:	c9                   	leave  
  102c2b:	c3                   	ret    

00102c2c <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102c2c:	f3 0f 1e fb          	endbr32 
  102c30:	55                   	push   %ebp
  102c31:	89 e5                	mov    %esp,%ebp
  102c33:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102c36:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102c3d:	eb 03                	jmp    102c42 <strnlen+0x16>
        cnt ++;
  102c3f:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102c42:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c45:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102c48:	73 10                	jae    102c5a <strnlen+0x2e>
  102c4a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c4d:	8d 50 01             	lea    0x1(%eax),%edx
  102c50:	89 55 08             	mov    %edx,0x8(%ebp)
  102c53:	0f b6 00             	movzbl (%eax),%eax
  102c56:	84 c0                	test   %al,%al
  102c58:	75 e5                	jne    102c3f <strnlen+0x13>
    }
    return cnt;
  102c5a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102c5d:	c9                   	leave  
  102c5e:	c3                   	ret    

00102c5f <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102c5f:	f3 0f 1e fb          	endbr32 
  102c63:	55                   	push   %ebp
  102c64:	89 e5                	mov    %esp,%ebp
  102c66:	57                   	push   %edi
  102c67:	56                   	push   %esi
  102c68:	83 ec 20             	sub    $0x20,%esp
  102c6b:	8b 45 08             	mov    0x8(%ebp),%eax
  102c6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c71:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c74:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102c77:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102c7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c7d:	89 d1                	mov    %edx,%ecx
  102c7f:	89 c2                	mov    %eax,%edx
  102c81:	89 ce                	mov    %ecx,%esi
  102c83:	89 d7                	mov    %edx,%edi
  102c85:	ac                   	lods   %ds:(%esi),%al
  102c86:	aa                   	stos   %al,%es:(%edi)
  102c87:	84 c0                	test   %al,%al
  102c89:	75 fa                	jne    102c85 <strcpy+0x26>
  102c8b:	89 fa                	mov    %edi,%edx
  102c8d:	89 f1                	mov    %esi,%ecx
  102c8f:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102c92:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102c95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102c98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102c9b:	83 c4 20             	add    $0x20,%esp
  102c9e:	5e                   	pop    %esi
  102c9f:	5f                   	pop    %edi
  102ca0:	5d                   	pop    %ebp
  102ca1:	c3                   	ret    

00102ca2 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102ca2:	f3 0f 1e fb          	endbr32 
  102ca6:	55                   	push   %ebp
  102ca7:	89 e5                	mov    %esp,%ebp
  102ca9:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102cac:	8b 45 08             	mov    0x8(%ebp),%eax
  102caf:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102cb2:	eb 1e                	jmp    102cd2 <strncpy+0x30>
        if ((*p = *src) != '\0') {
  102cb4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cb7:	0f b6 10             	movzbl (%eax),%edx
  102cba:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102cbd:	88 10                	mov    %dl,(%eax)
  102cbf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102cc2:	0f b6 00             	movzbl (%eax),%eax
  102cc5:	84 c0                	test   %al,%al
  102cc7:	74 03                	je     102ccc <strncpy+0x2a>
            src ++;
  102cc9:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102ccc:	ff 45 fc             	incl   -0x4(%ebp)
  102ccf:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102cd2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cd6:	75 dc                	jne    102cb4 <strncpy+0x12>
    }
    return dst;
  102cd8:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102cdb:	c9                   	leave  
  102cdc:	c3                   	ret    

00102cdd <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102cdd:	f3 0f 1e fb          	endbr32 
  102ce1:	55                   	push   %ebp
  102ce2:	89 e5                	mov    %esp,%ebp
  102ce4:	57                   	push   %edi
  102ce5:	56                   	push   %esi
  102ce6:	83 ec 20             	sub    $0x20,%esp
  102ce9:	8b 45 08             	mov    0x8(%ebp),%eax
  102cec:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102cef:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cf2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102cf5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102cf8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cfb:	89 d1                	mov    %edx,%ecx
  102cfd:	89 c2                	mov    %eax,%edx
  102cff:	89 ce                	mov    %ecx,%esi
  102d01:	89 d7                	mov    %edx,%edi
  102d03:	ac                   	lods   %ds:(%esi),%al
  102d04:	ae                   	scas   %es:(%edi),%al
  102d05:	75 08                	jne    102d0f <strcmp+0x32>
  102d07:	84 c0                	test   %al,%al
  102d09:	75 f8                	jne    102d03 <strcmp+0x26>
  102d0b:	31 c0                	xor    %eax,%eax
  102d0d:	eb 04                	jmp    102d13 <strcmp+0x36>
  102d0f:	19 c0                	sbb    %eax,%eax
  102d11:	0c 01                	or     $0x1,%al
  102d13:	89 fa                	mov    %edi,%edx
  102d15:	89 f1                	mov    %esi,%ecx
  102d17:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102d1a:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102d1d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102d20:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102d23:	83 c4 20             	add    $0x20,%esp
  102d26:	5e                   	pop    %esi
  102d27:	5f                   	pop    %edi
  102d28:	5d                   	pop    %ebp
  102d29:	c3                   	ret    

00102d2a <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102d2a:	f3 0f 1e fb          	endbr32 
  102d2e:	55                   	push   %ebp
  102d2f:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102d31:	eb 09                	jmp    102d3c <strncmp+0x12>
        n --, s1 ++, s2 ++;
  102d33:	ff 4d 10             	decl   0x10(%ebp)
  102d36:	ff 45 08             	incl   0x8(%ebp)
  102d39:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102d3c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d40:	74 1a                	je     102d5c <strncmp+0x32>
  102d42:	8b 45 08             	mov    0x8(%ebp),%eax
  102d45:	0f b6 00             	movzbl (%eax),%eax
  102d48:	84 c0                	test   %al,%al
  102d4a:	74 10                	je     102d5c <strncmp+0x32>
  102d4c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d4f:	0f b6 10             	movzbl (%eax),%edx
  102d52:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d55:	0f b6 00             	movzbl (%eax),%eax
  102d58:	38 c2                	cmp    %al,%dl
  102d5a:	74 d7                	je     102d33 <strncmp+0x9>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102d5c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d60:	74 18                	je     102d7a <strncmp+0x50>
  102d62:	8b 45 08             	mov    0x8(%ebp),%eax
  102d65:	0f b6 00             	movzbl (%eax),%eax
  102d68:	0f b6 d0             	movzbl %al,%edx
  102d6b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d6e:	0f b6 00             	movzbl (%eax),%eax
  102d71:	0f b6 c0             	movzbl %al,%eax
  102d74:	29 c2                	sub    %eax,%edx
  102d76:	89 d0                	mov    %edx,%eax
  102d78:	eb 05                	jmp    102d7f <strncmp+0x55>
  102d7a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102d7f:	5d                   	pop    %ebp
  102d80:	c3                   	ret    

00102d81 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102d81:	f3 0f 1e fb          	endbr32 
  102d85:	55                   	push   %ebp
  102d86:	89 e5                	mov    %esp,%ebp
  102d88:	83 ec 04             	sub    $0x4,%esp
  102d8b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d8e:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102d91:	eb 13                	jmp    102da6 <strchr+0x25>
        if (*s == c) {
  102d93:	8b 45 08             	mov    0x8(%ebp),%eax
  102d96:	0f b6 00             	movzbl (%eax),%eax
  102d99:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102d9c:	75 05                	jne    102da3 <strchr+0x22>
            return (char *)s;
  102d9e:	8b 45 08             	mov    0x8(%ebp),%eax
  102da1:	eb 12                	jmp    102db5 <strchr+0x34>
        }
        s ++;
  102da3:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102da6:	8b 45 08             	mov    0x8(%ebp),%eax
  102da9:	0f b6 00             	movzbl (%eax),%eax
  102dac:	84 c0                	test   %al,%al
  102dae:	75 e3                	jne    102d93 <strchr+0x12>
    }
    return NULL;
  102db0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102db5:	c9                   	leave  
  102db6:	c3                   	ret    

00102db7 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102db7:	f3 0f 1e fb          	endbr32 
  102dbb:	55                   	push   %ebp
  102dbc:	89 e5                	mov    %esp,%ebp
  102dbe:	83 ec 04             	sub    $0x4,%esp
  102dc1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dc4:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102dc7:	eb 0e                	jmp    102dd7 <strfind+0x20>
        if (*s == c) {
  102dc9:	8b 45 08             	mov    0x8(%ebp),%eax
  102dcc:	0f b6 00             	movzbl (%eax),%eax
  102dcf:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102dd2:	74 0f                	je     102de3 <strfind+0x2c>
            break;
        }
        s ++;
  102dd4:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102dd7:	8b 45 08             	mov    0x8(%ebp),%eax
  102dda:	0f b6 00             	movzbl (%eax),%eax
  102ddd:	84 c0                	test   %al,%al
  102ddf:	75 e8                	jne    102dc9 <strfind+0x12>
  102de1:	eb 01                	jmp    102de4 <strfind+0x2d>
            break;
  102de3:	90                   	nop
    }
    return (char *)s;
  102de4:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102de7:	c9                   	leave  
  102de8:	c3                   	ret    

00102de9 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102de9:	f3 0f 1e fb          	endbr32 
  102ded:	55                   	push   %ebp
  102dee:	89 e5                	mov    %esp,%ebp
  102df0:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102df3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102dfa:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102e01:	eb 03                	jmp    102e06 <strtol+0x1d>
        s ++;
  102e03:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102e06:	8b 45 08             	mov    0x8(%ebp),%eax
  102e09:	0f b6 00             	movzbl (%eax),%eax
  102e0c:	3c 20                	cmp    $0x20,%al
  102e0e:	74 f3                	je     102e03 <strtol+0x1a>
  102e10:	8b 45 08             	mov    0x8(%ebp),%eax
  102e13:	0f b6 00             	movzbl (%eax),%eax
  102e16:	3c 09                	cmp    $0x9,%al
  102e18:	74 e9                	je     102e03 <strtol+0x1a>
    }

    // plus/minus sign
    if (*s == '+') {
  102e1a:	8b 45 08             	mov    0x8(%ebp),%eax
  102e1d:	0f b6 00             	movzbl (%eax),%eax
  102e20:	3c 2b                	cmp    $0x2b,%al
  102e22:	75 05                	jne    102e29 <strtol+0x40>
        s ++;
  102e24:	ff 45 08             	incl   0x8(%ebp)
  102e27:	eb 14                	jmp    102e3d <strtol+0x54>
    }
    else if (*s == '-') {
  102e29:	8b 45 08             	mov    0x8(%ebp),%eax
  102e2c:	0f b6 00             	movzbl (%eax),%eax
  102e2f:	3c 2d                	cmp    $0x2d,%al
  102e31:	75 0a                	jne    102e3d <strtol+0x54>
        s ++, neg = 1;
  102e33:	ff 45 08             	incl   0x8(%ebp)
  102e36:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102e3d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102e41:	74 06                	je     102e49 <strtol+0x60>
  102e43:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102e47:	75 22                	jne    102e6b <strtol+0x82>
  102e49:	8b 45 08             	mov    0x8(%ebp),%eax
  102e4c:	0f b6 00             	movzbl (%eax),%eax
  102e4f:	3c 30                	cmp    $0x30,%al
  102e51:	75 18                	jne    102e6b <strtol+0x82>
  102e53:	8b 45 08             	mov    0x8(%ebp),%eax
  102e56:	40                   	inc    %eax
  102e57:	0f b6 00             	movzbl (%eax),%eax
  102e5a:	3c 78                	cmp    $0x78,%al
  102e5c:	75 0d                	jne    102e6b <strtol+0x82>
        s += 2, base = 16;
  102e5e:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102e62:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102e69:	eb 29                	jmp    102e94 <strtol+0xab>
    }
    else if (base == 0 && s[0] == '0') {
  102e6b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102e6f:	75 16                	jne    102e87 <strtol+0x9e>
  102e71:	8b 45 08             	mov    0x8(%ebp),%eax
  102e74:	0f b6 00             	movzbl (%eax),%eax
  102e77:	3c 30                	cmp    $0x30,%al
  102e79:	75 0c                	jne    102e87 <strtol+0x9e>
        s ++, base = 8;
  102e7b:	ff 45 08             	incl   0x8(%ebp)
  102e7e:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102e85:	eb 0d                	jmp    102e94 <strtol+0xab>
    }
    else if (base == 0) {
  102e87:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102e8b:	75 07                	jne    102e94 <strtol+0xab>
        base = 10;
  102e8d:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102e94:	8b 45 08             	mov    0x8(%ebp),%eax
  102e97:	0f b6 00             	movzbl (%eax),%eax
  102e9a:	3c 2f                	cmp    $0x2f,%al
  102e9c:	7e 1b                	jle    102eb9 <strtol+0xd0>
  102e9e:	8b 45 08             	mov    0x8(%ebp),%eax
  102ea1:	0f b6 00             	movzbl (%eax),%eax
  102ea4:	3c 39                	cmp    $0x39,%al
  102ea6:	7f 11                	jg     102eb9 <strtol+0xd0>
            dig = *s - '0';
  102ea8:	8b 45 08             	mov    0x8(%ebp),%eax
  102eab:	0f b6 00             	movzbl (%eax),%eax
  102eae:	0f be c0             	movsbl %al,%eax
  102eb1:	83 e8 30             	sub    $0x30,%eax
  102eb4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102eb7:	eb 48                	jmp    102f01 <strtol+0x118>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102eb9:	8b 45 08             	mov    0x8(%ebp),%eax
  102ebc:	0f b6 00             	movzbl (%eax),%eax
  102ebf:	3c 60                	cmp    $0x60,%al
  102ec1:	7e 1b                	jle    102ede <strtol+0xf5>
  102ec3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec6:	0f b6 00             	movzbl (%eax),%eax
  102ec9:	3c 7a                	cmp    $0x7a,%al
  102ecb:	7f 11                	jg     102ede <strtol+0xf5>
            dig = *s - 'a' + 10;
  102ecd:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed0:	0f b6 00             	movzbl (%eax),%eax
  102ed3:	0f be c0             	movsbl %al,%eax
  102ed6:	83 e8 57             	sub    $0x57,%eax
  102ed9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102edc:	eb 23                	jmp    102f01 <strtol+0x118>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102ede:	8b 45 08             	mov    0x8(%ebp),%eax
  102ee1:	0f b6 00             	movzbl (%eax),%eax
  102ee4:	3c 40                	cmp    $0x40,%al
  102ee6:	7e 3b                	jle    102f23 <strtol+0x13a>
  102ee8:	8b 45 08             	mov    0x8(%ebp),%eax
  102eeb:	0f b6 00             	movzbl (%eax),%eax
  102eee:	3c 5a                	cmp    $0x5a,%al
  102ef0:	7f 31                	jg     102f23 <strtol+0x13a>
            dig = *s - 'A' + 10;
  102ef2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef5:	0f b6 00             	movzbl (%eax),%eax
  102ef8:	0f be c0             	movsbl %al,%eax
  102efb:	83 e8 37             	sub    $0x37,%eax
  102efe:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102f01:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102f04:	3b 45 10             	cmp    0x10(%ebp),%eax
  102f07:	7d 19                	jge    102f22 <strtol+0x139>
            break;
        }
        s ++, val = (val * base) + dig;
  102f09:	ff 45 08             	incl   0x8(%ebp)
  102f0c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f0f:	0f af 45 10          	imul   0x10(%ebp),%eax
  102f13:	89 c2                	mov    %eax,%edx
  102f15:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102f18:	01 d0                	add    %edx,%eax
  102f1a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102f1d:	e9 72 ff ff ff       	jmp    102e94 <strtol+0xab>
            break;
  102f22:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102f23:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102f27:	74 08                	je     102f31 <strtol+0x148>
        *endptr = (char *) s;
  102f29:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f2c:	8b 55 08             	mov    0x8(%ebp),%edx
  102f2f:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102f31:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102f35:	74 07                	je     102f3e <strtol+0x155>
  102f37:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f3a:	f7 d8                	neg    %eax
  102f3c:	eb 03                	jmp    102f41 <strtol+0x158>
  102f3e:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102f41:	c9                   	leave  
  102f42:	c3                   	ret    

00102f43 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102f43:	f3 0f 1e fb          	endbr32 
  102f47:	55                   	push   %ebp
  102f48:	89 e5                	mov    %esp,%ebp
  102f4a:	57                   	push   %edi
  102f4b:	83 ec 24             	sub    $0x24,%esp
  102f4e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f51:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102f54:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  102f58:	8b 45 08             	mov    0x8(%ebp),%eax
  102f5b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102f5e:	88 55 f7             	mov    %dl,-0x9(%ebp)
  102f61:	8b 45 10             	mov    0x10(%ebp),%eax
  102f64:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102f67:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102f6a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102f6e:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102f71:	89 d7                	mov    %edx,%edi
  102f73:	f3 aa                	rep stos %al,%es:(%edi)
  102f75:	89 fa                	mov    %edi,%edx
  102f77:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102f7a:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102f7d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102f80:	83 c4 24             	add    $0x24,%esp
  102f83:	5f                   	pop    %edi
  102f84:	5d                   	pop    %ebp
  102f85:	c3                   	ret    

00102f86 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102f86:	f3 0f 1e fb          	endbr32 
  102f8a:	55                   	push   %ebp
  102f8b:	89 e5                	mov    %esp,%ebp
  102f8d:	57                   	push   %edi
  102f8e:	56                   	push   %esi
  102f8f:	53                   	push   %ebx
  102f90:	83 ec 30             	sub    $0x30,%esp
  102f93:	8b 45 08             	mov    0x8(%ebp),%eax
  102f96:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f99:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f9c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102f9f:	8b 45 10             	mov    0x10(%ebp),%eax
  102fa2:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102fa5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fa8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102fab:	73 42                	jae    102fef <memmove+0x69>
  102fad:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fb0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102fb3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fb6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fb9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102fbc:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102fbf:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fc2:	c1 e8 02             	shr    $0x2,%eax
  102fc5:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102fc7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102fca:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fcd:	89 d7                	mov    %edx,%edi
  102fcf:	89 c6                	mov    %eax,%esi
  102fd1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102fd3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102fd6:	83 e1 03             	and    $0x3,%ecx
  102fd9:	74 02                	je     102fdd <memmove+0x57>
  102fdb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102fdd:	89 f0                	mov    %esi,%eax
  102fdf:	89 fa                	mov    %edi,%edx
  102fe1:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102fe4:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102fe7:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102fea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  102fed:	eb 36                	jmp    103025 <memmove+0x9f>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102fef:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ff2:	8d 50 ff             	lea    -0x1(%eax),%edx
  102ff5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ff8:	01 c2                	add    %eax,%edx
  102ffa:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ffd:	8d 48 ff             	lea    -0x1(%eax),%ecx
  103000:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103003:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  103006:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103009:	89 c1                	mov    %eax,%ecx
  10300b:	89 d8                	mov    %ebx,%eax
  10300d:	89 d6                	mov    %edx,%esi
  10300f:	89 c7                	mov    %eax,%edi
  103011:	fd                   	std    
  103012:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103014:	fc                   	cld    
  103015:	89 f8                	mov    %edi,%eax
  103017:	89 f2                	mov    %esi,%edx
  103019:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  10301c:	89 55 c8             	mov    %edx,-0x38(%ebp)
  10301f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  103022:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103025:	83 c4 30             	add    $0x30,%esp
  103028:	5b                   	pop    %ebx
  103029:	5e                   	pop    %esi
  10302a:	5f                   	pop    %edi
  10302b:	5d                   	pop    %ebp
  10302c:	c3                   	ret    

0010302d <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10302d:	f3 0f 1e fb          	endbr32 
  103031:	55                   	push   %ebp
  103032:	89 e5                	mov    %esp,%ebp
  103034:	57                   	push   %edi
  103035:	56                   	push   %esi
  103036:	83 ec 20             	sub    $0x20,%esp
  103039:	8b 45 08             	mov    0x8(%ebp),%eax
  10303c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10303f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103042:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103045:	8b 45 10             	mov    0x10(%ebp),%eax
  103048:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10304b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10304e:	c1 e8 02             	shr    $0x2,%eax
  103051:	89 c1                	mov    %eax,%ecx
    asm volatile (
  103053:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103056:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103059:	89 d7                	mov    %edx,%edi
  10305b:	89 c6                	mov    %eax,%esi
  10305d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10305f:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  103062:	83 e1 03             	and    $0x3,%ecx
  103065:	74 02                	je     103069 <memcpy+0x3c>
  103067:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103069:	89 f0                	mov    %esi,%eax
  10306b:	89 fa                	mov    %edi,%edx
  10306d:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103070:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103073:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  103076:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103079:	83 c4 20             	add    $0x20,%esp
  10307c:	5e                   	pop    %esi
  10307d:	5f                   	pop    %edi
  10307e:	5d                   	pop    %ebp
  10307f:	c3                   	ret    

00103080 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103080:	f3 0f 1e fb          	endbr32 
  103084:	55                   	push   %ebp
  103085:	89 e5                	mov    %esp,%ebp
  103087:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  10308a:	8b 45 08             	mov    0x8(%ebp),%eax
  10308d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103090:	8b 45 0c             	mov    0xc(%ebp),%eax
  103093:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  103096:	eb 2e                	jmp    1030c6 <memcmp+0x46>
        if (*s1 != *s2) {
  103098:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10309b:	0f b6 10             	movzbl (%eax),%edx
  10309e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1030a1:	0f b6 00             	movzbl (%eax),%eax
  1030a4:	38 c2                	cmp    %al,%dl
  1030a6:	74 18                	je     1030c0 <memcmp+0x40>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1030a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030ab:	0f b6 00             	movzbl (%eax),%eax
  1030ae:	0f b6 d0             	movzbl %al,%edx
  1030b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1030b4:	0f b6 00             	movzbl (%eax),%eax
  1030b7:	0f b6 c0             	movzbl %al,%eax
  1030ba:	29 c2                	sub    %eax,%edx
  1030bc:	89 d0                	mov    %edx,%eax
  1030be:	eb 18                	jmp    1030d8 <memcmp+0x58>
        }
        s1 ++, s2 ++;
  1030c0:	ff 45 fc             	incl   -0x4(%ebp)
  1030c3:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  1030c6:	8b 45 10             	mov    0x10(%ebp),%eax
  1030c9:	8d 50 ff             	lea    -0x1(%eax),%edx
  1030cc:	89 55 10             	mov    %edx,0x10(%ebp)
  1030cf:	85 c0                	test   %eax,%eax
  1030d1:	75 c5                	jne    103098 <memcmp+0x18>
    }
    return 0;
  1030d3:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1030d8:	c9                   	leave  
  1030d9:	c3                   	ret    

001030da <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  1030da:	f3 0f 1e fb          	endbr32 
  1030de:	55                   	push   %ebp
  1030df:	89 e5                	mov    %esp,%ebp
  1030e1:	83 ec 58             	sub    $0x58,%esp
  1030e4:	8b 45 10             	mov    0x10(%ebp),%eax
  1030e7:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1030ea:	8b 45 14             	mov    0x14(%ebp),%eax
  1030ed:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  1030f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1030f3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1030f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1030f9:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  1030fc:	8b 45 18             	mov    0x18(%ebp),%eax
  1030ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103102:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103105:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103108:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10310b:	89 55 f0             	mov    %edx,-0x10(%ebp)
  10310e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103111:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103114:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103118:	74 1c                	je     103136 <printnum+0x5c>
  10311a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10311d:	ba 00 00 00 00       	mov    $0x0,%edx
  103122:	f7 75 e4             	divl   -0x1c(%ebp)
  103125:	89 55 f4             	mov    %edx,-0xc(%ebp)
  103128:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10312b:	ba 00 00 00 00       	mov    $0x0,%edx
  103130:	f7 75 e4             	divl   -0x1c(%ebp)
  103133:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103136:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103139:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10313c:	f7 75 e4             	divl   -0x1c(%ebp)
  10313f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103142:	89 55 dc             	mov    %edx,-0x24(%ebp)
  103145:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103148:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10314b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10314e:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103151:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103154:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  103157:	8b 45 18             	mov    0x18(%ebp),%eax
  10315a:	ba 00 00 00 00       	mov    $0x0,%edx
  10315f:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  103162:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  103165:	19 d1                	sbb    %edx,%ecx
  103167:	72 4c                	jb     1031b5 <printnum+0xdb>
        printnum(putch, putdat, result, base, width - 1, padc);
  103169:	8b 45 1c             	mov    0x1c(%ebp),%eax
  10316c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10316f:	8b 45 20             	mov    0x20(%ebp),%eax
  103172:	89 44 24 18          	mov    %eax,0x18(%esp)
  103176:	89 54 24 14          	mov    %edx,0x14(%esp)
  10317a:	8b 45 18             	mov    0x18(%ebp),%eax
  10317d:	89 44 24 10          	mov    %eax,0x10(%esp)
  103181:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103184:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103187:	89 44 24 08          	mov    %eax,0x8(%esp)
  10318b:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10318f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103192:	89 44 24 04          	mov    %eax,0x4(%esp)
  103196:	8b 45 08             	mov    0x8(%ebp),%eax
  103199:	89 04 24             	mov    %eax,(%esp)
  10319c:	e8 39 ff ff ff       	call   1030da <printnum>
  1031a1:	eb 1b                	jmp    1031be <printnum+0xe4>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  1031a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031a6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031aa:	8b 45 20             	mov    0x20(%ebp),%eax
  1031ad:	89 04 24             	mov    %eax,(%esp)
  1031b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b3:	ff d0                	call   *%eax
        while (-- width > 0)
  1031b5:	ff 4d 1c             	decl   0x1c(%ebp)
  1031b8:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  1031bc:	7f e5                	jg     1031a3 <printnum+0xc9>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  1031be:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1031c1:	05 70 3f 10 00       	add    $0x103f70,%eax
  1031c6:	0f b6 00             	movzbl (%eax),%eax
  1031c9:	0f be c0             	movsbl %al,%eax
  1031cc:	8b 55 0c             	mov    0xc(%ebp),%edx
  1031cf:	89 54 24 04          	mov    %edx,0x4(%esp)
  1031d3:	89 04 24             	mov    %eax,(%esp)
  1031d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d9:	ff d0                	call   *%eax
}
  1031db:	90                   	nop
  1031dc:	c9                   	leave  
  1031dd:	c3                   	ret    

001031de <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  1031de:	f3 0f 1e fb          	endbr32 
  1031e2:	55                   	push   %ebp
  1031e3:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1031e5:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1031e9:	7e 14                	jle    1031ff <getuint+0x21>
        return va_arg(*ap, unsigned long long);
  1031eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ee:	8b 00                	mov    (%eax),%eax
  1031f0:	8d 48 08             	lea    0x8(%eax),%ecx
  1031f3:	8b 55 08             	mov    0x8(%ebp),%edx
  1031f6:	89 0a                	mov    %ecx,(%edx)
  1031f8:	8b 50 04             	mov    0x4(%eax),%edx
  1031fb:	8b 00                	mov    (%eax),%eax
  1031fd:	eb 30                	jmp    10322f <getuint+0x51>
    }
    else if (lflag) {
  1031ff:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103203:	74 16                	je     10321b <getuint+0x3d>
        return va_arg(*ap, unsigned long);
  103205:	8b 45 08             	mov    0x8(%ebp),%eax
  103208:	8b 00                	mov    (%eax),%eax
  10320a:	8d 48 04             	lea    0x4(%eax),%ecx
  10320d:	8b 55 08             	mov    0x8(%ebp),%edx
  103210:	89 0a                	mov    %ecx,(%edx)
  103212:	8b 00                	mov    (%eax),%eax
  103214:	ba 00 00 00 00       	mov    $0x0,%edx
  103219:	eb 14                	jmp    10322f <getuint+0x51>
    }
    else {
        return va_arg(*ap, unsigned int);
  10321b:	8b 45 08             	mov    0x8(%ebp),%eax
  10321e:	8b 00                	mov    (%eax),%eax
  103220:	8d 48 04             	lea    0x4(%eax),%ecx
  103223:	8b 55 08             	mov    0x8(%ebp),%edx
  103226:	89 0a                	mov    %ecx,(%edx)
  103228:	8b 00                	mov    (%eax),%eax
  10322a:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  10322f:	5d                   	pop    %ebp
  103230:	c3                   	ret    

00103231 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  103231:	f3 0f 1e fb          	endbr32 
  103235:	55                   	push   %ebp
  103236:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103238:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10323c:	7e 14                	jle    103252 <getint+0x21>
        return va_arg(*ap, long long);
  10323e:	8b 45 08             	mov    0x8(%ebp),%eax
  103241:	8b 00                	mov    (%eax),%eax
  103243:	8d 48 08             	lea    0x8(%eax),%ecx
  103246:	8b 55 08             	mov    0x8(%ebp),%edx
  103249:	89 0a                	mov    %ecx,(%edx)
  10324b:	8b 50 04             	mov    0x4(%eax),%edx
  10324e:	8b 00                	mov    (%eax),%eax
  103250:	eb 28                	jmp    10327a <getint+0x49>
    }
    else if (lflag) {
  103252:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103256:	74 12                	je     10326a <getint+0x39>
        return va_arg(*ap, long);
  103258:	8b 45 08             	mov    0x8(%ebp),%eax
  10325b:	8b 00                	mov    (%eax),%eax
  10325d:	8d 48 04             	lea    0x4(%eax),%ecx
  103260:	8b 55 08             	mov    0x8(%ebp),%edx
  103263:	89 0a                	mov    %ecx,(%edx)
  103265:	8b 00                	mov    (%eax),%eax
  103267:	99                   	cltd   
  103268:	eb 10                	jmp    10327a <getint+0x49>
    }
    else {
        return va_arg(*ap, int);
  10326a:	8b 45 08             	mov    0x8(%ebp),%eax
  10326d:	8b 00                	mov    (%eax),%eax
  10326f:	8d 48 04             	lea    0x4(%eax),%ecx
  103272:	8b 55 08             	mov    0x8(%ebp),%edx
  103275:	89 0a                	mov    %ecx,(%edx)
  103277:	8b 00                	mov    (%eax),%eax
  103279:	99                   	cltd   
    }
}
  10327a:	5d                   	pop    %ebp
  10327b:	c3                   	ret    

0010327c <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  10327c:	f3 0f 1e fb          	endbr32 
  103280:	55                   	push   %ebp
  103281:	89 e5                	mov    %esp,%ebp
  103283:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  103286:	8d 45 14             	lea    0x14(%ebp),%eax
  103289:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  10328c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10328f:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103293:	8b 45 10             	mov    0x10(%ebp),%eax
  103296:	89 44 24 08          	mov    %eax,0x8(%esp)
  10329a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10329d:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a4:	89 04 24             	mov    %eax,(%esp)
  1032a7:	e8 03 00 00 00       	call   1032af <vprintfmt>
    va_end(ap);
}
  1032ac:	90                   	nop
  1032ad:	c9                   	leave  
  1032ae:	c3                   	ret    

001032af <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  1032af:	f3 0f 1e fb          	endbr32 
  1032b3:	55                   	push   %ebp
  1032b4:	89 e5                	mov    %esp,%ebp
  1032b6:	56                   	push   %esi
  1032b7:	53                   	push   %ebx
  1032b8:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1032bb:	eb 17                	jmp    1032d4 <vprintfmt+0x25>
            if (ch == '\0') {
  1032bd:	85 db                	test   %ebx,%ebx
  1032bf:	0f 84 c0 03 00 00    	je     103685 <vprintfmt+0x3d6>
                return;
            }
            putch(ch, putdat);
  1032c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032cc:	89 1c 24             	mov    %ebx,(%esp)
  1032cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1032d2:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1032d4:	8b 45 10             	mov    0x10(%ebp),%eax
  1032d7:	8d 50 01             	lea    0x1(%eax),%edx
  1032da:	89 55 10             	mov    %edx,0x10(%ebp)
  1032dd:	0f b6 00             	movzbl (%eax),%eax
  1032e0:	0f b6 d8             	movzbl %al,%ebx
  1032e3:	83 fb 25             	cmp    $0x25,%ebx
  1032e6:	75 d5                	jne    1032bd <vprintfmt+0xe>
        }

        // Process a %-escape sequence
        char padc = ' ';
  1032e8:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  1032ec:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  1032f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1032f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  1032f9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  103300:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103303:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  103306:	8b 45 10             	mov    0x10(%ebp),%eax
  103309:	8d 50 01             	lea    0x1(%eax),%edx
  10330c:	89 55 10             	mov    %edx,0x10(%ebp)
  10330f:	0f b6 00             	movzbl (%eax),%eax
  103312:	0f b6 d8             	movzbl %al,%ebx
  103315:	8d 43 dd             	lea    -0x23(%ebx),%eax
  103318:	83 f8 55             	cmp    $0x55,%eax
  10331b:	0f 87 38 03 00 00    	ja     103659 <vprintfmt+0x3aa>
  103321:	8b 04 85 94 3f 10 00 	mov    0x103f94(,%eax,4),%eax
  103328:	3e ff e0             	notrack jmp *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  10332b:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  10332f:	eb d5                	jmp    103306 <vprintfmt+0x57>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  103331:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  103335:	eb cf                	jmp    103306 <vprintfmt+0x57>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103337:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  10333e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103341:	89 d0                	mov    %edx,%eax
  103343:	c1 e0 02             	shl    $0x2,%eax
  103346:	01 d0                	add    %edx,%eax
  103348:	01 c0                	add    %eax,%eax
  10334a:	01 d8                	add    %ebx,%eax
  10334c:	83 e8 30             	sub    $0x30,%eax
  10334f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  103352:	8b 45 10             	mov    0x10(%ebp),%eax
  103355:	0f b6 00             	movzbl (%eax),%eax
  103358:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  10335b:	83 fb 2f             	cmp    $0x2f,%ebx
  10335e:	7e 38                	jle    103398 <vprintfmt+0xe9>
  103360:	83 fb 39             	cmp    $0x39,%ebx
  103363:	7f 33                	jg     103398 <vprintfmt+0xe9>
            for (precision = 0; ; ++ fmt) {
  103365:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  103368:	eb d4                	jmp    10333e <vprintfmt+0x8f>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  10336a:	8b 45 14             	mov    0x14(%ebp),%eax
  10336d:	8d 50 04             	lea    0x4(%eax),%edx
  103370:	89 55 14             	mov    %edx,0x14(%ebp)
  103373:	8b 00                	mov    (%eax),%eax
  103375:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  103378:	eb 1f                	jmp    103399 <vprintfmt+0xea>

        case '.':
            if (width < 0)
  10337a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10337e:	79 86                	jns    103306 <vprintfmt+0x57>
                width = 0;
  103380:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  103387:	e9 7a ff ff ff       	jmp    103306 <vprintfmt+0x57>

        case '#':
            altflag = 1;
  10338c:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  103393:	e9 6e ff ff ff       	jmp    103306 <vprintfmt+0x57>
            goto process_precision;
  103398:	90                   	nop

        process_precision:
            if (width < 0)
  103399:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10339d:	0f 89 63 ff ff ff    	jns    103306 <vprintfmt+0x57>
                width = precision, precision = -1;
  1033a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1033a6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1033a9:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  1033b0:	e9 51 ff ff ff       	jmp    103306 <vprintfmt+0x57>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  1033b5:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  1033b8:	e9 49 ff ff ff       	jmp    103306 <vprintfmt+0x57>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  1033bd:	8b 45 14             	mov    0x14(%ebp),%eax
  1033c0:	8d 50 04             	lea    0x4(%eax),%edx
  1033c3:	89 55 14             	mov    %edx,0x14(%ebp)
  1033c6:	8b 00                	mov    (%eax),%eax
  1033c8:	8b 55 0c             	mov    0xc(%ebp),%edx
  1033cb:	89 54 24 04          	mov    %edx,0x4(%esp)
  1033cf:	89 04 24             	mov    %eax,(%esp)
  1033d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1033d5:	ff d0                	call   *%eax
            break;
  1033d7:	e9 a4 02 00 00       	jmp    103680 <vprintfmt+0x3d1>

        // error message
        case 'e':
            err = va_arg(ap, int);
  1033dc:	8b 45 14             	mov    0x14(%ebp),%eax
  1033df:	8d 50 04             	lea    0x4(%eax),%edx
  1033e2:	89 55 14             	mov    %edx,0x14(%ebp)
  1033e5:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  1033e7:	85 db                	test   %ebx,%ebx
  1033e9:	79 02                	jns    1033ed <vprintfmt+0x13e>
                err = -err;
  1033eb:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  1033ed:	83 fb 06             	cmp    $0x6,%ebx
  1033f0:	7f 0b                	jg     1033fd <vprintfmt+0x14e>
  1033f2:	8b 34 9d 54 3f 10 00 	mov    0x103f54(,%ebx,4),%esi
  1033f9:	85 f6                	test   %esi,%esi
  1033fb:	75 23                	jne    103420 <vprintfmt+0x171>
                printfmt(putch, putdat, "error %d", err);
  1033fd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  103401:	c7 44 24 08 81 3f 10 	movl   $0x103f81,0x8(%esp)
  103408:	00 
  103409:	8b 45 0c             	mov    0xc(%ebp),%eax
  10340c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103410:	8b 45 08             	mov    0x8(%ebp),%eax
  103413:	89 04 24             	mov    %eax,(%esp)
  103416:	e8 61 fe ff ff       	call   10327c <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  10341b:	e9 60 02 00 00       	jmp    103680 <vprintfmt+0x3d1>
                printfmt(putch, putdat, "%s", p);
  103420:	89 74 24 0c          	mov    %esi,0xc(%esp)
  103424:	c7 44 24 08 8a 3f 10 	movl   $0x103f8a,0x8(%esp)
  10342b:	00 
  10342c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10342f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103433:	8b 45 08             	mov    0x8(%ebp),%eax
  103436:	89 04 24             	mov    %eax,(%esp)
  103439:	e8 3e fe ff ff       	call   10327c <printfmt>
            break;
  10343e:	e9 3d 02 00 00       	jmp    103680 <vprintfmt+0x3d1>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103443:	8b 45 14             	mov    0x14(%ebp),%eax
  103446:	8d 50 04             	lea    0x4(%eax),%edx
  103449:	89 55 14             	mov    %edx,0x14(%ebp)
  10344c:	8b 30                	mov    (%eax),%esi
  10344e:	85 f6                	test   %esi,%esi
  103450:	75 05                	jne    103457 <vprintfmt+0x1a8>
                p = "(null)";
  103452:	be 8d 3f 10 00       	mov    $0x103f8d,%esi
            }
            if (width > 0 && padc != '-') {
  103457:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10345b:	7e 76                	jle    1034d3 <vprintfmt+0x224>
  10345d:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  103461:	74 70                	je     1034d3 <vprintfmt+0x224>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103463:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103466:	89 44 24 04          	mov    %eax,0x4(%esp)
  10346a:	89 34 24             	mov    %esi,(%esp)
  10346d:	e8 ba f7 ff ff       	call   102c2c <strnlen>
  103472:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103475:	29 c2                	sub    %eax,%edx
  103477:	89 d0                	mov    %edx,%eax
  103479:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10347c:	eb 16                	jmp    103494 <vprintfmt+0x1e5>
                    putch(padc, putdat);
  10347e:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  103482:	8b 55 0c             	mov    0xc(%ebp),%edx
  103485:	89 54 24 04          	mov    %edx,0x4(%esp)
  103489:	89 04 24             	mov    %eax,(%esp)
  10348c:	8b 45 08             	mov    0x8(%ebp),%eax
  10348f:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  103491:	ff 4d e8             	decl   -0x18(%ebp)
  103494:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103498:	7f e4                	jg     10347e <vprintfmt+0x1cf>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10349a:	eb 37                	jmp    1034d3 <vprintfmt+0x224>
                if (altflag && (ch < ' ' || ch > '~')) {
  10349c:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1034a0:	74 1f                	je     1034c1 <vprintfmt+0x212>
  1034a2:	83 fb 1f             	cmp    $0x1f,%ebx
  1034a5:	7e 05                	jle    1034ac <vprintfmt+0x1fd>
  1034a7:	83 fb 7e             	cmp    $0x7e,%ebx
  1034aa:	7e 15                	jle    1034c1 <vprintfmt+0x212>
                    putch('?', putdat);
  1034ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034af:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034b3:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  1034ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1034bd:	ff d0                	call   *%eax
  1034bf:	eb 0f                	jmp    1034d0 <vprintfmt+0x221>
                }
                else {
                    putch(ch, putdat);
  1034c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034c4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034c8:	89 1c 24             	mov    %ebx,(%esp)
  1034cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1034ce:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1034d0:	ff 4d e8             	decl   -0x18(%ebp)
  1034d3:	89 f0                	mov    %esi,%eax
  1034d5:	8d 70 01             	lea    0x1(%eax),%esi
  1034d8:	0f b6 00             	movzbl (%eax),%eax
  1034db:	0f be d8             	movsbl %al,%ebx
  1034de:	85 db                	test   %ebx,%ebx
  1034e0:	74 27                	je     103509 <vprintfmt+0x25a>
  1034e2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1034e6:	78 b4                	js     10349c <vprintfmt+0x1ed>
  1034e8:	ff 4d e4             	decl   -0x1c(%ebp)
  1034eb:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1034ef:	79 ab                	jns    10349c <vprintfmt+0x1ed>
                }
            }
            for (; width > 0; width --) {
  1034f1:	eb 16                	jmp    103509 <vprintfmt+0x25a>
                putch(' ', putdat);
  1034f3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034fa:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  103501:	8b 45 08             	mov    0x8(%ebp),%eax
  103504:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  103506:	ff 4d e8             	decl   -0x18(%ebp)
  103509:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10350d:	7f e4                	jg     1034f3 <vprintfmt+0x244>
            }
            break;
  10350f:	e9 6c 01 00 00       	jmp    103680 <vprintfmt+0x3d1>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103514:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103517:	89 44 24 04          	mov    %eax,0x4(%esp)
  10351b:	8d 45 14             	lea    0x14(%ebp),%eax
  10351e:	89 04 24             	mov    %eax,(%esp)
  103521:	e8 0b fd ff ff       	call   103231 <getint>
  103526:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103529:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  10352c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10352f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103532:	85 d2                	test   %edx,%edx
  103534:	79 26                	jns    10355c <vprintfmt+0x2ad>
                putch('-', putdat);
  103536:	8b 45 0c             	mov    0xc(%ebp),%eax
  103539:	89 44 24 04          	mov    %eax,0x4(%esp)
  10353d:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  103544:	8b 45 08             	mov    0x8(%ebp),%eax
  103547:	ff d0                	call   *%eax
                num = -(long long)num;
  103549:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10354c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10354f:	f7 d8                	neg    %eax
  103551:	83 d2 00             	adc    $0x0,%edx
  103554:	f7 da                	neg    %edx
  103556:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103559:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  10355c:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103563:	e9 a8 00 00 00       	jmp    103610 <vprintfmt+0x361>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103568:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10356b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10356f:	8d 45 14             	lea    0x14(%ebp),%eax
  103572:	89 04 24             	mov    %eax,(%esp)
  103575:	e8 64 fc ff ff       	call   1031de <getuint>
  10357a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10357d:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  103580:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103587:	e9 84 00 00 00       	jmp    103610 <vprintfmt+0x361>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  10358c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10358f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103593:	8d 45 14             	lea    0x14(%ebp),%eax
  103596:	89 04 24             	mov    %eax,(%esp)
  103599:	e8 40 fc ff ff       	call   1031de <getuint>
  10359e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035a1:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1035a4:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1035ab:	eb 63                	jmp    103610 <vprintfmt+0x361>

        // pointer
        case 'p':
            putch('0', putdat);
  1035ad:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035b0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035b4:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  1035bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1035be:	ff d0                	call   *%eax
            putch('x', putdat);
  1035c0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035c3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035c7:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  1035ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1035d1:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  1035d3:	8b 45 14             	mov    0x14(%ebp),%eax
  1035d6:	8d 50 04             	lea    0x4(%eax),%edx
  1035d9:	89 55 14             	mov    %edx,0x14(%ebp)
  1035dc:	8b 00                	mov    (%eax),%eax
  1035de:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035e1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  1035e8:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  1035ef:	eb 1f                	jmp    103610 <vprintfmt+0x361>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  1035f1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1035f4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035f8:	8d 45 14             	lea    0x14(%ebp),%eax
  1035fb:	89 04 24             	mov    %eax,(%esp)
  1035fe:	e8 db fb ff ff       	call   1031de <getuint>
  103603:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103606:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  103609:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103610:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103614:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103617:	89 54 24 18          	mov    %edx,0x18(%esp)
  10361b:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10361e:	89 54 24 14          	mov    %edx,0x14(%esp)
  103622:	89 44 24 10          	mov    %eax,0x10(%esp)
  103626:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103629:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10362c:	89 44 24 08          	mov    %eax,0x8(%esp)
  103630:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103634:	8b 45 0c             	mov    0xc(%ebp),%eax
  103637:	89 44 24 04          	mov    %eax,0x4(%esp)
  10363b:	8b 45 08             	mov    0x8(%ebp),%eax
  10363e:	89 04 24             	mov    %eax,(%esp)
  103641:	e8 94 fa ff ff       	call   1030da <printnum>
            break;
  103646:	eb 38                	jmp    103680 <vprintfmt+0x3d1>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103648:	8b 45 0c             	mov    0xc(%ebp),%eax
  10364b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10364f:	89 1c 24             	mov    %ebx,(%esp)
  103652:	8b 45 08             	mov    0x8(%ebp),%eax
  103655:	ff d0                	call   *%eax
            break;
  103657:	eb 27                	jmp    103680 <vprintfmt+0x3d1>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103659:	8b 45 0c             	mov    0xc(%ebp),%eax
  10365c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103660:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  103667:	8b 45 08             	mov    0x8(%ebp),%eax
  10366a:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  10366c:	ff 4d 10             	decl   0x10(%ebp)
  10366f:	eb 03                	jmp    103674 <vprintfmt+0x3c5>
  103671:	ff 4d 10             	decl   0x10(%ebp)
  103674:	8b 45 10             	mov    0x10(%ebp),%eax
  103677:	48                   	dec    %eax
  103678:	0f b6 00             	movzbl (%eax),%eax
  10367b:	3c 25                	cmp    $0x25,%al
  10367d:	75 f2                	jne    103671 <vprintfmt+0x3c2>
                /* do nothing */;
            break;
  10367f:	90                   	nop
    while (1) {
  103680:	e9 36 fc ff ff       	jmp    1032bb <vprintfmt+0xc>
                return;
  103685:	90                   	nop
        }
    }
}
  103686:	83 c4 40             	add    $0x40,%esp
  103689:	5b                   	pop    %ebx
  10368a:	5e                   	pop    %esi
  10368b:	5d                   	pop    %ebp
  10368c:	c3                   	ret    

0010368d <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  10368d:	f3 0f 1e fb          	endbr32 
  103691:	55                   	push   %ebp
  103692:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103694:	8b 45 0c             	mov    0xc(%ebp),%eax
  103697:	8b 40 08             	mov    0x8(%eax),%eax
  10369a:	8d 50 01             	lea    0x1(%eax),%edx
  10369d:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036a0:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1036a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036a6:	8b 10                	mov    (%eax),%edx
  1036a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036ab:	8b 40 04             	mov    0x4(%eax),%eax
  1036ae:	39 c2                	cmp    %eax,%edx
  1036b0:	73 12                	jae    1036c4 <sprintputch+0x37>
        *b->buf ++ = ch;
  1036b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036b5:	8b 00                	mov    (%eax),%eax
  1036b7:	8d 48 01             	lea    0x1(%eax),%ecx
  1036ba:	8b 55 0c             	mov    0xc(%ebp),%edx
  1036bd:	89 0a                	mov    %ecx,(%edx)
  1036bf:	8b 55 08             	mov    0x8(%ebp),%edx
  1036c2:	88 10                	mov    %dl,(%eax)
    }
}
  1036c4:	90                   	nop
  1036c5:	5d                   	pop    %ebp
  1036c6:	c3                   	ret    

001036c7 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1036c7:	f3 0f 1e fb          	endbr32 
  1036cb:	55                   	push   %ebp
  1036cc:	89 e5                	mov    %esp,%ebp
  1036ce:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1036d1:	8d 45 14             	lea    0x14(%ebp),%eax
  1036d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1036d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1036da:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1036de:	8b 45 10             	mov    0x10(%ebp),%eax
  1036e1:	89 44 24 08          	mov    %eax,0x8(%esp)
  1036e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1036ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1036ef:	89 04 24             	mov    %eax,(%esp)
  1036f2:	e8 08 00 00 00       	call   1036ff <vsnprintf>
  1036f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1036fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1036fd:	c9                   	leave  
  1036fe:	c3                   	ret    

001036ff <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  1036ff:	f3 0f 1e fb          	endbr32 
  103703:	55                   	push   %ebp
  103704:	89 e5                	mov    %esp,%ebp
  103706:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103709:	8b 45 08             	mov    0x8(%ebp),%eax
  10370c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10370f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103712:	8d 50 ff             	lea    -0x1(%eax),%edx
  103715:	8b 45 08             	mov    0x8(%ebp),%eax
  103718:	01 d0                	add    %edx,%eax
  10371a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10371d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103724:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103728:	74 0a                	je     103734 <vsnprintf+0x35>
  10372a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10372d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103730:	39 c2                	cmp    %eax,%edx
  103732:	76 07                	jbe    10373b <vsnprintf+0x3c>
        return -E_INVAL;
  103734:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103739:	eb 2a                	jmp    103765 <vsnprintf+0x66>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  10373b:	8b 45 14             	mov    0x14(%ebp),%eax
  10373e:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103742:	8b 45 10             	mov    0x10(%ebp),%eax
  103745:	89 44 24 08          	mov    %eax,0x8(%esp)
  103749:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10374c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103750:	c7 04 24 8d 36 10 00 	movl   $0x10368d,(%esp)
  103757:	e8 53 fb ff ff       	call   1032af <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  10375c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10375f:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103762:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103765:	c9                   	leave  
  103766:	c3                   	ret    
