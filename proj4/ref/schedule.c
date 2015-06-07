typedef long unsigned int size_t;
typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;
typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;
typedef int __daddr_t;
typedef long int __swblk_t;
typedef int __key_t;
typedef int __clockid_t;
typedef void * __timer_t;
typedef long int __blksize_t;
typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;
typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;
typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;
typedef long int __ssize_t;
typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;
typedef long int __intptr_t;
typedef unsigned int __socklen_t;

typedef struct _IO_FILE FILE;




void schedule();




typedef struct _IO_FILE __FILE;
typedef int wchar_t;
typedef unsigned int wint_t;
typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
enum
{
  __GCONV_OK = 0,
  __GCONV_NOCONV,
  __GCONV_NODB,
  __GCONV_NOMEM,
  __GCONV_EMPTY_INPUT,
  __GCONV_FULL_OUTPUT,
  __GCONV_ILLEGAL_INPUT,
  __GCONV_INCOMPLETE_INPUT,
  __GCONV_ILLEGAL_DESCRIPTOR,
  __GCONV_INTERNAL_ERROR
};
enum
{
  __GCONV_IS_LAST = 0x0001,
  __GCONV_IGNORE_ERRORS = 0x0002
};
struct __gconv_step;
struct __gconv_step_data;
struct __gconv_loaded_object;
struct __gconv_trans_data;
typedef int (*__gconv_fct) (struct __gconv_step *, struct __gconv_step_data *,
       __const unsigned char **, __const unsigned char *,
       unsigned char **, size_t *, int, int);
typedef wint_t (*__gconv_btowc_fct) (struct __gconv_step *, unsigned char);
typedef int (*__gconv_init_fct) (struct __gconv_step *);
typedef void (*__gconv_end_fct) (struct __gconv_step *);
typedef int (*__gconv_trans_fct) (struct __gconv_step *,
      struct __gconv_step_data *, void *,
      __const unsigned char *,
      __const unsigned char **,
      __const unsigned char *, unsigned char **,
      size_t *);
typedef int (*__gconv_trans_context_fct) (void *, __const unsigned char *,
       __const unsigned char *,
       unsigned char *, unsigned char *);
typedef int (*__gconv_trans_query_fct) (__const char *, __const char ***,
     size_t *);
typedef int (*__gconv_trans_init_fct) (void **, const char *);
typedef void (*__gconv_trans_end_fct) (void *);
struct __gconv_trans_data
{
  __gconv_trans_fct __trans_fct;
  __gconv_trans_context_fct __trans_context_fct;
  __gconv_trans_end_fct __trans_end_fct;
  void *__data;
  struct __gconv_trans_data *__next;
};
struct __gconv_step
{
  struct __gconv_loaded_object *__shlib_handle;
  __const char *__modname;
  int __counter;
  char *__from_name;
  char *__to_name;
  __gconv_fct __fct;
  __gconv_btowc_fct __btowc_fct;
  __gconv_init_fct __init_fct;
  __gconv_end_fct __end_fct;
  int __min_needed_from;
  int __max_needed_from;
  int __min_needed_to;
  int __max_needed_to;
  int __stateful;
  void *__data;
};
struct __gconv_step_data
{
  unsigned char *__outbuf;
  unsigned char *__outbufend;
  int __flags;
  int __invocation_counter;



  int __internal_use;

  __mbstate_t *__statep;
  __mbstate_t __state;



  struct __gconv_trans_data *__trans;
};



typedef struct __gconv_info
{
  size_t __nsteps;
  struct __gconv_step *__steps;
  __extension__ struct __gconv_step_data __data [];
} *__gconv_t;
typedef union
{
  struct __gconv_info __cd;
  struct
  {
    struct __gconv_info __cd;
    struct __gconv_step_data __data;
  } __combined;
} _G_iconv_t;
typedef int _G_int16_t __attribute__ ((__mode__ (__HI__)));
typedef int _G_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int _G_uint16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int _G_uint32_t __attribute__ ((__mode__ (__SI__)));
typedef __builtin_va_list __gnuc_va_list;
struct _IO_jump_t; struct _IO_FILE;
typedef void _IO_lock_t;
struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;
  int _pos;


};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
struct _IO_FILE {
  int _flags;
  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;
  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;
  struct _IO_marker *_markers;
  struct _IO_FILE *_chain;
  int _fileno;
  int _flags2;
  __off_t _old_offset;
  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];
  _IO_lock_t *_lock;
  __off64_t _offset;
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;
  int _mode;
  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
};
typedef struct _IO_FILE _IO_FILE;
struct _IO_FILE_plus;
extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);
typedef __ssize_t __io_write_fn (void *__cookie, __const char *__buf,
     size_t __n);
typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);
typedef int __io_close_fn (void *__cookie);
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
extern wint_t __wunderflow (_IO_FILE *);
extern wint_t __wuflow (_IO_FILE *);
extern wint_t __woverflow (_IO_FILE *, wint_t);
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__));
extern int _IO_peekc_locked (_IO_FILE *__fp);
extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__));
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);
extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);
extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__));

typedef _G_fpos_t fpos_t;

extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;

extern int remove (__const char *__filename) __attribute__ ((__nothrow__));
extern int rename (__const char *__old, __const char *__new) __attribute__ ((__nothrow__));


extern FILE *tmpfile (void);
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__));

extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__));
extern char *tempnam (__const char *__dir, __const char *__pfx)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__));

extern int fclose (FILE *__stream);
extern int fflush (FILE *__stream);

extern int fflush_unlocked (FILE *__stream);

extern FILE *fopen (__const char *__restrict __filename,
      __const char *__restrict __modes);
extern FILE *freopen (__const char *__restrict __filename,
        __const char *__restrict __modes,
        FILE *__restrict __stream);

extern FILE *fdopen (int __fd, __const char *__modes) __attribute__ ((__nothrow__));

extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__));

extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__));








extern int fprintf (FILE *__restrict __stream,
      __const char *__restrict __format, ...);




extern int printf (__const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      __const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (__const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       __const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        __const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));


extern int fscanf (FILE *__restrict __stream,
     __const char *__restrict __format, ...) ;
extern int scanf (__const char *__restrict __format, ...) ;
extern int sscanf (__const char *__restrict __s,
     __const char *__restrict __format, ...) __attribute__ ((__nothrow__));


extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);
extern int getchar (void);

extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
extern int fgetc_unlocked (FILE *__stream);

extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);
extern int putchar (int __c);

extern int fputc_unlocked (int __c, FILE *__stream);
extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);
extern int getw (FILE *__stream);
extern int putw (int __w, FILE *__stream);

extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
extern char *gets (char *__s) ;


extern int fputs (__const char *__restrict __s, FILE *__restrict __stream);
extern int puts (__const char *__s);
extern int ungetc (int __c, FILE *__stream);
extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite (__const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s) ;

extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (__const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream) ;

extern int fseek (FILE *__stream, long int __off, int __whence);
extern long int ftell (FILE *__stream) ;
extern void rewind (FILE *__stream);

extern int fseeko (FILE *__stream, __off_t __off, int __whence);
extern __off_t ftello (FILE *__stream) ;

extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);
extern int fsetpos (FILE *__stream, __const fpos_t *__pos);


extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__));
extern int feof (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern int ferror (FILE *__stream) __attribute__ ((__nothrow__)) ;

extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;

extern void perror (__const char *__s);

extern int sys_nerr;
extern __const char *__const sys_errlist[];
extern int fileno (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern FILE *popen (__const char *__command, __const char *__modes) ;
extern int pclose (FILE *__stream);
extern char *ctermid (char *__s) __attribute__ ((__nothrow__));
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__));
extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__));

typedef struct _job {
    struct _job *next, *prev;
    int val ;
    short priority;
} Ele, *Ele_Ptr;
typedef struct list
{
  Ele *first;
  Ele *last;
  int mem_count;
} List;
Ele* new_ele(new_num)
int new_num;
{
    Ele *ele;
    ele =(Ele *)malloc(sizeof(Ele));
    ele->next = 0;
    ele->prev = 0;
    ele->val = new_num;
    return ele;
}
List *new_list()
{
    List *list;
    list = (List *)malloc(sizeof(List));
    list->first = 0;
    list->last = 0;
    list->mem_count = 0;
    return (list);
}
List *append_ele(a_list, a_ele)
List *a_list;
Ele *a_ele;
{
  if (!a_list)
      a_list = new_list();
  a_ele->prev = a_list->last;
  if (a_list->last)
    a_list->last->next = a_ele;
  else
    a_list->first = a_ele;
  a_list->last = a_ele;
  a_ele->next = 0;
  a_list->mem_count++;
  return (a_list);
}
Ele *find_nth(f_list, n)
List *f_list;
int n;
{
    Ele *f_ele;
    int i;
    if (!f_list)
 return 0;
    f_ele = f_list->first;
    for (i=1; f_ele && (i<n); i++)
 f_ele = f_ele->next;
    return f_ele;
}
List *del_ele(d_list, d_ele)
List *d_list;
Ele *d_ele;
{
    if (!d_list || !d_ele)
 return (0);
    if (d_ele->next)
 d_ele->next->prev = d_ele->prev;
    else
 d_list->last = d_ele->prev;
    if (d_ele->prev)
 d_ele->prev->next = d_ele->next;
    else
 d_list->first = d_ele->next;
    d_list->mem_count--;
    return (d_list);
}
void free_ele(ptr)
Ele *ptr;
{
    free(ptr);
}
int alloc_proc_num;
int num_processes;
Ele* cur_proc;
List *prio_queue[3 +1];
List *block_queue;
void
finish_process()
{
    schedule();
    if (cur_proc)
    {
 fprintf(stdout, "%d ", cur_proc->val);
 free_ele(cur_proc);
 num_processes--;
    }
}
void
finish_all_processes()
{
    int i;
    int total;
    total = num_processes;
    for (i=0; i<total; i++)
 finish_process();
}

