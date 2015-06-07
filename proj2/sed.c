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

enum
{
  _ISupper = ((0) < 8 ? ((1 << (0)) << 8) : ((1 << (0)) >> 8)),
  _ISlower = ((1) < 8 ? ((1 << (1)) << 8) : ((1 << (1)) >> 8)),
  _ISalpha = ((2) < 8 ? ((1 << (2)) << 8) : ((1 << (2)) >> 8)),
  _ISdigit = ((3) < 8 ? ((1 << (3)) << 8) : ((1 << (3)) >> 8)),
  _ISxdigit = ((4) < 8 ? ((1 << (4)) << 8) : ((1 << (4)) >> 8)),
  _ISspace = ((5) < 8 ? ((1 << (5)) << 8) : ((1 << (5)) >> 8)),
  _ISprint = ((6) < 8 ? ((1 << (6)) << 8) : ((1 << (6)) >> 8)),
  _ISgraph = ((7) < 8 ? ((1 << (7)) << 8) : ((1 << (7)) >> 8)),
  _ISblank = ((8) < 8 ? ((1 << (8)) << 8) : ((1 << (8)) >> 8)),
  _IScntrl = ((9) < 8 ? ((1 << (9)) << 8) : ((1 << (9)) >> 8)),
  _ISpunct = ((10) < 8 ? ((1 << (10)) << 8) : ((1 << (10)) >> 8)),
  _ISalnum = ((11) < 8 ? ((1 << (11)) << 8) : ((1 << (11)) >> 8))
};
extern __const unsigned short int **__ctype_b_loc (void)
     __attribute__ ((__const));
extern __const __int32_t **__ctype_tolower_loc (void)
     __attribute__ ((__const));
extern __const __int32_t **__ctype_toupper_loc (void)
     __attribute__ ((__const));

extern int isalnum (int) __attribute__ ((__nothrow__));
extern int isalpha (int) __attribute__ ((__nothrow__));
extern int iscntrl (int) __attribute__ ((__nothrow__));
extern int isdigit (int) __attribute__ ((__nothrow__));
extern int islower (int) __attribute__ ((__nothrow__));
extern int isgraph (int) __attribute__ ((__nothrow__));
extern int isprint (int) __attribute__ ((__nothrow__));
extern int ispunct (int) __attribute__ ((__nothrow__));
extern int isspace (int) __attribute__ ((__nothrow__));
extern int isupper (int) __attribute__ ((__nothrow__));
extern int isxdigit (int) __attribute__ ((__nothrow__));
extern int tolower (int __c) __attribute__ ((__nothrow__));
extern int toupper (int __c) __attribute__ ((__nothrow__));


extern int isblank (int) __attribute__ ((__nothrow__));

extern int isctype (int __c, int __mask) __attribute__ ((__nothrow__));
extern int isascii (int __c) __attribute__ ((__nothrow__));
extern int toascii (int __c) __attribute__ ((__nothrow__));
extern int _toupper (int) __attribute__ ((__nothrow__));
extern int _tolower (int) __attribute__ ((__nothrow__));
typedef struct __locale_struct
{
  struct locale_data *__locales[13];
  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;
  const char *__names[13];
} *__locale_t;
extern int isalnum_l (int, __locale_t) __attribute__ ((__nothrow__));
extern int isalpha_l (int, __locale_t) __attribute__ ((__nothrow__));
extern int iscntrl_l (int, __locale_t) __attribute__ ((__nothrow__));
extern int isdigit_l (int, __locale_t) __attribute__ ((__nothrow__));
extern int islower_l (int, __locale_t) __attribute__ ((__nothrow__));
extern int isgraph_l (int, __locale_t) __attribute__ ((__nothrow__));
extern int isprint_l (int, __locale_t) __attribute__ ((__nothrow__));
extern int ispunct_l (int, __locale_t) __attribute__ ((__nothrow__));
extern int isspace_l (int, __locale_t) __attribute__ ((__nothrow__));
extern int isupper_l (int, __locale_t) __attribute__ ((__nothrow__));
extern int isxdigit_l (int, __locale_t) __attribute__ ((__nothrow__));
extern int isblank_l (int, __locale_t) __attribute__ ((__nothrow__));
extern int __tolower_l (int __c, __locale_t __l) __attribute__ ((__nothrow__));
extern int tolower_l (int __c, __locale_t __l) __attribute__ ((__nothrow__));
extern int __toupper_l (int __c, __locale_t __l) __attribute__ ((__nothrow__));
extern int toupper_l (int __c, __locale_t __l) __attribute__ ((__nothrow__));



typedef struct _IO_FILE FILE;


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
typedef __io_read_fn cookie_read_function_t;
typedef __io_write_fn cookie_write_function_t;
typedef __io_seek_fn cookie_seek_function_t;
typedef __io_close_fn cookie_close_function_t;
typedef struct
{
  __io_read_fn *read;
  __io_write_fn *write;
  __io_seek_fn *seek;
  __io_close_fn *close;
} _IO_cookie_io_functions_t;
typedef _IO_cookie_io_functions_t cookie_io_functions_t;
struct _IO_cookie_file;
extern void _IO_cookie_init (struct _IO_cookie_file *__cfile, int __read_write,
        void *__cookie, _IO_cookie_io_functions_t __fns);
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
typedef __gnuc_va_list va_list;

typedef _G_fpos_t fpos_t;

typedef _G_fpos64_t fpos64_t;
extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;

extern int remove (__const char *__filename) __attribute__ ((__nothrow__));
extern int rename (__const char *__old, __const char *__new) __attribute__ ((__nothrow__));

extern int renameat (int __oldfd, __const char *__old, int __newfd,
       __const char *__new) __attribute__ ((__nothrow__));

extern FILE *tmpfile (void);
extern FILE *tmpfile64 (void);
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__));

extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__));
extern char *tempnam (__const char *__dir, __const char *__pfx)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__));

extern int fclose (FILE *__stream);
extern int fflush (FILE *__stream);

extern int fflush_unlocked (FILE *__stream);
extern int fcloseall (void);

extern FILE *fopen (__const char *__restrict __filename,
      __const char *__restrict __modes);
extern FILE *freopen (__const char *__restrict __filename,
        __const char *__restrict __modes,
        FILE *__restrict __stream);

extern FILE *fopen64 (__const char *__restrict __filename,
        __const char *__restrict __modes);
extern FILE *freopen64 (__const char *__restrict __filename,
   __const char *__restrict __modes,
   FILE *__restrict __stream);
extern FILE *fdopen (int __fd, __const char *__modes) __attribute__ ((__nothrow__));
extern FILE *fopencookie (void *__restrict __magic_cookie,
     __const char *__restrict __modes,
     _IO_cookie_io_functions_t __io_funcs) __attribute__ ((__nothrow__));
extern FILE *fmemopen (void *__s, size_t __len, __const char *__modes) __attribute__ ((__nothrow__));
extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__));

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

extern int vasprintf (char **__restrict __ptr, __const char *__restrict __f,
        __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0)));
extern int __asprintf (char **__restrict __ptr,
         __const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3)));
extern int asprintf (char **__restrict __ptr,
       __const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3)));
extern int vdprintf (int __fd, __const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, __const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));

extern int fscanf (FILE *__restrict __stream,
     __const char *__restrict __format, ...) ;
extern int scanf (__const char *__restrict __format, ...) ;
extern int sscanf (__const char *__restrict __s,
     __const char *__restrict __format, ...) __attribute__ ((__nothrow__));


extern int vfscanf (FILE *__restrict __s, __const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (__const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (__const char *__restrict __s,
      __const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__scanf__, 2, 0)));


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

extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream) ;
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;
extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;

extern int fputs (__const char *__restrict __s, FILE *__restrict __stream);
extern int puts (__const char *__s);
extern int ungetc (int __c, FILE *__stream);
extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite (__const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s) ;

extern int fputs_unlocked (__const char *__restrict __s,
      FILE *__restrict __stream);
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

extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, __const fpos64_t *__pos);

extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__));
extern int feof (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern int ferror (FILE *__stream) __attribute__ ((__nothrow__)) ;

extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;

extern void perror (__const char *__s);

extern int sys_nerr;
extern __const char *__const sys_errlist[];
extern int _sys_nerr;
extern __const char *__const _sys_errlist[];
extern int fileno (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern FILE *popen (__const char *__command, __const char *__modes) ;
extern int pclose (FILE *__stream);
extern char *ctermid (char *__s) __attribute__ ((__nothrow__));
extern char *cuserid (char *__s);
struct obstack;
extern int obstack_printf (struct obstack *__restrict __obstack,
      __const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       __const char *__restrict __format,
       __gnuc_va_list __args)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0)));
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__));
extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__));


typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;
typedef __loff_t loff_t;
typedef __ino_t ino_t;
typedef __ino64_t ino64_t;
typedef __dev_t dev_t;
typedef __gid_t gid_t;
typedef __mode_t mode_t;
typedef __nlink_t nlink_t;
typedef __uid_t uid_t;
typedef __off_t off_t;
typedef __off64_t off64_t;
typedef __pid_t pid_t;
typedef __id_t id_t;
typedef __ssize_t ssize_t;
typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;
typedef __key_t key_t;

typedef __clock_t clock_t;



typedef __time_t time_t;


typedef __clockid_t clockid_t;
typedef __timer_t timer_t;
typedef __useconds_t useconds_t;
typedef __suseconds_t suseconds_t;
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));
typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));
typedef int register_t __attribute__ ((__mode__ (__word__)));
typedef int __sig_atomic_t;
typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
typedef __sigset_t sigset_t;
struct timespec
  {
    __time_t tv_sec;
    long int tv_nsec;
  };
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
typedef long int __fd_mask;
typedef struct
  {
    __fd_mask fds_bits[1024 / (8 * sizeof (__fd_mask))];
  } fd_set;
typedef __fd_mask fd_mask;

extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);

__extension__
extern __inline unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__));
__extension__
extern __inline unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__));
__extension__
extern __inline unsigned long long int gnu_dev_makedev (unsigned int __major,
       unsigned int __minor)
     __attribute__ ((__nothrow__));
__extension__ extern __inline unsigned int
__attribute__ ((__nothrow__)) gnu_dev_major (unsigned long long int __dev)
{
  return ((__dev >> 8) & 0xfff) | ((unsigned int) (__dev >> 32) & ~0xfff);
}
__extension__ extern __inline unsigned int
__attribute__ ((__nothrow__)) gnu_dev_minor (unsigned long long int __dev)
{
  return (__dev & 0xff) | ((unsigned int) (__dev >> 12) & ~0xff);
}
__extension__ extern __inline unsigned long long int
__attribute__ ((__nothrow__)) gnu_dev_makedev (unsigned int __major, unsigned int __minor)
{
  return ((__minor & 0xff) | ((__major & 0xfff) << 8)
   | (((unsigned long long int) (__minor & ~0xff)) << 12)
   | (((unsigned long long int) (__major & ~0xfff)) << 32));
}
typedef __blksize_t blksize_t;
typedef __blkcnt_t blkcnt_t;
typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;
typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;
typedef unsigned long int pthread_t;
typedef union
{
  char __size[56];
  long int __align;
} pthread_attr_t;
typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;
    unsigned int __nusers;
    int __kind;
    int __spins;
    __pthread_list_t __list;
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;
typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;
typedef unsigned int pthread_key_t;
typedef int pthread_once_t;
typedef union
{
  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    unsigned long int __pad1;
    unsigned long int __pad2;
    unsigned int __flags;
  } __data;
  char __size[56];
  long int __align;
} pthread_rwlock_t;
typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;
typedef volatile int pthread_spinlock_t;
typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;

typedef unsigned reg_syntax_t;
extern reg_syntax_t re_syntax_options;
typedef enum
{
  REG_NOERROR = 0,
  REG_NOMATCH,
  REG_BADPAT,
  REG_ECOLLATE,
  REG_ECTYPE,
  REG_EESCAPE,
  REG_ESUBREG,
  REG_EBRACK,
  REG_EPAREN,
  REG_EBRACE,
  REG_BADBR,
  REG_ERANGE,
  REG_ESPACE,
  REG_BADRPT,
  REG_EEND,
  REG_ESIZE,
  REG_ERPAREN
} reg_errcode_t;
struct re_pattern_buffer
{
  unsigned char *buffer;
  unsigned long allocated;
  unsigned long used;
  reg_syntax_t syntax;
  char *fastmap;
  char *translate;
  size_t re_nsub;
  unsigned can_be_null : 1;
  unsigned regs_allocated : 2;
  unsigned fastmap_accurate : 1;
  unsigned no_sub : 1;
  unsigned not_bol : 1;
  unsigned not_eol : 1;
  unsigned newline_anchor : 1;
};
typedef struct re_pattern_buffer regex_t;
typedef int regoff_t;
struct re_registers
{
  unsigned num_regs;
  regoff_t *start;
  regoff_t *end;
};
typedef struct
{
  regoff_t rm_so;
  regoff_t rm_eo;
} regmatch_t;
extern reg_syntax_t re_set_syntax (reg_syntax_t syntax);
extern const char *re_compile_pattern
  (const char *pattern, int length, struct re_pattern_buffer *buffer);
extern int re_compile_fastmap (struct re_pattern_buffer *buffer);
extern int re_search
  (struct re_pattern_buffer *buffer, const char *string, int length, int start, int range, struct re_registers *regs);
extern int re_search_2
  (struct re_pattern_buffer *buffer, const char *string1, int length1, const char *string2, int length2, int start, int range, struct re_registers *regs, int stop);
extern int re_match
  (struct re_pattern_buffer *buffer, const char *string, int length, int start, struct re_registers *regs);
extern int re_match_2
  (struct re_pattern_buffer *buffer, const char *string1, int length1, const char *string2, int length2, int start, struct re_registers *regs, int stop);
extern void re_set_registers
  (struct re_pattern_buffer *buffer, struct re_registers *regs, unsigned num_regs, regoff_t *starts, regoff_t *ends);
extern char *re_comp (const char *);
extern int re_exec (const char *);
extern int regcomp (regex_t *preg, const char *pattern, int cflags);
extern int regexec
  (const regex_t *preg, const char *string, size_t nmatch, regmatch_t pmatch[], int eflags);
extern size_t regerror
  (int errcode, const regex_t *preg, char *errbuf, size_t errbuf_size);
extern void regfree (regex_t *preg);
extern char *optarg;
extern int optind;
extern int opterr;
extern int optopt;
struct option
{
  const char *name;
  int has_arg;
  int *flag;
  int val;
};
extern int getopt (int argc, char *const *argv, const char *shortopts);
extern int getopt_long (int argc, char *const *argv, const char *shortopts,
          const struct option *longopts, int *longind);
extern int getopt_long_only (int argc, char *const *argv,
        const char *shortopts,
               const struct option *longopts, int *longind);
extern int _getopt_internal (int argc, char *const *argv,
        const char *shortopts,
               const struct option *longopts, int *longind,
        int long_only);

union wait
  {
    int w_status;
    struct
      {
 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;
      } __wait_terminated;
    struct
      {
 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;
      } __wait_stopped;
  };
typedef union
  {
    union wait *__uptr;
    int *__iptr;
  } __WAIT_STATUS __attribute__ ((__transparent_union__));

typedef struct
  {
    int quot;
    int rem;
  } div_t;
typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;


__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;

extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__)) ;

extern double atof (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
extern int atoi (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
extern long int atol (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;


__extension__ extern long long int atoll (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;


extern double strtod (__const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;


extern float strtof (__const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
extern long double strtold (__const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;


extern long int strtol (__const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
extern unsigned long int strtoul (__const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

__extension__
extern long long int strtoq (__const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
__extension__
extern unsigned long long int strtouq (__const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

__extension__
extern long long int strtoll (__const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
__extension__
extern unsigned long long int strtoull (__const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

extern long int strtol_l (__const char *__restrict __nptr,
     char **__restrict __endptr, int __base,
     __locale_t __loc) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 4))) ;
extern unsigned long int strtoul_l (__const char *__restrict __nptr,
        char **__restrict __endptr,
        int __base, __locale_t __loc)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 4))) ;
__extension__
extern long long int strtoll_l (__const char *__restrict __nptr,
    char **__restrict __endptr, int __base,
    __locale_t __loc)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 4))) ;
__extension__
extern unsigned long long int strtoull_l (__const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, __locale_t __loc)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 4))) ;
extern double strtod_l (__const char *__restrict __nptr,
   char **__restrict __endptr, __locale_t __loc)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3))) ;
extern float strtof_l (__const char *__restrict __nptr,
         char **__restrict __endptr, __locale_t __loc)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3))) ;
extern long double strtold_l (__const char *__restrict __nptr,
         char **__restrict __endptr,
         __locale_t __loc)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3))) ;
extern double __strtod_internal (__const char *__restrict __nptr,
     char **__restrict __endptr, int __group)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
extern float __strtof_internal (__const char *__restrict __nptr,
    char **__restrict __endptr, int __group)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
extern long double __strtold_internal (__const char *__restrict __nptr,
           char **__restrict __endptr,
           int __group)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
extern long int __strtol_internal (__const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, int __group)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
extern unsigned long int __strtoul_internal (__const char *__restrict __nptr,
          char **__restrict __endptr,
          int __base, int __group)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
__extension__
extern long long int __strtoll_internal (__const char *__restrict __nptr,
      char **__restrict __endptr,
      int __base, int __group)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
__extension__
extern unsigned long long int __strtoull_internal (__const char *
         __restrict __nptr,
         char **__restrict __endptr,
         int __base, int __group)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