void schedule()
{
    int i;
    cur_proc = 0;
    for (i=3; i > 0; i--)
    {
 if (prio_queue[i]->mem_count > 0)
 {
     cur_proc = prio_queue[i]->first;
     prio_queue[i] = del_ele(prio_queue[i], cur_proc);
     return;
 }
    }
}
void
upgrade_process_prio(prio, ratio)
int prio;
float ratio;
{
    int count;
    int n;
    Ele *proc;
    List *src_queue, *dest_queue;
    if (prio >= 3)
 return;
    src_queue = prio_queue[prio];
    dest_queue = prio_queue[prio+1];
    count = src_queue->mem_count;
    if (count > 0)
    {
 n = (int) (count*ratio + 1);
 proc = find_nth(src_queue, n);
 if (proc) {
     src_queue = del_ele(src_queue, proc);
     proc->priority = prio;
     dest_queue = append_ele(dest_queue, proc);
 }
    }
}
void
unblock_process(ratio)
float ratio;
{
    int count;
    int n;
    Ele *proc;
    int prio;
    if (block_queue)
    {
 count = block_queue->mem_count;
 n = (int) (count*ratio + 1);
 proc = find_nth(block_queue, n);
 if (proc) {
     block_queue = del_ele(block_queue, proc);
     prio = proc->priority;
     prio_queue[prio] = append_ele(prio_queue[prio], proc);
 }
    }
}
void quantum_expire()
{
    int prio;
    schedule();
    if (cur_proc)
    {
 prio = cur_proc->priority;
 prio_queue[prio] = append_ele(prio_queue[prio], cur_proc);
    }
}
void
block_process()
{
    schedule();
    if (cur_proc)
    {
 block_queue = append_ele(block_queue, cur_proc);
    }
}
Ele * new_process(prio)
int prio;
{
    Ele *proc;
    proc = new_ele(alloc_proc_num++);
    proc->priority = prio;
    num_processes++;
    return proc;
}
void add_process(prio)
int prio;
{
    Ele *proc;
    proc = new_process(prio);
    prio_queue[prio] = append_ele(prio_queue[prio], proc);
}
void init_prio_queue(prio, num_proc)
int prio;
int num_proc;
{
    List *queue;
    Ele *proc;
    int i;
    queue = new_list();
    for (i=0; i<num_proc; i++)
    {
 proc = new_process(prio);
 queue = append_ele(queue, proc);
    }
    prio_queue[prio] = queue;
}
void initialize()
{
    alloc_proc_num = 0;
    num_processes = 0;
}
main(argc, argv)
int argc;
char *argv[];
{
    int command;
    int prio;
    float ratio;
    int status;
    if (argc < (3 +1))
    {
 fprintf(stdout, "incorrect usage\n");
 return 1;
    }
    initialize();
    for (prio=3; prio >= 1; prio--)
    {
 init_prio_queue(prio, atoi(argv[prio]));
    }
    for (status = fscanf(stdin, "%d", &command);
  ((status!=(-1)) && status);
  status = fscanf(stdin, "%d", &command))
    {
 switch(command)
 {
 case 6:
     finish_process();
     break;
 case 3:
     block_process();
     break;
 case 5:
     quantum_expire();
     break;
 case 4:
     fscanf(stdin, "%f", &ratio);
     unblock_process(ratio);
     break;
 case 2:
     fscanf(stdin, "%d", &prio);
     fscanf(stdin, "%f", &ratio);
     if (prio > 3 || prio <= 0) {
  fprintf(stdout, "** invalid priority\n");
  return 2;
     }
     else
  upgrade_process_prio(prio, ratio);
     break;
 case 1:
     fscanf(stdin, "%d", &prio);
     if (prio > 3 || prio <= 0) {
  fprintf(stdout, "** invalid priority\n");
  return 3;
     }
     else
  add_process(prio);
     break;
 case 7:
     finish_all_processes();
     break;
 }
    }
    return 0;
}