extern char *l64a (long int __n) __attribute__ ((__nothrow__)) ;
extern long int a64l (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
extern long int random (void) __attribute__ ((__nothrow__));
extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__));
extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));
extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };
extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));
extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 4)));
extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern int rand (void) __attribute__ ((__nothrow__));
extern void srand (unsigned int __seed) __attribute__ ((__nothrow__));

extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__));
extern double drand48 (void) __attribute__ ((__nothrow__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern long int lrand48 (void) __attribute__ ((__nothrow__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern long int mrand48 (void) __attribute__ ((__nothrow__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern void srand48 (long int __seedval) __attribute__ ((__nothrow__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    unsigned long long int __a;
  };
extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));
extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern void *malloc (size_t __size) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;
extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;


extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));
extern void free (void *__ptr) __attribute__ ((__nothrow__));

extern void cfree (void *__ptr) __attribute__ ((__nothrow__));

extern void *alloca (size_t __size) __attribute__ ((__nothrow__));

extern void *valloc (size_t __size) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;
extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

extern void abort (void) __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));
extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));

extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));

extern void exit (int __status) __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));


extern void _Exit (int __status) __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));


extern char *getenv (__const char *__name) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

extern char *__secure_getenv (__const char *__name)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
extern int putenv (char *__string) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern int setenv (__const char *__name, __const char *__value, int __replace)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));
extern int unsetenv (__const char *__name) __attribute__ ((__nothrow__));
extern int clearenv (void) __attribute__ ((__nothrow__));
extern char *mktemp (char *__template) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) ;
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

extern int system (__const char *__command) ;

extern char *canonicalize_file_name (__const char *__name)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
extern char *realpath (__const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__)) ;
typedef int (*__compar_fn_t) (__const void *, __const void *);
typedef __compar_fn_t comparison_fn_t;

extern void *bsearch (__const void *__key, __const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;
extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
extern int abs (int __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;

__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;

extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;


__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;

extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3))) ;
extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3))) ;
extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int mblen (__const char *__s, size_t __n) __attribute__ ((__nothrow__)) ;
extern int mbtowc (wchar_t *__restrict __pwc,
     __const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__)) ;
extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__)) ;
extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   __const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__));
extern size_t wcstombs (char *__restrict __s,
   __const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__));

extern int rpmatch (__const char *__response) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
extern int getsubopt (char **__restrict __optionp,
        char *__const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2, 3))) ;
extern void setkey (__const char *__key) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern int posix_openpt (int __oflag) ;
extern int grantpt (int __fd) __attribute__ ((__nothrow__));
extern int unlockpt (int __fd) __attribute__ ((__nothrow__));
extern char *ptsname (int __fd) __attribute__ ((__nothrow__)) ;
extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));
extern int getpt (void);
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern void *memcpy (void *__restrict __dest,
       __const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memmove (void *__dest, __const void *__src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern void *memccpy (void *__restrict __dest, __const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern int memcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memchr (__const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

extern void *rawmemchr (__const void *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern void *memrchr (__const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

extern char *strcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strcat (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strncat (char *__restrict __dest, __const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strncmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcoll (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strxfrm (char *__restrict __dest,
         __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));

extern int strcoll_l (__const char *__s1, __const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));
extern size_t strxfrm_l (char *__dest, __const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 4)));
extern char *strdup (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
extern char *strndup (__const char *__string, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));

extern char *strchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *strrchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

extern char *strchrnul (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

extern size_t strcspn (__const char *__s, __const char *__reject)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strspn (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strpbrk (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strstr (__const char *__haystack, __const char *__needle)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strtok (char *__restrict __s, __const char *__restrict __delim)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));

extern char *__strtok_r (char *__restrict __s,
    __const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3)));
extern char *strtok_r (char *__restrict __s, __const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3)));
extern char *strcasestr (__const char *__haystack, __const char *__needle)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memmem (__const void *__haystack, size_t __haystacklen,
       __const void *__needle, size_t __needlelen)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)));
extern void *__mempcpy (void *__restrict __dest,
   __const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        __const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strlen (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

extern size_t strnlen (__const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

extern char *strerror (int __errnum) __attribute__ ((__nothrow__));

extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));
extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern void bcopy (__const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern int bcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *index (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *rindex (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern int ffs (int __i) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
extern int ffsl (long int __l) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__));
extern int strcasecmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strncasecmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcasecmp_l (__const char *__s1, __const char *__s2,
    __locale_t __loc)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));
extern int strncasecmp_l (__const char *__s1, __const char *__s2,
     size_t __n, __locale_t __loc)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));
extern char *strsep (char **__restrict __stringp,
       __const char *__restrict __delim)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strverscmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strsignal (int __sig) __attribute__ ((__nothrow__));
extern char *__stpcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *__stpncpy (char *__restrict __dest,
   __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strfry (char *__string) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern void *memfrob (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern char *basename (__const char *__filename) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int *__errno_location (void) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
extern char *program_invocation_name, *program_invocation_short_name;

typedef int error_t;
char *version_string = "GNU sed version 1.18";
struct vector
{
  struct sed_cmd *v;
  int v_length;
  int v_allocated;
  struct vector *return_v;
  int return_i;
};
struct sed_label
{
  struct vector *v;
  int v_index;
  char *name;
  struct sed_label *next;
};
enum addr_types
{
  addr_is_null = 0,
  addr_is_num = 1,
  addr_is_regex = 2,
  addr_is_last = 3
};
struct addr
{
  int addr_type;
  struct re_pattern_buffer *addr_regex;
  int addr_number;
};
struct sed_cmd
{
  struct addr a1, a2;
  int aflags;
  char cmd;
  union
    {
      struct
 {
   char *text;
   int text_len;
 }
      cmd_txt;
      struct sed_cmd *label;
      FILE *io_file;
      struct
 {
   struct re_pattern_buffer *regx;
   char *replacement;
   int replace_length;
   int flags;
   int numb;
   FILE *wio_file;
 }
      cmd_regex;
      unsigned char *translate;
      struct vector *sub;
      struct sed_label *jump;
    } x;
};
struct line
{
  char *text;
  int length;
  int alloc;
};
struct
  {
    FILE *phile;
    char *name;
    int readit;
  }
file_ptrs[32];
void close_files ();
void panic (char *str,...);
char *__fp_name (FILE * fp);
FILE *ck_fopen (char *name, char *mode);
void ck_fwrite (char *ptr, int size, int nmemb, FILE * stream);
void ck_fclose (FILE * stream);
void *ck_malloc (int size);
void *ck_realloc (void * ptr, int size);
char *ck_strdup (char *str);
void *init_buffer (void);
void flush_buffer (void * bb);
int size_buffer (void * b);
void add_buffer (void * bb, char *p, int n);
void add1_buffer (void * bb, int ch);
char *get_buffer (void * bb);
void compile_string (char *str);
void compile_file (char *str);
struct vector *compile_program (struct vector * vector, int);
void bad_prog (char *why);
int inchar (void);
void savchar (int ch);
int compile_address (struct addr * addr);
void compile_regex (int slash);
struct sed_label *setup_jump (struct sed_label * list, struct sed_cmd * cmd, struct vector * vec);
FILE *compile_filename (int readit);
void read_file (char *name);
void execute_program (struct vector * vec);
int match_address (struct addr * addr);
int read_pattern_space (void);
void append_pattern_space (void);
void line_copy (struct line * from, struct line * to);
void line_append (struct line * from, struct line * to);
void str_append (struct line * to, char *string, int length);
void usage (int);
extern char *myname;
int no_default_output = 0;
int input_line_number = 0;
int last_input_file = 0;
int input_EOF = 0;
int quit_cmd = 0;
int replaced = 0;
int program_depth = 0;
struct vector *the_program = 0;
struct sed_label *jumps = 0;
struct sed_label *labels = 0;
struct line line;
struct line hold;
struct line append;
unsigned char *prog_start;
unsigned char *prog_end;
unsigned char *prog_cur;
char *prog_name;
FILE *prog_file;
int prog_line = 1;
FILE *input_file;
int bad_input = 0;
struct re_pattern_buffer *last_regex;
static char ONE_ADDR[] = "Command only uses one address";
static char NO_ADDR[] = "Command doesn't take any addresses";
static char LINE_JUNK[] = "Extra characters after command";
static char BAD_EOF[] = "Unexpected End-of-file";
static char NO_REGEX[] = "No previous regular expression";
static char NO_COMMAND[] = "Missing command";
static struct option longopts[] =
{
  {"expression", 1, ((void *)0), 'e'},
  {"file", 1, ((void *)0), 'f'},
  {"quiet", 0, ((void *)0), 'n'},
  {"silent", 0, ((void *)0), 'n'},
  {"version", 0, ((void *)0), 'V'},
  {"help", 0, ((void *)0), 'h'},
  {((void *)0), 0, ((void *)0), 0}
};
int
main (argc, argv)
     int argc;
     char **argv;
{
  int opt;
  char *e_strings = ((void *)0);
  int compiled = 0;
  struct sed_label *go, *lbl;
  re_set_syntax ((((((1) << 1) << 1) | (((((((1) << 1) << 1) << 1) << 1) << 1) << 1) | ((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) | ((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) | (((((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)) | ((1) << 1)));
  myname = "Executable";
  while ((opt = getopt_long (argc, argv, "hne:f:V", longopts, (int *) 0))
  != (-1))
    {
      switch (opt)
 {
 case 'n':
   no_default_output = 1;
   break;
 case 'e':
   if (e_strings == ((void *)0))
     {
       e_strings = ck_malloc (strlen (optarg) + 2);
       strcpy (e_strings, optarg);
     }
   else
     {
       e_strings = ck_realloc (e_strings, strlen (e_strings) + strlen (optarg) + 2);
       strcat (e_strings, optarg);
     }
   strcat (e_strings, "\n");
   compiled = 1;
   break;
 case 'f':
   compile_file (optarg);
   compiled = 1;
   break;
 case 'V':
   fprintf (stdout, "%s\n", version_string);
   exit (0);
   break;
 case 'h':
   usage (0);
   break;
 default:
   usage (4);
   break;
 }
    }
  if (e_strings)
    {
      compile_string (e_strings);
      free (e_strings);
    }
  if (!compiled)
    {
      if (optind == argc)
 usage (4);
      compile_string (argv[optind++]);
    }
  for (go = jumps; go; go = go->next)
    {
      for (lbl = labels; lbl; lbl = lbl->next)
 if (!strcmp (lbl->name, go->name))
   break;
      if (*go->name && !lbl)
 panic ("Can't find label for jump to '%s'", go->name);
      go->v->v[go->v_index].x.jump = lbl;
    }
  line.length = 0;
  line.alloc = 50;
  line.text = ck_malloc (50);
  append.length = 0;
  append.alloc = 50;
  append.text = ck_malloc (50);
  hold.length = 1;
  hold.alloc = 50;
  hold.text = ck_malloc (50);
  hold.text[0] = '\n';
  if (argc <= optind)
    {
      last_input_file++;
      read_file ("-");
    }
  else
    while (optind < argc)
      {
 if (optind == argc - 1)
   last_input_file++;
 read_file (argv[optind]);
 optind++;
 if (quit_cmd)
   break;
      }
  close_files ();
  if (bad_input)
    exit (2);
  exit (0);
}
void
close_files ()
{
  int nf;
  for (nf = 0; nf < 32; nf++)
    {
      if (file_ptrs[nf].phile)
 fclose (file_ptrs[nf].phile);
    }
}
void
compile_string (str)
     char *str;
{
  prog_file = 0;
  prog_line = 0;
  prog_start = prog_cur = (unsigned char *)str;
  prog_end = (unsigned char *)str + strlen (str);
  the_program = compile_program (the_program, prog_line);
}
void
compile_file (str)
     char *str;
{
  int ch;
  prog_start = prog_cur = prog_end = 0;
  prog_name = str;
  prog_line = 1;
  if (str[0] == '-' && str[1] == '\0')
    prog_file = stdin;
  else
    prog_file = ck_fopen (str, "r");
  ch = _IO_getc (prog_file);
  if (ch == '#')
    {
      ch = _IO_getc (prog_file);
      if (ch == 'n')
 no_default_output++;
      while (ch != (-1) && ch != '\n')
 ch = _IO_getc (prog_file);
      ++prog_line;
    }
  else if (ch != (-1))
    ungetc (ch, prog_file);
  the_program = compile_program (the_program, prog_line);
}
struct vector *
compile_program (vector, open_line)
     struct vector *vector;
     int open_line;
{
  struct sed_cmd *cur_cmd;
  int pch,ch = 0;
  int slash;
  void *b;
  unsigned char *string;
  int num;
  if (!vector)
    {
      vector = (struct vector *) ck_malloc (sizeof (struct vector));
      vector->v = (struct sed_cmd *) ck_malloc (40 * sizeof (struct sed_cmd));
      vector->v_allocated = 40;
      vector->v_length = 0;
      vector->return_v = 0;
      vector->return_i = 0;
    }
  for (;;)
    {
    skip_comment:
      do
 {
   pch = ch;
   ch = inchar ();
   if ((pch == '\\') && (ch == '\n'))
     ch = inchar ();
 }
      while (ch != (-1) && (((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISblank) || ch == '\n' || ch == ';'));
      if (ch == (-1))
 break;
      savchar (ch);
      if (vector->v_length == vector->v_allocated)
 {
   vector->v = ((struct sed_cmd *)
         ck_realloc ((void *) vector->v,
       ((vector->v_length + 40)
        * sizeof (struct sed_cmd))));
   vector->v_allocated += 40;
 }
      cur_cmd = vector->v + vector->v_length;
      vector->v_length++;
      cur_cmd->a1.addr_type = 0;
      cur_cmd->a2.addr_type = 0;
      cur_cmd->aflags = 0;
      cur_cmd->cmd = 0;
      if (compile_address (&(cur_cmd->a1)))
 {
   ch = inchar ();
   if (ch == ',')
     {
       do
  ch = inchar ();
       while (ch != (-1) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISblank));
       savchar (ch);
       if (compile_address (&(cur_cmd->a2)))
  ;
       else
  bad_prog ("Unexpected ','");
     }
   else
     savchar (ch);
 }
      if (cur_cmd->a1.addr_type == addr_is_num
   && cur_cmd->a2.addr_type == addr_is_num
   && cur_cmd->a2.addr_number < cur_cmd->a1.addr_number)
 cur_cmd->a2.addr_number = cur_cmd->a1.addr_number;
      ch = inchar ();
      if (ch == (-1))
 bad_prog (NO_COMMAND);
    new_cmd:
      switch (ch)
 {
 case '#':
   if (cur_cmd->a1.addr_type != 0)
     bad_prog (NO_ADDR);
   do
     ch = inchar ();
   while (ch != (-1) && ch != '\n');
   vector->v_length--;
   goto skip_comment;
 case '!':
   if (cur_cmd->aflags & 02)
     bad_prog ("Multiple '!'s");
   cur_cmd->aflags |= 02;
   do
     ch = inchar ();
   while (ch != (-1) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISblank));
   if (ch == (-1))
     bad_prog (NO_COMMAND);
   goto new_cmd;
 case 'a':
 case 'i':
   if (cur_cmd->a2.addr_type != 0)
     bad_prog (ONE_ADDR);
 case 'c':
   cur_cmd->cmd = ch;
   if (inchar () != '\\' || inchar () != '\n')
     bad_prog (LINE_JUNK);
   b = init_buffer ();
   while ((ch = inchar ()) != (-1) && ch != '\n')
     {
       if (ch == '\\')
  ch = inchar ();
       add1_buffer (b, ch);
     }
   if (ch != (-1))
     add1_buffer (b, ch);
   num = size_buffer (b);
   string = (unsigned char *) ck_malloc (num);
   bcopy (get_buffer (b), string, num);
   flush_buffer (b);
   cur_cmd->x.cmd_txt.text_len = num;
   cur_cmd->x.cmd_txt.text = (char *) string;
   break;
 case '{':
   cur_cmd->cmd = ch;
   program_depth++;
   cur_cmd->x.sub = compile_program ((struct vector *) 0, prog_line);
   cur_cmd->x.sub->return_v = vector;
   cur_cmd->x.sub->return_i = vector->v_length - 1;
   break;
 case '}':
   if (!program_depth)
     bad_prog ("Unexpected '}'");
   --program_depth;
   cur_cmd->cmd = ch;
   if (cur_cmd->a1.addr_type != 0)
     bad_prog ("} doesn't want any addresses");
   while ((ch = inchar ()) != (-1) && ch != '\n' && ch != ';')
     if (!((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISblank))
       bad_prog (LINE_JUNK);
   return vector;
 case ':':
   cur_cmd->cmd = ch;
   if (cur_cmd->a1.addr_type != 0)
     bad_prog (": doesn't want any addresses");
   labels = setup_jump (labels, cur_cmd, vector);
   break;
 case 'b':
 case 't':
   cur_cmd->cmd = ch;
   jumps = setup_jump (jumps, cur_cmd, vector);
   break;
 case 'q':
 case '=':
   if (cur_cmd->a2.addr_type)
     bad_prog (ONE_ADDR);
 case 'd':
 case 'D':
 case 'g':
 case 'G':
 case 'h':
 case 'H':
 case 'l':
 case 'n':
 case 'N':
 case 'p':
 case 'P':
 case 'x':
   cur_cmd->cmd = ch;
   do
     ch = inchar ();
   while (ch != (-1) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISblank) && ch != '\n' && ch != ';');
   if (ch != '\n' && ch != ';' && ch != (-1))
     bad_prog (LINE_JUNK);
   break;
 case 'r':
   if (cur_cmd->a2.addr_type != 0)
     bad_prog (ONE_ADDR);
 case 'w':
   cur_cmd->cmd = ch;
   cur_cmd->x.io_file = compile_filename (ch == 'r');
   break;
 case 's':
   cur_cmd->cmd = ch;
   slash = inchar ();
   compile_regex (slash);
   cur_cmd->x.cmd_regex.regx = last_regex;
   b = init_buffer ();
   while (((ch = inchar ()) != (-1)) && (ch != slash) && (ch != '\n'))
     {
       if (ch == '\\')
  {
    int ci;
    ci = inchar ();
    if (ci != (-1))
      {
        if (ci != '\n')
   add1_buffer (b, ch);
        add1_buffer (b, ci);
      }
  }
       else
  add1_buffer (b, ch);
     }
   if (ch != slash)
     {
       if (ch == '\n' && prog_line > 1)
  --prog_line;
       bad_prog ("Unterminated `s' command");
     }
   cur_cmd->x.cmd_regex.replace_length = size_buffer (b);
   cur_cmd->x.cmd_regex.replacement = ck_malloc (cur_cmd->x.cmd_regex.replace_length);
   bcopy (get_buffer (b), cur_cmd->x.cmd_regex.replacement, cur_cmd->x.cmd_regex.replace_length);
   flush_buffer (b);
   cur_cmd->x.cmd_regex.flags = 0;
   cur_cmd->x.cmd_regex.numb = 0;
   if (ch == (-1))
     break;
   do
     {
       ch = inchar ();
       switch (ch)
  {
  case 'p':
    if (cur_cmd->x.cmd_regex.flags & 02)
      bad_prog ("multiple 'p' options to 's' command");
    cur_cmd->x.cmd_regex.flags |= 02;
    break;
  case 'g':
    if (cur_cmd->x.cmd_regex.flags & 010)
      cur_cmd->x.cmd_regex.flags &= ~010;
    if (cur_cmd->x.cmd_regex.flags & 01)
      bad_prog ("multiple 'g' options to 's' command");
    cur_cmd->x.cmd_regex.flags |= 01;
    break;
  case 'w':
    cur_cmd->x.cmd_regex.flags |= 04;
    cur_cmd->x.cmd_regex.wio_file = compile_filename (0);
    ch = '\n';
    break;
  case '0':
  case '1':
  case '2':
  case '3':
  case '4':
  case '5':
  case '6':
  case '7':
  case '8':
  case '9':
    if (cur_cmd->x.cmd_regex.flags & 010)
      bad_prog ("multiple number options to 's' command");
    if ((cur_cmd->x.cmd_regex.flags & 01) == 0)
      cur_cmd->x.cmd_regex.flags |= 010;
    num = 0;
    while (((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISdigit))
      {
        num = num * 10 + ch - '0';
        ch = inchar ();
      }
    savchar (ch);
    cur_cmd->x.cmd_regex.numb = num;
    break;
  case '\n':
  case ';':
  case (-1):
    break;
  default:
    bad_prog ("Unknown option to 's'");
    break;
  }
     }
   while (ch != (-1) && ch != '\n' && ch != ';');
   if (ch == (-1))
     break;
   break;
 case 'y':
   cur_cmd->cmd = ch;
   string = (unsigned char *) ck_malloc (256);
   for (num = 0; num < 256; num++)
     string[num] = num;
   b = init_buffer ();
   slash = inchar ();
   while ((ch = inchar ()) != (-1) && ch != slash)
     add1_buffer (b, ch);
   cur_cmd->x.translate = string;
   string = (unsigned char *) get_buffer (b);
   for (num = size_buffer (b); num; --num)
     {
       ch = inchar ();
       if (ch == (-1))
  bad_prog (BAD_EOF);
       if (ch == slash)
  bad_prog ("strings for y command are different lengths");
       cur_cmd->x.translate[*string++] = ch;
     }
   flush_buffer (b);
   if (inchar () != slash || ((ch = inchar ()) != (-1) && ch != '\n' && ch != ';'))
     bad_prog (LINE_JUNK);
   break;
 default:
   bad_prog ("Unknown command");
 }
    }
  if (program_depth)
    {
      prog_line = open_line;
      bad_prog ("Unmatched `{'");
    }
  return vector;
}
void
bad_prog (why)
     char *why;
{
  if (prog_line > 0)
    fprintf (stdout, "%s: file %s line %d: %s\n",
      myname, prog_name, prog_line, why);
  else
    fprintf (stdout, "%s: %s\n", myname, why);
  exit (1);
}
int
inchar ()
{
  int ch;
  if (prog_file)
    {
      if (feof (prog_file))
 return (-1);
      else
 ch = _IO_getc (prog_file);
    }
  else
    {
      if (!prog_cur)
 return (-1);
      else if (prog_cur == prog_end)
 {
   ch = (-1);
   prog_cur = 0;
 }
      else
 ch = *prog_cur++;
    }
  if ((ch == '\n') && prog_line)
    prog_line++;
  return ch;
}
void
savchar (ch)
     int ch;
{
  if (ch == (-1))
    return;
  if (ch == '\n' && prog_line > 1)
    --prog_line;
  if (prog_file)
    ungetc (ch, prog_file);
  else
    *--prog_cur = ch;
}
int
compile_address (addr)
     struct addr *addr;
{
  int ch;
  int num;
  ch = inchar ();
  if (((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISdigit))
    {
      num = ch - '0';
      while ((ch = inchar ()) != (-1) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISdigit))
 num = num * 10 + ch - '0';
      while (ch != (-1) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISblank))
 ch = inchar ();
      savchar (ch);
      addr->addr_type = addr_is_num;
      addr->addr_number = num;
      return 1;
    }
  else if (ch == '/' || ch == '\\')
    {
      addr->addr_type = addr_is_regex;
      if (ch == '\\')
 ch = inchar ();
      compile_regex (ch);
      addr->addr_regex = last_regex;
      do
 ch = inchar ();
      while (ch != (-1) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISblank));
      savchar (ch);
      return 1;
    }
  else if (ch == '$')
    {
      addr->addr_type = addr_is_last;
      do
 ch = inchar ();
      while (ch != (-1) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISblank));
      savchar (ch);
      return 1;
    }
  else
    savchar (ch);
  return 0;
}
void
compile_regex (slash)
     int slash;
{
  void *b;
  int ch;
  int char_class_pos = -1;
  b = init_buffer ();
  while ((ch = inchar ()) != (-1) && (ch != slash || (char_class_pos >= 0)))
    {
      if (ch == '^')
 {
   if (size_buffer (b) == 0)
     {
       add1_buffer (b, '\\');
       add1_buffer (b, '`');
     }
   else
     add1_buffer (b, ch);
   continue;
 }
      else if (ch == '$')
 {
   ch = inchar ();
   savchar (ch);
   if (ch == slash)
     {
       add1_buffer (b, '\\');
       add1_buffer (b, '\'');
     }
   else
     add1_buffer (b, '$');
   continue;
 }
      else if (ch == '[')
 {
   if (char_class_pos < 0)
     char_class_pos = size_buffer (b);
   add1_buffer (b, ch);
   continue;
 }
      else if (ch == ']')
 {
   add1_buffer (b, ch);
   {
     char * regexp = get_buffer (b);
     int pos = size_buffer (b) - 1;
     if (!( (char_class_pos >= 0)
    && ( (pos == char_class_pos + 1)
        || ( (pos == char_class_pos + 2)
     && (regexp[char_class_pos + 1] == '^')))))
       char_class_pos = -1;
     continue;
   }
 }
      else if (ch != '\\' || (char_class_pos >= 0))
 {
   add1_buffer (b, ch);
   continue;
 }
      ch = inchar ();
      switch (ch)
 {
 case 'n':
   add1_buffer (b, '\n');
   break;
 case (-1):
   break;
 default:
   add1_buffer (b, '\\');
   add1_buffer (b, ch);
   break;
 }
    }
  if (ch == (-1))
    bad_prog (BAD_EOF);
  if (size_buffer (b))
    {
      last_regex = (struct re_pattern_buffer *) ck_malloc (sizeof (struct re_pattern_buffer));
      last_regex->allocated = size_buffer (b) + 10;
      last_regex->buffer =
 (unsigned char *) ck_malloc (last_regex->allocated);
      last_regex->fastmap = ck_malloc (256);
      last_regex->translate = 0;
      re_compile_pattern (get_buffer (b), size_buffer (b), last_regex);
    }
  else if (!last_regex)
    bad_prog (NO_REGEX);
  flush_buffer (b);
}
struct sed_label *
setup_jump (list, cmd, vec)
     struct sed_label *list;
     struct sed_cmd *cmd;
     struct vector *vec;
{
  struct sed_label *tmp;
  void *b;
  int ch;
  b = init_buffer ();
  while ((ch = inchar ()) != (-1) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISblank))
    ;
  while (ch != (-1) && ch != '\n' && (!((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISblank)) && ch != ';' && ch != '}')
    {
      add1_buffer (b, ch);
      ch = inchar ();
    }
  savchar (ch);
  add1_buffer (b, '\0');
  tmp = (struct sed_label *) ck_malloc (sizeof (struct sed_label));
  tmp->v = vec;
  tmp->v_index = cmd - vec->v;
  tmp->name = ck_strdup (get_buffer (b));
  tmp->next = list;
  flush_buffer (b);
  return tmp;
}
FILE *
compile_filename (readit)
     int readit;
{
  char *file_name;
  int n;
  void *b;
  int ch;
  if (inchar () != ' ')
    bad_prog ("missing ' ' before filename");
  b = init_buffer ();
  while ((ch = inchar ()) != (-1) && ch != '\n')
    add1_buffer (b, ch);
  add1_buffer (b, '\0');
  file_name = get_buffer (b);
  for (n = 0; n < 32; n++)
    {
      if (!file_ptrs[n].name)
 break;
      if (!strcmp (file_ptrs[n].name, file_name))
 {
   if (file_ptrs[n].readit != readit)
     bad_prog ("Can't open file for both reading and writing");
   flush_buffer (b);
   return file_ptrs[n].phile;
 }
    }
  if (n < 32)
    {
      file_ptrs[n].name = ck_strdup (file_name);
      file_ptrs[n].readit = readit;
      if (!readit)
 file_ptrs[n].phile = ck_fopen (file_name, "w");
      else
 {
   file_ptrs[n].phile = ck_fopen (file_name, "r");
 }
      flush_buffer (b);
      return file_ptrs[n].phile;
    }
  else
    {
      bad_prog ("Hopelessely evil compiled in limit on number of open files.  re-compile sed");
      return 0;
    }
}
void
read_file (name)
     char *name;
{
  if (*name == '-' && name[1] == '\0')
    input_file = stdin;
  else
    {
      input_file = fopen (name, "r");
      if (input_file == 0)
 {
   char *ptr = strerror((*__errno_location ()));
   bad_input++;
   fprintf (stdout, "%s: can't read %s: %s\n", myname, name, ptr);
   return;
 }
    }
  while (read_pattern_space ())
    {
      execute_program (the_program);
      if (!no_default_output)
 ck_fwrite (line.text, 1, line.length, stdout);
      if (append.length)
 {
   ck_fwrite (append.text, 1, append.length, stdout);
   append.length = 0;
 }
      if (quit_cmd)
 break;
    }
  ck_fclose (input_file);
}
static char *
eol_pos (str, len)
     char *str;
     int len;
{
  while (len--)
    if (*str++ == '\n')
      return --str;
  return --str;
}
static void
chr_copy (dest, src, len)
     char *dest;
     char *src;
     int len;
{
  while (len--)
    *dest++ = *src++;
}
static struct re_registers regs =
{0, 0, 0};
void
execute_program (vec)
     struct vector *vec;
{
  struct sed_cmd *cur_cmd;
  int n;
  int addr_matched;
  static int end_cycle;
  int start;
  int remain;
  int offset;
  static struct line tmp;
  struct line t;
  char *rep, *rep_end, *rep_next, *rep_cur;
  int count;
  struct vector *restart_vec = vec;
restart:
  vec = restart_vec;
  count = 0;
  end_cycle = 0;
  for (cur_cmd = vec->v, n = vec->v_length; n; cur_cmd++, n--)
    {
    exe_loop:
      addr_matched = 0;
      if (cur_cmd->aflags & 01)
 {
   addr_matched = 1;
   if (match_address (&(cur_cmd->a2)))
     cur_cmd->aflags &= ~01;
 }
      else if (match_address (&(cur_cmd->a1)))
 {
   addr_matched = 1;
   if (cur_cmd->a2.addr_type != addr_is_null)
     if ( (cur_cmd->a2.addr_type == addr_is_regex)
  || !match_address (&(cur_cmd->a2)))
       cur_cmd->aflags |= 01;
 }
      if (cur_cmd->aflags & 02)
 addr_matched = !addr_matched;
      if (!addr_matched)
 continue;
      switch (cur_cmd->cmd)
 {
 case '{':
   if (cur_cmd->x.sub->v_length)
     {
       vec = cur_cmd->x.sub;
       cur_cmd = vec->v;
       n = vec->v_length;
       goto exe_loop;
     }
   break;
 case '}':
   cur_cmd = vec->return_v->v + vec->return_i;
   n = vec->return_v->v_length - vec->return_i;
   vec = vec->return_v;
   break;
 case ':':
   break;
 case '=':
   printf ("%d\n", input_line_number);
   break;
 case 'a':
   while (append.alloc - append.length < cur_cmd->x.cmd_txt.text_len)
     {
       append.alloc *= 2;
       append.text = ck_realloc (append.text, append.alloc);
     }
   bcopy (cur_cmd->x.cmd_txt.text,
   append.text + append.length, cur_cmd->x.cmd_txt.text_len);
   append.length += cur_cmd->x.cmd_txt.text_len;
   break;
 case 'b':
   if (!cur_cmd->x.jump)
     end_cycle++;
   else
     {
       struct sed_label *j = cur_cmd->x.jump;
       n = j->v->v_length - j->v_index;
       cur_cmd = j->v->v + j->v_index;
       goto exe_loop;
     }
   break;
 case 'c':
   line.length = 0;
   if (!((cur_cmd->aflags & 01)))
     ck_fwrite (cur_cmd->x.cmd_txt.text,
         1, cur_cmd->x.cmd_txt.text_len, stdout);
   end_cycle++;
   break;
 case 'd':
   line.length = 0;
   end_cycle++;
   break;
 case 'D':
   {
     char *tmp;
     int newlength;
     tmp = eol_pos (line.text, line.length);
     newlength = line.length - (tmp - line.text) - 1;
     if (newlength)
       {
  chr_copy (line.text, tmp + 1, newlength);
  line.length = newlength;
  goto restart;
       }
     line.length = 0;
     end_cycle++;
   }
   break;
 case 'g':
   line_copy (&hold, &line);
   break;
 case 'G':
   line_append (&hold, &line);
   break;
 case 'h':
   line_copy (&line, &hold);
   break;
 case 'H':
   line_append (&line, &hold);
   break;
 case 'i':
   ck_fwrite (cur_cmd->x.cmd_txt.text, 1,
       cur_cmd->x.cmd_txt.text_len, stdout);
   break;
 case 'l':
   {
     char *tmp;
     int n;
     int width = 0;
     n = line.length;
     tmp = line.text;
     while (n--)
       {
  if (!n && (*tmp == '\n'))
    break;
  if (width > 77)
    {
      width = 0;
      putchar ('\n');
    }
  if (*tmp == '\\')
    {
      printf ("\\\\");
      width += 2;
    }
  else if (((*__ctype_b_loc ())[(int) ((*tmp))] & (unsigned short int) _ISprint))
    {
      putchar (*tmp);
      width++;
    }
  else
    switch (*tmp)
      {
      case 007:
        printf ("\\a");
        width += 2;
        break;
      case '\b':
        printf ("\\b");
        width += 2;
        break;
      case '\f':
        printf ("\\f");
        width += 2;
        break;
      case '\n':
        printf ("\\n");
        width += 2;
        break;
      case '\r':
        printf ("\\r");
        width += 2;
        break;
      case '\t':
        printf ("\\t");
        width += 2;
        break;
      case '\v':
        printf ("\\v");
        width += 2;
        break;
      default:
        printf ("\\%02x", (*tmp) & 0xFF);
        width += 2;
        break;
      }
  tmp++;
       }
     putchar ('\n');
   }
   break;
 case 'n':
   if (feof (input_file))
     goto quit;
   if (!no_default_output)
     ck_fwrite (line.text, 1, line.length, stdout);
   read_pattern_space ();
   break;
 case 'N':
   if (feof (input_file))
     {
       line.length = 0;
       goto quit;
     }
   append_pattern_space ();
   break;
 case 'p':
   ck_fwrite (line.text, 1, line.length, stdout);
   break;
 case 'P':
   {
     char *tmp;
     tmp = eol_pos (line.text, line.length);
     ck_fwrite (line.text, 1,
         tmp ? tmp - line.text + 1
         : line.length, stdout);
   }
   break;
 case 'q':
 quit:
   quit_cmd++;
   end_cycle++;
   break;
 case 'r':
   {
     int n = 0;
     if (cur_cmd->x.io_file)
       {
  rewind (cur_cmd->x.io_file);
  do
    {
      append.length += n;
      if (append.length == append.alloc)
        {
   append.alloc *= 2;
   append.text = ck_realloc (append.text, append.alloc);
        }
      n = fread (append.text + append.length, sizeof (char),
          append.alloc - append.length,
          cur_cmd->x.io_file);
    }
  while (n > 0);
  if (ferror (cur_cmd->x.io_file))
    panic ("Read error on input file to 'r' command");
       }
   }
   break;
 case 's':
   {
     int trail_nl_p = line.text [line.length - 1] == '\n';
     if (!tmp.alloc)
       {
  tmp.alloc = 50;
  tmp.text = ck_malloc (50);
       }
     count = 0;
     start = 0;
     remain = line.length - trail_nl_p;
     tmp.length = 0;
     rep = cur_cmd->x.cmd_regex.replacement;
     rep_end = rep + cur_cmd->x.cmd_regex.replace_length;
     while ((offset = re_search (cur_cmd->x.cmd_regex.regx,
     line.text,
     line.length - trail_nl_p,
     start,
     remain,
     &regs)) >= 0)
       {
  count++;
  if (offset - start)
    str_append (&tmp, line.text + start, offset - start);
  if (cur_cmd->x.cmd_regex.flags & 010)
    {
      if (count != cur_cmd->x.cmd_regex.numb)
        {
   int matched = regs.end[0] - regs.start[0];
   if (!matched) matched = 1;
   str_append (&tmp, line.text + regs.start[0], matched);
   start = (offset == regs.end[0]
     ? offset + 1 : regs.end[0]);
   remain = (line.length - trail_nl_p) - start;
   continue;
        }
    }
  for (rep_next = rep_cur = rep; rep_next < rep_end; rep_next++)
    {
      if (*rep_next == '&')
        {
   if (rep_next - rep_cur)
     str_append (&tmp, rep_cur, rep_next - rep_cur);
   str_append (&tmp, line.text + regs.start[0], regs.end[0] - regs.start[0]);
   rep_cur = rep_next + 1;
        }
      else if (*rep_next == '\\')
        {
   if (rep_next - rep_cur)
     str_append (&tmp, rep_cur, rep_next - rep_cur);
   rep_next++;
   if (rep_next != rep_end)
     {
       int n;
       if (*rep_next >= '0' && *rep_next <= '9')
         {
    n = *rep_next - '0';
    str_append (&tmp, line.text + regs.start[n], regs.end[n] - regs.start[n]);
         }
       else
         str_append (&tmp, rep_next, 1);
     }
   rep_cur = rep_next + 1;
        }
    }
  if (rep_next - rep_cur)
    str_append (&tmp, rep_cur, rep_next - rep_cur);
  if (offset == regs.end[0])
    {
      str_append (&tmp, line.text + offset, 1);
      ++regs.end[0];
    }
  start = regs.end[0];
  remain = (line.length - trail_nl_p) - start;
  if (remain < 0)
    break;
  if (!(cur_cmd->x.cmd_regex.flags & 01))
    break;
       }
     if (!count)
       break;
     replaced = 1;
     str_append (&tmp, line.text + start, remain + trail_nl_p);
     t.text = line.text;
     t.length = line.length;
     t.alloc = line.alloc;
     line.text = tmp.text;
     line.length = tmp.length;
     line.alloc = tmp.alloc;
     tmp.text = t.text;
     tmp.length = t.length;
     tmp.alloc = t.alloc;
     if ((cur_cmd->x.cmd_regex.flags & 04)
  && cur_cmd->x.cmd_regex.wio_file)
       ck_fwrite (line.text, 1, line.length,
    cur_cmd->x.cmd_regex.wio_file);
     if (cur_cmd->x.cmd_regex.flags & 02)
       ck_fwrite (line.text, 1, line.length, stdout);
     break;
   }
 case 't':
   if (replaced)
     {
       replaced = 0;
       if (!cur_cmd->x.jump)
  end_cycle++;
       else
  {
    struct sed_label *j = cur_cmd->x.jump;
    n = j->v->v_length - j->v_index;
    cur_cmd = j->v->v + j->v_index;
    goto exe_loop;
  }
     }
   break;
 case 'w':
   if (cur_cmd->x.io_file)
     ck_fwrite (line.text, 1, line.length, cur_cmd->x.io_file);
   break;
 case 'x':
   {
     struct line tmp;
     tmp = line;
     line = hold;
     hold = tmp;
   }
   break;
 case 'y':
   {
     unsigned char *p, *e;
     for (p = (unsigned char *) (line.text), e = p + line.length; p < e; p++)
       *p = cur_cmd->x.translate[*p];
   }
   break;
 default:
   panic ("INTERNAL ERROR: Bad cmd %c", cur_cmd->cmd);
 }
      if (end_cycle)
 break;
    }
}
int
match_address (addr)
     struct addr *addr;
{
  switch (addr->addr_type)
    {
    case addr_is_null:
      return 1;
    case addr_is_num:
      return (input_line_number == addr->addr_number);
    case addr_is_regex:
      {
 int trail_nl_p = line.text [line.length - 1] == '\n';
 return (re_search (addr->addr_regex,
      line.text,
      line.length - trail_nl_p,
      0,
      line.length - trail_nl_p,
      (struct re_registers *) 0) >= 0) ? 1 : 0;
      }
    case addr_is_last:
      return (input_EOF) ? 1 : 0;
    default:
      panic ("INTERNAL ERROR: bad address type");
      break;
    }
  return -1;
}
int
read_pattern_space ()
{
  int n;
  char *p;
  int ch;
  p = line.text;
  n = line.alloc;
  if (feof (input_file))
    return 0;
  input_line_number++;
  replaced = 0;
  for (;;)
    {
      if (n == 0)
 {
   line.text = ck_realloc (line.text, line.alloc * 2);
   p = line.text + line.alloc;
   n = line.alloc;
   line.alloc *= 2;
 }
      ch = _IO_getc (input_file);
      if (ch == (-1))
 {
   if (n == line.alloc)
     return 0;
   line.length = line.alloc - n;
   if (last_input_file)
     input_EOF++;
   return 1;
 }
      *p++ = ch;
      --n;
      if (ch == '\n')
 {
   line.length = line.alloc - n;
   break;
 }
    }
  ch = _IO_getc (input_file);
  if (ch != (-1))
    ungetc (ch, input_file);
  else if (last_input_file)
    input_EOF++;
  return 1;
}
void
append_pattern_space ()
{
  char *p;
  int n;
  int ch;
  p = line.text + line.length;
  n = line.alloc - line.length;
  input_line_number++;
  replaced = 0;
  for (;;)
    {
      ch = _IO_getc (input_file);
      if (ch == (-1))
 {
   if (n == line.alloc)
     return;
   line.length = line.alloc - n;
   if (last_input_file)
     input_EOF++;
   return;
 }
      if (n == 0)
 {
   line.text = ck_realloc (line.text, line.alloc * 2);
   p = line.text + line.alloc;
   n = line.alloc;
   line.alloc *= 2;
 }
      *p++ = ch;
      --n;
      if (ch == '\n')
 {
   line.length = line.alloc - n;
   break;
 }
    }
  ch = _IO_getc (input_file);
  if (ch != (-1))
    ungetc (ch, input_file);
  else if (last_input_file)
    input_EOF++;
}
void
line_copy (from, to)
     struct line *from, *to;
{
  if (from->length > to->alloc)
    {
      to->alloc = from->length;
      to->text = ck_realloc (to->text, to->alloc);
    }
  bcopy (from->text, to->text, from->length);
  to->length = from->length;
}
void
line_append (from, to)
     struct line *from, *to;
{
  if (from->length > (to->alloc - to->length))
    {
      to->alloc += from->length;
      to->text = ck_realloc (to->text, to->alloc);
    }
  bcopy (from->text, to->text + to->length, from->length);
  to->length += from->length;
}
void
str_append (to, string, length)
     struct line *to;
     char *string;
     int length;
{
  if (length > to->alloc - to->length)
    {
      to->alloc += length;
      to->text = ck_realloc (to->text, to->alloc);
    }
  bcopy (string, to->text + to->length, length);
  to->length += length;
}
void
usage (status)
     int status;
{
  fprintf (status ? stdout : stdout, "Usage: %s [-nV] [--quiet] [--silent] [--version] [-e script]\n        [-f script-file] [--expression=script] [--file=script-file] [file...]\n",
    myname);
  exit (status);
}
void *ck_malloc();
char *myname;
void
panic(char *str, ...)
{
 va_list iggy;
 fprintf(stdout,"%s: ",myname);
 __builtin_va_start(iggy,str);
 vfprintf(stdout,str,iggy);
 __builtin_va_end(iggy);
 _IO_putc ('\n', stdout);
 exit(4);
}
struct id {
 FILE *fp;
 char *name;
};
static struct id __id_s[32];
char *
__fp_name(fp)
FILE *fp;
{
 int n;
 for(n=0;n<32;n++) {
  if(__id_s[n].fp==fp)
   return __id_s[n].name;
 }
 return "{Unknown file pointer}";
}
FILE *
ck_fopen(name,mode)
char *name;
char *mode;
{
 FILE *ret;
 int n;
 ret=fopen(name,mode);
 if(ret==(FILE *)0)
  panic("Couldn't open file %s",name);
 for(n=0;n<32;n++) {
  if(ret==__id_s[n].fp) {
   free((void *)__id_s[n].name);
   __id_s[n].name=(char *)ck_malloc(strlen(name)+1);
   strcpy(__id_s[n].name,name);
   break;
  }
 }
 if(n==32) {
  for(n=0;n<32;n++)
   if(__id_s[n].fp==(FILE *)0)
    break;
  if(n==32)
   panic("Internal error: too many files open");
  __id_s[n].fp=ret;
  __id_s[n].name=(char *)ck_malloc(strlen(name)+1);
  strcpy(__id_s[n].name,name);
 }
 return ret;
}
void
ck_fwrite(ptr,size,nmemb,stream)
char *ptr;
int size,nmemb;
FILE *stream;
{
 if(fwrite(ptr,size,nmemb,stream)!=nmemb)
  panic("couldn't write %d items to %s",nmemb,__fp_name(stream));
}
void
ck_fclose(stream)
FILE *stream;
{
 if(fclose(stream)==(-1))
  panic("Couldn't close %s",__fp_name(stream));
}
void *
ck_malloc(size)
int size;
{
 void *ret;
 if(!size)
  size++;
 ret=malloc(size);
 if(ret==(void *)0)
  panic("Couldn't allocate memory");
 return ret;
}
void *
xmalloc(size)
int size;
{
  return ck_malloc (size);
}
void *
ck_realloc(ptr,size)
void *ptr;
int size;
{
 void *ret;
 ret=realloc(ptr,size);
 if(ret==(void *)0)
  panic("Couldn't re-allocate memory");
 return ret;
}
char *
ck_strdup(str)
char *str;
{
 char *ret;
 ret=(char *)ck_malloc(strlen(str)+2);
 strcpy(ret,str);
 return ret;
}
struct buffer {
 int allocated;
 int length;
 char *b;
};
void *
init_buffer()
{
 struct buffer *b;
 b=(struct buffer *)ck_malloc(sizeof(struct buffer));
 b->allocated=50;
 b->b=(char *)ck_malloc(50);
 b->length=0;
 return (void *)b;
}
void
flush_buffer(bb)
void *bb;
{
 struct buffer *b;
 b=(struct buffer *)bb;
 free(b->b);
 b->b=0;
 b->allocated=0;
 b->length=0;
 free(b);
}
int
size_buffer(b)
void *b;
{
 struct buffer *bb;
 bb=(struct buffer *)b;
 return bb->length;
}
void
add_buffer(bb,p,n)
void *bb;
char *p;
int n;
{
 struct buffer *b;
 int x;
 char * cp;
 b=(struct buffer *)bb;
 if(b->length+n>b->allocated) {
  b->allocated*=2;
  b->b=(char *)ck_realloc(b->b,b->allocated);
 }
 x = n;
 cp = b->b + b->length;
 while (x--)
   *cp++ = *p++;
 b->length+=n;
}
void
add1_buffer(bb,ch)
void *bb;
int ch;
{
 struct buffer *b;
 b=(struct buffer *)bb;
 if(b->length+1>b->allocated) {
  b->allocated*=2;
  b->b=(char *)ck_realloc(b->b,b->allocated);
 }
 b->b[b->length]=ch;
 b->length++;
}
char *
get_buffer(bb)
void *bb;
{
 struct buffer *b;
 b=(struct buffer *)bb;
 return b->b;
}
static char re_syntax_table[256];
static void
init_syntax_once ()
{
   register int c;
   static int done = 0;
   if (done)
     return;
   memset ((re_syntax_table), 0, (sizeof re_syntax_table));
   for (c = 'a'; c <= 'z'; c++)
     re_syntax_table[c] = 1;
   for (c = 'A'; c <= 'Z'; c++)
     re_syntax_table[c] = 1;
   for (c = '0'; c <= '9'; c++)
     re_syntax_table[c] = 1;
   re_syntax_table['_'] = 1;
   done = 1;
}
typedef char boolean;
typedef enum
{
  no_op = 0,
  exactn = 1,
  anychar,
  charset,
  charset_not,
  start_memory,
  stop_memory,
  duplicate,
  begline,
  endline,
  begbuf,
  endbuf,
  jump,
  jump_past_alt,
  on_failure_jump,
  on_failure_keep_string_jump,
  pop_failure_jump,
  maybe_pop_jump,
  dummy_failure_jump,
  push_dummy_failure,
  succeed_n,
  jump_n,
  set_number_at,
  wordchar,
  notwordchar,
  wordbeg,
  wordend,
  wordbound,
  notwordbound
} re_opcode_t;
reg_syntax_t re_syntax_options = 0;
reg_syntax_t
re_set_syntax (syntax)
    reg_syntax_t syntax;
{
  reg_syntax_t ret = re_syntax_options;
  re_syntax_options = syntax;
  return ret;
}
static const char *re_error_msg[] =
  { ((void *)0),
    "No match",
    "Invalid regular expression",
    "Invalid collation character",
    "Invalid character class name",
    "Trailing backslash",
    "Invalid back reference",
    "Unmatched [ or [^",
    "Unmatched ( or \\(",
    "Unmatched \\{",
    "Invalid content of \\{\\}",
    "Invalid range end",
    "Memory exhausted",
    "Invalid preceding regular expression",
    "Premature end of regular expression",
    "Regular expression too big",
    "Unmatched ) or \\)",
  };
static void store_op1 (), store_op2 ();
static void insert_op1 (), insert_op2 ();
static boolean at_begline_loc_p (), at_endline_loc_p ();
static boolean group_in_compile_stack ();
static reg_errcode_t compile_range ();
typedef unsigned regnum_t;
typedef int pattern_offset_t;
typedef struct
{
  pattern_offset_t begalt_offset;
  pattern_offset_t fixup_alt_jump;
  pattern_offset_t inner_group_offset;
  pattern_offset_t laststart_offset;
  regnum_t regnum;
} compile_stack_elt_t;
typedef struct
{
  compile_stack_elt_t *stack;
  unsigned size;
  unsigned avail;
} compile_stack_type;
static reg_errcode_t
regex_compile (pattern, size, syntax, bufp)
     const char *pattern;
     int size;
     reg_syntax_t syntax;
     struct re_pattern_buffer *bufp;
{
  register unsigned char c, c1;
  const char *p1;
  register unsigned char *b;
  compile_stack_type compile_stack;
  const char *p = pattern;
  const char *pend = pattern + size;
  char *translate = bufp->translate;
  unsigned char *pending_exact = 0;
  unsigned char *laststart = 0;
  unsigned char *begalt;
  const char *beg_interval;
  unsigned char *fixup_alt_jump = 0;
  regnum_t regnum = 0;
  compile_stack.stack = ((compile_stack_elt_t *) malloc ((32) * sizeof (compile_stack_elt_t)));
  if (compile_stack.stack == ((void *)0))
    return REG_ESPACE;
  compile_stack.size = 32;
  compile_stack.avail = 0;
  bufp->syntax = syntax;
  bufp->fastmap_accurate = 0;
  bufp->not_bol = bufp->not_eol = 0;
  bufp->used = 0;
  bufp->re_nsub = 0;
   init_syntax_once ();
  if (bufp->allocated == 0)
    {
      if (bufp->buffer)
 {
          ((bufp->buffer) = (unsigned char *) realloc (bufp->buffer, (32) * sizeof (unsigned char)));
        }
      else
        {
          bufp->buffer = ((unsigned char *) malloc ((32) * sizeof (unsigned char)));
        }
      if (!bufp->buffer) return REG_ESPACE;
      bufp->allocated = 32;
    }
  begalt = b = bufp->buffer;
  while (p != pend)
    {
      do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; if (translate) c = translate[c]; } while (0);
      switch (c)
        {
        case '^':
          {
            if (
                   p == pattern + 1
                || syntax & ((((1) << 1) << 1) << 1)
                || at_begline_loc_p (pattern, p, syntax))
              do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (begline); } while (0);
            else
              goto normal_char;
          }
          break;
        case '$':
          {
            if (
                   p == pend
                || syntax & ((((1) << 1) << 1) << 1)
                || at_endline_loc_p (p, pend, syntax))
               do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (endline); } while (0);
             else
               goto normal_char;
           }
           break;
 case '+':
        case '?':
          if ((syntax & ((1) << 1))
              || (syntax & (((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)))
            goto normal_char;
        handle_plus:
        case '*':
          if (!laststart)
            {
              if (syntax & ((((((1) << 1) << 1) << 1) << 1) << 1))
                return REG_BADRPT;
              else if (!(syntax & (((((1) << 1) << 1) << 1) << 1)))
                goto normal_char;
            }
          {
            boolean keep_string_p = 0;
            char zero_times_ok = 0, many_times_ok = 0;
            for (;;)
              {
                zero_times_ok |= c != '+';
                many_times_ok |= c != '?';
                if (p == pend)
                  break;
                do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; if (translate) c = translate[c]; } while (0);
                if (c == '*'
                    || (!(syntax & ((1) << 1)) && (c == '+' || c == '?')))
                  ;
                else if (syntax & ((1) << 1) && c == '\\')
                  {
                    if (p == pend) return REG_EESCAPE;
                    do {if (p == pend) return REG_EEND; c1 = (unsigned char) *p++; if (translate) c1 = translate[c1]; } while (0);
                    if (!(c1 == '+' || c1 == '?'))
                      {
                        p--;
                        p--;
                        break;
                      }
                    c = c1;
                  }
                else
                  {
                    p--;
                    break;
                  }
               }
            if (!laststart)
              break;
            if (many_times_ok)
              {
                ;
                while (b - bufp->buffer + (3) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0);
                if ((translate ? translate[(unsigned char) (*(p - 2))] : (*(p - 2))) == (translate ? translate[(unsigned char) ('.')] : ('.'))
      && zero_times_ok
                    && p < pend && (translate ? translate[(unsigned char) (*p)] : (*p)) == (translate ? translate[(unsigned char) ('\n')] : ('\n'))
                    && !(syntax & (((((((1) << 1) << 1) << 1) << 1) << 1) << 1)))
                  {
                    store_op1 (jump, b, (laststart) - (b) - 3);
                    keep_string_p = 1;
                  }
                else
                  store_op1 (maybe_pop_jump, b, (laststart - 3) - (b) - 3);
                b += 3;
              }
            while (b - bufp->buffer + (3) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0);
            insert_op1 (keep_string_p ? on_failure_keep_string_jump : on_failure_jump, laststart, (b + 3) - (laststart) - 3, b);
            pending_exact = 0;
            b += 3;
            if (!zero_times_ok)
              {
                while (b - bufp->buffer + (3) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0);
                insert_op1 (dummy_failure_jump, laststart, (laststart + 6) - (laststart) - 3, b);
                b += 3;
              }
            }
   break;
 case '.':
          laststart = b;
          do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (anychar); } while (0);
          break;
        case '[':
          {
            boolean had_char_class = 0;
            if (p == pend) return REG_EBRACK;
     while (b - bufp->buffer + (34) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0);
            laststart = b;
            do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (*p == '^' ? charset_not : charset); } while (0);
            if (*p == '^')
              p++;
            p1 = p;
            do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) ((1 << 8) / 8); } while (0);
            memset ((b), 0, ((1 << 8) / 8));
            if ((re_opcode_t) b[-2] == charset_not
                && (syntax & (((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)))
              (b[((unsigned char) ('\n')) / 8] |= 1 << (((unsigned char) '\n') % 8));
            for (;;)
              {
                if (p == pend) return REG_EBRACK;
                do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; if (translate) c = translate[c]; } while (0);
                if ((syntax & (1)) && c == '\\')
                  {
                    if (p == pend) return REG_EESCAPE;
                    do {if (p == pend) return REG_EEND; c1 = (unsigned char) *p++; if (translate) c1 = translate[c1]; } while (0);
                    (b[((unsigned char) (c1)) / 8] |= 1 << (((unsigned char) c1) % 8));
                    continue;
                  }
                if (c == ']' && p != p1 + 1)
                  break;
                if (had_char_class && c == '-' && *p != ']')
                  return REG_ERANGE;
                if (c == '-'
                    && !(p - 2 >= pattern && p[-2] == '[')
                    && !(p - 3 >= pattern && p[-3] == '[' && p[-2] == '^')
                    && *p != ']')
                  {
                    reg_errcode_t ret
                      = compile_range (&p, pend, translate, syntax, b);
                    if (ret != REG_NOERROR) return ret;
                  }
                else if (p[0] == '-' && p[1] != ']')
                  {
                    reg_errcode_t ret;
                    do {if (p == pend) return REG_EEND; c1 = (unsigned char) *p++; if (translate) c1 = translate[c1]; } while (0);
                    ret = compile_range (&p, pend, translate, syntax, b);
                    if (ret != REG_NOERROR) return ret;
                  }
                else if (syntax & (((1) << 1) << 1) && c == '[' && *p == ':')
                  {
                    char str[6 + 1];
                    do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; if (translate) c = translate[c]; } while (0);
                    c1 = 0;
                    if (p == pend) return REG_EBRACK;
                    for (;;)
                      {
                        do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; if (translate) c = translate[c]; } while (0);
                        if (c == ':' || c == ']' || p == pend
                            || c1 == 6)
                          break;
                        str[c1++] = c;
                      }
                    str[c1] = '\0';
                    if (c == ':' && *p == ']')
                      {
                        int ch;
                        boolean is_alnum = ((strcmp (str, "alnum") == 0));
                        boolean is_alpha = ((strcmp (str, "alpha") == 0));
                        boolean is_blank = ((strcmp (str, "blank") == 0));
                        boolean is_cntrl = ((strcmp (str, "cntrl") == 0));
                        boolean is_digit = ((strcmp (str, "digit") == 0));
                        boolean is_graph = ((strcmp (str, "graph") == 0));
                        boolean is_lower = ((strcmp (str, "lower") == 0));
                        boolean is_print = ((strcmp (str, "print") == 0));
                        boolean is_punct = ((strcmp (str, "punct") == 0));
                        boolean is_space = ((strcmp (str, "space") == 0));
                        boolean is_upper = ((strcmp (str, "upper") == 0));
                        boolean is_xdigit = ((strcmp (str, "xdigit") == 0));
                        if (!(((strcmp (str, "alpha") == 0)) || ((strcmp (str, "upper") == 0)) || ((strcmp (str, "lower") == 0)) || ((strcmp (str, "digit") == 0)) || ((strcmp (str, "alnum") == 0)) || ((strcmp (str, "xdigit") == 0)) || ((strcmp (str, "space") == 0)) || ((strcmp (str, "print") == 0)) || ((strcmp (str, "punct") == 0)) || ((strcmp (str, "graph") == 0)) || ((strcmp (str, "cntrl") == 0)) || ((strcmp (str, "blank") == 0)))) return REG_ECTYPE;
                        do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; if (translate) c = translate[c]; } while (0);
                        if (p == pend) return REG_EBRACK;
                        for (ch = 0; ch < 1 << 8; ch++)
                          {
                            if ( (is_alnum && ((((ch) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISalnum)))
                                || (is_alpha && ((((ch) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISalpha)))
                                || (is_blank && ((((ch) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISblank)))
                                || (is_cntrl && ((((ch) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _IScntrl)))
                                || (is_digit && ((((ch) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISdigit)))
                                || (is_graph && ((((ch) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISgraph)))
                                || (is_lower && ((((ch) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISlower)))
                                || (is_print && ((((ch) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISprint)))
                                || (is_punct && ((((ch) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISpunct)))
                                || (is_space && ((((ch) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISspace)))
                                || (is_upper && ((((ch) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISupper)))
                                || (is_xdigit && ((((ch) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((ch))] & (unsigned short int) _ISxdigit))))
                            (b[((unsigned char) (ch)) / 8] |= 1 << (((unsigned char) ch) % 8));
                          }
                        had_char_class = 1;
                      }
                    else
                      {
                        c1++;
                        while (c1--)
                          p--;
                        (b[((unsigned char) ('[')) / 8] |= 1 << (((unsigned char) '[') % 8));
                        (b[((unsigned char) (':')) / 8] |= 1 << (((unsigned char) ':') % 8));
                        had_char_class = 0;
                      }
                  }
                else
                  {
                    had_char_class = 0;
                    (b[((unsigned char) (c)) / 8] |= 1 << (((unsigned char) c) % 8));
                  }
              }
            while ((int) b[-1] > 0 && b[b[-1] - 1] == 0)
              b[-1]--;
            b += b[-1];
          }
          break;
 case '(':
          if (syntax & ((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
            goto handle_open;
          else
            goto normal_char;
        case ')':
          if (syntax & ((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
            goto handle_close;
          else
            goto normal_char;
        case '\n':
          if (syntax & ((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
            goto handle_alt;
          else
            goto normal_char;
 case '|':
          if (syntax & ((((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
            goto handle_alt;
          else
            goto normal_char;
        case '{':
           if (syntax & ((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) && syntax & (((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
             goto handle_interval;
           else
             goto normal_char;
        case '\\':
          if (p == pend) return REG_EESCAPE;
          do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; } while (0);
          switch (c)
            {
            case '(':
              if (syntax & ((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
                goto normal_backslash;
            handle_open:
              bufp->re_nsub++;
              regnum++;
              if ((compile_stack.avail == compile_stack.size))
                {
                  ((compile_stack.stack) = (compile_stack_elt_t *) realloc (compile_stack.stack, (compile_stack.size << 1) * sizeof (compile_stack_elt_t)));
                  if (compile_stack.stack == ((void *)0)) return REG_ESPACE;
                  compile_stack.size <<= 1;
                }
              (compile_stack.stack[compile_stack.avail]).begalt_offset = begalt - bufp->buffer;
              (compile_stack.stack[compile_stack.avail]).fixup_alt_jump
                = fixup_alt_jump ? fixup_alt_jump - bufp->buffer + 1 : 0;
              (compile_stack.stack[compile_stack.avail]).laststart_offset = b - bufp->buffer;
              (compile_stack.stack[compile_stack.avail]).regnum = regnum;
              if (regnum <= 255)
                {
                  (compile_stack.stack[compile_stack.avail]).inner_group_offset = b - bufp->buffer + 2;
                  do { while (b - bufp->buffer + (3) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (start_memory); *b++ = (unsigned char) (regnum); *b++ = (unsigned char) (0); } while (0);
                }
              compile_stack.avail++;
              fixup_alt_jump = 0;
              laststart = 0;
              begalt = b;
       pending_exact = 0;
              break;
            case ')':
              if (syntax & ((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)) goto normal_backslash;
              if ((compile_stack.avail == 0))
                if (syntax & ((((((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
                  goto normal_backslash;
                else
                  return REG_ERPAREN;
            handle_close:
              if (fixup_alt_jump)
                {
                  do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (push_dummy_failure); } while (0);
                  store_op1 (jump_past_alt, fixup_alt_jump, (b - 1) - (fixup_alt_jump) - 3);
                }
              if ((compile_stack.avail == 0))
                if (syntax & ((((((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
                  goto normal_char;
                else
                  return REG_ERPAREN;
              ;
              {
                regnum_t this_group_regnum;
                compile_stack.avail--;
                begalt = bufp->buffer + (compile_stack.stack[compile_stack.avail]).begalt_offset;
                fixup_alt_jump
                  = (compile_stack.stack[compile_stack.avail]).fixup_alt_jump
                    ? bufp->buffer + (compile_stack.stack[compile_stack.avail]).fixup_alt_jump - 1
                    : 0;
                laststart = bufp->buffer + (compile_stack.stack[compile_stack.avail]).laststart_offset;
                this_group_regnum = (compile_stack.stack[compile_stack.avail]).regnum;
  pending_exact = 0;
                if (this_group_regnum <= 255)
                  {
                    unsigned char *inner_group_loc
                      = bufp->buffer + (compile_stack.stack[compile_stack.avail]).inner_group_offset;
                    *inner_group_loc = regnum - this_group_regnum;
                    do { while (b - bufp->buffer + (3) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (stop_memory); *b++ = (unsigned char) (this_group_regnum); *b++ = (unsigned char) (regnum - this_group_regnum); } while (0);
                  }
              }
              break;
            case '|':
              if (syntax & (((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) || syntax & ((((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
                goto normal_backslash;
            handle_alt:
              if (syntax & (((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
                goto normal_char;
              while (b - bufp->buffer + (3) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0);
              insert_op1 (on_failure_jump, begalt, (b + 6) - (begalt) - 3, b);
              pending_exact = 0;
              b += 3;
              if (fixup_alt_jump)
                store_op1 (jump_past_alt, fixup_alt_jump, (b) - (fixup_alt_jump) - 3);
              fixup_alt_jump = b;
              while (b - bufp->buffer + (3) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0);
              b += 3;
              laststart = 0;
              begalt = b;
              break;
            case '{':
              if (!(syntax & ((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
                  || ((syntax & ((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)) && (syntax & (((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)))
                  || (p - 2 == pattern && p == pend))
                goto normal_backslash;
            handle_interval:
              {
                int lower_bound = -1, upper_bound = -1;
                beg_interval = p - 1;
                if (p == pend)
                  {
                    if (syntax & (((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
                      goto unfetch_interval;
                    else
                      return REG_EBRACE;
                  }
                { if (p != pend) { do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; if (translate) c = translate[c]; } while (0); while (((((c) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((c))] & (unsigned short int) _ISdigit))) { if (lower_bound < 0) lower_bound = 0; lower_bound = lower_bound * 10 + c - '0'; if (p == pend) break; do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; if (translate) c = translate[c]; } while (0); } } };
                if (c == ',')
                  {
                    { if (p != pend) { do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; if (translate) c = translate[c]; } while (0); while (((((c) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((c))] & (unsigned short int) _ISdigit))) { if (upper_bound < 0) upper_bound = 0; upper_bound = upper_bound * 10 + c - '0'; if (p == pend) break; do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; if (translate) c = translate[c]; } while (0); } } };
                    if (upper_bound < 0) upper_bound = ((1 << 15) - 1);
                  }
                else
                  upper_bound = lower_bound;
                if (lower_bound < 0 || upper_bound > ((1 << 15) - 1)
                    || lower_bound > upper_bound)
                  {
                    if (syntax & (((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
                      goto unfetch_interval;
                    else
                      return REG_BADBR;
                  }
                if (!(syntax & (((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)))
                  {
                    if (c != '\\') return REG_EBRACE;
                    do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; if (translate) c = translate[c]; } while (0);
                  }
                if (c != '}')
                  {
                    if (syntax & (((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
                      goto unfetch_interval;
                    else
                      return REG_BADBR;
                  }
                if (!laststart)
                  {
                    if (syntax & ((((((1) << 1) << 1) << 1) << 1) << 1))
                      return REG_BADRPT;
                    else if (syntax & (((((1) << 1) << 1) << 1) << 1))
                      laststart = b;
                    else
                      goto unfetch_interval;
                  }
                 if (upper_bound == 0)
                   {
                     while (b - bufp->buffer + (3) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0);
                     insert_op1 (jump, laststart, (b + 3) - (laststart) - 3, b);
                     b += 3;
                   }
                 else
                   {
                     unsigned nbytes = 10 + (upper_bound > 1) * 10;
                     while (b - bufp->buffer + (nbytes) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0);
                     insert_op2 (succeed_n, laststart, (b + 5 + (upper_bound > 1) * 5) - (laststart) - 3, lower_bound, b);
                     b += 5;
                     insert_op2 (set_number_at, laststart, 5, lower_bound, b);
                     b += 5;
                     if (upper_bound > 1)
                       {
                         store_op2 (jump_n, b, (laststart + 5) - (b) - 3, upper_bound - 1);
                         b += 5;
                         insert_op2 (set_number_at, laststart, b - laststart,
                                     upper_bound - 1, b);
                         b += 5;
                       }
                   }
                pending_exact = 0;
                beg_interval = ((void *)0);
              }
              break;
            unfetch_interval:
               ;
               p = beg_interval;
               beg_interval = ((void *)0);
               do {if (p == pend) return REG_EEND; c = (unsigned char) *p++; if (translate) c = translate[c]; } while (0);
               if (!(syntax & (((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)))
                 {
                   if (p > pattern && p[-1] == '\\')
                     goto normal_backslash;
                 }
               goto normal_char;
            case 'w':
              laststart = b;
              do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (wordchar); } while (0);
              break;
            case 'W':
              laststart = b;
              do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (notwordchar); } while (0);
              break;
            case '<':
              do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (wordbeg); } while (0);
              break;
            case '>':
              do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (wordend); } while (0);
              break;
            case 'b':
              do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (wordbound); } while (0);
              break;
            case 'B':
              do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (notwordbound); } while (0);
              break;
            case '`':
              do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (begbuf); } while (0);
              break;
            case '\'':
              do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (endbuf); } while (0);
              break;
            case '1': case '2': case '3': case '4': case '5':
            case '6': case '7': case '8': case '9':
              if (syntax & (((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
                goto normal_char;
              c1 = c - '0';
              if (c1 > regnum)
                return REG_ESUBREG;
              if (group_in_compile_stack (compile_stack, c1))
                goto normal_char;
              laststart = b;
              do { while (b - bufp->buffer + (2) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (duplicate); *b++ = (unsigned char) (c1); } while (0);
              break;
            case '+':
            case '?':
              if (syntax & ((1) << 1))
                goto handle_plus;
              else
                goto normal_backslash;
            default:
            normal_backslash:
              c = (translate ? translate[(unsigned char) (c)] : (c));
              goto normal_char;
            }
          break;
 default:
 normal_char:
          if (!pending_exact
              || pending_exact + *pending_exact + 1 != b
       || *pending_exact == (1 << 8) - 1
              || *p == '*' || *p == '^'
       || ((syntax & ((1) << 1))
    ? *p == '\\' && (p[1] == '+' || p[1] == '?')
    : (*p == '+' || *p == '?'))
       || ((syntax & ((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
                  && ((syntax & (((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1))
        ? *p == '{'
                      : (p[0] == '\\' && p[1] == '{'))))
     {
              laststart = b;
       do { while (b - bufp->buffer + (2) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (exactn); *b++ = (unsigned char) (0); } while (0);
       pending_exact = b - 1;
            }
   do { while (b - bufp->buffer + (1) > bufp->allocated) do { unsigned char *old_buffer = bufp->buffer; if (bufp->allocated == (1L << 16)) return REG_ESIZE; bufp->allocated <<= 1; if (bufp->allocated > (1L << 16)) bufp->allocated = (1L << 16); bufp->buffer = (unsigned char *) realloc (bufp->buffer, bufp->allocated); if (bufp->buffer == ((void *)0)) return REG_ESPACE; if (old_buffer != bufp->buffer) { b = (b - old_buffer) + bufp->buffer; begalt = (begalt - old_buffer) + bufp->buffer; if (fixup_alt_jump) fixup_alt_jump = (fixup_alt_jump - old_buffer) + bufp->buffer; if (laststart) laststart = (laststart - old_buffer) + bufp->buffer; if (pending_exact) pending_exact = (pending_exact - old_buffer) + bufp->buffer; } } while (0); *b++ = (unsigned char) (c); } while (0);
          (*pending_exact)++;
   break;
        }
    }
  if (fixup_alt_jump)
    store_op1 (jump_past_alt, fixup_alt_jump, (b) - (fixup_alt_jump) - 3);
  if (!(compile_stack.avail == 0))
    return REG_EPAREN;
  free (compile_stack.stack);
  bufp->used = b - bufp->buffer;
  return REG_NOERROR;
}
static void
store_op1 (op, loc, arg)
    re_opcode_t op;
    unsigned char *loc;
    int arg;
{
  *loc = (unsigned char) op;
  do { (loc + 1)[0] = (arg) & 0377; (loc + 1)[1] = (arg) >> 8; } while (0);
}
static void
store_op2 (op, loc, arg1, arg2)
    re_opcode_t op;
    unsigned char *loc;
    int arg1, arg2;
{
  *loc = (unsigned char) op;
  do { (loc + 1)[0] = (arg1) & 0377; (loc + 1)[1] = (arg1) >> 8; } while (0);
  do { (loc + 3)[0] = (arg2) & 0377; (loc + 3)[1] = (arg2) >> 8; } while (0);
}
static void
insert_op1 (op, loc, arg, end)
    re_opcode_t op;
    unsigned char *loc;
    int arg;
    unsigned char *end;
{
  register unsigned char *pfrom = end;
  register unsigned char *pto = end + 3;
  while (pfrom != loc)
    *--pto = *--pfrom;
  store_op1 (op, loc, arg);
}
static void
insert_op2 (op, loc, arg1, arg2, end)
    re_opcode_t op;
    unsigned char *loc;
    int arg1, arg2;
    unsigned char *end;
{
  register unsigned char *pfrom = end;
  register unsigned char *pto = end + 5;
  while (pfrom != loc)
    *--pto = *--pfrom;
  store_op2 (op, loc, arg1, arg2);
}
static boolean
at_begline_loc_p (pattern, p, syntax)
    const char *pattern, *p;
    reg_syntax_t syntax;
{
  const char *prev = p - 2;
  boolean prev_prev_backslash = prev > pattern && prev[-1] == '\\';
  return
       (*prev == '(' && (syntax & ((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) || prev_prev_backslash))
    || (*prev == '|' && (syntax & ((((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) || prev_prev_backslash));
}
static boolean
at_endline_loc_p (p, pend, syntax)
    const char *p, *pend;
    int syntax;
{
  const char *next = p;
  boolean next_backslash = *next == '\\';
  const char *next_next = p + 1 < pend ? p + 1 : ((void *)0);
  return
       (syntax & ((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) ? *next == ')'
        : next_backslash && next_next && *next_next == ')')
    || (syntax & ((((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) ? *next == '|'
        : next_backslash && next_next && *next_next == '|');
}
static boolean
group_in_compile_stack (compile_stack, regnum)
    compile_stack_type compile_stack;
    regnum_t regnum;
{
  int this_element;
  for (this_element = compile_stack.avail - 1;
       this_element >= 0;
       this_element--)
    if (compile_stack.stack[this_element].regnum == regnum)
      return 1;
  return 0;
}
static reg_errcode_t
compile_range (p_ptr, pend, translate, syntax, b)
    const char **p_ptr, *pend;
    char *translate;
    reg_syntax_t syntax;
    unsigned char *b;
{
  unsigned this_char;
  const char *p = *p_ptr;
  int range_start, range_end;
  if (p == pend)
    return REG_ERANGE;
  range_start = ((unsigned char *) p)[-2];
  range_end = ((unsigned char *) p)[0];
  (*p_ptr)++;
  if (range_start > range_end)
    return syntax & (((((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) ? REG_ERANGE : REG_NOERROR;
  for (this_char = range_start; this_char <= range_end; this_char++)
    {
      (b[((unsigned char) ((translate ? translate[(unsigned char) (this_char)] : (this_char)))) / 8] |= 1 << (((unsigned char) (translate ? translate[(unsigned char) (this_char)] : (this_char))) % 8));
    }
  return REG_NOERROR;
}
int re_max_failures = 2000;
typedef const unsigned char *fail_stack_elt_t;
typedef struct
{
  fail_stack_elt_t *stack;
  unsigned size;
  unsigned avail;
} fail_stack_type;
int
re_compile_fastmap (bufp)
     struct re_pattern_buffer *bufp;
{
  int j, k;
  fail_stack_type fail_stack;
  char *destination;
  unsigned num_regs = 0;
  register char *fastmap = bufp->fastmap;
  unsigned char *pattern = bufp->buffer;
  unsigned long size = bufp->used;
  const unsigned char *p = pattern;
  register unsigned char *pend = pattern + size;
  boolean path_can_be_null = 1;
  boolean succeed_n_p = 0;
  ;
  do { fail_stack.stack = (fail_stack_elt_t *) __builtin_alloca (5 * sizeof (fail_stack_elt_t)); if (fail_stack.stack == ((void *)0)) return -2; fail_stack.size = 5; fail_stack.avail = 0; } while (0);
  memset ((fastmap), 0, (1 << 8));
  bufp->fastmap_accurate = 1;
  bufp->can_be_null = 0;
  while (p != pend || !(fail_stack.avail == 0))
    {
      if (p == pend)
        {
          bufp->can_be_null |= path_can_be_null;
          path_can_be_null = 1;
          p = fail_stack.stack[--fail_stack.avail];
 }
      ;
      switch ((re_opcode_t) *p++)
 {
 case duplicate:
   bufp->can_be_null = 1;
          return 0;
 case exactn:
          fastmap[p[1]] = 1;
   break;
        case charset:
          for (j = *p++ * 8 - 1; j >= 0; j--)
     if (p[j / 8] & (1 << (j % 8)))
              fastmap[j] = 1;
   break;
 case charset_not:
   for (j = *p * 8; j < (1 << 8); j++)
            fastmap[j] = 1;
   for (j = *p++ * 8 - 1; j >= 0; j--)
     if (!(p[j / 8] & (1 << (j % 8))))
              fastmap[j] = 1;
          break;
 case wordchar:
   for (j = 0; j < (1 << 8); j++)
     if (re_syntax_table[j] == 1)
       fastmap[j] = 1;
   break;
 case notwordchar:
   for (j = 0; j < (1 << 8); j++)
     if (re_syntax_table[j] != 1)
       fastmap[j] = 1;
   break;
        case anychar:
   for (j = 0; j < (1 << 8); j++)
            fastmap[j] = 1;
          if (!(bufp->syntax & (((((((1) << 1) << 1) << 1) << 1) << 1) << 1)))
            fastmap['\n'] = 0;
   else if (bufp->can_be_null)
     return 0;
   break;
        case no_op:
        case begline:
        case endline:
 case begbuf:
 case endbuf:
 case wordbound:
 case notwordbound:
 case wordbeg:
 case wordend:
        case push_dummy_failure:
          continue;
 case jump_n:
        case pop_failure_jump:
 case maybe_pop_jump:
 case jump:
        case jump_past_alt:
 case dummy_failure_jump:
          do { do { (j) = *(p) & 0377; (j) += ((signed char) (*((p) + 1))) << 8; } while (0); (p) += 2; } while (0);
   p += j;
   if (j > 0)
     continue;
          if ((re_opcode_t) *p != on_failure_jump
       && (re_opcode_t) *p != succeed_n)
     continue;
          p++;
          do { do { (j) = *(p) & 0377; (j) += ((signed char) (*((p) + 1))) << 8; } while (0); (p) += 2; } while (0);
          p += j;
          if (!(fail_stack.avail == 0)
       && fail_stack.stack[fail_stack.avail - 1] == p)
            fail_stack.avail--;
          continue;
        case on_failure_jump:
        case on_failure_keep_string_jump:
 handle_on_failure_jump:
          do { do { (j) = *(p) & 0377; (j) += ((signed char) (*((p) + 1))) << 8; } while (0); (p) += 2; } while (0);
          if (p + j < pend)
            {
              if (!(((fail_stack.avail == fail_stack.size) && !((fail_stack).size > re_max_failures * ((num_regs - 1) * 3 + 4) ? 0 : ((fail_stack).stack = (fail_stack_elt_t *) (destination = (char *) __builtin_alloca (((fail_stack).size << 1) * sizeof (fail_stack_elt_t)), memcpy ((destination), ((fail_stack).stack), ((fail_stack).size * sizeof (fail_stack_elt_t))), destination), (fail_stack).stack == ((void *)0) ? 0 : ((fail_stack).size <<= 1, 1)))) ? 0 : ((fail_stack).stack[(fail_stack).avail++] = p + j, 1)))
                return -2;
            }
          else
            bufp->can_be_null = 1;
          if (succeed_n_p)
            {
              do { do { (k) = *(p) & 0377; (k) += ((signed char) (*((p) + 1))) << 8; } while (0); (p) += 2; } while (0);
              succeed_n_p = 0;
     }
          continue;
 case succeed_n:
          p += 2;
          do { do { (k) = *(p) & 0377; (k) += ((signed char) (*((p) + 1))) << 8; } while (0); (p) += 2; } while (0);
          if (k == 0)
     {
              p -= 4;
         succeed_n_p = 1;
              goto handle_on_failure_jump;
            }
          continue;
 case set_number_at:
          p += 4;
          continue;
 case start_memory:
        case stop_memory:
   p += 2;
   continue;
 default:
          abort ();
        }
      path_can_be_null = 0;
      p = pend;
    }
  bufp->can_be_null |= path_can_be_null;
  return 0;
}
void
re_set_registers (bufp, regs, num_regs, starts, ends)
    struct re_pattern_buffer *bufp;
    struct re_registers *regs;
    unsigned num_regs;
    regoff_t *starts, *ends;
{
  if (num_regs)
    {
      bufp->regs_allocated = 1;
      regs->num_regs = num_regs;
      regs->start = starts;
      regs->end = ends;
    }
  else
    {
      bufp->regs_allocated = 0;
      regs->num_regs = 0;
      regs->start = regs->end = (regoff_t) 0;
    }
}
int
re_search (bufp, string, size, startpos, range, regs)
     struct re_pattern_buffer *bufp;
     const char *string;
     int size, startpos, range;
     struct re_registers *regs;
{
  return re_search_2 (bufp, ((void *)0), 0, string, size, startpos, range,
        regs, size);
}
int
re_search_2 (bufp, string1, size1, string2, size2, startpos, range, regs, stop)
     struct re_pattern_buffer *bufp;
     const char *string1, *string2;
     int size1, size2;
     int startpos;
     int range;
     struct re_registers *regs;
     int stop;
{
  int val;
  register char *fastmap = bufp->fastmap;
  register char *translate = bufp->translate;
  int total_size = size1 + size2;
  int endpos = startpos + range;
  if (startpos < 0 || startpos > total_size)
    return -1;
  if (endpos < -1)
    range = -1 - startpos;
  else if (endpos > total_size)
    range = total_size - startpos;
  if (bufp->used > 0 && (re_opcode_t) bufp->buffer[0] == begbuf && range > 0)
    {
      if (startpos > 0)
 return -1;
      else
 range = 1;
    }
  if (fastmap && !bufp->fastmap_accurate)
    if (re_compile_fastmap (bufp) == -2)
      return -2;
  for (;;)
    {
      if (fastmap && startpos < total_size && !bufp->can_be_null)
 {
   if (range > 0)
     {
       register const char *d;
       register int lim = 0;
       int irange = range;
              if (startpos < size1 && startpos + range >= size1)
                lim = range - (size1 - startpos);
       d = (startpos >= size1 ? string2 - size1 : string1) + startpos;
       if (translate)
                while (range > lim
                       && !fastmap[(unsigned char)
       translate[(unsigned char) *d++]])
                  range--;
       else
                while (range > lim && !fastmap[(unsigned char) *d++])
                  range--;
       startpos += irange - range;
     }
   else
     {
       register char c = (size1 == 0 || startpos >= size1
                                 ? string2[startpos - size1]
                                 : string1[startpos]);
       if (!fastmap[(unsigned char) (translate ? translate[(unsigned char) (c)] : (c))])
  goto advance;
     }
 }
      if (range >= 0 && startpos == total_size && fastmap
          && !bufp->can_be_null)
 return -1;
      val = re_match_2 (bufp, string1, size1, string2, size2,
                 startpos, regs, stop);
      if (val >= 0)
 return startpos;
      if (val == -2)
 return -2;
    advance:
      if (!range)
        break;
      else if (range > 0)
        {
          range--;
          startpos++;
        }
      else
        {
          range++;
          startpos--;
        }
    }
  return -1;
}
static int bcmp_translate ();
static boolean alt_match_null_string_p (),
               common_op_match_null_string_p (),
               group_match_null_string_p ();
typedef union
{
  fail_stack_elt_t word;
  struct
  {
    unsigned match_null_string_p : 2;
    unsigned is_active : 1;
    unsigned matched_something : 1;
    unsigned ever_matched_something : 1;
  } bits;
} register_info_type;
int
re_match (bufp, string, size, pos, regs)
     struct re_pattern_buffer *bufp;
     const char *string;
     int size, pos;
     struct re_registers *regs;
 {
  return re_match_2 (bufp, ((void *)0), 0, string, size, pos, regs, size);
}
int
re_match_2 (bufp, string1, size1, string2, size2, pos, regs, stop)
     struct re_pattern_buffer *bufp;
     const char *string1, *string2;
     int size1, size2;
     int pos;
     struct re_registers *regs;
     int stop;
{
  int mcnt;
  unsigned char *p1;
  const char *end1, *end2;
  const char *end_match_1, *end_match_2;
  const char *d, *dend;
  unsigned char *p = bufp->buffer;
  register unsigned char *pend = p + bufp->used;
  char *translate = bufp->translate;
  fail_stack_type fail_stack;
  unsigned num_regs = bufp->re_nsub + 1;
  unsigned lowest_active_reg = ((1 << 8) + 1);
  unsigned highest_active_reg = (1 << 8);
  const char **regstart, **regend;
  const char **old_regstart, **old_regend;
  register_info_type *reg_info;
  unsigned best_regs_set = 0;
  const char **best_regstart, **best_regend;
  const char *match_end = ((void *)0);
  const char **reg_dummy;
  register_info_type *reg_info_dummy;
  ;
  do { fail_stack.stack = (fail_stack_elt_t *) __builtin_alloca (5 * sizeof (fail_stack_elt_t)); if (fail_stack.stack == ((void *)0)) return -2; fail_stack.size = 5; fail_stack.avail = 0; } while (0);
  if (bufp->re_nsub)
    {
      regstart = ((const char * *) __builtin_alloca ((num_regs) * sizeof (const char *)));
      regend = ((const char * *) __builtin_alloca ((num_regs) * sizeof (const char *)));
      old_regstart = ((const char * *) __builtin_alloca ((num_regs) * sizeof (const char *)));
      old_regend = ((const char * *) __builtin_alloca ((num_regs) * sizeof (const char *)));
      best_regstart = ((const char * *) __builtin_alloca ((num_regs) * sizeof (const char *)));
      best_regend = ((const char * *) __builtin_alloca ((num_regs) * sizeof (const char *)));
      reg_info = ((register_info_type *) __builtin_alloca ((num_regs) * sizeof (register_info_type)));
      reg_dummy = ((const char * *) __builtin_alloca ((num_regs) * sizeof (const char *)));
      reg_info_dummy = ((register_info_type *) __builtin_alloca ((num_regs) * sizeof (register_info_type)));
      if (!(regstart && regend && old_regstart && old_regend && reg_info
            && best_regstart && best_regend && reg_dummy && reg_info_dummy))
        {
          __builtin_alloca (0);
          return -2;
        }
    }
  if (pos < 0 || pos > size1 + size2)
    {
      __builtin_alloca (0);
      return -1;
    }
  for (mcnt = 1; mcnt < num_regs; mcnt++)
    {
      regstart[mcnt] = regend[mcnt]
        = old_regstart[mcnt] = old_regend[mcnt] = ((char *) -1);
      ((reg_info[mcnt]).bits.match_null_string_p) = 3;
      ((reg_info[mcnt]).bits.is_active) = 0;
      ((reg_info[mcnt]).bits.matched_something) = 0;
      ((reg_info[mcnt]).bits.ever_matched_something) = 0;
    }
  if (size2 == 0 && string1 != ((void *)0))
    {
      string2 = string1;
      size2 = size1;
      string1 = 0;
      size1 = 0;
    }
  end1 = string1 + size1;
  end2 = string2 + size2;
  if (stop <= size1)
    {
      end_match_1 = string1 + stop;
      end_match_2 = string2;
    }
  else
    {
      end_match_1 = end1;
      end_match_2 = string2 + stop - size1;
    }
  if (size1 > 0 && pos <= size1)
    {
      d = string1 + pos;
      dend = end_match_1;
    }
  else
    {
      d = string2 + pos - size1;
      dend = end_match_2;
    }
  ;
  ;
  ;
  ;
  ;
  for (;;)
    {
      ;
      if (p == pend)
 {
          ;
          if (d != end_match_2)
     {
              ;
              if (!(fail_stack.avail == 0))
                {
                  boolean same_str_p = ((size1 && string1 <= (match_end) && (match_end) <= string1 + size1)
                          == (dend == end_match_1));
                  if (!best_regs_set
                      || (same_str_p && d > match_end)
                      || (!same_str_p && !(dend == end_match_1)))
                    {
                      best_regs_set = 1;
                      match_end = d;
                      ;
                      for (mcnt = 1; mcnt < num_regs; mcnt++)
                        {
                          best_regstart[mcnt] = regstart[mcnt];
                          best_regend[mcnt] = regend[mcnt];
                        }
                    }
                  goto fail;
                }
              else if (best_regs_set)
                {
           restore_best_regs:
                  ;
                  d = match_end;
                  dend = ((d >= string1 && d <= end1)
             ? end_match_1 : end_match_2);
    for (mcnt = 1; mcnt < num_regs; mcnt++)
      {
        regstart[mcnt] = best_regstart[mcnt];
        regend[mcnt] = best_regend[mcnt];
      }
                }
            }
          ;
          if (regs && !bufp->no_sub)
     {
              if (bufp->regs_allocated == 0)
                {
                  regs->num_regs = ((30) > (num_regs + 1) ? (30) : (num_regs + 1));
                  regs->start = ((regoff_t *) malloc ((regs->num_regs) * sizeof (regoff_t)));
                  regs->end = ((regoff_t *) malloc ((regs->num_regs) * sizeof (regoff_t)));
                  if (regs->start == ((void *)0) || regs->end == ((void *)0))
                    return -2;
                  bufp->regs_allocated = 1;
                }
              else if (bufp->regs_allocated == 1)
                {
                  if (regs->num_regs < num_regs + 1)
                    {
                      regs->num_regs = num_regs + 1;
                      ((regs->start) = (regoff_t *) realloc (regs->start, (regs->num_regs) * sizeof (regoff_t)));
                      ((regs->end) = (regoff_t *) realloc (regs->end, (regs->num_regs) * sizeof (regoff_t)));
                      if (regs->start == ((void *)0) || regs->end == ((void *)0))
                        return -2;
                    }
                }
              else
                ;
              if (regs->num_regs > 0)
                {
                  regs->start[0] = pos;
                  regs->end[0] = ((dend == end_match_1) ? d - string1
             : d - string2 + size1);
                }
       for (mcnt = 1; mcnt < ((num_regs) < (regs->num_regs) ? (num_regs) : (regs->num_regs)); mcnt++)
  {
                  if (((regstart[mcnt]) == ((char *) -1)) || ((regend[mcnt]) == ((char *) -1)))
                    regs->start[mcnt] = regs->end[mcnt] = -1;
                  else
                    {
        regs->start[mcnt] = ((size1 && string1 <= (regstart[mcnt]) && (regstart[mcnt]) <= string1 + size1) ? (regstart[mcnt]) - string1 : (regstart[mcnt]) - string2 + size1);
                      regs->end[mcnt] = ((size1 && string1 <= (regend[mcnt]) && (regend[mcnt]) <= string1 + size1) ? (regend[mcnt]) - string1 : (regend[mcnt]) - string2 + size1);
                    }
  }
              for (mcnt = num_regs; mcnt < regs->num_regs; mcnt++)
                regs->start[mcnt] = regs->end[mcnt] = -1;
     }
          __builtin_alloca (0);
          ;
          ;
          mcnt = d - pos - ((dend == end_match_1)
       ? string1
       : string2 - size1);
          ;
          return mcnt;
        }
      switch ((re_opcode_t) *p++)
 {
        case no_op:
          ;
          break;
 case exactn:
   mcnt = *p++;
          ;
          if (translate)
     {
       do
  {
    while (d == dend) { if (dend == end_match_2) goto fail; d = string2; dend = end_match_2; };
    if (translate[(unsigned char) *d++] != (char) *p++)
                    goto fail;
  }
       while (--mcnt);
     }
   else
     {
       do
  {
    while (d == dend) { if (dend == end_match_2) goto fail; d = string2; dend = end_match_2; };
    if (*d++ != (char) *p++) goto fail;
  }
       while (--mcnt);
     }
   do { unsigned r; for (r = lowest_active_reg; r <= highest_active_reg; r++) { ((reg_info[r]).bits.matched_something) = ((reg_info[r]).bits.ever_matched_something) = 1; } } while (0);
          break;
 case anychar:
          ;
          while (d == dend) { if (dend == end_match_2) goto fail; d = string2; dend = end_match_2; };
          if ((!(bufp->syntax & (((((((1) << 1) << 1) << 1) << 1) << 1) << 1)) && (translate ? translate[(unsigned char) (*d)] : (*d)) == '\n')
              || (bufp->syntax & ((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) && (translate ? translate[(unsigned char) (*d)] : (*d)) == '\000'))
     goto fail;
          do { unsigned r; for (r = lowest_active_reg; r <= highest_active_reg; r++) { ((reg_info[r]).bits.matched_something) = ((reg_info[r]).bits.ever_matched_something) = 1; } } while (0);
          ;
          d++;
   break;
 case charset:
 case charset_not:
   {
     register unsigned char c;
     boolean not = (re_opcode_t) *(p - 1) == charset_not;
            ;
     while (d == dend) { if (dend == end_match_2) goto fail; d = string2; dend = end_match_2; };
     c = (translate ? translate[(unsigned char) (*d)] : (*d));
     if (c < (unsigned) (*p * 8)
  && p[1 + c / 8] & (1 << (c % 8)))
       not = !not;
     p += 1 + *p;
     if (!not) goto fail;
     do { unsigned r; for (r = lowest_active_reg; r <= highest_active_reg; r++) { ((reg_info[r]).bits.matched_something) = ((reg_info[r]).bits.ever_matched_something) = 1; } } while (0);
            d++;
     break;
   }
        case start_memory:
   ;
   p1 = p;
          if (((reg_info[*p]).bits.match_null_string_p) == 3)
            ((reg_info[*p]).bits.match_null_string_p)
              = group_match_null_string_p (&p1, pend, reg_info);
          old_regstart[*p] = ((reg_info[*p]).bits.match_null_string_p)
                             ? ((regstart[*p]) == ((char *) -1)) ? d : regstart[*p]
                             : regstart[*p];
   ;
          regstart[*p] = d;
   ;
          ((reg_info[*p]).bits.is_active) = 1;
          ((reg_info[*p]).bits.matched_something) = 0;
          highest_active_reg = *p;
          if (lowest_active_reg == ((1 << 8) + 1))
            lowest_active_reg = *p;
          p += 2;
          break;
 case stop_memory:
   ;
          old_regend[*p] = ((reg_info[*p]).bits.match_null_string_p)
                           ? ((regend[*p]) == ((char *) -1)) ? d : regend[*p]
      : regend[*p];
   ;
          regend[*p] = d;
   ;
          ((reg_info[*p]).bits.is_active) = 0;
          if (lowest_active_reg == highest_active_reg)
            {
              lowest_active_reg = ((1 << 8) + 1);
              highest_active_reg = (1 << 8);
            }
          else
            {
              unsigned char r = *p - 1;
              while (r > 0 && !((reg_info[r]).bits.is_active))
                r--;
       if (r == 0)
                {
                  lowest_active_reg = ((1 << 8) + 1);
                  highest_active_reg = (1 << 8);
                }
              else
                highest_active_reg = r;
            }
          if ((!((reg_info[*p]).bits.matched_something)
               || (re_opcode_t) p[-3] == start_memory)
       && (p + 2) < pend)
            {
              boolean is_a_jump_n = 0;
              p1 = p + 2;
              mcnt = 0;
              switch ((re_opcode_t) *p1++)
                {
                  case jump_n:
      is_a_jump_n = 1;
                  case pop_failure_jump:
    case maybe_pop_jump:
    case jump:
    case dummy_failure_jump:
                    do { do { (mcnt) = *(p1) & 0377; (mcnt) += ((signed char) (*((p1) + 1))) << 8; } while (0); (p1) += 2; } while (0);
      if (is_a_jump_n)
        p1 += 2;
                    break;
                  default:
                                     ;
                }
       p1 += mcnt;
              if (mcnt < 0 && (re_opcode_t) *p1 == on_failure_jump
                  && (re_opcode_t) p1[3] == start_memory && p1[4] == *p)
  {
                  if (((reg_info[*p]).bits.ever_matched_something))
      {
        unsigned r;
                      ((reg_info[*p]).bits.ever_matched_something) = 0;
                      for (r = *p; r < *p + *(p + 1); r++)
                        {
                          regstart[r] = old_regstart[r];
                          if ((int) old_regend[r] >= (int) regstart[r])
                            regend[r] = old_regend[r];
                        }
                    }
    p1++;
                  do { do { (mcnt) = *(p1) & 0377; (mcnt) += ((signed char) (*((p1) + 1))) << 8; } while (0); (p1) += 2; } while (0);
                  do { char *destination; int this_reg; ; ; ; ; ; ; ; while (((fail_stack).size - (fail_stack).avail) < ((highest_active_reg - lowest_active_reg + 1) * 3 + 4)) { if (!((fail_stack).size > re_max_failures * ((num_regs - 1) * 3 + 4) ? 0 : ((fail_stack).stack = (fail_stack_elt_t *) (destination = (char *) __builtin_alloca (((fail_stack).size << 1) * sizeof (fail_stack_elt_t)), memcpy ((destination), ((fail_stack).stack), ((fail_stack).size * sizeof (fail_stack_elt_t))), destination), (fail_stack).stack == ((void *)0) ? 0 : ((fail_stack).size <<= 1, 1)))) return -2; ; ; } ; for (this_reg = lowest_active_reg; this_reg <= highest_active_reg; this_reg++) { ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) regstart[this_reg]; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) regend[this_reg]; ; ; ; ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) reg_info[this_reg].word; } ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) lowest_active_reg; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) highest_active_reg; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) p1 + mcnt; ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) d; ; ; } while (0);
                  goto fail;
                }
            }
          p += 2;
          break;
        case duplicate:
   {
     register const char *d2, *dend2;
     int regno = *p++;
     ;
            if (((regstart[regno]) == ((char *) -1)) || ((regend[regno]) == ((char *) -1)))
              goto fail;
            d2 = regstart[regno];
            dend2 = (((size1 && string1 <= (regstart[regno]) && (regstart[regno]) <= string1 + size1)
        == (size1 && string1 <= (regend[regno]) && (regend[regno]) <= string1 + size1))
       ? regend[regno] : end_match_1);
     for (;;)
       {
  while (d2 == dend2)
    {
      if (dend2 == end_match_2) break;
      if (dend2 == regend[regno]) break;
                    d2 = string2;
                    dend2 = regend[regno];
    }
  if (d2 == dend2) break;
  while (d == dend) { if (dend == end_match_2) goto fail; d = string2; dend = end_match_2; };
  mcnt = dend - d;
                if (mcnt > dend2 - d2)
    mcnt = dend2 - d2;
  if (translate
                    ? bcmp_translate (d, d2, mcnt, translate)
                    : memcmp ((d), (d2), (mcnt)))
    goto fail;
  d += mcnt, d2 += mcnt;
       }
   }
   break;
 case begline:
          ;
          if (((d) == (size1 ? string1 : string2) || !size2))
            {
              if (!bufp->not_bol) break;
            }
          else if (d[-1] == '\n' && bufp->newline_anchor)
            {
              break;
            }
          goto fail;
 case endline:
          ;
          if (((d) == end2))
            {
              if (!bufp->not_eol) break;
            }
          else if ((d == end1 ? *string2 : *d) == '\n'
                   && bufp->newline_anchor)
            {
              break;
            }
          goto fail;
        case begbuf:
          ;
          if (((d) == (size1 ? string1 : string2) || !size2))
            break;
          goto fail;
        case endbuf:
          ;
   if (((d) == end2))
     break;
          goto fail;
        case on_failure_keep_string_jump:
          ;
          do { do { (mcnt) = *(p) & 0377; (mcnt) += ((signed char) (*((p) + 1))) << 8; } while (0); (p) += 2; } while (0);
          ;
          do { char *destination; int this_reg; ; ; ; ; ; ; ; while (((fail_stack).size - (fail_stack).avail) < ((highest_active_reg - lowest_active_reg + 1) * 3 + 4)) { if (!((fail_stack).size > re_max_failures * ((num_regs - 1) * 3 + 4) ? 0 : ((fail_stack).stack = (fail_stack_elt_t *) (destination = (char *) __builtin_alloca (((fail_stack).size << 1) * sizeof (fail_stack_elt_t)), memcpy ((destination), ((fail_stack).stack), ((fail_stack).size * sizeof (fail_stack_elt_t))), destination), (fail_stack).stack == ((void *)0) ? 0 : ((fail_stack).size <<= 1, 1)))) return -2; ; ; } ; for (this_reg = lowest_active_reg; this_reg <= highest_active_reg; this_reg++) { ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) regstart[this_reg]; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) regend[this_reg]; ; ; ; ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) reg_info[this_reg].word; } ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) lowest_active_reg; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) highest_active_reg; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) p + mcnt; ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) ((void *)0); ; ; } while (0);
          break;
 case on_failure_jump:
        on_failure:
          ;
          do { do { (mcnt) = *(p) & 0377; (mcnt) += ((signed char) (*((p) + 1))) << 8; } while (0); (p) += 2; } while (0);
          ;
          p1 = p;
          while (p1 < pend && (re_opcode_t) *p1 == no_op)
            p1++;
          if (p1 < pend && (re_opcode_t) *p1 == start_memory)
            {
              highest_active_reg = *(p1 + 1) + *(p1 + 2);
              if (lowest_active_reg == ((1 << 8) + 1))
                lowest_active_reg = *(p1 + 1);
            }
          ;
          do { char *destination; int this_reg; ; ; ; ; ; ; ; while (((fail_stack).size - (fail_stack).avail) < ((highest_active_reg - lowest_active_reg + 1) * 3 + 4)) { if (!((fail_stack).size > re_max_failures * ((num_regs - 1) * 3 + 4) ? 0 : ((fail_stack).stack = (fail_stack_elt_t *) (destination = (char *) __builtin_alloca (((fail_stack).size << 1) * sizeof (fail_stack_elt_t)), memcpy ((destination), ((fail_stack).stack), ((fail_stack).size * sizeof (fail_stack_elt_t))), destination), (fail_stack).stack == ((void *)0) ? 0 : ((fail_stack).size <<= 1, 1)))) return -2; ; ; } ; for (this_reg = lowest_active_reg; this_reg <= highest_active_reg; this_reg++) { ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) regstart[this_reg]; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) regend[this_reg]; ; ; ; ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) reg_info[this_reg].word; } ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) lowest_active_reg; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) highest_active_reg; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) p + mcnt; ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) d; ; ; } while (0);
          break;
        case maybe_pop_jump:
          do { do { (mcnt) = *(p) & 0377; (mcnt) += ((signed char) (*((p) + 1))) << 8; } while (0); (p) += 2; } while (0);
          ;
          {
     register unsigned char *p2 = p;
     while (p2 + 2 < pend
     && ((re_opcode_t) *p2 == stop_memory
         || (re_opcode_t) *p2 == start_memory))
       p2 += 3;
            if (p2 == pend)
       {
           p[-3] = (unsigned char) pop_failure_jump;
                ;
              }
            else if ((re_opcode_t) *p2 == exactn
       || (bufp->newline_anchor && (re_opcode_t) *p2 == endline))
       {
  register unsigned char c
                  = *p2 == (unsigned char) endline ? '\n' : p2[2];
  p1 = p + mcnt;
                if ((re_opcode_t) p1[3] == exactn && p1[5] != c)
                  {
        p[-3] = (unsigned char) pop_failure_jump;
                    ;
                  }
  else if ((re_opcode_t) p1[3] == charset
    || (re_opcode_t) p1[3] == charset_not)
    {
      int not = (re_opcode_t) p1[3] == charset_not;
      if (c < (unsigned char) (p1[4] * 8)
   && p1[5 + c / 8] & (1 << (c % 8)))
        not = !not;
      if (!not)
                      {
            p[-3] = (unsigned char) pop_failure_jump;
                        ;
                      }
    }
       }
   }
   p -= 2;
   if ((re_opcode_t) p[-1] != pop_failure_jump)
     {
       p[-1] = (unsigned char) jump;
              ;
       goto unconditional_jump;
     }
        case pop_failure_jump:
          {
            unsigned dummy_low_reg, dummy_high_reg;
            unsigned char *pdummy;
            const char *sdummy;
            ;
            { int this_reg; const unsigned char *string_temp; ; ; ; ; ; ; ; string_temp = fail_stack.stack[--fail_stack.avail]; if (string_temp != ((void *)0)) sdummy = (const char *) string_temp; ; ; ; pdummy = (unsigned char *) fail_stack.stack[--fail_stack.avail]; ; ; dummy_high_reg = (unsigned) fail_stack.stack[--fail_stack.avail]; ; dummy_low_reg = (unsigned) fail_stack.stack[--fail_stack.avail]; ; for (this_reg = dummy_high_reg; this_reg >= dummy_low_reg; this_reg--) { ; reg_info_dummy[this_reg].word = fail_stack.stack[--fail_stack.avail]; ; reg_dummy[this_reg] = (const char *) fail_stack.stack[--fail_stack.avail]; ; reg_dummy[this_reg] = (const char *) fail_stack.stack[--fail_stack.avail]; ; } ; };
          }
        case jump:
 unconditional_jump:
   do { do { (mcnt) = *(p) & 0377; (mcnt) += ((signed char) (*((p) + 1))) << 8; } while (0); (p) += 2; } while (0);
          ;
   p += mcnt;
          ;
   break;
        case jump_past_alt:
          ;
          goto unconditional_jump;
        case dummy_failure_jump:
          ;
          do { char *destination; int this_reg; ; ; ; ; ; ; ; while (((fail_stack).size - (fail_stack).avail) < ((highest_active_reg - lowest_active_reg + 1) * 3 + 4)) { if (!((fail_stack).size > re_max_failures * ((num_regs - 1) * 3 + 4) ? 0 : ((fail_stack).stack = (fail_stack_elt_t *) (destination = (char *) __builtin_alloca (((fail_stack).size << 1) * sizeof (fail_stack_elt_t)), memcpy ((destination), ((fail_stack).stack), ((fail_stack).size * sizeof (fail_stack_elt_t))), destination), (fail_stack).stack == ((void *)0) ? 0 : ((fail_stack).size <<= 1, 1)))) return -2; ; ; } ; for (this_reg = lowest_active_reg; this_reg <= highest_active_reg; this_reg++) { ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) regstart[this_reg]; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) regend[this_reg]; ; ; ; ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) reg_info[this_reg].word; } ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) lowest_active_reg; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) highest_active_reg; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) 0; ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) 0; ; ; } while (0);
          goto unconditional_jump;
        case push_dummy_failure:
          ;
          do { char *destination; int this_reg; ; ; ; ; ; ; ; while (((fail_stack).size - (fail_stack).avail) < ((highest_active_reg - lowest_active_reg + 1) * 3 + 4)) { if (!((fail_stack).size > re_max_failures * ((num_regs - 1) * 3 + 4) ? 0 : ((fail_stack).stack = (fail_stack_elt_t *) (destination = (char *) __builtin_alloca (((fail_stack).size << 1) * sizeof (fail_stack_elt_t)), memcpy ((destination), ((fail_stack).stack), ((fail_stack).size * sizeof (fail_stack_elt_t))), destination), (fail_stack).stack == ((void *)0) ? 0 : ((fail_stack).size <<= 1, 1)))) return -2; ; ; } ; for (this_reg = lowest_active_reg; this_reg <= highest_active_reg; this_reg++) { ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) regstart[this_reg]; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) regend[this_reg]; ; ; ; ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) reg_info[this_reg].word; } ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) lowest_active_reg; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) highest_active_reg; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) 0; ; ; ; fail_stack.stack[fail_stack.avail++] = (fail_stack_elt_t) 0; ; ; } while (0);
          break;
        case succeed_n:
          do { (mcnt) = *(p + 2) & 0377; (mcnt) += ((signed char) (*((p + 2) + 1))) << 8; } while (0);
          ;
          ;
          if (mcnt > 0)
            {
               mcnt--;
        p += 2;
               do { do { (p)[0] = (mcnt) & 0377; (p)[1] = (mcnt) >> 8; } while (0); (p) += 2; } while (0);
               ;
            }
   else if (mcnt == 0)
            {
              ;
       p[2] = (unsigned char) no_op;
              p[3] = (unsigned char) no_op;
              goto on_failure;
            }
          break;
        case jump_n:
          do { (mcnt) = *(p + 2) & 0377; (mcnt) += ((signed char) (*((p + 2) + 1))) << 8; } while (0);
          ;
          if (mcnt)
            {
               mcnt--;
               do { (p + 2)[0] = (mcnt) & 0377; (p + 2)[1] = (mcnt) >> 8; } while (0);
        goto unconditional_jump;
            }
   else
     p += 4;
          break;
 case set_number_at:
   {
            ;
            do { do { (mcnt) = *(p) & 0377; (mcnt) += ((signed char) (*((p) + 1))) << 8; } while (0); (p) += 2; } while (0);
            p1 = p + mcnt;
            do { do { (mcnt) = *(p) & 0377; (mcnt) += ((signed char) (*((p) + 1))) << 8; } while (0); (p) += 2; } while (0);
            ;
     do { (p1)[0] = (mcnt) & 0377; (p1)[1] = (mcnt) >> 8; } while (0);
            break;
          }
        case wordbound:
          ;
          if ((((d) == (size1 ? string1 : string2) || !size2) || ((d) == end2) || (re_syntax_table[(d - 1) == end1 ? *string2 : (d - 1) == string2 - 1 ? *(end1 - 1) : *(d - 1)] == 1) != (re_syntax_table[(d) == end1 ? *string2 : (d) == string2 - 1 ? *(end1 - 1) : *(d)] == 1)))
     break;
          goto fail;
 case notwordbound:
          ;
   if ((((d) == (size1 ? string1 : string2) || !size2) || ((d) == end2) || (re_syntax_table[(d - 1) == end1 ? *string2 : (d - 1) == string2 - 1 ? *(end1 - 1) : *(d - 1)] == 1) != (re_syntax_table[(d) == end1 ? *string2 : (d) == string2 - 1 ? *(end1 - 1) : *(d)] == 1)))
     goto fail;
          break;
 case wordbeg:
          ;
   if ((re_syntax_table[(d) == end1 ? *string2 : (d) == string2 - 1 ? *(end1 - 1) : *(d)] == 1) && (((d) == (size1 ? string1 : string2) || !size2) || !(re_syntax_table[(d - 1) == end1 ? *string2 : (d - 1) == string2 - 1 ? *(end1 - 1) : *(d - 1)] == 1)))
     break;
          goto fail;
 case wordend:
          ;
   if (!((d) == (size1 ? string1 : string2) || !size2) && (re_syntax_table[(d - 1) == end1 ? *string2 : (d - 1) == string2 - 1 ? *(end1 - 1) : *(d - 1)] == 1)
              && (!(re_syntax_table[(d) == end1 ? *string2 : (d) == string2 - 1 ? *(end1 - 1) : *(d)] == 1) || ((d) == end2)))
     break;
          goto fail;
 case wordchar:
          ;
   while (d == dend) { if (dend == end_match_2) goto fail; d = string2; dend = end_match_2; };
          if (!(re_syntax_table[(d) == end1 ? *string2 : (d) == string2 - 1 ? *(end1 - 1) : *(d)] == 1))
            goto fail;
   do { unsigned r; for (r = lowest_active_reg; r <= highest_active_reg; r++) { ((reg_info[r]).bits.matched_something) = ((reg_info[r]).bits.ever_matched_something) = 1; } } while (0);
          d++;
   break;
 case notwordchar:
          ;
   while (d == dend) { if (dend == end_match_2) goto fail; d = string2; dend = end_match_2; };
   if ((re_syntax_table[(d) == end1 ? *string2 : (d) == string2 - 1 ? *(end1 - 1) : *(d)] == 1))
            goto fail;
          do { unsigned r; for (r = lowest_active_reg; r <= highest_active_reg; r++) { ((reg_info[r]).bits.matched_something) = ((reg_info[r]).bits.ever_matched_something) = 1; } } while (0);
          d++;
   break;
        default:
          abort ();
 }
      continue;
    fail:
      if (!(fail_stack.avail == 0))
 {
          ;
          { int this_reg; const unsigned char *string_temp; ; ; ; ; ; ; ; string_temp = fail_stack.stack[--fail_stack.avail]; if (string_temp != ((void *)0)) d = (const char *) string_temp; ; ; ; p = (unsigned char *) fail_stack.stack[--fail_stack.avail]; ; ; highest_active_reg = (unsigned) fail_stack.stack[--fail_stack.avail]; ; lowest_active_reg = (unsigned) fail_stack.stack[--fail_stack.avail]; ; for (this_reg = highest_active_reg; this_reg >= lowest_active_reg; this_reg--) { ; reg_info[this_reg].word = fail_stack.stack[--fail_stack.avail]; ; regend[this_reg] = (const char *) fail_stack.stack[--fail_stack.avail]; ; regstart[this_reg] = (const char *) fail_stack.stack[--fail_stack.avail]; ; } ; };
          if (!p)
     goto fail;
   ;
          if (p < pend)
            {
              boolean is_a_jump_n = 0;
              switch ((re_opcode_t) *p)
                {
                case jump_n:
                  is_a_jump_n = 1;
                case maybe_pop_jump:
                case pop_failure_jump:
                case jump:
                  p1 = p + 1;
                  do { do { (mcnt) = *(p1) & 0377; (mcnt) += ((signed char) (*((p1) + 1))) << 8; } while (0); (p1) += 2; } while (0);
                  p1 += mcnt;
                  if ((is_a_jump_n && (re_opcode_t) *p1 == succeed_n)
                      || (!is_a_jump_n
                          && (re_opcode_t) *p1 == on_failure_jump))
                    goto fail;
                  break;
                default:
                                   ;
                }
            }
          if (d >= string1 && d <= end1)
     dend = end_match_1;
        }
      else
        break;
    }
  if (best_regs_set)
    goto restore_best_regs;
  __builtin_alloca (0);
  return -1;
}
static boolean
group_match_null_string_p (p, end, reg_info)
    unsigned char **p, *end;
    register_info_type *reg_info;
{
  int mcnt;
  unsigned char *p1 = *p + 2;
  while (p1 < end)
    {
      switch ((re_opcode_t) *p1)
        {
        case on_failure_jump:
          p1++;
          do { do { (mcnt) = *(p1) & 0377; (mcnt) += ((signed char) (*((p1) + 1))) << 8; } while (0); (p1) += 2; } while (0);
   if (mcnt >= 0)
     {
              while ((re_opcode_t) p1[mcnt-3] == jump_past_alt)
                {
                  if (!alt_match_null_string_p (p1, p1 + mcnt - 3,
                          reg_info))
                    return 0;
                  p1 += mcnt;
                  if ((re_opcode_t) *p1 != on_failure_jump)
                    break;
    p1++;
                  do { do { (mcnt) = *(p1) & 0377; (mcnt) += ((signed char) (*((p1) + 1))) << 8; } while (0); (p1) += 2; } while (0);
                  if ((re_opcode_t) p1[mcnt-3] != jump_past_alt)
                    {
                      p1 -= 3;
                      break;
                    }
                }
              do { (mcnt) = *(p1 - 2) & 0377; (mcnt) += ((signed char) (*((p1 - 2) + 1))) << 8; } while (0);
              if (!alt_match_null_string_p (p1, p1 + mcnt, reg_info))
                return 0;
              p1 += mcnt;
            }
          break;
        case stop_memory:
   ;
          *p = p1 + 2;
          return 1;
        default:
          if (!common_op_match_null_string_p (&p1, end, reg_info))
            return 0;
        }
    }
  return 0;
}
static boolean
alt_match_null_string_p (p, end, reg_info)
    unsigned char *p, *end;
    register_info_type *reg_info;
{
  int mcnt;
  unsigned char *p1 = p;
  while (p1 < end)
    {
      switch ((re_opcode_t) *p1)
        {
        case on_failure_jump:
          p1++;
          do { do { (mcnt) = *(p1) & 0377; (mcnt) += ((signed char) (*((p1) + 1))) << 8; } while (0); (p1) += 2; } while (0);
          p1 += mcnt;
          break;
 default:
          if (!common_op_match_null_string_p (&p1, end, reg_info))
            return 0;
        }
    }
  return 1;
}
static boolean
common_op_match_null_string_p (p, end, reg_info)
    unsigned char **p, *end;
    register_info_type *reg_info;
{
  int mcnt;
  boolean ret;
  int reg_no;
  unsigned char *p1 = *p;
  switch ((re_opcode_t) *p1++)
    {
    case no_op:
    case begline:
    case endline:
    case begbuf:
    case endbuf:
    case wordbeg:
    case wordend:
    case wordbound:
    case notwordbound:
      break;
    case start_memory:
      reg_no = *p1;
      ;
      ret = group_match_null_string_p (&p1, end, reg_info);
      if (((reg_info[reg_no]).bits.match_null_string_p) == 3)
        ((reg_info[reg_no]).bits.match_null_string_p) = ret;
      if (!ret)
        return 0;
      break;
    case jump:
      do { do { (mcnt) = *(p1) & 0377; (mcnt) += ((signed char) (*((p1) + 1))) << 8; } while (0); (p1) += 2; } while (0);
      if (mcnt >= 0)
        p1 += mcnt;
      else
        return 0;
      break;
    case succeed_n:
      p1 += 2;
      do { do { (mcnt) = *(p1) & 0377; (mcnt) += ((signed char) (*((p1) + 1))) << 8; } while (0); (p1) += 2; } while (0);
      if (mcnt == 0)
        {
          p1 -= 4;
          do { do { (mcnt) = *(p1) & 0377; (mcnt) += ((signed char) (*((p1) + 1))) << 8; } while (0); (p1) += 2; } while (0);
          p1 += mcnt;
        }
      else
        return 0;
      break;
    case duplicate:
      if (!((reg_info[*p1]).bits.match_null_string_p))
        return 0;
      break;
    case set_number_at:
      p1 += 4;
    default:
      return 0;
  }
  *p = p1;
  return 1;
}
static int
bcmp_translate (s1, s2, len, translate)
     unsigned char *s1, *s2;
     register int len;
     char *translate;
{
  register unsigned char *p1 = s1, *p2 = s2;
  while (len)
    {
      if (translate[*p1++] != translate[*p2++]) return 1;
      len--;
    }
  return 0;
}
const char *
re_compile_pattern (pattern, length, bufp)
     const char *pattern;
     int length;
     struct re_pattern_buffer *bufp;
{
  reg_errcode_t ret;
  bufp->regs_allocated = 0;
  bufp->no_sub = 0;
  bufp->newline_anchor = 1;
  ret = regex_compile (pattern, length, re_syntax_options, bufp);
  return re_error_msg[(int) ret];
}
int
regcomp (preg, pattern, cflags)
    regex_t *preg;
    const char *pattern;
    int cflags;
{
  reg_errcode_t ret;
  unsigned syntax
    = (cflags & 1) ?
      (((((1) << 1) << 1) | (((((((1) << 1) << 1) << 1) << 1) << 1) << 1) | ((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) | ((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) | (((((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)) | ((((1) << 1) << 1) << 1) | (((((1) << 1) << 1) << 1) << 1) | (((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) | ((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) | ((((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) | ((((((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)) : (((((1) << 1) << 1) | (((((((1) << 1) << 1) << 1) << 1) << 1) << 1) | ((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) | ((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) | (((((((((((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1)) | ((1) << 1));
  preg->buffer = 0;
  preg->allocated = 0;
  preg->fastmap = 0;
  if (cflags & (1 << 1))
    {
      unsigned i;
      preg->translate = (char *) malloc (256);
      if (preg->translate == ((void *)0))
        return (int) REG_ESPACE;
      for (i = 0; i < 256; i++)
        preg->translate[i] = ((((i) & ~0x7f) == 0) && ((*__ctype_b_loc ())[(int) ((i))] & (unsigned short int) _ISupper)) ? tolower (i) : i;
    }
  else
    preg->translate = ((void *)0);
  if (cflags & ((1 << 1) << 1))
    {
      syntax &= ~(((((((1) << 1) << 1) << 1) << 1) << 1) << 1);
      syntax |= (((((((((1) << 1) << 1) << 1) << 1) << 1) << 1) << 1) << 1);
      preg->newline_anchor = 1;
    }
  else
    preg->newline_anchor = 0;
  preg->no_sub = !!(cflags & (((1 << 1) << 1) << 1));
  ret = regex_compile (pattern, strlen (pattern), syntax, preg);
  if (ret == REG_ERPAREN) ret = REG_EPAREN;
  return (int) ret;
}
int
regexec (preg, string, nmatch, pmatch, eflags)
    const regex_t *preg;
    const char *string;
    size_t nmatch;
    regmatch_t pmatch[];
    int eflags;
{
  int ret;
  struct re_registers regs;
  regex_t private_preg;
  int len = strlen (string);
  boolean want_reg_info = !preg->no_sub && nmatch > 0;
  private_preg = *preg;
  private_preg.not_bol = !!(eflags & 1);
  private_preg.not_eol = !!(eflags & (1 << 1));
  private_preg.regs_allocated = 2;
  if (want_reg_info)
    {
      regs.num_regs = nmatch;
      regs.start = ((regoff_t *) malloc ((nmatch) * sizeof (regoff_t)));
      regs.end = ((regoff_t *) malloc ((nmatch) * sizeof (regoff_t)));
      if (regs.start == ((void *)0) || regs.end == ((void *)0))
        return (int) REG_NOMATCH;
    }
  ret = re_search (&private_preg, string, len,
                                0, len,
                   want_reg_info ? &regs : (struct re_registers *) 0);
  if (want_reg_info)
    {
      if (ret >= 0)
        {
          unsigned r;
          for (r = 0; r < nmatch; r++)
            {
              pmatch[r].rm_so = regs.start[r];
              pmatch[r].rm_eo = regs.end[r];
            }
        }
      free (regs.start);
      free (regs.end);
    }
  return ret >= 0 ? (int) REG_NOERROR : (int) REG_NOMATCH;
}
size_t
regerror (errcode, preg, errbuf, errbuf_size)
    int errcode;
    const regex_t *preg;
    char *errbuf;
    size_t errbuf_size;
{
  const char *msg;
  size_t msg_size;
  if (errcode < 0
      || errcode >= (sizeof (re_error_msg) / sizeof (re_error_msg[0])))
    abort ();
  msg = re_error_msg[errcode];
  if (! msg)
    msg = "Success";
  msg_size = strlen (msg) + 1;
  if (errbuf_size != 0)
    {
      if (msg_size > errbuf_size)
        {
          strncpy (errbuf, msg, errbuf_size - 1);
          errbuf[errbuf_size - 1] = 0;
        }
      else
        strcpy (errbuf, msg);
    }
  return msg_size;
}
void
regfree (preg)
    regex_t *preg;
{
  if (preg->buffer != ((void *)0))
    free (preg->buffer);
  preg->buffer = ((void *)0);
  preg->allocated = 0;
  preg->used = 0;
  if (preg->fastmap != ((void *)0))
    free (preg->fastmap);
  preg->fastmap = ((void *)0);
  preg->fastmap_accurate = 0;
  if (preg->translate != ((void *)0))
    free (preg->translate);
  preg->translate = ((void *)0);
}
