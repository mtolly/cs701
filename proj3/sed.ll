; ModuleID = 'sed.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.vector = type { %struct.sed_cmd*, i32, i32, %struct.vector*, i32 }
%struct.sed_cmd = type { %struct.addr, %struct.addr, i32, i8, %union.anon }
%struct.addr = type { i32, %struct.re_pattern_buffer*, i32 }
%struct.re_pattern_buffer = type { i8*, i64, i64, i32, i8*, i8*, i64, i8 }
%union.anon = type { %struct.anon.0 }
%struct.anon.0 = type { %struct.re_pattern_buffer*, i8*, i32, i32, i32, %struct._IO_FILE* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.sed_label = type { %struct.vector*, i32, i8*, %struct.sed_label* }
%struct.line = type { i8*, i32, i32 }
%struct.anon.1 = type { %struct._IO_FILE*, i8*, i32 }
%struct.re_registers = type { i32, i32*, i32* }
%struct.id = type { %struct._IO_FILE*, i8* }
%struct.option = type { i8*, i32, i32*, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.anon = type { i8*, i32 }
%struct.buffer = type { i32, i32, i8* }
%struct.fail_stack_type = type { i8**, i32, i32 }
%union.register_info_type = type { i8* }
%struct.anon.2 = type { i8, [3 x i8] }
%struct.compile_stack_type = type { %struct.compile_stack_elt_t*, i32, i32 }
%struct.compile_stack_elt_t = type { i32, i32, i32, i32, i32 }
%struct.regmatch_t = type { i32, i32 }

@.str = private unnamed_addr constant [21 x i8] c"GNU sed version 1.18\00", align 1
@version_string = global i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), align 8
@no_default_output = global i32 0, align 4
@input_line_number = global i32 0, align 4
@last_input_file = global i32 0, align 4
@input_EOF = global i32 0, align 4
@quit_cmd = global i32 0, align 4
@replaced = global i32 0, align 4
@program_depth = global i32 0, align 4
@the_program = global %struct.vector* null, align 8
@jumps = global %struct.sed_label* null, align 8
@labels = global %struct.sed_label* null, align 8
@prog_line = global i32 1, align 4
@bad_input = global i32 0, align 4
@.str1 = private unnamed_addr constant [11 x i8] c"Executable\00", align 1
@myname = common global i8* null, align 8
@.str2 = private unnamed_addr constant [8 x i8] c"hne:f:V\00", align 1
@optarg = external global i8*
@.str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@stdout = external global %struct._IO_FILE*
@.str4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@optind = external global i32
@.str5 = private unnamed_addr constant [34 x i8] c"Can't find label for jump to '%s'\00", align 1
@line = common global %struct.line zeroinitializer, align 8
@append = common global %struct.line zeroinitializer, align 8
@hold = common global %struct.line zeroinitializer, align 8
@.str6 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@file_ptrs = common global [32 x %struct.anon.1] zeroinitializer, align 16
@prog_file = common global %struct._IO_FILE* null, align 8
@prog_cur = common global i8* null, align 8
@prog_start = common global i8* null, align 8
@prog_end = common global i8* null, align 8
@prog_name = common global i8* null, align 8
@stdin = external global %struct._IO_FILE*
@.str7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str8 = private unnamed_addr constant [15 x i8] c"Unexpected ','\00", align 1
@NO_COMMAND = internal global [16 x i8] c"Missing command\00", align 16
@NO_ADDR = internal global [35 x i8] c"Command doesn't take any addresses\00", align 16
@.str9 = private unnamed_addr constant [14 x i8] c"Multiple '!'s\00", align 1
@ONE_ADDR = internal global [30 x i8] c"Command only uses one address\00", align 16
@LINE_JUNK = internal global [31 x i8] c"Extra characters after command\00", align 16
@.str10 = private unnamed_addr constant [15 x i8] c"Unexpected '}'\00", align 1
@.str11 = private unnamed_addr constant [29 x i8] c"} doesn't want any addresses\00", align 1
@.str12 = private unnamed_addr constant [29 x i8] c": doesn't want any addresses\00", align 1
@last_regex = common global %struct.re_pattern_buffer* null, align 8
@.str13 = private unnamed_addr constant [25 x i8] c"Unterminated `s' command\00", align 1
@.str14 = private unnamed_addr constant [36 x i8] c"multiple 'p' options to 's' command\00", align 1
@.str15 = private unnamed_addr constant [36 x i8] c"multiple 'g' options to 's' command\00", align 1
@.str16 = private unnamed_addr constant [39 x i8] c"multiple number options to 's' command\00", align 1
@.str17 = private unnamed_addr constant [22 x i8] c"Unknown option to 's'\00", align 1
@BAD_EOF = internal global [23 x i8] c"Unexpected End-of-file\00", align 16
@.str18 = private unnamed_addr constant [44 x i8] c"strings for y command are different lengths\00", align 1
@.str19 = private unnamed_addr constant [16 x i8] c"Unknown command\00", align 1
@.str20 = private unnamed_addr constant [14 x i8] c"Unmatched `{'\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"%s: file %s line %d: %s\0A\00", align 1
@.str22 = private unnamed_addr constant [8 x i8] c"%s: %s\0A\00", align 1
@NO_REGEX = internal global [31 x i8] c"No previous regular expression\00", align 16
@.str23 = private unnamed_addr constant [28 x i8] c"missing ' ' before filename\00", align 1
@.str24 = private unnamed_addr constant [45 x i8] c"Can't open file for both reading and writing\00", align 1
@.str25 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str26 = private unnamed_addr constant [76 x i8] c"Hopelessely evil compiled in limit on number of open files.  re-compile sed\00", align 1
@input_file = common global %struct._IO_FILE* null, align 8
@.str27 = private unnamed_addr constant [23 x i8] c"%s: can't read %s: %s\0A\00", align 1
@execute_program.end_cycle = internal global i32 0, align 4
@execute_program.tmp = internal global %struct.line zeroinitializer, align 8
@.str28 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str29 = private unnamed_addr constant [3 x i8] c"\5C\5C\00", align 1
@.str30 = private unnamed_addr constant [3 x i8] c"\5Ca\00", align 1
@.str31 = private unnamed_addr constant [3 x i8] c"\5Cb\00", align 1
@.str32 = private unnamed_addr constant [3 x i8] c"\5Cf\00", align 1
@.str33 = private unnamed_addr constant [3 x i8] c"\5Cn\00", align 1
@.str34 = private unnamed_addr constant [3 x i8] c"\5Cr\00", align 1
@.str35 = private unnamed_addr constant [3 x i8] c"\5Ct\00", align 1
@.str36 = private unnamed_addr constant [3 x i8] c"\5Cv\00", align 1
@.str37 = private unnamed_addr constant [6 x i8] c"\5C%02x\00", align 1
@.str38 = private unnamed_addr constant [40 x i8] c"Read error on input file to 'r' command\00", align 1
@regs = internal global %struct.re_registers zeroinitializer, align 8
@.str39 = private unnamed_addr constant [27 x i8] c"INTERNAL ERROR: Bad cmd %c\00", align 1
@.str40 = private unnamed_addr constant [33 x i8] c"INTERNAL ERROR: bad address type\00", align 1
@.str41 = private unnamed_addr constant [140 x i8] c"Usage: %s [-nV] [--quiet] [--silent] [--version] [-e script]\0A        [-f script-file] [--expression=script] [--file=script-file] [file...]\0A\00", align 1
@.str42 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@__id_s = internal global [32 x %struct.id] zeroinitializer, align 16
@.str43 = private unnamed_addr constant [23 x i8] c"{Unknown file pointer}\00", align 1
@.str44 = private unnamed_addr constant [22 x i8] c"Couldn't open file %s\00", align 1
@.str45 = private unnamed_addr constant [36 x i8] c"Internal error: too many files open\00", align 1
@.str46 = private unnamed_addr constant [30 x i8] c"couldn't write %d items to %s\00", align 1
@.str47 = private unnamed_addr constant [18 x i8] c"Couldn't close %s\00", align 1
@.str48 = private unnamed_addr constant [25 x i8] c"Couldn't allocate memory\00", align 1
@.str49 = private unnamed_addr constant [28 x i8] c"Couldn't re-allocate memory\00", align 1
@re_syntax_options = global i32 0, align 4
@re_max_failures = global i32 2000, align 4
@re_syntax_table = internal global [256 x i8] zeroinitializer, align 16
@re_error_msg = internal global [17 x i8*] [i8* null, i8* getelementptr inbounds ([9 x i8]* @.str51, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8]* @.str52, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8]* @.str53, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8]* @.str54, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8]* @.str55, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8]* @.str56, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str57, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str58, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str59, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8]* @.str60, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str61, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @.str62, i32 0, i32 0), i8* getelementptr inbounds ([37 x i8]* @.str63, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8]* @.str64, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8]* @.str65, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str66, i32 0, i32 0)], align 16
@.str50 = private unnamed_addr constant [8 x i8] c"Success\00", align 1
@.str51 = private unnamed_addr constant [9 x i8] c"No match\00", align 1
@.str52 = private unnamed_addr constant [27 x i8] c"Invalid regular expression\00", align 1
@.str53 = private unnamed_addr constant [28 x i8] c"Invalid collation character\00", align 1
@.str54 = private unnamed_addr constant [29 x i8] c"Invalid character class name\00", align 1
@.str55 = private unnamed_addr constant [19 x i8] c"Trailing backslash\00", align 1
@.str56 = private unnamed_addr constant [23 x i8] c"Invalid back reference\00", align 1
@.str57 = private unnamed_addr constant [18 x i8] c"Unmatched [ or [^\00", align 1
@.str58 = private unnamed_addr constant [18 x i8] c"Unmatched ( or \5C(\00", align 1
@.str59 = private unnamed_addr constant [13 x i8] c"Unmatched \5C{\00", align 1
@.str60 = private unnamed_addr constant [24 x i8] c"Invalid content of \5C{\5C}\00", align 1
@.str61 = private unnamed_addr constant [18 x i8] c"Invalid range end\00", align 1
@.str62 = private unnamed_addr constant [17 x i8] c"Memory exhausted\00", align 1
@.str63 = private unnamed_addr constant [37 x i8] c"Invalid preceding regular expression\00", align 1
@.str64 = private unnamed_addr constant [36 x i8] c"Premature end of regular expression\00", align 1
@.str65 = private unnamed_addr constant [27 x i8] c"Regular expression too big\00", align 1
@.str66 = private unnamed_addr constant [18 x i8] c"Unmatched ) or \5C)\00", align 1
@.str67 = private unnamed_addr constant [6 x i8] c"alnum\00", align 1
@.str68 = private unnamed_addr constant [6 x i8] c"alpha\00", align 1
@.str69 = private unnamed_addr constant [6 x i8] c"blank\00", align 1
@.str70 = private unnamed_addr constant [6 x i8] c"cntrl\00", align 1
@.str71 = private unnamed_addr constant [6 x i8] c"digit\00", align 1
@.str72 = private unnamed_addr constant [6 x i8] c"graph\00", align 1
@.str73 = private unnamed_addr constant [6 x i8] c"lower\00", align 1
@.str74 = private unnamed_addr constant [6 x i8] c"print\00", align 1
@.str75 = private unnamed_addr constant [6 x i8] c"punct\00", align 1
@.str76 = private unnamed_addr constant [6 x i8] c"space\00", align 1
@.str77 = private unnamed_addr constant [6 x i8] c"upper\00", align 1
@.str78 = private unnamed_addr constant [7 x i8] c"xdigit\00", align 1
@init_syntax_once.done = internal global i32 0, align 4
@.str79 = private unnamed_addr constant [11 x i8] c"expression\00", align 1
@.str80 = private unnamed_addr constant [5 x i8] c"file\00", align 1
@.str81 = private unnamed_addr constant [6 x i8] c"quiet\00", align 1
@.str82 = private unnamed_addr constant [7 x i8] c"silent\00", align 1
@.str83 = private unnamed_addr constant [8 x i8] c"version\00", align 1
@.str84 = private unnamed_addr constant [5 x i8] c"help\00", align 1
@longopts = internal global <{ { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] } }> <{ { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([11 x i8]* @.str79, i32 0, i32 0), i32 1, i32* null, i32 101, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str80, i32 0, i32 0), i32 1, i32* null, i32 102, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([6 x i8]* @.str81, i32 0, i32 0), i32 0, i32* null, i32 110, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([7 x i8]* @.str82, i32 0, i32 0), i32 0, i32* null, i32 110, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([8 x i8]* @.str83, i32 0, i32 0), i32 0, i32* null, i32 86, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* getelementptr inbounds ([5 x i8]* @.str84, i32 0, i32 0), i32 0, i32* null, i32 104, [4 x i8] undef }, { i8*, i32, i32*, i32, [4 x i8] } { i8* null, i32 0, i32* null, i32 0, [4 x i8] undef } }>, align 16

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
  %1 = alloca i64, align 8
  store i64 %__dev, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = lshr i64 %2, 8
  %4 = and i64 %3, 4095
  %5 = load i64* %1, align 8
  %6 = lshr i64 %5, 32
  %7 = trunc i64 %6 to i32
  %8 = and i32 %7, -4096
  %9 = zext i32 %8 to i64
  %10 = or i64 %4, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
  %1 = alloca i64, align 8
  store i64 %__dev, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = and i64 %2, 255
  %4 = load i64* %1, align 8
  %5 = lshr i64 %4, 12
  %6 = trunc i64 %5 to i32
  %7 = and i32 %6, -256
  %8 = zext i32 %7 to i64
  %9 = or i64 %3, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %__major, i32* %1, align 4
  store i32 %__minor, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 255
  %5 = load i32* %1, align 4
  %6 = and i32 %5, 4095
  %7 = shl i32 %6, 8
  %8 = or i32 %4, %7
  %9 = zext i32 %8 to i64
  %10 = load i32* %2, align 4
  %11 = and i32 %10, -256
  %12 = zext i32 %11 to i64
  %13 = shl i64 %12, 12
  %14 = or i64 %9, %13
  %15 = load i32* %1, align 4
  %16 = and i32 %15, -4096
  %17 = zext i32 %16 to i64
  %18 = shl i64 %17, 32
  %19 = or i64 %14, %18
  ret i64 %19
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %opt = alloca i32, align 4
  %e_strings = alloca i8*, align 8
  %compiled = alloca i32, align 4
  %go = alloca %struct.sed_label*, align 8
  %lbl = alloca %struct.sed_label*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i8* null, i8** %e_strings, align 8
  store i32 0, i32* %compiled, align 4
  %4 = call i32 @re_set_syntax(i32 66246)
  store i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i8** @myname, align 8
  br label %5

; <label>:5                                       ; preds = %49, %0
  %6 = load i32* %2, align 4
  %7 = load i8*** %3, align 8
  %8 = call i32 @getopt_long(i32 %6, i8** %7, i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), %struct.option* getelementptr inbounds ([7 x %struct.option]* bitcast (<{ { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] }, { i8*, i32, i32*, i32, [4 x i8] } }>* @longopts to [7 x %struct.option]*), i32 0, i32 0), i32* null)
  store i32 %8, i32* %opt, align 4
  %9 = icmp ne i32 %8, -1
  br i1 %9, label %10, label %50

; <label>:10                                      ; preds = %5
  %11 = load i32* %opt, align 4
  switch i32 %11, label %48 [
    i32 110, label %12
    i32 101, label %13
    i32 102, label %41
    i32 86, label %43
    i32 104, label %47
  ]

; <label>:12                                      ; preds = %10
  store i32 1, i32* @no_default_output, align 4
  br label %49

; <label>:13                                      ; preds = %10
  %14 = load i8** %e_strings, align 8
  %15 = icmp eq i8* %14, null
  br i1 %15, label %16, label %25

; <label>:16                                      ; preds = %13
  %17 = load i8** @optarg, align 8
  %18 = call i64 @strlen(i8* %17) nounwind readonly
  %19 = add i64 %18, 2
  %20 = trunc i64 %19 to i32
  %21 = call i8* @ck_malloc(i32 %20)
  store i8* %21, i8** %e_strings, align 8
  %22 = load i8** %e_strings, align 8
  %23 = load i8** @optarg, align 8
  %24 = call i8* @strcpy(i8* %22, i8* %23) nounwind
  br label %38

; <label>:25                                      ; preds = %13
  %26 = load i8** %e_strings, align 8
  %27 = load i8** %e_strings, align 8
  %28 = call i64 @strlen(i8* %27) nounwind readonly
  %29 = load i8** @optarg, align 8
  %30 = call i64 @strlen(i8* %29) nounwind readonly
  %31 = add i64 %28, %30
  %32 = add i64 %31, 2
  %33 = trunc i64 %32 to i32
  %34 = call i8* @ck_realloc(i8* %26, i32 %33)
  store i8* %34, i8** %e_strings, align 8
  %35 = load i8** %e_strings, align 8
  %36 = load i8** @optarg, align 8
  %37 = call i8* @strcat(i8* %35, i8* %36) nounwind
  br label %38

; <label>:38                                      ; preds = %25, %16
  %39 = load i8** %e_strings, align 8
  %40 = call i8* @strcat(i8* %39, i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)) nounwind
  store i32 1, i32* %compiled, align 4
  br label %49

; <label>:41                                      ; preds = %10
  %42 = load i8** @optarg, align 8
  call void @compile_file(i8* %42)
  store i32 1, i32* %compiled, align 4
  br label %49

; <label>:43                                      ; preds = %10
  %44 = load %struct._IO_FILE** @stdout, align 8
  %45 = load i8** @version_string, align 8
  %46 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i8* %45)
  call void @exit(i32 0) noreturn nounwind
  unreachable

; <label>:47                                      ; preds = %10
  call void @usage(i32 0)
  br label %49

; <label>:48                                      ; preds = %10
  call void @usage(i32 4)
  br label %49

; <label>:49                                      ; preds = %48, %47, %41, %38, %12
  br label %5

; <label>:50                                      ; preds = %5
  %51 = load i8** %e_strings, align 8
  %52 = icmp ne i8* %51, null
  br i1 %52, label %53, label %56

; <label>:53                                      ; preds = %50
  %54 = load i8** %e_strings, align 8
  call void @compile_string(i8* %54)
  %55 = load i8** %e_strings, align 8
  call void @free(i8* %55) nounwind
  br label %56

; <label>:56                                      ; preds = %53, %50
  %57 = load i32* %compiled, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %71, label %59

; <label>:59                                      ; preds = %56
  %60 = load i32* @optind, align 4
  %61 = load i32* %2, align 4
  %62 = icmp eq i32 %60, %61
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %59
  call void @usage(i32 4)
  br label %64

; <label>:64                                      ; preds = %63, %59
  %65 = load i32* @optind, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* @optind, align 4
  %67 = sext i32 %65 to i64
  %68 = load i8*** %3, align 8
  %69 = getelementptr inbounds i8** %68, i64 %67
  %70 = load i8** %69, align 8
  call void @compile_string(i8* %70)
  br label %71

; <label>:71                                      ; preds = %64, %56
  %72 = load %struct.sed_label** @jumps, align 8
  store %struct.sed_label* %72, %struct.sed_label** %go, align 8
  br label %73

; <label>:73                                      ; preds = %124, %71
  %74 = load %struct.sed_label** %go, align 8
  %75 = icmp ne %struct.sed_label* %74, null
  br i1 %75, label %76, label %128

; <label>:76                                      ; preds = %73
  %77 = load %struct.sed_label** @labels, align 8
  store %struct.sed_label* %77, %struct.sed_label** %lbl, align 8
  br label %78

; <label>:78                                      ; preds = %92, %76
  %79 = load %struct.sed_label** %lbl, align 8
  %80 = icmp ne %struct.sed_label* %79, null
  br i1 %80, label %81, label %96

; <label>:81                                      ; preds = %78
  %82 = load %struct.sed_label** %lbl, align 8
  %83 = getelementptr inbounds %struct.sed_label* %82, i32 0, i32 2
  %84 = load i8** %83, align 8
  %85 = load %struct.sed_label** %go, align 8
  %86 = getelementptr inbounds %struct.sed_label* %85, i32 0, i32 2
  %87 = load i8** %86, align 8
  %88 = call i32 @strcmp(i8* %84, i8* %87) nounwind readonly
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %91, label %90

; <label>:90                                      ; preds = %81
  br label %96

; <label>:91                                      ; preds = %81
  br label %92

; <label>:92                                      ; preds = %91
  %93 = load %struct.sed_label** %lbl, align 8
  %94 = getelementptr inbounds %struct.sed_label* %93, i32 0, i32 3
  %95 = load %struct.sed_label** %94, align 8
  store %struct.sed_label* %95, %struct.sed_label** %lbl, align 8
  br label %78

; <label>:96                                      ; preds = %90, %78
  %97 = load %struct.sed_label** %go, align 8
  %98 = getelementptr inbounds %struct.sed_label* %97, i32 0, i32 2
  %99 = load i8** %98, align 8
  %100 = load i8* %99, align 1
  %101 = sext i8 %100 to i32
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %110

; <label>:103                                     ; preds = %96
  %104 = load %struct.sed_label** %lbl, align 8
  %105 = icmp ne %struct.sed_label* %104, null
  br i1 %105, label %110, label %106

; <label>:106                                     ; preds = %103
  %107 = load %struct.sed_label** %go, align 8
  %108 = getelementptr inbounds %struct.sed_label* %107, i32 0, i32 2
  %109 = load i8** %108, align 8
  call void (i8*, ...)* @panic(i8* getelementptr inbounds ([34 x i8]* @.str5, i32 0, i32 0), i8* %109)
  br label %110

; <label>:110                                     ; preds = %106, %103, %96
  %111 = load %struct.sed_label** %lbl, align 8
  %112 = load %struct.sed_label** %go, align 8
  %113 = getelementptr inbounds %struct.sed_label* %112, i32 0, i32 1
  %114 = load i32* %113, align 4
  %115 = sext i32 %114 to i64
  %116 = load %struct.sed_label** %go, align 8
  %117 = getelementptr inbounds %struct.sed_label* %116, i32 0, i32 0
  %118 = load %struct.vector** %117, align 8
  %119 = getelementptr inbounds %struct.vector* %118, i32 0, i32 0
  %120 = load %struct.sed_cmd** %119, align 8
  %121 = getelementptr inbounds %struct.sed_cmd* %120, i64 %115
  %122 = getelementptr inbounds %struct.sed_cmd* %121, i32 0, i32 4
  %123 = bitcast %union.anon* %122 to %struct.sed_label**
  store %struct.sed_label* %111, %struct.sed_label** %123, align 8
  br label %124

; <label>:124                                     ; preds = %110
  %125 = load %struct.sed_label** %go, align 8
  %126 = getelementptr inbounds %struct.sed_label* %125, i32 0, i32 3
  %127 = load %struct.sed_label** %126, align 8
  store %struct.sed_label* %127, %struct.sed_label** %go, align 8
  br label %73

; <label>:128                                     ; preds = %73
  store i32 0, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  store i32 50, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %129 = call i8* @ck_malloc(i32 50)
  store i8* %129, i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  store i32 0, i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  store i32 50, i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 2), align 4
  %130 = call i8* @ck_malloc(i32 50)
  store i8* %130, i8** getelementptr inbounds (%struct.line* @append, i32 0, i32 0), align 8
  store i32 1, i32* getelementptr inbounds (%struct.line* @hold, i32 0, i32 1), align 4
  store i32 50, i32* getelementptr inbounds (%struct.line* @hold, i32 0, i32 2), align 4
  %131 = call i8* @ck_malloc(i32 50)
  store i8* %131, i8** getelementptr inbounds (%struct.line* @hold, i32 0, i32 0), align 8
  %132 = load i8** getelementptr inbounds (%struct.line* @hold, i32 0, i32 0), align 8
  %133 = getelementptr inbounds i8* %132, i64 0
  store i8 10, i8* %133, align 1
  %134 = load i32* %2, align 4
  %135 = load i32* @optind, align 4
  %136 = icmp sle i32 %134, %135
  br i1 %136, label %137, label %140

; <label>:137                                     ; preds = %128
  %138 = load i32* @last_input_file, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, i32* @last_input_file, align 4
  call void @read_file(i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0))
  br label %166

; <label>:140                                     ; preds = %128
  br label %141

; <label>:141                                     ; preds = %164, %140
  %142 = load i32* @optind, align 4
  %143 = load i32* %2, align 4
  %144 = icmp slt i32 %142, %143
  br i1 %144, label %145, label %165

; <label>:145                                     ; preds = %141
  %146 = load i32* @optind, align 4
  %147 = load i32* %2, align 4
  %148 = sub nsw i32 %147, 1
  %149 = icmp eq i32 %146, %148
  br i1 %149, label %150, label %153

; <label>:150                                     ; preds = %145
  %151 = load i32* @last_input_file, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, i32* @last_input_file, align 4
  br label %153

; <label>:153                                     ; preds = %150, %145
  %154 = load i32* @optind, align 4
  %155 = sext i32 %154 to i64
  %156 = load i8*** %3, align 8
  %157 = getelementptr inbounds i8** %156, i64 %155
  %158 = load i8** %157, align 8
  call void @read_file(i8* %158)
  %159 = load i32* @optind, align 4
  %160 = add nsw i32 %159, 1
  store i32 %160, i32* @optind, align 4
  %161 = load i32* @quit_cmd, align 4
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %163, label %164

; <label>:163                                     ; preds = %153
  br label %165

; <label>:164                                     ; preds = %153
  br label %141

; <label>:165                                     ; preds = %163, %141
  br label %166

; <label>:166                                     ; preds = %165, %137
  call void @close_files()
  %167 = load i32* @bad_input, align 4
  %168 = icmp ne i32 %167, 0
  br i1 %168, label %169, label %170

; <label>:169                                     ; preds = %166
  call void @exit(i32 2) noreturn nounwind
  unreachable

; <label>:170                                     ; preds = %166
  call void @exit(i32 0) noreturn nounwind
  unreachable
                                                  ; No predecessors!
  %172 = load i32* %1
  ret i32 %172
}

define i32 @re_set_syntax(i32 %syntax) nounwind uwtable {
  %1 = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32 %syntax, i32* %1, align 4
  %2 = load i32* @re_syntax_options, align 4
  store i32 %2, i32* %ret, align 4
  %3 = load i32* %1, align 4
  store i32 %3, i32* @re_syntax_options, align 4
  %4 = load i32* %ret, align 4
  ret i32 %4
}

declare i32 @getopt_long(i32, i8**, i8*, %struct.option*, i32*)

define i8* @ck_malloc(i32 %size) nounwind uwtable {
  %1 = alloca i32, align 4
  %ret = alloca i8*, align 8
  store i32 %size, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %7, label %4

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* %1, align 4
  br label %7

; <label>:7                                       ; preds = %4, %0
  %8 = load i32* %1, align 4
  %9 = sext i32 %8 to i64
  %10 = call noalias i8* @malloc(i64 %9) nounwind
  store i8* %10, i8** %ret, align 8
  %11 = load i8** %ret, align 8
  %12 = icmp eq i8* %11, null
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %7
  call void (i8*, ...)* @panic(i8* getelementptr inbounds ([25 x i8]* @.str48, i32 0, i32 0))
  br label %14

; <label>:14                                      ; preds = %13, %7
  %15 = load i8** %ret, align 8
  ret i8* %15
}

declare i64 @strlen(i8*) nounwind readonly

declare i8* @strcpy(i8*, i8*) nounwind

define i8* @ck_realloc(i8* %ptr, i32 %size) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %ret = alloca i8*, align 8
  store i8* %ptr, i8** %1, align 8
  store i32 %size, i32* %2, align 4
  %3 = load i8** %1, align 8
  %4 = load i32* %2, align 4
  %5 = sext i32 %4 to i64
  %6 = call noalias i8* @realloc(i8* %3, i64 %5) nounwind
  store i8* %6, i8** %ret, align 8
  %7 = load i8** %ret, align 8
  %8 = icmp eq i8* %7, null
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void (i8*, ...)* @panic(i8* getelementptr inbounds ([28 x i8]* @.str49, i32 0, i32 0))
  br label %10

; <label>:10                                      ; preds = %9, %0
  %11 = load i8** %ret, align 8
  ret i8* %11
}

declare i8* @strcat(i8*, i8*) nounwind

define void @compile_file(i8* %str) nounwind uwtable {
  %1 = alloca i8*, align 8
  %ch = alloca i32, align 4
  store i8* %str, i8** %1, align 8
  store i8* null, i8** @prog_end, align 8
  store i8* null, i8** @prog_cur, align 8
  store i8* null, i8** @prog_start, align 8
  %2 = load i8** %1, align 8
  store i8* %2, i8** @prog_name, align 8
  store i32 1, i32* @prog_line, align 4
  %3 = load i8** %1, align 8
  %4 = getelementptr inbounds i8* %3, i64 0
  %5 = load i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, 45
  br i1 %7, label %8, label %16

; <label>:8                                       ; preds = %0
  %9 = load i8** %1, align 8
  %10 = getelementptr inbounds i8* %9, i64 1
  %11 = load i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14                                      ; preds = %8
  %15 = load %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %15, %struct._IO_FILE** @prog_file, align 8
  br label %19

; <label>:16                                      ; preds = %8, %0
  %17 = load i8** %1, align 8
  %18 = call %struct._IO_FILE* @ck_fopen(i8* %17, i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0))
  store %struct._IO_FILE* %18, %struct._IO_FILE** @prog_file, align 8
  br label %19

; <label>:19                                      ; preds = %16, %14
  %20 = load %struct._IO_FILE** @prog_file, align 8
  %21 = call i32 @_IO_getc(%struct._IO_FILE* %20)
  store i32 %21, i32* %ch, align 4
  %22 = load i32* %ch, align 4
  %23 = icmp eq i32 %22, 35
  br i1 %23, label %24, label %47

; <label>:24                                      ; preds = %19
  %25 = load %struct._IO_FILE** @prog_file, align 8
  %26 = call i32 @_IO_getc(%struct._IO_FILE* %25)
  store i32 %26, i32* %ch, align 4
  %27 = load i32* %ch, align 4
  %28 = icmp eq i32 %27, 110
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %24
  %30 = load i32* @no_default_output, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* @no_default_output, align 4
  br label %32

; <label>:32                                      ; preds = %29, %24
  br label %33

; <label>:33                                      ; preds = %41, %32
  %34 = load i32* %ch, align 4
  %35 = icmp ne i32 %34, -1
  br i1 %35, label %36, label %39

; <label>:36                                      ; preds = %33
  %37 = load i32* %ch, align 4
  %38 = icmp ne i32 %37, 10
  br label %39

; <label>:39                                      ; preds = %36, %33
  %40 = phi i1 [ false, %33 ], [ %38, %36 ]
  br i1 %40, label %41, label %44

; <label>:41                                      ; preds = %39
  %42 = load %struct._IO_FILE** @prog_file, align 8
  %43 = call i32 @_IO_getc(%struct._IO_FILE* %42)
  store i32 %43, i32* %ch, align 4
  br label %33

; <label>:44                                      ; preds = %39
  %45 = load i32* @prog_line, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* @prog_line, align 4
  br label %55

; <label>:47                                      ; preds = %19
  %48 = load i32* %ch, align 4
  %49 = icmp ne i32 %48, -1
  br i1 %49, label %50, label %54

; <label>:50                                      ; preds = %47
  %51 = load i32* %ch, align 4
  %52 = load %struct._IO_FILE** @prog_file, align 8
  %53 = call i32 @ungetc(i32 %51, %struct._IO_FILE* %52)
  br label %54

; <label>:54                                      ; preds = %50, %47
  br label %55

; <label>:55                                      ; preds = %54, %44
  %56 = load %struct.vector** @the_program, align 8
  %57 = load i32* @prog_line, align 4
  %58 = call %struct.vector* @compile_program(%struct.vector* %56, i32 %57)
  store %struct.vector* %58, %struct.vector** @the_program, align 8
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...)

declare void @exit(i32) noreturn nounwind

define void @usage(i32 %status) nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 %status, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = load %struct._IO_FILE** @stdout, align 8
  br label %8

; <label>:6                                       ; preds = %0
  %7 = load %struct._IO_FILE** @stdout, align 8
  br label %8

; <label>:8                                       ; preds = %6, %4
  %9 = phi %struct._IO_FILE* [ %5, %4 ], [ %7, %6 ]
  %10 = load i8** @myname, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([140 x i8]* @.str41, i32 0, i32 0), i8* %10)
  %12 = load i32* %1, align 4
  call void @exit(i32 %12) noreturn nounwind
  unreachable
                                                  ; No predecessors!
  ret void
}

define void @compile_string(i8* %str) nounwind uwtable {
  %1 = alloca i8*, align 8
  store i8* %str, i8** %1, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** @prog_file, align 8
  store i32 0, i32* @prog_line, align 4
  %2 = load i8** %1, align 8
  store i8* %2, i8** @prog_cur, align 8
  store i8* %2, i8** @prog_start, align 8
  %3 = load i8** %1, align 8
  %4 = load i8** %1, align 8
  %5 = call i64 @strlen(i8* %4) nounwind readonly
  %6 = getelementptr inbounds i8* %3, i64 %5
  store i8* %6, i8** @prog_end, align 8
  %7 = load %struct.vector** @the_program, align 8
  %8 = load i32* @prog_line, align 4
  %9 = call %struct.vector* @compile_program(%struct.vector* %7, i32 %8)
  store %struct.vector* %9, %struct.vector** @the_program, align 8
  ret void
}

declare void @free(i8*) nounwind

declare i32 @strcmp(i8*, i8*) nounwind readonly

define void @panic(i8* %str, ...) nounwind uwtable {
  %1 = alloca i8*, align 8
  %iggy = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %str, i8** %1, align 8
  %2 = load %struct._IO_FILE** @stdout, align 8
  %3 = load i8** @myname, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([5 x i8]* @.str42, i32 0, i32 0), i8* %3)
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %iggy, i32 0, i32 0
  %6 = bitcast %struct.__va_list_tag* %5 to i8*
  call void @llvm.va_start(i8* %6)
  %7 = load %struct._IO_FILE** @stdout, align 8
  %8 = load i8** %1, align 8
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %iggy, i32 0, i32 0
  %10 = call i32 @vfprintf(%struct._IO_FILE* %7, i8* %8, %struct.__va_list_tag* %9)
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %iggy, i32 0, i32 0
  %12 = bitcast %struct.__va_list_tag* %11 to i8*
  call void @llvm.va_end(i8* %12)
  %13 = load %struct._IO_FILE** @stdout, align 8
  %14 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %13)
  call void @exit(i32 4) noreturn nounwind
  unreachable
                                                  ; No predecessors!
  ret void
}

define void @read_file(i8* %name) nounwind uwtable {
  %1 = alloca i8*, align 8
  %ptr = alloca i8*, align 8
  store i8* %name, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = load i8* %2, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp eq i32 %4, 45
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %0
  %7 = load i8** %1, align 8
  %8 = getelementptr inbounds i8* %7, i64 1
  %9 = load i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12                                      ; preds = %6
  %13 = load %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %13, %struct._IO_FILE** @input_file, align 8
  br label %31

; <label>:14                                      ; preds = %6, %0
  %15 = load i8** %1, align 8
  %16 = call %struct._IO_FILE* @fopen(i8* %15, i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0))
  store %struct._IO_FILE* %16, %struct._IO_FILE** @input_file, align 8
  %17 = load %struct._IO_FILE** @input_file, align 8
  %18 = icmp eq %struct._IO_FILE* %17, null
  br i1 %18, label %19, label %30

; <label>:19                                      ; preds = %14
  %20 = call i32* @__errno_location() nounwind readnone
  %21 = load i32* %20, align 4
  %22 = call i8* @strerror(i32 %21) nounwind
  store i8* %22, i8** %ptr, align 8
  %23 = load i32* @bad_input, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* @bad_input, align 4
  %25 = load %struct._IO_FILE** @stdout, align 8
  %26 = load i8** @myname, align 8
  %27 = load i8** %1, align 8
  %28 = load i8** %ptr, align 8
  %29 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([23 x i8]* @.str27, i32 0, i32 0), i8* %26, i8* %27, i8* %28)
  br label %57

; <label>:30                                      ; preds = %14
  br label %31

; <label>:31                                      ; preds = %30, %12
  br label %32

; <label>:32                                      ; preds = %54, %31
  %33 = call i32 @read_pattern_space()
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %55

; <label>:35                                      ; preds = %32
  %36 = load %struct.vector** @the_program, align 8
  call void @execute_program(%struct.vector* %36)
  %37 = load i32* @no_default_output, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %43, label %39

; <label>:39                                      ; preds = %35
  %40 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %41 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %42 = load %struct._IO_FILE** @stdout, align 8
  call void @ck_fwrite(i8* %40, i32 1, i32 %41, %struct._IO_FILE* %42)
  br label %43

; <label>:43                                      ; preds = %39, %35
  %44 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %50

; <label>:46                                      ; preds = %43
  %47 = load i8** getelementptr inbounds (%struct.line* @append, i32 0, i32 0), align 8
  %48 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  %49 = load %struct._IO_FILE** @stdout, align 8
  call void @ck_fwrite(i8* %47, i32 1, i32 %48, %struct._IO_FILE* %49)
  store i32 0, i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  br label %50

; <label>:50                                      ; preds = %46, %43
  %51 = load i32* @quit_cmd, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %50
  br label %55

; <label>:54                                      ; preds = %50
  br label %32

; <label>:55                                      ; preds = %53, %32
  %56 = load %struct._IO_FILE** @input_file, align 8
  call void @ck_fclose(%struct._IO_FILE* %56)
  br label %57

; <label>:57                                      ; preds = %55, %19
  ret void
}

define void @close_files() nounwind uwtable {
  %nf = alloca i32, align 4
  store i32 0, i32* %nf, align 4
  br label %1

; <label>:1                                       ; preds = %19, %0
  %2 = load i32* %nf, align 4
  %3 = icmp slt i32 %2, 32
  br i1 %3, label %4, label %22

; <label>:4                                       ; preds = %1
  %5 = load i32* %nf, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [32 x %struct.anon.1]* @file_ptrs, i32 0, i64 %6
  %8 = getelementptr inbounds %struct.anon.1* %7, i32 0, i32 0
  %9 = load %struct._IO_FILE** %8, align 8
  %10 = icmp ne %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %18

; <label>:11                                      ; preds = %4
  %12 = load i32* %nf, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [32 x %struct.anon.1]* @file_ptrs, i32 0, i64 %13
  %15 = getelementptr inbounds %struct.anon.1* %14, i32 0, i32 0
  %16 = load %struct._IO_FILE** %15, align 8
  %17 = call i32 @fclose(%struct._IO_FILE* %16)
  br label %18

; <label>:18                                      ; preds = %11, %4
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i32* %nf, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %nf, align 4
  br label %1

; <label>:22                                      ; preds = %1
  ret void
}

declare i32 @fclose(%struct._IO_FILE*)

define %struct.vector* @compile_program(%struct.vector* %vector, i32 %open_line) nounwind uwtable {
  %1 = alloca %struct.vector*, align 8
  %2 = alloca %struct.vector*, align 8
  %3 = alloca i32, align 4
  %cur_cmd = alloca %struct.sed_cmd*, align 8
  %pch = alloca i32, align 4
  %ch = alloca i32, align 4
  %slash = alloca i32, align 4
  %b = alloca i8*, align 8
  %string = alloca i8*, align 8
  %num = alloca i32, align 4
  %ci = alloca i32, align 4
  store %struct.vector* %vector, %struct.vector** %2, align 8
  store i32 %open_line, i32* %3, align 4
  store i32 0, i32* %ch, align 4
  %4 = load %struct.vector** %2, align 8
  %5 = icmp ne %struct.vector* %4, null
  br i1 %5, label %21, label %6

; <label>:6                                       ; preds = %0
  %7 = call i8* @ck_malloc(i32 32)
  %8 = bitcast i8* %7 to %struct.vector*
  store %struct.vector* %8, %struct.vector** %2, align 8
  %9 = call i8* @ck_malloc(i32 3840)
  %10 = bitcast i8* %9 to %struct.sed_cmd*
  %11 = load %struct.vector** %2, align 8
  %12 = getelementptr inbounds %struct.vector* %11, i32 0, i32 0
  store %struct.sed_cmd* %10, %struct.sed_cmd** %12, align 8
  %13 = load %struct.vector** %2, align 8
  %14 = getelementptr inbounds %struct.vector* %13, i32 0, i32 2
  store i32 40, i32* %14, align 4
  %15 = load %struct.vector** %2, align 8
  %16 = getelementptr inbounds %struct.vector* %15, i32 0, i32 1
  store i32 0, i32* %16, align 4
  %17 = load %struct.vector** %2, align 8
  %18 = getelementptr inbounds %struct.vector* %17, i32 0, i32 3
  store %struct.vector* null, %struct.vector** %18, align 8
  %19 = load %struct.vector** %2, align 8
  %20 = getelementptr inbounds %struct.vector* %19, i32 0, i32 4
  store i32 0, i32* %20, align 4
  br label %21

; <label>:21                                      ; preds = %6, %0
  br label %22

; <label>:22                                      ; preds = %794, %21
  br label %23

; <label>:23                                      ; preds = %208, %22
  br label %24

; <label>:24                                      ; preds = %56, %23
  %25 = load i32* %ch, align 4
  store i32 %25, i32* %pch, align 4
  %26 = call i32 @inchar()
  store i32 %26, i32* %ch, align 4
  %27 = load i32* %pch, align 4
  %28 = icmp eq i32 %27, 92
  br i1 %28, label %29, label %34

; <label>:29                                      ; preds = %24
  %30 = load i32* %ch, align 4
  %31 = icmp eq i32 %30, 10
  br i1 %31, label %32, label %34

; <label>:32                                      ; preds = %29
  %33 = call i32 @inchar()
  store i32 %33, i32* %ch, align 4
  br label %34

; <label>:34                                      ; preds = %32, %29, %24
  br label %35

; <label>:35                                      ; preds = %34
  %36 = load i32* %ch, align 4
  %37 = icmp ne i32 %36, -1
  br i1 %37, label %38, label %56

; <label>:38                                      ; preds = %35
  %39 = load i32* %ch, align 4
  %40 = sext i32 %39 to i64
  %41 = call i16** @__ctype_b_loc() nounwind readnone
  %42 = load i16** %41, align 8
  %43 = getelementptr inbounds i16* %42, i64 %40
  %44 = load i16* %43, align 2
  %45 = zext i16 %44 to i32
  %46 = and i32 %45, 1
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %54, label %48

; <label>:48                                      ; preds = %38
  %49 = load i32* %ch, align 4
  %50 = icmp eq i32 %49, 10
  br i1 %50, label %54, label %51

; <label>:51                                      ; preds = %48
  %52 = load i32* %ch, align 4
  %53 = icmp eq i32 %52, 59
  br label %54

; <label>:54                                      ; preds = %51, %48, %38
  %55 = phi i1 [ true, %48 ], [ true, %38 ], [ %53, %51 ]
  br label %56

; <label>:56                                      ; preds = %54, %35
  %57 = phi i1 [ false, %35 ], [ %55, %54 ]
  br i1 %57, label %24, label %58

; <label>:58                                      ; preds = %56
  %59 = load i32* %ch, align 4
  %60 = icmp eq i32 %59, -1
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %58
  br label %795

; <label>:62                                      ; preds = %58
  %63 = load i32* %ch, align 4
  call void @savchar(i32 %63)
  %64 = load %struct.vector** %2, align 8
  %65 = getelementptr inbounds %struct.vector* %64, i32 0, i32 1
  %66 = load i32* %65, align 4
  %67 = load %struct.vector** %2, align 8
  %68 = getelementptr inbounds %struct.vector* %67, i32 0, i32 2
  %69 = load i32* %68, align 4
  %70 = icmp eq i32 %66, %69
  br i1 %70, label %71, label %91

; <label>:71                                      ; preds = %62
  %72 = load %struct.vector** %2, align 8
  %73 = getelementptr inbounds %struct.vector* %72, i32 0, i32 0
  %74 = load %struct.sed_cmd** %73, align 8
  %75 = bitcast %struct.sed_cmd* %74 to i8*
  %76 = load %struct.vector** %2, align 8
  %77 = getelementptr inbounds %struct.vector* %76, i32 0, i32 1
  %78 = load i32* %77, align 4
  %79 = add nsw i32 %78, 40
  %80 = sext i32 %79 to i64
  %81 = mul i64 %80, 96
  %82 = trunc i64 %81 to i32
  %83 = call i8* @ck_realloc(i8* %75, i32 %82)
  %84 = bitcast i8* %83 to %struct.sed_cmd*
  %85 = load %struct.vector** %2, align 8
  %86 = getelementptr inbounds %struct.vector* %85, i32 0, i32 0
  store %struct.sed_cmd* %84, %struct.sed_cmd** %86, align 8
  %87 = load %struct.vector** %2, align 8
  %88 = getelementptr inbounds %struct.vector* %87, i32 0, i32 2
  %89 = load i32* %88, align 4
  %90 = add nsw i32 %89, 40
  store i32 %90, i32* %88, align 4
  br label %91

; <label>:91                                      ; preds = %71, %62
  %92 = load %struct.vector** %2, align 8
  %93 = getelementptr inbounds %struct.vector* %92, i32 0, i32 0
  %94 = load %struct.sed_cmd** %93, align 8
  %95 = load %struct.vector** %2, align 8
  %96 = getelementptr inbounds %struct.vector* %95, i32 0, i32 1
  %97 = load i32* %96, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds %struct.sed_cmd* %94, i64 %98
  store %struct.sed_cmd* %99, %struct.sed_cmd** %cur_cmd, align 8
  %100 = load %struct.vector** %2, align 8
  %101 = getelementptr inbounds %struct.vector* %100, i32 0, i32 1
  %102 = load i32* %101, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %101, align 4
  %104 = load %struct.sed_cmd** %cur_cmd, align 8
  %105 = getelementptr inbounds %struct.sed_cmd* %104, i32 0, i32 0
  %106 = getelementptr inbounds %struct.addr* %105, i32 0, i32 0
  store i32 0, i32* %106, align 4
  %107 = load %struct.sed_cmd** %cur_cmd, align 8
  %108 = getelementptr inbounds %struct.sed_cmd* %107, i32 0, i32 1
  %109 = getelementptr inbounds %struct.addr* %108, i32 0, i32 0
  store i32 0, i32* %109, align 4
  %110 = load %struct.sed_cmd** %cur_cmd, align 8
  %111 = getelementptr inbounds %struct.sed_cmd* %110, i32 0, i32 2
  store i32 0, i32* %111, align 4
  %112 = load %struct.sed_cmd** %cur_cmd, align 8
  %113 = getelementptr inbounds %struct.sed_cmd* %112, i32 0, i32 3
  store i8 0, i8* %113, align 1
  %114 = load %struct.sed_cmd** %cur_cmd, align 8
  %115 = getelementptr inbounds %struct.sed_cmd* %114, i32 0, i32 0
  %116 = call i32 @compile_address(%struct.addr* %115)
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %118, label %152

; <label>:118                                     ; preds = %91
  %119 = call i32 @inchar()
  store i32 %119, i32* %ch, align 4
  %120 = load i32* %ch, align 4
  %121 = icmp eq i32 %120, 44
  br i1 %121, label %122, label %149

; <label>:122                                     ; preds = %118
  br label %123

; <label>:123                                     ; preds = %138, %122
  %124 = call i32 @inchar()
  store i32 %124, i32* %ch, align 4
  br label %125

; <label>:125                                     ; preds = %123
  %126 = load i32* %ch, align 4
  %127 = icmp ne i32 %126, -1
  br i1 %127, label %128, label %138

; <label>:128                                     ; preds = %125
  %129 = load i32* %ch, align 4
  %130 = sext i32 %129 to i64
  %131 = call i16** @__ctype_b_loc() nounwind readnone
  %132 = load i16** %131, align 8
  %133 = getelementptr inbounds i16* %132, i64 %130
  %134 = load i16* %133, align 2
  %135 = zext i16 %134 to i32
  %136 = and i32 %135, 1
  %137 = icmp ne i32 %136, 0
  br label %138

; <label>:138                                     ; preds = %128, %125
  %139 = phi i1 [ false, %125 ], [ %137, %128 ]
  br i1 %139, label %123, label %140

; <label>:140                                     ; preds = %138
  %141 = load i32* %ch, align 4
  call void @savchar(i32 %141)
  %142 = load %struct.sed_cmd** %cur_cmd, align 8
  %143 = getelementptr inbounds %struct.sed_cmd* %142, i32 0, i32 1
  %144 = call i32 @compile_address(%struct.addr* %143)
  %145 = icmp ne i32 %144, 0
  br i1 %145, label %146, label %147

; <label>:146                                     ; preds = %140
  br label %148

; <label>:147                                     ; preds = %140
  call void @bad_prog(i8* getelementptr inbounds ([15 x i8]* @.str8, i32 0, i32 0))
  br label %148

; <label>:148                                     ; preds = %147, %146
  br label %151

; <label>:149                                     ; preds = %118
  %150 = load i32* %ch, align 4
  call void @savchar(i32 %150)
  br label %151

; <label>:151                                     ; preds = %149, %148
  br label %152

; <label>:152                                     ; preds = %151, %91
  %153 = load %struct.sed_cmd** %cur_cmd, align 8
  %154 = getelementptr inbounds %struct.sed_cmd* %153, i32 0, i32 0
  %155 = getelementptr inbounds %struct.addr* %154, i32 0, i32 0
  %156 = load i32* %155, align 4
  %157 = icmp eq i32 %156, 1
  br i1 %157, label %158, label %182

; <label>:158                                     ; preds = %152
  %159 = load %struct.sed_cmd** %cur_cmd, align 8
  %160 = getelementptr inbounds %struct.sed_cmd* %159, i32 0, i32 1
  %161 = getelementptr inbounds %struct.addr* %160, i32 0, i32 0
  %162 = load i32* %161, align 4
  %163 = icmp eq i32 %162, 1
  br i1 %163, label %164, label %182

; <label>:164                                     ; preds = %158
  %165 = load %struct.sed_cmd** %cur_cmd, align 8
  %166 = getelementptr inbounds %struct.sed_cmd* %165, i32 0, i32 1
  %167 = getelementptr inbounds %struct.addr* %166, i32 0, i32 2
  %168 = load i32* %167, align 4
  %169 = load %struct.sed_cmd** %cur_cmd, align 8
  %170 = getelementptr inbounds %struct.sed_cmd* %169, i32 0, i32 0
  %171 = getelementptr inbounds %struct.addr* %170, i32 0, i32 2
  %172 = load i32* %171, align 4
  %173 = icmp slt i32 %168, %172
  br i1 %173, label %174, label %182

; <label>:174                                     ; preds = %164
  %175 = load %struct.sed_cmd** %cur_cmd, align 8
  %176 = getelementptr inbounds %struct.sed_cmd* %175, i32 0, i32 0
  %177 = getelementptr inbounds %struct.addr* %176, i32 0, i32 2
  %178 = load i32* %177, align 4
  %179 = load %struct.sed_cmd** %cur_cmd, align 8
  %180 = getelementptr inbounds %struct.sed_cmd* %179, i32 0, i32 1
  %181 = getelementptr inbounds %struct.addr* %180, i32 0, i32 2
  store i32 %178, i32* %181, align 4
  br label %182

; <label>:182                                     ; preds = %174, %164, %158, %152
  %183 = call i32 @inchar()
  store i32 %183, i32* %ch, align 4
  %184 = load i32* %ch, align 4
  %185 = icmp eq i32 %184, -1
  br i1 %185, label %186, label %187

; <label>:186                                     ; preds = %182
  call void @bad_prog(i8* getelementptr inbounds ([16 x i8]* @NO_COMMAND, i32 0, i32 0))
  br label %187

; <label>:187                                     ; preds = %186, %182
  br label %188

; <label>:188                                     ; preds = %246, %187
  %189 = load i32* %ch, align 4
  switch i32 %189, label %793 [
    i32 35, label %190
    i32 33, label %213
    i32 97, label %247
    i32 105, label %247
    i32 99, label %255
    i32 123, label %311
    i32 125, label %338
    i32 58, label %381
    i32 98, label %397
    i32 116, label %397
    i32 113, label %406
    i32 61, label %406
    i32 100, label %414
    i32 68, label %414
    i32 103, label %414
    i32 71, label %414
    i32 104, label %414
    i32 72, label %414
    i32 108, label %414
    i32 110, label %414
    i32 78, label %414
    i32 112, label %414
    i32 80, label %414
    i32 120, label %414
    i32 114, label %453
    i32 119, label %461
    i32 115, label %473
    i32 121, label %706
  ]

; <label>:190                                     ; preds = %188
  %191 = load %struct.sed_cmd** %cur_cmd, align 8
  %192 = getelementptr inbounds %struct.sed_cmd* %191, i32 0, i32 0
  %193 = getelementptr inbounds %struct.addr* %192, i32 0, i32 0
  %194 = load i32* %193, align 4
  %195 = icmp ne i32 %194, 0
  br i1 %195, label %196, label %197

; <label>:196                                     ; preds = %190
  call void @bad_prog(i8* getelementptr inbounds ([35 x i8]* @NO_ADDR, i32 0, i32 0))
  br label %197

; <label>:197                                     ; preds = %196, %190
  br label %198

; <label>:198                                     ; preds = %206, %197
  %199 = call i32 @inchar()
  store i32 %199, i32* %ch, align 4
  br label %200

; <label>:200                                     ; preds = %198
  %201 = load i32* %ch, align 4
  %202 = icmp ne i32 %201, -1
  br i1 %202, label %203, label %206

; <label>:203                                     ; preds = %200
  %204 = load i32* %ch, align 4
  %205 = icmp ne i32 %204, 10
  br label %206

; <label>:206                                     ; preds = %203, %200
  %207 = phi i1 [ false, %200 ], [ %205, %203 ]
  br i1 %207, label %198, label %208

; <label>:208                                     ; preds = %206
  %209 = load %struct.vector** %2, align 8
  %210 = getelementptr inbounds %struct.vector* %209, i32 0, i32 1
  %211 = load i32* %210, align 4
  %212 = add nsw i32 %211, -1
  store i32 %212, i32* %210, align 4
  br label %23

; <label>:213                                     ; preds = %188
  %214 = load %struct.sed_cmd** %cur_cmd, align 8
  %215 = getelementptr inbounds %struct.sed_cmd* %214, i32 0, i32 2
  %216 = load i32* %215, align 4
  %217 = and i32 %216, 2
  %218 = icmp ne i32 %217, 0
  br i1 %218, label %219, label %220

; <label>:219                                     ; preds = %213
  call void @bad_prog(i8* getelementptr inbounds ([14 x i8]* @.str9, i32 0, i32 0))
  br label %220

; <label>:220                                     ; preds = %219, %213
  %221 = load %struct.sed_cmd** %cur_cmd, align 8
  %222 = getelementptr inbounds %struct.sed_cmd* %221, i32 0, i32 2
  %223 = load i32* %222, align 4
  %224 = or i32 %223, 2
  store i32 %224, i32* %222, align 4
  br label %225

; <label>:225                                     ; preds = %240, %220
  %226 = call i32 @inchar()
  store i32 %226, i32* %ch, align 4
  br label %227

; <label>:227                                     ; preds = %225
  %228 = load i32* %ch, align 4
  %229 = icmp ne i32 %228, -1
  br i1 %229, label %230, label %240

; <label>:230                                     ; preds = %227
  %231 = load i32* %ch, align 4
  %232 = sext i32 %231 to i64
  %233 = call i16** @__ctype_b_loc() nounwind readnone
  %234 = load i16** %233, align 8
  %235 = getelementptr inbounds i16* %234, i64 %232
  %236 = load i16* %235, align 2
  %237 = zext i16 %236 to i32
  %238 = and i32 %237, 1
  %239 = icmp ne i32 %238, 0
  br label %240

; <label>:240                                     ; preds = %230, %227
  %241 = phi i1 [ false, %227 ], [ %239, %230 ]
  br i1 %241, label %225, label %242

; <label>:242                                     ; preds = %240
  %243 = load i32* %ch, align 4
  %244 = icmp eq i32 %243, -1
  br i1 %244, label %245, label %246

; <label>:245                                     ; preds = %242
  call void @bad_prog(i8* getelementptr inbounds ([16 x i8]* @NO_COMMAND, i32 0, i32 0))
  br label %246

; <label>:246                                     ; preds = %245, %242
  br label %188

; <label>:247                                     ; preds = %188, %188
  %248 = load %struct.sed_cmd** %cur_cmd, align 8
  %249 = getelementptr inbounds %struct.sed_cmd* %248, i32 0, i32 1
  %250 = getelementptr inbounds %struct.addr* %249, i32 0, i32 0
  %251 = load i32* %250, align 4
  %252 = icmp ne i32 %251, 0
  br i1 %252, label %253, label %254

; <label>:253                                     ; preds = %247
  call void @bad_prog(i8* getelementptr inbounds ([30 x i8]* @ONE_ADDR, i32 0, i32 0))
  br label %254

; <label>:254                                     ; preds = %253, %247
  br label %255

; <label>:255                                     ; preds = %254, %188
  %256 = load i32* %ch, align 4
  %257 = trunc i32 %256 to i8
  %258 = load %struct.sed_cmd** %cur_cmd, align 8
  %259 = getelementptr inbounds %struct.sed_cmd* %258, i32 0, i32 3
  store i8 %257, i8* %259, align 1
  %260 = call i32 @inchar()
  %261 = icmp ne i32 %260, 92
  br i1 %261, label %265, label %262

; <label>:262                                     ; preds = %255
  %263 = call i32 @inchar()
  %264 = icmp ne i32 %263, 10
  br i1 %264, label %265, label %266

; <label>:265                                     ; preds = %262, %255
  call void @bad_prog(i8* getelementptr inbounds ([31 x i8]* @LINE_JUNK, i32 0, i32 0))
  br label %266

; <label>:266                                     ; preds = %265, %262
  %267 = call i8* @init_buffer()
  store i8* %267, i8** %b, align 8
  br label %268

; <label>:268                                     ; preds = %281, %266
  %269 = call i32 @inchar()
  store i32 %269, i32* %ch, align 4
  %270 = icmp ne i32 %269, -1
  br i1 %270, label %271, label %274

; <label>:271                                     ; preds = %268
  %272 = load i32* %ch, align 4
  %273 = icmp ne i32 %272, 10
  br label %274

; <label>:274                                     ; preds = %271, %268
  %275 = phi i1 [ false, %268 ], [ %273, %271 ]
  br i1 %275, label %276, label %284

; <label>:276                                     ; preds = %274
  %277 = load i32* %ch, align 4
  %278 = icmp eq i32 %277, 92
  br i1 %278, label %279, label %281

; <label>:279                                     ; preds = %276
  %280 = call i32 @inchar()
  store i32 %280, i32* %ch, align 4
  br label %281

; <label>:281                                     ; preds = %279, %276
  %282 = load i8** %b, align 8
  %283 = load i32* %ch, align 4
  call void @add1_buffer(i8* %282, i32 %283)
  br label %268

; <label>:284                                     ; preds = %274
  %285 = load i32* %ch, align 4
  %286 = icmp ne i32 %285, -1
  br i1 %286, label %287, label %290

; <label>:287                                     ; preds = %284
  %288 = load i8** %b, align 8
  %289 = load i32* %ch, align 4
  call void @add1_buffer(i8* %288, i32 %289)
  br label %290

; <label>:290                                     ; preds = %287, %284
  %291 = load i8** %b, align 8
  %292 = call i32 @size_buffer(i8* %291)
  store i32 %292, i32* %num, align 4
  %293 = load i32* %num, align 4
  %294 = call i8* @ck_malloc(i32 %293)
  store i8* %294, i8** %string, align 8
  %295 = load i8** %b, align 8
  %296 = call i8* @get_buffer(i8* %295)
  %297 = load i8** %string, align 8
  %298 = load i32* %num, align 4
  %299 = sext i32 %298 to i64
  call void @bcopy(i8* %296, i8* %297, i64 %299) nounwind
  %300 = load i8** %b, align 8
  call void @flush_buffer(i8* %300)
  %301 = load i32* %num, align 4
  %302 = load %struct.sed_cmd** %cur_cmd, align 8
  %303 = getelementptr inbounds %struct.sed_cmd* %302, i32 0, i32 4
  %304 = bitcast %union.anon* %303 to %struct.anon*
  %305 = getelementptr inbounds %struct.anon* %304, i32 0, i32 1
  store i32 %301, i32* %305, align 4
  %306 = load i8** %string, align 8
  %307 = load %struct.sed_cmd** %cur_cmd, align 8
  %308 = getelementptr inbounds %struct.sed_cmd* %307, i32 0, i32 4
  %309 = bitcast %union.anon* %308 to %struct.anon*
  %310 = getelementptr inbounds %struct.anon* %309, i32 0, i32 0
  store i8* %306, i8** %310, align 8
  br label %794

; <label>:311                                     ; preds = %188
  %312 = load i32* %ch, align 4
  %313 = trunc i32 %312 to i8
  %314 = load %struct.sed_cmd** %cur_cmd, align 8
  %315 = getelementptr inbounds %struct.sed_cmd* %314, i32 0, i32 3
  store i8 %313, i8* %315, align 1
  %316 = load i32* @program_depth, align 4
  %317 = add nsw i32 %316, 1
  store i32 %317, i32* @program_depth, align 4
  %318 = load i32* @prog_line, align 4
  %319 = call %struct.vector* (...)* bitcast (%struct.vector* (%struct.vector*, i32)* @compile_program to %struct.vector* (...)*)(%struct.vector* null, i32 %318)
  %320 = load %struct.sed_cmd** %cur_cmd, align 8
  %321 = getelementptr inbounds %struct.sed_cmd* %320, i32 0, i32 4
  %322 = bitcast %union.anon* %321 to %struct.vector**
  store %struct.vector* %319, %struct.vector** %322, align 8
  %323 = load %struct.vector** %2, align 8
  %324 = load %struct.sed_cmd** %cur_cmd, align 8
  %325 = getelementptr inbounds %struct.sed_cmd* %324, i32 0, i32 4
  %326 = bitcast %union.anon* %325 to %struct.vector**
  %327 = load %struct.vector** %326, align 8
  %328 = getelementptr inbounds %struct.vector* %327, i32 0, i32 3
  store %struct.vector* %323, %struct.vector** %328, align 8
  %329 = load %struct.vector** %2, align 8
  %330 = getelementptr inbounds %struct.vector* %329, i32 0, i32 1
  %331 = load i32* %330, align 4
  %332 = sub nsw i32 %331, 1
  %333 = load %struct.sed_cmd** %cur_cmd, align 8
  %334 = getelementptr inbounds %struct.sed_cmd* %333, i32 0, i32 4
  %335 = bitcast %union.anon* %334 to %struct.vector**
  %336 = load %struct.vector** %335, align 8
  %337 = getelementptr inbounds %struct.vector* %336, i32 0, i32 4
  store i32 %332, i32* %337, align 4
  br label %794

; <label>:338                                     ; preds = %188
  %339 = load i32* @program_depth, align 4
  %340 = icmp ne i32 %339, 0
  br i1 %340, label %342, label %341

; <label>:341                                     ; preds = %338
  call void @bad_prog(i8* getelementptr inbounds ([15 x i8]* @.str10, i32 0, i32 0))
  br label %342

; <label>:342                                     ; preds = %341, %338
  %343 = load i32* @program_depth, align 4
  %344 = add nsw i32 %343, -1
  store i32 %344, i32* @program_depth, align 4
  %345 = load i32* %ch, align 4
  %346 = trunc i32 %345 to i8
  %347 = load %struct.sed_cmd** %cur_cmd, align 8
  %348 = getelementptr inbounds %struct.sed_cmd* %347, i32 0, i32 3
  store i8 %346, i8* %348, align 1
  %349 = load %struct.sed_cmd** %cur_cmd, align 8
  %350 = getelementptr inbounds %struct.sed_cmd* %349, i32 0, i32 0
  %351 = getelementptr inbounds %struct.addr* %350, i32 0, i32 0
  %352 = load i32* %351, align 4
  %353 = icmp ne i32 %352, 0
  br i1 %353, label %354, label %355

; <label>:354                                     ; preds = %342
  call void @bad_prog(i8* getelementptr inbounds ([29 x i8]* @.str11, i32 0, i32 0))
  br label %355

; <label>:355                                     ; preds = %354, %342
  br label %356

; <label>:356                                     ; preds = %378, %355
  %357 = call i32 @inchar()
  store i32 %357, i32* %ch, align 4
  %358 = icmp ne i32 %357, -1
  br i1 %358, label %359, label %365

; <label>:359                                     ; preds = %356
  %360 = load i32* %ch, align 4
  %361 = icmp ne i32 %360, 10
  br i1 %361, label %362, label %365

; <label>:362                                     ; preds = %359
  %363 = load i32* %ch, align 4
  %364 = icmp ne i32 %363, 59
  br label %365

; <label>:365                                     ; preds = %362, %359, %356
  %366 = phi i1 [ false, %359 ], [ false, %356 ], [ %364, %362 ]
  br i1 %366, label %367, label %379

; <label>:367                                     ; preds = %365
  %368 = load i32* %ch, align 4
  %369 = sext i32 %368 to i64
  %370 = call i16** @__ctype_b_loc() nounwind readnone
  %371 = load i16** %370, align 8
  %372 = getelementptr inbounds i16* %371, i64 %369
  %373 = load i16* %372, align 2
  %374 = zext i16 %373 to i32
  %375 = and i32 %374, 1
  %376 = icmp ne i32 %375, 0
  br i1 %376, label %378, label %377

; <label>:377                                     ; preds = %367
  call void @bad_prog(i8* getelementptr inbounds ([31 x i8]* @LINE_JUNK, i32 0, i32 0))
  br label %378

; <label>:378                                     ; preds = %377, %367
  br label %356

; <label>:379                                     ; preds = %365
  %380 = load %struct.vector** %2, align 8
  store %struct.vector* %380, %struct.vector** %1
  br label %802

; <label>:381                                     ; preds = %188
  %382 = load i32* %ch, align 4
  %383 = trunc i32 %382 to i8
  %384 = load %struct.sed_cmd** %cur_cmd, align 8
  %385 = getelementptr inbounds %struct.sed_cmd* %384, i32 0, i32 3
  store i8 %383, i8* %385, align 1
  %386 = load %struct.sed_cmd** %cur_cmd, align 8
  %387 = getelementptr inbounds %struct.sed_cmd* %386, i32 0, i32 0
  %388 = getelementptr inbounds %struct.addr* %387, i32 0, i32 0
  %389 = load i32* %388, align 4
  %390 = icmp ne i32 %389, 0
  br i1 %390, label %391, label %392

; <label>:391                                     ; preds = %381
  call void @bad_prog(i8* getelementptr inbounds ([29 x i8]* @.str12, i32 0, i32 0))
  br label %392

; <label>:392                                     ; preds = %391, %381
  %393 = load %struct.sed_label** @labels, align 8
  %394 = load %struct.sed_cmd** %cur_cmd, align 8
  %395 = load %struct.vector** %2, align 8
  %396 = call %struct.sed_label* @setup_jump(%struct.sed_label* %393, %struct.sed_cmd* %394, %struct.vector* %395)
  store %struct.sed_label* %396, %struct.sed_label** @labels, align 8
  br label %794

; <label>:397                                     ; preds = %188, %188
  %398 = load i32* %ch, align 4
  %399 = trunc i32 %398 to i8
  %400 = load %struct.sed_cmd** %cur_cmd, align 8
  %401 = getelementptr inbounds %struct.sed_cmd* %400, i32 0, i32 3
  store i8 %399, i8* %401, align 1
  %402 = load %struct.sed_label** @jumps, align 8
  %403 = load %struct.sed_cmd** %cur_cmd, align 8
  %404 = load %struct.vector** %2, align 8
  %405 = call %struct.sed_label* @setup_jump(%struct.sed_label* %402, %struct.sed_cmd* %403, %struct.vector* %404)
  store %struct.sed_label* %405, %struct.sed_label** @jumps, align 8
  br label %794

; <label>:406                                     ; preds = %188, %188
  %407 = load %struct.sed_cmd** %cur_cmd, align 8
  %408 = getelementptr inbounds %struct.sed_cmd* %407, i32 0, i32 1
  %409 = getelementptr inbounds %struct.addr* %408, i32 0, i32 0
  %410 = load i32* %409, align 4
  %411 = icmp ne i32 %410, 0
  br i1 %411, label %412, label %413

; <label>:412                                     ; preds = %406
  call void @bad_prog(i8* getelementptr inbounds ([30 x i8]* @ONE_ADDR, i32 0, i32 0))
  br label %413

; <label>:413                                     ; preds = %412, %406
  br label %414

; <label>:414                                     ; preds = %413, %188, %188, %188, %188, %188, %188, %188, %188, %188, %188, %188, %188
  %415 = load i32* %ch, align 4
  %416 = trunc i32 %415 to i8
  %417 = load %struct.sed_cmd** %cur_cmd, align 8
  %418 = getelementptr inbounds %struct.sed_cmd* %417, i32 0, i32 3
  store i8 %416, i8* %418, align 1
  br label %419

; <label>:419                                     ; preds = %440, %414
  %420 = call i32 @inchar()
  store i32 %420, i32* %ch, align 4
  br label %421

; <label>:421                                     ; preds = %419
  %422 = load i32* %ch, align 4
  %423 = icmp ne i32 %422, -1
  br i1 %423, label %424, label %440

; <label>:424                                     ; preds = %421
  %425 = load i32* %ch, align 4
  %426 = sext i32 %425 to i64
  %427 = call i16** @__ctype_b_loc() nounwind readnone
  %428 = load i16** %427, align 8
  %429 = getelementptr inbounds i16* %428, i64 %426
  %430 = load i16* %429, align 2
  %431 = zext i16 %430 to i32
  %432 = and i32 %431, 1
  %433 = icmp ne i32 %432, 0
  br i1 %433, label %434, label %440

; <label>:434                                     ; preds = %424
  %435 = load i32* %ch, align 4
  %436 = icmp ne i32 %435, 10
  br i1 %436, label %437, label %440

; <label>:437                                     ; preds = %434
  %438 = load i32* %ch, align 4
  %439 = icmp ne i32 %438, 59
  br label %440

; <label>:440                                     ; preds = %437, %434, %424, %421
  %441 = phi i1 [ false, %434 ], [ false, %424 ], [ false, %421 ], [ %439, %437 ]
  br i1 %441, label %419, label %442

; <label>:442                                     ; preds = %440
  %443 = load i32* %ch, align 4
  %444 = icmp ne i32 %443, 10
  br i1 %444, label %445, label %452

; <label>:445                                     ; preds = %442
  %446 = load i32* %ch, align 4
  %447 = icmp ne i32 %446, 59
  br i1 %447, label %448, label %452

; <label>:448                                     ; preds = %445
  %449 = load i32* %ch, align 4
  %450 = icmp ne i32 %449, -1
  br i1 %450, label %451, label %452

; <label>:451                                     ; preds = %448
  call void @bad_prog(i8* getelementptr inbounds ([31 x i8]* @LINE_JUNK, i32 0, i32 0))
  br label %452

; <label>:452                                     ; preds = %451, %448, %445, %442
  br label %794

; <label>:453                                     ; preds = %188
  %454 = load %struct.sed_cmd** %cur_cmd, align 8
  %455 = getelementptr inbounds %struct.sed_cmd* %454, i32 0, i32 1
  %456 = getelementptr inbounds %struct.addr* %455, i32 0, i32 0
  %457 = load i32* %456, align 4
  %458 = icmp ne i32 %457, 0
  br i1 %458, label %459, label %460

; <label>:459                                     ; preds = %453
  call void @bad_prog(i8* getelementptr inbounds ([30 x i8]* @ONE_ADDR, i32 0, i32 0))
  br label %460

; <label>:460                                     ; preds = %459, %453
  br label %461

; <label>:461                                     ; preds = %460, %188
  %462 = load i32* %ch, align 4
  %463 = trunc i32 %462 to i8
  %464 = load %struct.sed_cmd** %cur_cmd, align 8
  %465 = getelementptr inbounds %struct.sed_cmd* %464, i32 0, i32 3
  store i8 %463, i8* %465, align 1
  %466 = load i32* %ch, align 4
  %467 = icmp eq i32 %466, 114
  %468 = zext i1 %467 to i32
  %469 = call %struct._IO_FILE* @compile_filename(i32 %468)
  %470 = load %struct.sed_cmd** %cur_cmd, align 8
  %471 = getelementptr inbounds %struct.sed_cmd* %470, i32 0, i32 4
  %472 = bitcast %union.anon* %471 to %struct._IO_FILE**
  store %struct._IO_FILE* %469, %struct._IO_FILE** %472, align 8
  br label %794

; <label>:473                                     ; preds = %188
  %474 = load i32* %ch, align 4
  %475 = trunc i32 %474 to i8
  %476 = load %struct.sed_cmd** %cur_cmd, align 8
  %477 = getelementptr inbounds %struct.sed_cmd* %476, i32 0, i32 3
  store i8 %475, i8* %477, align 1
  %478 = call i32 @inchar()
  store i32 %478, i32* %slash, align 4
  %479 = load i32* %slash, align 4
  call void @compile_regex(i32 %479)
  %480 = load %struct.re_pattern_buffer** @last_regex, align 8
  %481 = load %struct.sed_cmd** %cur_cmd, align 8
  %482 = getelementptr inbounds %struct.sed_cmd* %481, i32 0, i32 4
  %483 = bitcast %union.anon* %482 to %struct.anon.0*
  %484 = getelementptr inbounds %struct.anon.0* %483, i32 0, i32 0
  store %struct.re_pattern_buffer* %480, %struct.re_pattern_buffer** %484, align 8
  %485 = call i8* @init_buffer()
  store i8* %485, i8** %b, align 8
  br label %486

; <label>:486                                     ; preds = %518, %473
  %487 = call i32 @inchar()
  store i32 %487, i32* %ch, align 4
  %488 = icmp ne i32 %487, -1
  br i1 %488, label %489, label %496

; <label>:489                                     ; preds = %486
  %490 = load i32* %ch, align 4
  %491 = load i32* %slash, align 4
  %492 = icmp ne i32 %490, %491
  br i1 %492, label %493, label %496

; <label>:493                                     ; preds = %489
  %494 = load i32* %ch, align 4
  %495 = icmp ne i32 %494, 10
  br label %496

; <label>:496                                     ; preds = %493, %489, %486
  %497 = phi i1 [ false, %489 ], [ false, %486 ], [ %495, %493 ]
  br i1 %497, label %498, label %519

; <label>:498                                     ; preds = %496
  %499 = load i32* %ch, align 4
  %500 = icmp eq i32 %499, 92
  br i1 %500, label %501, label %515

; <label>:501                                     ; preds = %498
  %502 = call i32 @inchar()
  store i32 %502, i32* %ci, align 4
  %503 = load i32* %ci, align 4
  %504 = icmp ne i32 %503, -1
  br i1 %504, label %505, label %514

; <label>:505                                     ; preds = %501
  %506 = load i32* %ci, align 4
  %507 = icmp ne i32 %506, 10
  br i1 %507, label %508, label %511

; <label>:508                                     ; preds = %505
  %509 = load i8** %b, align 8
  %510 = load i32* %ch, align 4
  call void @add1_buffer(i8* %509, i32 %510)
  br label %511

; <label>:511                                     ; preds = %508, %505
  %512 = load i8** %b, align 8
  %513 = load i32* %ci, align 4
  call void @add1_buffer(i8* %512, i32 %513)
  br label %514

; <label>:514                                     ; preds = %511, %501
  br label %518

; <label>:515                                     ; preds = %498
  %516 = load i8** %b, align 8
  %517 = load i32* %ch, align 4
  call void @add1_buffer(i8* %516, i32 %517)
  br label %518

; <label>:518                                     ; preds = %515, %514
  br label %486

; <label>:519                                     ; preds = %496
  %520 = load i32* %ch, align 4
  %521 = load i32* %slash, align 4
  %522 = icmp ne i32 %520, %521
  br i1 %522, label %523, label %533

; <label>:523                                     ; preds = %519
  %524 = load i32* %ch, align 4
  %525 = icmp eq i32 %524, 10
  br i1 %525, label %526, label %532

; <label>:526                                     ; preds = %523
  %527 = load i32* @prog_line, align 4
  %528 = icmp sgt i32 %527, 1
  br i1 %528, label %529, label %532

; <label>:529                                     ; preds = %526
  %530 = load i32* @prog_line, align 4
  %531 = add nsw i32 %530, -1
  store i32 %531, i32* @prog_line, align 4
  br label %532

; <label>:532                                     ; preds = %529, %526, %523
  call void @bad_prog(i8* getelementptr inbounds ([25 x i8]* @.str13, i32 0, i32 0))
  br label %533

; <label>:533                                     ; preds = %532, %519
  %534 = load i8** %b, align 8
  %535 = call i32 @size_buffer(i8* %534)
  %536 = load %struct.sed_cmd** %cur_cmd, align 8
  %537 = getelementptr inbounds %struct.sed_cmd* %536, i32 0, i32 4
  %538 = bitcast %union.anon* %537 to %struct.anon.0*
  %539 = getelementptr inbounds %struct.anon.0* %538, i32 0, i32 2
  store i32 %535, i32* %539, align 4
  %540 = load %struct.sed_cmd** %cur_cmd, align 8
  %541 = getelementptr inbounds %struct.sed_cmd* %540, i32 0, i32 4
  %542 = bitcast %union.anon* %541 to %struct.anon.0*
  %543 = getelementptr inbounds %struct.anon.0* %542, i32 0, i32 2
  %544 = load i32* %543, align 4
  %545 = call i8* @ck_malloc(i32 %544)
  %546 = load %struct.sed_cmd** %cur_cmd, align 8
  %547 = getelementptr inbounds %struct.sed_cmd* %546, i32 0, i32 4
  %548 = bitcast %union.anon* %547 to %struct.anon.0*
  %549 = getelementptr inbounds %struct.anon.0* %548, i32 0, i32 1
  store i8* %545, i8** %549, align 8
  %550 = load i8** %b, align 8
  %551 = call i8* @get_buffer(i8* %550)
  %552 = load %struct.sed_cmd** %cur_cmd, align 8
  %553 = getelementptr inbounds %struct.sed_cmd* %552, i32 0, i32 4
  %554 = bitcast %union.anon* %553 to %struct.anon.0*
  %555 = getelementptr inbounds %struct.anon.0* %554, i32 0, i32 1
  %556 = load i8** %555, align 8
  %557 = load %struct.sed_cmd** %cur_cmd, align 8
  %558 = getelementptr inbounds %struct.sed_cmd* %557, i32 0, i32 4
  %559 = bitcast %union.anon* %558 to %struct.anon.0*
  %560 = getelementptr inbounds %struct.anon.0* %559, i32 0, i32 2
  %561 = load i32* %560, align 4
  %562 = sext i32 %561 to i64
  call void @bcopy(i8* %551, i8* %556, i64 %562) nounwind
  %563 = load i8** %b, align 8
  call void @flush_buffer(i8* %563)
  %564 = load %struct.sed_cmd** %cur_cmd, align 8
  %565 = getelementptr inbounds %struct.sed_cmd* %564, i32 0, i32 4
  %566 = bitcast %union.anon* %565 to %struct.anon.0*
  %567 = getelementptr inbounds %struct.anon.0* %566, i32 0, i32 3
  store i32 0, i32* %567, align 4
  %568 = load %struct.sed_cmd** %cur_cmd, align 8
  %569 = getelementptr inbounds %struct.sed_cmd* %568, i32 0, i32 4
  %570 = bitcast %union.anon* %569 to %struct.anon.0*
  %571 = getelementptr inbounds %struct.anon.0* %570, i32 0, i32 4
  store i32 0, i32* %571, align 4
  %572 = load i32* %ch, align 4
  %573 = icmp eq i32 %572, -1
  br i1 %573, label %574, label %575

; <label>:574                                     ; preds = %533
  br label %794

; <label>:575                                     ; preds = %533
  br label %576

; <label>:576                                     ; preds = %699, %575
  %577 = call i32 @inchar()
  store i32 %577, i32* %ch, align 4
  %578 = load i32* %ch, align 4
  switch i32 %578, label %688 [
    i32 112, label %579
    i32 103, label %595
    i32 119, label %626
    i32 48, label %638
    i32 49, label %638
    i32 50, label %638
    i32 51, label %638
    i32 52, label %638
    i32 53, label %638
    i32 54, label %638
    i32 55, label %638
    i32 56, label %638
    i32 57, label %638
    i32 10, label %687
    i32 59, label %687
    i32 -1, label %687
  ]

; <label>:579                                     ; preds = %576
  %580 = load %struct.sed_cmd** %cur_cmd, align 8
  %581 = getelementptr inbounds %struct.sed_cmd* %580, i32 0, i32 4
  %582 = bitcast %union.anon* %581 to %struct.anon.0*
  %583 = getelementptr inbounds %struct.anon.0* %582, i32 0, i32 3
  %584 = load i32* %583, align 4
  %585 = and i32 %584, 2
  %586 = icmp ne i32 %585, 0
  br i1 %586, label %587, label %588

; <label>:587                                     ; preds = %579
  call void @bad_prog(i8* getelementptr inbounds ([36 x i8]* @.str14, i32 0, i32 0))
  br label %588

; <label>:588                                     ; preds = %587, %579
  %589 = load %struct.sed_cmd** %cur_cmd, align 8
  %590 = getelementptr inbounds %struct.sed_cmd* %589, i32 0, i32 4
  %591 = bitcast %union.anon* %590 to %struct.anon.0*
  %592 = getelementptr inbounds %struct.anon.0* %591, i32 0, i32 3
  %593 = load i32* %592, align 4
  %594 = or i32 %593, 2
  store i32 %594, i32* %592, align 4
  br label %689

; <label>:595                                     ; preds = %576
  %596 = load %struct.sed_cmd** %cur_cmd, align 8
  %597 = getelementptr inbounds %struct.sed_cmd* %596, i32 0, i32 4
  %598 = bitcast %union.anon* %597 to %struct.anon.0*
  %599 = getelementptr inbounds %struct.anon.0* %598, i32 0, i32 3
  %600 = load i32* %599, align 4
  %601 = and i32 %600, 8
  %602 = icmp ne i32 %601, 0
  br i1 %602, label %603, label %610

; <label>:603                                     ; preds = %595
  %604 = load %struct.sed_cmd** %cur_cmd, align 8
  %605 = getelementptr inbounds %struct.sed_cmd* %604, i32 0, i32 4
  %606 = bitcast %union.anon* %605 to %struct.anon.0*
  %607 = getelementptr inbounds %struct.anon.0* %606, i32 0, i32 3
  %608 = load i32* %607, align 4
  %609 = and i32 %608, -9
  store i32 %609, i32* %607, align 4
  br label %610

; <label>:610                                     ; preds = %603, %595
  %611 = load %struct.sed_cmd** %cur_cmd, align 8
  %612 = getelementptr inbounds %struct.sed_cmd* %611, i32 0, i32 4
  %613 = bitcast %union.anon* %612 to %struct.anon.0*
  %614 = getelementptr inbounds %struct.anon.0* %613, i32 0, i32 3
  %615 = load i32* %614, align 4
  %616 = and i32 %615, 1
  %617 = icmp ne i32 %616, 0
  br i1 %617, label %618, label %619

; <label>:618                                     ; preds = %610
  call void @bad_prog(i8* getelementptr inbounds ([36 x i8]* @.str15, i32 0, i32 0))
  br label %619

; <label>:619                                     ; preds = %618, %610
  %620 = load %struct.sed_cmd** %cur_cmd, align 8
  %621 = getelementptr inbounds %struct.sed_cmd* %620, i32 0, i32 4
  %622 = bitcast %union.anon* %621 to %struct.anon.0*
  %623 = getelementptr inbounds %struct.anon.0* %622, i32 0, i32 3
  %624 = load i32* %623, align 4
  %625 = or i32 %624, 1
  store i32 %625, i32* %623, align 4
  br label %689

; <label>:626                                     ; preds = %576
  %627 = load %struct.sed_cmd** %cur_cmd, align 8
  %628 = getelementptr inbounds %struct.sed_cmd* %627, i32 0, i32 4
  %629 = bitcast %union.anon* %628 to %struct.anon.0*
  %630 = getelementptr inbounds %struct.anon.0* %629, i32 0, i32 3
  %631 = load i32* %630, align 4
  %632 = or i32 %631, 4
  store i32 %632, i32* %630, align 4
  %633 = call %struct._IO_FILE* @compile_filename(i32 0)
  %634 = load %struct.sed_cmd** %cur_cmd, align 8
  %635 = getelementptr inbounds %struct.sed_cmd* %634, i32 0, i32 4
  %636 = bitcast %union.anon* %635 to %struct.anon.0*
  %637 = getelementptr inbounds %struct.anon.0* %636, i32 0, i32 5
  store %struct._IO_FILE* %633, %struct._IO_FILE** %637, align 8
  store i32 10, i32* %ch, align 4
  br label %689

; <label>:638                                     ; preds = %576, %576, %576, %576, %576, %576, %576, %576, %576, %576
  %639 = load %struct.sed_cmd** %cur_cmd, align 8
  %640 = getelementptr inbounds %struct.sed_cmd* %639, i32 0, i32 4
  %641 = bitcast %union.anon* %640 to %struct.anon.0*
  %642 = getelementptr inbounds %struct.anon.0* %641, i32 0, i32 3
  %643 = load i32* %642, align 4
  %644 = and i32 %643, 8
  %645 = icmp ne i32 %644, 0
  br i1 %645, label %646, label %647

; <label>:646                                     ; preds = %638
  call void @bad_prog(i8* getelementptr inbounds ([39 x i8]* @.str16, i32 0, i32 0))
  br label %647

; <label>:647                                     ; preds = %646, %638
  %648 = load %struct.sed_cmd** %cur_cmd, align 8
  %649 = getelementptr inbounds %struct.sed_cmd* %648, i32 0, i32 4
  %650 = bitcast %union.anon* %649 to %struct.anon.0*
  %651 = getelementptr inbounds %struct.anon.0* %650, i32 0, i32 3
  %652 = load i32* %651, align 4
  %653 = and i32 %652, 1
  %654 = icmp eq i32 %653, 0
  br i1 %654, label %655, label %662

; <label>:655                                     ; preds = %647
  %656 = load %struct.sed_cmd** %cur_cmd, align 8
  %657 = getelementptr inbounds %struct.sed_cmd* %656, i32 0, i32 4
  %658 = bitcast %union.anon* %657 to %struct.anon.0*
  %659 = getelementptr inbounds %struct.anon.0* %658, i32 0, i32 3
  %660 = load i32* %659, align 4
  %661 = or i32 %660, 8
  store i32 %661, i32* %659, align 4
  br label %662

; <label>:662                                     ; preds = %655, %647
  store i32 0, i32* %num, align 4
  br label %663

; <label>:663                                     ; preds = %673, %662
  %664 = load i32* %ch, align 4
  %665 = sext i32 %664 to i64
  %666 = call i16** @__ctype_b_loc() nounwind readnone
  %667 = load i16** %666, align 8
  %668 = getelementptr inbounds i16* %667, i64 %665
  %669 = load i16* %668, align 2
  %670 = zext i16 %669 to i32
  %671 = and i32 %670, 2048
  %672 = icmp ne i32 %671, 0
  br i1 %672, label %673, label %680

; <label>:673                                     ; preds = %663
  %674 = load i32* %num, align 4
  %675 = mul nsw i32 %674, 10
  %676 = load i32* %ch, align 4
  %677 = add nsw i32 %675, %676
  %678 = sub nsw i32 %677, 48
  store i32 %678, i32* %num, align 4
  %679 = call i32 @inchar()
  store i32 %679, i32* %ch, align 4
  br label %663

; <label>:680                                     ; preds = %663
  %681 = load i32* %ch, align 4
  call void @savchar(i32 %681)
  %682 = load i32* %num, align 4
  %683 = load %struct.sed_cmd** %cur_cmd, align 8
  %684 = getelementptr inbounds %struct.sed_cmd* %683, i32 0, i32 4
  %685 = bitcast %union.anon* %684 to %struct.anon.0*
  %686 = getelementptr inbounds %struct.anon.0* %685, i32 0, i32 4
  store i32 %682, i32* %686, align 4
  br label %689

; <label>:687                                     ; preds = %576, %576, %576
  br label %689

; <label>:688                                     ; preds = %576
  call void @bad_prog(i8* getelementptr inbounds ([22 x i8]* @.str17, i32 0, i32 0))
  br label %689

; <label>:689                                     ; preds = %688, %687, %680, %626, %619, %588
  br label %690

; <label>:690                                     ; preds = %689
  %691 = load i32* %ch, align 4
  %692 = icmp ne i32 %691, -1
  br i1 %692, label %693, label %699

; <label>:693                                     ; preds = %690
  %694 = load i32* %ch, align 4
  %695 = icmp ne i32 %694, 10
  br i1 %695, label %696, label %699

; <label>:696                                     ; preds = %693
  %697 = load i32* %ch, align 4
  %698 = icmp ne i32 %697, 59
  br label %699

; <label>:699                                     ; preds = %696, %693, %690
  %700 = phi i1 [ false, %693 ], [ false, %690 ], [ %698, %696 ]
  br i1 %700, label %576, label %701

; <label>:701                                     ; preds = %699
  %702 = load i32* %ch, align 4
  %703 = icmp eq i32 %702, -1
  br i1 %703, label %704, label %705

; <label>:704                                     ; preds = %701
  br label %794

; <label>:705                                     ; preds = %701
  br label %794

; <label>:706                                     ; preds = %188
  %707 = load i32* %ch, align 4
  %708 = trunc i32 %707 to i8
  %709 = load %struct.sed_cmd** %cur_cmd, align 8
  %710 = getelementptr inbounds %struct.sed_cmd* %709, i32 0, i32 3
  store i8 %708, i8* %710, align 1
  %711 = call i8* @ck_malloc(i32 256)
  store i8* %711, i8** %string, align 8
  store i32 0, i32* %num, align 4
  br label %712

; <label>:712                                     ; preds = %722, %706
  %713 = load i32* %num, align 4
  %714 = icmp slt i32 %713, 256
  br i1 %714, label %715, label %725

; <label>:715                                     ; preds = %712
  %716 = load i32* %num, align 4
  %717 = trunc i32 %716 to i8
  %718 = load i32* %num, align 4
  %719 = sext i32 %718 to i64
  %720 = load i8** %string, align 8
  %721 = getelementptr inbounds i8* %720, i64 %719
  store i8 %717, i8* %721, align 1
  br label %722

; <label>:722                                     ; preds = %715
  %723 = load i32* %num, align 4
  %724 = add nsw i32 %723, 1
  store i32 %724, i32* %num, align 4
  br label %712

; <label>:725                                     ; preds = %712
  %726 = call i8* @init_buffer()
  store i8* %726, i8** %b, align 8
  %727 = call i32 @inchar()
  store i32 %727, i32* %slash, align 4
  br label %728

; <label>:728                                     ; preds = %737, %725
  %729 = call i32 @inchar()
  store i32 %729, i32* %ch, align 4
  %730 = icmp ne i32 %729, -1
  br i1 %730, label %731, label %735

; <label>:731                                     ; preds = %728
  %732 = load i32* %ch, align 4
  %733 = load i32* %slash, align 4
  %734 = icmp ne i32 %732, %733
  br label %735

; <label>:735                                     ; preds = %731, %728
  %736 = phi i1 [ false, %728 ], [ %734, %731 ]
  br i1 %736, label %737, label %740

; <label>:737                                     ; preds = %735
  %738 = load i8** %b, align 8
  %739 = load i32* %ch, align 4
  call void @add1_buffer(i8* %738, i32 %739)
  br label %728

; <label>:740                                     ; preds = %735
  %741 = load i8** %string, align 8
  %742 = load %struct.sed_cmd** %cur_cmd, align 8
  %743 = getelementptr inbounds %struct.sed_cmd* %742, i32 0, i32 4
  %744 = bitcast %union.anon* %743 to i8**
  store i8* %741, i8** %744, align 8
  %745 = load i8** %b, align 8
  %746 = call i8* @get_buffer(i8* %745)
  store i8* %746, i8** %string, align 8
  %747 = load i8** %b, align 8
  %748 = call i32 @size_buffer(i8* %747)
  store i32 %748, i32* %num, align 4
  br label %749

; <label>:749                                     ; preds = %774, %740
  %750 = load i32* %num, align 4
  %751 = icmp ne i32 %750, 0
  br i1 %751, label %752, label %777

; <label>:752                                     ; preds = %749
  %753 = call i32 @inchar()
  store i32 %753, i32* %ch, align 4
  %754 = load i32* %ch, align 4
  %755 = icmp eq i32 %754, -1
  br i1 %755, label %756, label %757

; <label>:756                                     ; preds = %752
  call void @bad_prog(i8* getelementptr inbounds ([23 x i8]* @BAD_EOF, i32 0, i32 0))
  br label %757

; <label>:757                                     ; preds = %756, %752
  %758 = load i32* %ch, align 4
  %759 = load i32* %slash, align 4
  %760 = icmp eq i32 %758, %759
  br i1 %760, label %761, label %762

; <label>:761                                     ; preds = %757
  call void @bad_prog(i8* getelementptr inbounds ([44 x i8]* @.str18, i32 0, i32 0))
  br label %762

; <label>:762                                     ; preds = %761, %757
  %763 = load i32* %ch, align 4
  %764 = trunc i32 %763 to i8
  %765 = load i8** %string, align 8
  %766 = getelementptr inbounds i8* %765, i32 1
  store i8* %766, i8** %string, align 8
  %767 = load i8* %765, align 1
  %768 = zext i8 %767 to i64
  %769 = load %struct.sed_cmd** %cur_cmd, align 8
  %770 = getelementptr inbounds %struct.sed_cmd* %769, i32 0, i32 4
  %771 = bitcast %union.anon* %770 to i8**
  %772 = load i8** %771, align 8
  %773 = getelementptr inbounds i8* %772, i64 %768
  store i8 %764, i8* %773, align 1
  br label %774

; <label>:774                                     ; preds = %762
  %775 = load i32* %num, align 4
  %776 = add nsw i32 %775, -1
  store i32 %776, i32* %num, align 4
  br label %749

; <label>:777                                     ; preds = %749
  %778 = load i8** %b, align 8
  call void @flush_buffer(i8* %778)
  %779 = call i32 @inchar()
  %780 = load i32* %slash, align 4
  %781 = icmp ne i32 %779, %780
  br i1 %781, label %791, label %782

; <label>:782                                     ; preds = %777
  %783 = call i32 @inchar()
  store i32 %783, i32* %ch, align 4
  %784 = icmp ne i32 %783, -1
  br i1 %784, label %785, label %792

; <label>:785                                     ; preds = %782
  %786 = load i32* %ch, align 4
  %787 = icmp ne i32 %786, 10
  br i1 %787, label %788, label %792

; <label>:788                                     ; preds = %785
  %789 = load i32* %ch, align 4
  %790 = icmp ne i32 %789, 59
  br i1 %790, label %791, label %792

; <label>:791                                     ; preds = %788, %777
  call void @bad_prog(i8* getelementptr inbounds ([31 x i8]* @LINE_JUNK, i32 0, i32 0))
  br label %792

; <label>:792                                     ; preds = %791, %788, %785, %782
  br label %794

; <label>:793                                     ; preds = %188
  call void @bad_prog(i8* getelementptr inbounds ([16 x i8]* @.str19, i32 0, i32 0))
  br label %794

; <label>:794                                     ; preds = %793, %792, %705, %704, %574, %461, %452, %397, %392, %311, %290
  br label %22

; <label>:795                                     ; preds = %61
  %796 = load i32* @program_depth, align 4
  %797 = icmp ne i32 %796, 0
  br i1 %797, label %798, label %800

; <label>:798                                     ; preds = %795
  %799 = load i32* %3, align 4
  store i32 %799, i32* @prog_line, align 4
  call void @bad_prog(i8* getelementptr inbounds ([14 x i8]* @.str20, i32 0, i32 0))
  br label %800

; <label>:800                                     ; preds = %798, %795
  %801 = load %struct.vector** %2, align 8
  store %struct.vector* %801, %struct.vector** %1
  br label %802

; <label>:802                                     ; preds = %800, %379
  %803 = load %struct.vector** %1
  ret %struct.vector* %803
}

define %struct._IO_FILE* @ck_fopen(i8* %name, i8* %mode) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %ret = alloca %struct._IO_FILE*, align 8
  %n = alloca i32, align 4
  store i8* %name, i8** %1, align 8
  store i8* %mode, i8** %2, align 8
  %3 = load i8** %1, align 8
  %4 = load i8** %2, align 8
  %5 = call %struct._IO_FILE* @fopen(i8* %3, i8* %4)
  store %struct._IO_FILE* %5, %struct._IO_FILE** %ret, align 8
  %6 = load %struct._IO_FILE** %ret, align 8
  %7 = icmp eq %struct._IO_FILE* %6, null
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %0
  %9 = load i8** %1, align 8
  call void (i8*, ...)* @panic(i8* getelementptr inbounds ([22 x i8]* @.str44, i32 0, i32 0), i8* %9)
  br label %10

; <label>:10                                      ; preds = %8, %0
  store i32 0, i32* %n, align 4
  br label %11

; <label>:11                                      ; preds = %45, %10
  %12 = load i32* %n, align 4
  %13 = icmp slt i32 %12, 32
  br i1 %13, label %14, label %48

; <label>:14                                      ; preds = %11
  %15 = load %struct._IO_FILE** %ret, align 8
  %16 = load i32* %n, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [32 x %struct.id]* @__id_s, i32 0, i64 %17
  %19 = getelementptr inbounds %struct.id* %18, i32 0, i32 0
  %20 = load %struct._IO_FILE** %19, align 8
  %21 = icmp eq %struct._IO_FILE* %15, %20
  br i1 %21, label %22, label %44

; <label>:22                                      ; preds = %14
  %23 = load i32* %n, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [32 x %struct.id]* @__id_s, i32 0, i64 %24
  %26 = getelementptr inbounds %struct.id* %25, i32 0, i32 1
  %27 = load i8** %26, align 8
  call void @free(i8* %27) nounwind
  %28 = load i8** %1, align 8
  %29 = call i64 @strlen(i8* %28) nounwind readonly
  %30 = add i64 %29, 1
  %31 = trunc i64 %30 to i32
  %32 = call i8* @ck_malloc(i32 %31)
  %33 = load i32* %n, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [32 x %struct.id]* @__id_s, i32 0, i64 %34
  %36 = getelementptr inbounds %struct.id* %35, i32 0, i32 1
  store i8* %32, i8** %36, align 8
  %37 = load i32* %n, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [32 x %struct.id]* @__id_s, i32 0, i64 %38
  %40 = getelementptr inbounds %struct.id* %39, i32 0, i32 1
  %41 = load i8** %40, align 8
  %42 = load i8** %1, align 8
  %43 = call i8* @strcpy(i8* %41, i8* %42) nounwind
  br label %48

; <label>:44                                      ; preds = %14
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load i32* %n, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %n, align 4
  br label %11

; <label>:48                                      ; preds = %22, %11
  %49 = load i32* %n, align 4
  %50 = icmp eq i32 %49, 32
  br i1 %50, label %51, label %93

; <label>:51                                      ; preds = %48
  store i32 0, i32* %n, align 4
  br label %52

; <label>:52                                      ; preds = %64, %51
  %53 = load i32* %n, align 4
  %54 = icmp slt i32 %53, 32
  br i1 %54, label %55, label %67

; <label>:55                                      ; preds = %52
  %56 = load i32* %n, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [32 x %struct.id]* @__id_s, i32 0, i64 %57
  %59 = getelementptr inbounds %struct.id* %58, i32 0, i32 0
  %60 = load %struct._IO_FILE** %59, align 8
  %61 = icmp eq %struct._IO_FILE* %60, null
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %55
  br label %67

; <label>:63                                      ; preds = %55
  br label %64

; <label>:64                                      ; preds = %63
  %65 = load i32* %n, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %n, align 4
  br label %52

; <label>:67                                      ; preds = %62, %52
  %68 = load i32* %n, align 4
  %69 = icmp eq i32 %68, 32
  br i1 %69, label %70, label %71

; <label>:70                                      ; preds = %67
  call void (i8*, ...)* @panic(i8* getelementptr inbounds ([36 x i8]* @.str45, i32 0, i32 0))
  br label %71

; <label>:71                                      ; preds = %70, %67
  %72 = load %struct._IO_FILE** %ret, align 8
  %73 = load i32* %n, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [32 x %struct.id]* @__id_s, i32 0, i64 %74
  %76 = getelementptr inbounds %struct.id* %75, i32 0, i32 0
  store %struct._IO_FILE* %72, %struct._IO_FILE** %76, align 8
  %77 = load i8** %1, align 8
  %78 = call i64 @strlen(i8* %77) nounwind readonly
  %79 = add i64 %78, 1
  %80 = trunc i64 %79 to i32
  %81 = call i8* @ck_malloc(i32 %80)
  %82 = load i32* %n, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [32 x %struct.id]* @__id_s, i32 0, i64 %83
  %85 = getelementptr inbounds %struct.id* %84, i32 0, i32 1
  store i8* %81, i8** %85, align 8
  %86 = load i32* %n, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [32 x %struct.id]* @__id_s, i32 0, i64 %87
  %89 = getelementptr inbounds %struct.id* %88, i32 0, i32 1
  %90 = load i8** %89, align 8
  %91 = load i8** %1, align 8
  %92 = call i8* @strcpy(i8* %90, i8* %91) nounwind
  br label %93

; <label>:93                                      ; preds = %71, %48
  %94 = load %struct._IO_FILE** %ret, align 8
  ret %struct._IO_FILE* %94
}

declare i32 @_IO_getc(%struct._IO_FILE*)

declare i32 @ungetc(i32, %struct._IO_FILE*)

define i32 @inchar() nounwind uwtable {
  %1 = alloca i32, align 4
  %ch = alloca i32, align 4
  %2 = load %struct._IO_FILE** @prog_file, align 8
  %3 = icmp ne %struct._IO_FILE* %2, null
  br i1 %3, label %4, label %13

; <label>:4                                       ; preds = %0
  %5 = load %struct._IO_FILE** @prog_file, align 8
  %6 = call i32 @feof(%struct._IO_FILE* %5) nounwind
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %4
  store i32 -1, i32* %1
  br label %40

; <label>:9                                       ; preds = %4
  %10 = load %struct._IO_FILE** @prog_file, align 8
  %11 = call i32 @_IO_getc(%struct._IO_FILE* %10)
  store i32 %11, i32* %ch, align 4
  br label %12

; <label>:12                                      ; preds = %9
  br label %29

; <label>:13                                      ; preds = %0
  %14 = load i8** @prog_cur, align 8
  %15 = icmp ne i8* %14, null
  br i1 %15, label %17, label %16

; <label>:16                                      ; preds = %13
  store i32 -1, i32* %1
  br label %40

; <label>:17                                      ; preds = %13
  %18 = load i8** @prog_cur, align 8
  %19 = load i8** @prog_end, align 8
  %20 = icmp eq i8* %18, %19
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %17
  store i32 -1, i32* %ch, align 4
  store i8* null, i8** @prog_cur, align 8
  br label %27

; <label>:22                                      ; preds = %17
  %23 = load i8** @prog_cur, align 8
  %24 = getelementptr inbounds i8* %23, i32 1
  store i8* %24, i8** @prog_cur, align 8
  %25 = load i8* %23, align 1
  %26 = zext i8 %25 to i32
  store i32 %26, i32* %ch, align 4
  br label %27

; <label>:27                                      ; preds = %22, %21
  br label %28

; <label>:28                                      ; preds = %27
  br label %29

; <label>:29                                      ; preds = %28, %12
  %30 = load i32* %ch, align 4
  %31 = icmp eq i32 %30, 10
  br i1 %31, label %32, label %38

; <label>:32                                      ; preds = %29
  %33 = load i32* @prog_line, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %38

; <label>:35                                      ; preds = %32
  %36 = load i32* @prog_line, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* @prog_line, align 4
  br label %38

; <label>:38                                      ; preds = %35, %32, %29
  %39 = load i32* %ch, align 4
  store i32 %39, i32* %1
  br label %40

; <label>:40                                      ; preds = %38, %16, %8
  %41 = load i32* %1
  ret i32 %41
}

declare i16** @__ctype_b_loc() nounwind readnone

define void @savchar(i32 %ch) nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 %ch, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp eq i32 %2, -1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %26

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = icmp eq i32 %6, 10
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %5
  %9 = load i32* @prog_line, align 4
  %10 = icmp sgt i32 %9, 1
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %8
  %12 = load i32* @prog_line, align 4
  %13 = add nsw i32 %12, -1
  store i32 %13, i32* @prog_line, align 4
  br label %14

; <label>:14                                      ; preds = %11, %8, %5
  %15 = load %struct._IO_FILE** @prog_file, align 8
  %16 = icmp ne %struct._IO_FILE* %15, null
  br i1 %16, label %17, label %21

; <label>:17                                      ; preds = %14
  %18 = load i32* %1, align 4
  %19 = load %struct._IO_FILE** @prog_file, align 8
  %20 = call i32 @ungetc(i32 %18, %struct._IO_FILE* %19)
  br label %26

; <label>:21                                      ; preds = %14
  %22 = load i32* %1, align 4
  %23 = trunc i32 %22 to i8
  %24 = load i8** @prog_cur, align 8
  %25 = getelementptr inbounds i8* %24, i32 -1
  store i8* %25, i8** @prog_cur, align 8
  store i8 %23, i8* %25, align 1
  br label %26

; <label>:26                                      ; preds = %21, %17, %4
  ret void
}

define i32 @compile_address(%struct.addr* %addr) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca %struct.addr*, align 8
  %ch = alloca i32, align 4
  %num = alloca i32, align 4
  store %struct.addr* %addr, %struct.addr** %2, align 8
  %3 = call i32 @inchar()
  store i32 %3, i32* %ch, align 4
  %4 = load i32* %ch, align 4
  %5 = sext i32 %4 to i64
  %6 = call i16** @__ctype_b_loc() nounwind readnone
  %7 = load i16** %6, align 8
  %8 = getelementptr inbounds i16* %7, i64 %5
  %9 = load i16* %8, align 2
  %10 = zext i16 %9 to i32
  %11 = and i32 %10, 2048
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %62

; <label>:13                                      ; preds = %0
  %14 = load i32* %ch, align 4
  %15 = sub nsw i32 %14, 48
  store i32 %15, i32* %num, align 4
  br label %16

; <label>:16                                      ; preds = %31, %13
  %17 = call i32 @inchar()
  store i32 %17, i32* %ch, align 4
  %18 = icmp ne i32 %17, -1
  br i1 %18, label %19, label %29

; <label>:19                                      ; preds = %16
  %20 = load i32* %ch, align 4
  %21 = sext i32 %20 to i64
  %22 = call i16** @__ctype_b_loc() nounwind readnone
  %23 = load i16** %22, align 8
  %24 = getelementptr inbounds i16* %23, i64 %21
  %25 = load i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = and i32 %26, 2048
  %28 = icmp ne i32 %27, 0
  br label %29

; <label>:29                                      ; preds = %19, %16
  %30 = phi i1 [ false, %16 ], [ %28, %19 ]
  br i1 %30, label %31, label %37

; <label>:31                                      ; preds = %29
  %32 = load i32* %num, align 4
  %33 = mul nsw i32 %32, 10
  %34 = load i32* %ch, align 4
  %35 = add nsw i32 %33, %34
  %36 = sub nsw i32 %35, 48
  store i32 %36, i32* %num, align 4
  br label %16

; <label>:37                                      ; preds = %29
  br label %38

; <label>:38                                      ; preds = %53, %37
  %39 = load i32* %ch, align 4
  %40 = icmp ne i32 %39, -1
  br i1 %40, label %41, label %51

; <label>:41                                      ; preds = %38
  %42 = load i32* %ch, align 4
  %43 = sext i32 %42 to i64
  %44 = call i16** @__ctype_b_loc() nounwind readnone
  %45 = load i16** %44, align 8
  %46 = getelementptr inbounds i16* %45, i64 %43
  %47 = load i16* %46, align 2
  %48 = zext i16 %47 to i32
  %49 = and i32 %48, 1
  %50 = icmp ne i32 %49, 0
  br label %51

; <label>:51                                      ; preds = %41, %38
  %52 = phi i1 [ false, %38 ], [ %50, %41 ]
  br i1 %52, label %53, label %55

; <label>:53                                      ; preds = %51
  %54 = call i32 @inchar()
  store i32 %54, i32* %ch, align 4
  br label %38

; <label>:55                                      ; preds = %51
  %56 = load i32* %ch, align 4
  call void (...)* bitcast (void (i32)* @savchar to void (...)*)(i32 %56)
  %57 = load %struct.addr** %2, align 8
  %58 = getelementptr inbounds %struct.addr* %57, i32 0, i32 0
  store i32 1, i32* %58, align 4
  %59 = load i32* %num, align 4
  %60 = load %struct.addr** %2, align 8
  %61 = getelementptr inbounds %struct.addr* %60, i32 0, i32 2
  store i32 %59, i32* %61, align 4
  store i32 1, i32* %1
  br label %129

; <label>:62                                      ; preds = %0
  %63 = load i32* %ch, align 4
  %64 = icmp eq i32 %63, 47
  br i1 %64, label %68, label %65

; <label>:65                                      ; preds = %62
  %66 = load i32* %ch, align 4
  %67 = icmp eq i32 %66, 92
  br i1 %67, label %68, label %99

; <label>:68                                      ; preds = %65, %62
  %69 = load %struct.addr** %2, align 8
  %70 = getelementptr inbounds %struct.addr* %69, i32 0, i32 0
  store i32 2, i32* %70, align 4
  %71 = load i32* %ch, align 4
  %72 = icmp eq i32 %71, 92
  br i1 %72, label %73, label %75

; <label>:73                                      ; preds = %68
  %74 = call i32 @inchar()
  store i32 %74, i32* %ch, align 4
  br label %75

; <label>:75                                      ; preds = %73, %68
  %76 = load i32* %ch, align 4
  call void @compile_regex(i32 %76)
  %77 = load %struct.re_pattern_buffer** @last_regex, align 8
  %78 = load %struct.addr** %2, align 8
  %79 = getelementptr inbounds %struct.addr* %78, i32 0, i32 1
  store %struct.re_pattern_buffer* %77, %struct.re_pattern_buffer** %79, align 8
  br label %80

; <label>:80                                      ; preds = %95, %75
  %81 = call i32 @inchar()
  store i32 %81, i32* %ch, align 4
  br label %82

; <label>:82                                      ; preds = %80
  %83 = load i32* %ch, align 4
  %84 = icmp ne i32 %83, -1
  br i1 %84, label %85, label %95

; <label>:85                                      ; preds = %82
  %86 = load i32* %ch, align 4
  %87 = sext i32 %86 to i64
  %88 = call i16** @__ctype_b_loc() nounwind readnone
  %89 = load i16** %88, align 8
  %90 = getelementptr inbounds i16* %89, i64 %87
  %91 = load i16* %90, align 2
  %92 = zext i16 %91 to i32
  %93 = and i32 %92, 1
  %94 = icmp ne i32 %93, 0
  br label %95

; <label>:95                                      ; preds = %85, %82
  %96 = phi i1 [ false, %82 ], [ %94, %85 ]
  br i1 %96, label %80, label %97

; <label>:97                                      ; preds = %95
  %98 = load i32* %ch, align 4
  call void (...)* bitcast (void (i32)* @savchar to void (...)*)(i32 %98)
  store i32 1, i32* %1
  br label %129

; <label>:99                                      ; preds = %65
  %100 = load i32* %ch, align 4
  %101 = icmp eq i32 %100, 36
  br i1 %101, label %102, label %124

; <label>:102                                     ; preds = %99
  %103 = load %struct.addr** %2, align 8
  %104 = getelementptr inbounds %struct.addr* %103, i32 0, i32 0
  store i32 3, i32* %104, align 4
  br label %105

; <label>:105                                     ; preds = %120, %102
  %106 = call i32 @inchar()
  store i32 %106, i32* %ch, align 4
  br label %107

; <label>:107                                     ; preds = %105
  %108 = load i32* %ch, align 4
  %109 = icmp ne i32 %108, -1
  br i1 %109, label %110, label %120

; <label>:110                                     ; preds = %107
  %111 = load i32* %ch, align 4
  %112 = sext i32 %111 to i64
  %113 = call i16** @__ctype_b_loc() nounwind readnone
  %114 = load i16** %113, align 8
  %115 = getelementptr inbounds i16* %114, i64 %112
  %116 = load i16* %115, align 2
  %117 = zext i16 %116 to i32
  %118 = and i32 %117, 1
  %119 = icmp ne i32 %118, 0
  br label %120

; <label>:120                                     ; preds = %110, %107
  %121 = phi i1 [ false, %107 ], [ %119, %110 ]
  br i1 %121, label %105, label %122

; <label>:122                                     ; preds = %120
  %123 = load i32* %ch, align 4
  call void (...)* bitcast (void (i32)* @savchar to void (...)*)(i32 %123)
  store i32 1, i32* %1
  br label %129

; <label>:124                                     ; preds = %99
  %125 = load i32* %ch, align 4
  call void (...)* bitcast (void (i32)* @savchar to void (...)*)(i32 %125)
  br label %126

; <label>:126                                     ; preds = %124
  br label %127

; <label>:127                                     ; preds = %126
  br label %128

; <label>:128                                     ; preds = %127
  store i32 0, i32* %1
  br label %129

; <label>:129                                     ; preds = %128, %122, %97, %55
  %130 = load i32* %1
  ret i32 %130
}

define void @bad_prog(i8* %why) nounwind uwtable {
  %1 = alloca i8*, align 8
  store i8* %why, i8** %1, align 8
  %2 = load i32* @prog_line, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %0
  %5 = load %struct._IO_FILE** @stdout, align 8
  %6 = load i8** @myname, align 8
  %7 = load i8** @prog_name, align 8
  %8 = load i32* @prog_line, align 4
  %9 = load i8** %1, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([25 x i8]* @.str21, i32 0, i32 0), i8* %6, i8* %7, i32 %8, i8* %9)
  br label %16

; <label>:11                                      ; preds = %0
  %12 = load %struct._IO_FILE** @stdout, align 8
  %13 = load i8** @myname, align 8
  %14 = load i8** %1, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8]* @.str22, i32 0, i32 0), i8* %13, i8* %14)
  br label %16

; <label>:16                                      ; preds = %11, %4
  call void @exit(i32 1) noreturn nounwind
  unreachable
                                                  ; No predecessors!
  ret void
}

define i8* @init_buffer() nounwind uwtable {
  %b = alloca %struct.buffer*, align 8
  %1 = call i8* (...)* bitcast (i8* (i32)* @ck_malloc to i8* (...)*)(i32 16)
  %2 = bitcast i8* %1 to %struct.buffer*
  store %struct.buffer* %2, %struct.buffer** %b, align 8
  %3 = load %struct.buffer** %b, align 8
  %4 = getelementptr inbounds %struct.buffer* %3, i32 0, i32 0
  store i32 50, i32* %4, align 4
  %5 = call i8* (...)* bitcast (i8* (i32)* @ck_malloc to i8* (...)*)(i32 50)
  %6 = load %struct.buffer** %b, align 8
  %7 = getelementptr inbounds %struct.buffer* %6, i32 0, i32 2
  store i8* %5, i8** %7, align 8
  %8 = load %struct.buffer** %b, align 8
  %9 = getelementptr inbounds %struct.buffer* %8, i32 0, i32 1
  store i32 0, i32* %9, align 4
  %10 = load %struct.buffer** %b, align 8
  %11 = bitcast %struct.buffer* %10 to i8*
  ret i8* %11
}

define void @add1_buffer(i8* %bb, i32 %ch) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %b = alloca %struct.buffer*, align 8
  store i8* %bb, i8** %1, align 8
  store i32 %ch, i32* %2, align 4
  %3 = load i8** %1, align 8
  %4 = bitcast i8* %3 to %struct.buffer*
  store %struct.buffer* %4, %struct.buffer** %b, align 8
  %5 = load %struct.buffer** %b, align 8
  %6 = getelementptr inbounds %struct.buffer* %5, i32 0, i32 1
  %7 = load i32* %6, align 4
  %8 = add nsw i32 %7, 1
  %9 = load %struct.buffer** %b, align 8
  %10 = getelementptr inbounds %struct.buffer* %9, i32 0, i32 0
  %11 = load i32* %10, align 4
  %12 = icmp sgt i32 %8, %11
  br i1 %12, label %13, label %27

; <label>:13                                      ; preds = %0
  %14 = load %struct.buffer** %b, align 8
  %15 = getelementptr inbounds %struct.buffer* %14, i32 0, i32 0
  %16 = load i32* %15, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, i32* %15, align 4
  %18 = load %struct.buffer** %b, align 8
  %19 = getelementptr inbounds %struct.buffer* %18, i32 0, i32 2
  %20 = load i8** %19, align 8
  %21 = load %struct.buffer** %b, align 8
  %22 = getelementptr inbounds %struct.buffer* %21, i32 0, i32 0
  %23 = load i32* %22, align 4
  %24 = call i8* (...)* bitcast (i8* (i8*, i32)* @ck_realloc to i8* (...)*)(i8* %20, i32 %23)
  %25 = load %struct.buffer** %b, align 8
  %26 = getelementptr inbounds %struct.buffer* %25, i32 0, i32 2
  store i8* %24, i8** %26, align 8
  br label %27

; <label>:27                                      ; preds = %13, %0
  %28 = load i32* %2, align 4
  %29 = trunc i32 %28 to i8
  %30 = load %struct.buffer** %b, align 8
  %31 = getelementptr inbounds %struct.buffer* %30, i32 0, i32 1
  %32 = load i32* %31, align 4
  %33 = sext i32 %32 to i64
  %34 = load %struct.buffer** %b, align 8
  %35 = getelementptr inbounds %struct.buffer* %34, i32 0, i32 2
  %36 = load i8** %35, align 8
  %37 = getelementptr inbounds i8* %36, i64 %33
  store i8 %29, i8* %37, align 1
  %38 = load %struct.buffer** %b, align 8
  %39 = getelementptr inbounds %struct.buffer* %38, i32 0, i32 1
  %40 = load i32* %39, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %39, align 4
  ret void
}

define i32 @size_buffer(i8* %b) nounwind uwtable {
  %1 = alloca i8*, align 8
  %bb = alloca %struct.buffer*, align 8
  store i8* %b, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = bitcast i8* %2 to %struct.buffer*
  store %struct.buffer* %3, %struct.buffer** %bb, align 8
  %4 = load %struct.buffer** %bb, align 8
  %5 = getelementptr inbounds %struct.buffer* %4, i32 0, i32 1
  %6 = load i32* %5, align 4
  ret i32 %6
}

declare void @bcopy(i8*, i8*, i64) nounwind

define i8* @get_buffer(i8* %bb) nounwind uwtable {
  %1 = alloca i8*, align 8
  %b = alloca %struct.buffer*, align 8
  store i8* %bb, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = bitcast i8* %2 to %struct.buffer*
  store %struct.buffer* %3, %struct.buffer** %b, align 8
  %4 = load %struct.buffer** %b, align 8
  %5 = getelementptr inbounds %struct.buffer* %4, i32 0, i32 2
  %6 = load i8** %5, align 8
  ret i8* %6
}

define void @flush_buffer(i8* %bb) nounwind uwtable {
  %1 = alloca i8*, align 8
  %b = alloca %struct.buffer*, align 8
  store i8* %bb, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = bitcast i8* %2 to %struct.buffer*
  store %struct.buffer* %3, %struct.buffer** %b, align 8
  %4 = load %struct.buffer** %b, align 8
  %5 = getelementptr inbounds %struct.buffer* %4, i32 0, i32 2
  %6 = load i8** %5, align 8
  call void @free(i8* %6) nounwind
  %7 = load %struct.buffer** %b, align 8
  %8 = getelementptr inbounds %struct.buffer* %7, i32 0, i32 2
  store i8* null, i8** %8, align 8
  %9 = load %struct.buffer** %b, align 8
  %10 = getelementptr inbounds %struct.buffer* %9, i32 0, i32 0
  store i32 0, i32* %10, align 4
  %11 = load %struct.buffer** %b, align 8
  %12 = getelementptr inbounds %struct.buffer* %11, i32 0, i32 1
  store i32 0, i32* %12, align 4
  %13 = load %struct.buffer** %b, align 8
  %14 = bitcast %struct.buffer* %13 to i8*
  call void @free(i8* %14) nounwind
  ret void
}

define %struct.sed_label* @setup_jump(%struct.sed_label* %list, %struct.sed_cmd* %cmd, %struct.vector* %vec) nounwind uwtable {
  %1 = alloca %struct.sed_label*, align 8
  %2 = alloca %struct.sed_cmd*, align 8
  %3 = alloca %struct.vector*, align 8
  %tmp = alloca %struct.sed_label*, align 8
  %b = alloca i8*, align 8
  %ch = alloca i32, align 4
  store %struct.sed_label* %list, %struct.sed_label** %1, align 8
  store %struct.sed_cmd* %cmd, %struct.sed_cmd** %2, align 8
  store %struct.vector* %vec, %struct.vector** %3, align 8
  %4 = call i8* @init_buffer()
  store i8* %4, i8** %b, align 8
  br label %5

; <label>:5                                       ; preds = %20, %0
  %6 = call i32 @inchar()
  store i32 %6, i32* %ch, align 4
  %7 = icmp ne i32 %6, -1
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %5
  %9 = load i32* %ch, align 4
  %10 = sext i32 %9 to i64
  %11 = call i16** @__ctype_b_loc() nounwind readnone
  %12 = load i16** %11, align 8
  %13 = getelementptr inbounds i16* %12, i64 %10
  %14 = load i16* %13, align 2
  %15 = zext i16 %14 to i32
  %16 = and i32 %15, 1
  %17 = icmp ne i32 %16, 0
  br label %18

; <label>:18                                      ; preds = %8, %5
  %19 = phi i1 [ false, %5 ], [ %17, %8 ]
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %18
  br label %5

; <label>:21                                      ; preds = %18
  br label %22

; <label>:22                                      ; preds = %46, %21
  %23 = load i32* %ch, align 4
  %24 = icmp ne i32 %23, -1
  br i1 %24, label %25, label %44

; <label>:25                                      ; preds = %22
  %26 = load i32* %ch, align 4
  %27 = icmp ne i32 %26, 10
  br i1 %27, label %28, label %44

; <label>:28                                      ; preds = %25
  %29 = load i32* %ch, align 4
  %30 = sext i32 %29 to i64
  %31 = call i16** @__ctype_b_loc() nounwind readnone
  %32 = load i16** %31, align 8
  %33 = getelementptr inbounds i16* %32, i64 %30
  %34 = load i16* %33, align 2
  %35 = zext i16 %34 to i32
  %36 = and i32 %35, 1
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %44, label %38

; <label>:38                                      ; preds = %28
  %39 = load i32* %ch, align 4
  %40 = icmp ne i32 %39, 59
  br i1 %40, label %41, label %44

; <label>:41                                      ; preds = %38
  %42 = load i32* %ch, align 4
  %43 = icmp ne i32 %42, 125
  br label %44

; <label>:44                                      ; preds = %41, %38, %28, %25, %22
  %45 = phi i1 [ false, %38 ], [ false, %28 ], [ false, %25 ], [ false, %22 ], [ %43, %41 ]
  br i1 %45, label %46, label %50

; <label>:46                                      ; preds = %44
  %47 = load i8** %b, align 8
  %48 = load i32* %ch, align 4
  call void @add1_buffer(i8* %47, i32 %48)
  %49 = call i32 @inchar()
  store i32 %49, i32* %ch, align 4
  br label %22

; <label>:50                                      ; preds = %44
  %51 = load i32* %ch, align 4
  call void (...)* bitcast (void (i32)* @savchar to void (...)*)(i32 %51)
  %52 = load i8** %b, align 8
  call void @add1_buffer(i8* %52, i32 0)
  %53 = call i8* @ck_malloc(i32 32)
  %54 = bitcast i8* %53 to %struct.sed_label*
  store %struct.sed_label* %54, %struct.sed_label** %tmp, align 8
  %55 = load %struct.vector** %3, align 8
  %56 = load %struct.sed_label** %tmp, align 8
  %57 = getelementptr inbounds %struct.sed_label* %56, i32 0, i32 0
  store %struct.vector* %55, %struct.vector** %57, align 8
  %58 = load %struct.sed_cmd** %2, align 8
  %59 = load %struct.vector** %3, align 8
  %60 = getelementptr inbounds %struct.vector* %59, i32 0, i32 0
  %61 = load %struct.sed_cmd** %60, align 8
  %62 = ptrtoint %struct.sed_cmd* %58 to i64
  %63 = ptrtoint %struct.sed_cmd* %61 to i64
  %64 = sub i64 %62, %63
  %65 = sdiv exact i64 %64, 96
  %66 = trunc i64 %65 to i32
  %67 = load %struct.sed_label** %tmp, align 8
  %68 = getelementptr inbounds %struct.sed_label* %67, i32 0, i32 1
  store i32 %66, i32* %68, align 4
  %69 = load i8** %b, align 8
  %70 = call i8* @get_buffer(i8* %69)
  %71 = call i8* @ck_strdup(i8* %70)
  %72 = load %struct.sed_label** %tmp, align 8
  %73 = getelementptr inbounds %struct.sed_label* %72, i32 0, i32 2
  store i8* %71, i8** %73, align 8
  %74 = load %struct.sed_label** %1, align 8
  %75 = load %struct.sed_label** %tmp, align 8
  %76 = getelementptr inbounds %struct.sed_label* %75, i32 0, i32 3
  store %struct.sed_label* %74, %struct.sed_label** %76, align 8
  %77 = load i8** %b, align 8
  call void @flush_buffer(i8* %77)
  %78 = load %struct.sed_label** %tmp, align 8
  ret %struct.sed_label* %78
}

define %struct._IO_FILE* @compile_filename(i32 %readit) nounwind uwtable {
  %1 = alloca %struct._IO_FILE*, align 8
  %2 = alloca i32, align 4
  %file_name = alloca i8*, align 8
  %n = alloca i32, align 4
  %b = alloca i8*, align 8
  %ch = alloca i32, align 4
  store i32 %readit, i32* %2, align 4
  %3 = call i32 @inchar()
  %4 = icmp ne i32 %3, 32
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void (...)* bitcast (void (i8*)* @bad_prog to void (...)*)(i8* getelementptr inbounds ([28 x i8]* @.str23, i32 0, i32 0))
  br label %6

; <label>:6                                       ; preds = %5, %0
  %7 = call i8* @init_buffer()
  store i8* %7, i8** %b, align 8
  br label %8

; <label>:8                                       ; preds = %16, %6
  %9 = call i32 @inchar()
  store i32 %9, i32* %ch, align 4
  %10 = icmp ne i32 %9, -1
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %8
  %12 = load i32* %ch, align 4
  %13 = icmp ne i32 %12, 10
  br label %14

; <label>:14                                      ; preds = %11, %8
  %15 = phi i1 [ false, %8 ], [ %13, %11 ]
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %14
  %17 = load i8** %b, align 8
  %18 = load i32* %ch, align 4
  call void @add1_buffer(i8* %17, i32 %18)
  br label %8

; <label>:19                                      ; preds = %14
  %20 = load i8** %b, align 8
  call void @add1_buffer(i8* %20, i32 0)
  %21 = load i8** %b, align 8
  %22 = call i8* @get_buffer(i8* %21)
  store i8* %22, i8** %file_name, align 8
  store i32 0, i32* %n, align 4
  br label %23

; <label>:23                                      ; preds = %60, %19
  %24 = load i32* %n, align 4
  %25 = icmp slt i32 %24, 32
  br i1 %25, label %26, label %63

; <label>:26                                      ; preds = %23
  %27 = load i32* %n, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [32 x %struct.anon.1]* @file_ptrs, i32 0, i64 %28
  %30 = getelementptr inbounds %struct.anon.1* %29, i32 0, i32 1
  %31 = load i8** %30, align 8
  %32 = icmp ne i8* %31, null
  br i1 %32, label %34, label %33

; <label>:33                                      ; preds = %26
  br label %63

; <label>:34                                      ; preds = %26
  %35 = load i32* %n, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [32 x %struct.anon.1]* @file_ptrs, i32 0, i64 %36
  %38 = getelementptr inbounds %struct.anon.1* %37, i32 0, i32 1
  %39 = load i8** %38, align 8
  %40 = load i8** %file_name, align 8
  %41 = call i32 @strcmp(i8* %39, i8* %40) nounwind readonly
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %59, label %43

; <label>:43                                      ; preds = %34
  %44 = load i32* %n, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [32 x %struct.anon.1]* @file_ptrs, i32 0, i64 %45
  %47 = getelementptr inbounds %struct.anon.1* %46, i32 0, i32 2
  %48 = load i32* %47, align 4
  %49 = load i32* %2, align 4
  %50 = icmp ne i32 %48, %49
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %43
  call void (...)* bitcast (void (i8*)* @bad_prog to void (...)*)(i8* getelementptr inbounds ([45 x i8]* @.str24, i32 0, i32 0))
  br label %52

; <label>:52                                      ; preds = %51, %43
  %53 = load i8** %b, align 8
  call void @flush_buffer(i8* %53)
  %54 = load i32* %n, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [32 x %struct.anon.1]* @file_ptrs, i32 0, i64 %55
  %57 = getelementptr inbounds %struct.anon.1* %56, i32 0, i32 0
  %58 = load %struct._IO_FILE** %57, align 8
  store %struct._IO_FILE* %58, %struct._IO_FILE** %1
  br label %102

; <label>:59                                      ; preds = %34
  br label %60

; <label>:60                                      ; preds = %59
  %61 = load i32* %n, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %n, align 4
  br label %23

; <label>:63                                      ; preds = %33, %23
  %64 = load i32* %n, align 4
  %65 = icmp slt i32 %64, 32
  br i1 %65, label %66, label %101

; <label>:66                                      ; preds = %63
  %67 = load i8** %file_name, align 8
  %68 = call i8* @ck_strdup(i8* %67)
  %69 = load i32* %n, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [32 x %struct.anon.1]* @file_ptrs, i32 0, i64 %70
  %72 = getelementptr inbounds %struct.anon.1* %71, i32 0, i32 1
  store i8* %68, i8** %72, align 8
  %73 = load i32* %2, align 4
  %74 = load i32* %n, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [32 x %struct.anon.1]* @file_ptrs, i32 0, i64 %75
  %77 = getelementptr inbounds %struct.anon.1* %76, i32 0, i32 2
  store i32 %73, i32* %77, align 4
  %78 = load i32* %2, align 4
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %87, label %80

; <label>:80                                      ; preds = %66
  %81 = load i8** %file_name, align 8
  %82 = call %struct._IO_FILE* @ck_fopen(i8* %81, i8* getelementptr inbounds ([2 x i8]* @.str25, i32 0, i32 0))
  %83 = load i32* %n, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [32 x %struct.anon.1]* @file_ptrs, i32 0, i64 %84
  %86 = getelementptr inbounds %struct.anon.1* %85, i32 0, i32 0
  store %struct._IO_FILE* %82, %struct._IO_FILE** %86, align 8
  br label %94

; <label>:87                                      ; preds = %66
  %88 = load i8** %file_name, align 8
  %89 = call %struct._IO_FILE* @ck_fopen(i8* %88, i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0))
  %90 = load i32* %n, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [32 x %struct.anon.1]* @file_ptrs, i32 0, i64 %91
  %93 = getelementptr inbounds %struct.anon.1* %92, i32 0, i32 0
  store %struct._IO_FILE* %89, %struct._IO_FILE** %93, align 8
  br label %94

; <label>:94                                      ; preds = %87, %80
  %95 = load i8** %b, align 8
  call void @flush_buffer(i8* %95)
  %96 = load i32* %n, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [32 x %struct.anon.1]* @file_ptrs, i32 0, i64 %97
  %99 = getelementptr inbounds %struct.anon.1* %98, i32 0, i32 0
  %100 = load %struct._IO_FILE** %99, align 8
  store %struct._IO_FILE* %100, %struct._IO_FILE** %1
  br label %102

; <label>:101                                     ; preds = %63
  call void (...)* bitcast (void (i8*)* @bad_prog to void (...)*)(i8* getelementptr inbounds ([76 x i8]* @.str26, i32 0, i32 0))
  store %struct._IO_FILE* null, %struct._IO_FILE** %1
  br label %102

; <label>:102                                     ; preds = %101, %94, %52
  %103 = load %struct._IO_FILE** %1
  ret %struct._IO_FILE* %103
}

define void @compile_regex(i32 %slash) nounwind uwtable {
  %1 = alloca i32, align 4
  %b = alloca i8*, align 8
  %ch = alloca i32, align 4
  %char_class_pos = alloca i32, align 4
  %regexp = alloca i8*, align 8
  %pos = alloca i32, align 4
  store i32 %slash, i32* %1, align 4
  store i32 -1, i32* %char_class_pos, align 4
  %2 = call i8* @init_buffer()
  store i8* %2, i8** %b, align 8
  br label %3

; <label>:3                                       ; preds = %115, %98, %91, %55, %45, %30, %0
  %4 = call i32 @inchar()
  store i32 %4, i32* %ch, align 4
  %5 = icmp ne i32 %4, -1
  br i1 %5, label %6, label %15

; <label>:6                                       ; preds = %3
  %7 = load i32* %ch, align 4
  %8 = load i32* %1, align 4
  %9 = icmp ne i32 %7, %8
  br i1 %9, label %13, label %10

; <label>:10                                      ; preds = %6
  %11 = load i32* %char_class_pos, align 4
  %12 = icmp sge i32 %11, 0
  br label %13

; <label>:13                                      ; preds = %10, %6
  %14 = phi i1 [ true, %6 ], [ %12, %10 ]
  br label %15

; <label>:15                                      ; preds = %13, %3
  %16 = phi i1 [ false, %3 ], [ %14, %13 ]
  br i1 %16, label %17, label %116

; <label>:17                                      ; preds = %15
  %18 = load i32* %ch, align 4
  %19 = icmp eq i32 %18, 94
  br i1 %19, label %20, label %31

; <label>:20                                      ; preds = %17
  %21 = load i8** %b, align 8
  %22 = call i32 @size_buffer(i8* %21)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %27

; <label>:24                                      ; preds = %20
  %25 = load i8** %b, align 8
  call void @add1_buffer(i8* %25, i32 92)
  %26 = load i8** %b, align 8
  call void @add1_buffer(i8* %26, i32 96)
  br label %30

; <label>:27                                      ; preds = %20
  %28 = load i8** %b, align 8
  %29 = load i32* %ch, align 4
  call void @add1_buffer(i8* %28, i32 %29)
  br label %30

; <label>:30                                      ; preds = %27, %24
  br label %3

; <label>:31                                      ; preds = %17
  %32 = load i32* %ch, align 4
  %33 = icmp eq i32 %32, 36
  br i1 %33, label %34, label %46

; <label>:34                                      ; preds = %31
  %35 = call i32 @inchar()
  store i32 %35, i32* %ch, align 4
  %36 = load i32* %ch, align 4
  call void (...)* bitcast (void (i32)* @savchar to void (...)*)(i32 %36)
  %37 = load i32* %ch, align 4
  %38 = load i32* %1, align 4
  %39 = icmp eq i32 %37, %38
  br i1 %39, label %40, label %43

; <label>:40                                      ; preds = %34
  %41 = load i8** %b, align 8
  call void @add1_buffer(i8* %41, i32 92)
  %42 = load i8** %b, align 8
  call void @add1_buffer(i8* %42, i32 39)
  br label %45

; <label>:43                                      ; preds = %34
  %44 = load i8** %b, align 8
  call void @add1_buffer(i8* %44, i32 36)
  br label %45

; <label>:45                                      ; preds = %43, %40
  br label %3

; <label>:46                                      ; preds = %31
  %47 = load i32* %ch, align 4
  %48 = icmp eq i32 %47, 91
  br i1 %48, label %49, label %58

; <label>:49                                      ; preds = %46
  %50 = load i32* %char_class_pos, align 4
  %51 = icmp slt i32 %50, 0
  br i1 %51, label %52, label %55

; <label>:52                                      ; preds = %49
  %53 = load i8** %b, align 8
  %54 = call i32 @size_buffer(i8* %53)
  store i32 %54, i32* %char_class_pos, align 4
  br label %55

; <label>:55                                      ; preds = %52, %49
  %56 = load i8** %b, align 8
  %57 = load i32* %ch, align 4
  call void @add1_buffer(i8* %56, i32 %57)
  br label %3

; <label>:58                                      ; preds = %46
  %59 = load i32* %ch, align 4
  %60 = icmp eq i32 %59, 93
  br i1 %60, label %61, label %92

; <label>:61                                      ; preds = %58
  %62 = load i8** %b, align 8
  %63 = load i32* %ch, align 4
  call void @add1_buffer(i8* %62, i32 %63)
  %64 = load i8** %b, align 8
  %65 = call i8* @get_buffer(i8* %64)
  store i8* %65, i8** %regexp, align 8
  %66 = load i8** %b, align 8
  %67 = call i32 @size_buffer(i8* %66)
  %68 = sub nsw i32 %67, 1
  store i32 %68, i32* %pos, align 4
  %69 = load i32* %char_class_pos, align 4
  %70 = icmp sge i32 %69, 0
  br i1 %70, label %71, label %90

; <label>:71                                      ; preds = %61
  %72 = load i32* %pos, align 4
  %73 = load i32* %char_class_pos, align 4
  %74 = add nsw i32 %73, 1
  %75 = icmp eq i32 %72, %74
  br i1 %75, label %91, label %76

; <label>:76                                      ; preds = %71
  %77 = load i32* %pos, align 4
  %78 = load i32* %char_class_pos, align 4
  %79 = add nsw i32 %78, 2
  %80 = icmp eq i32 %77, %79
  br i1 %80, label %81, label %90

; <label>:81                                      ; preds = %76
  %82 = load i32* %char_class_pos, align 4
  %83 = add nsw i32 %82, 1
  %84 = sext i32 %83 to i64
  %85 = load i8** %regexp, align 8
  %86 = getelementptr inbounds i8* %85, i64 %84
  %87 = load i8* %86, align 1
  %88 = sext i8 %87 to i32
  %89 = icmp eq i32 %88, 94
  br i1 %89, label %91, label %90

; <label>:90                                      ; preds = %81, %76, %61
  store i32 -1, i32* %char_class_pos, align 4
  br label %91

; <label>:91                                      ; preds = %90, %81, %71
  br label %3

; <label>:92                                      ; preds = %58
  %93 = load i32* %ch, align 4
  %94 = icmp ne i32 %93, 92
  br i1 %94, label %98, label %95

; <label>:95                                      ; preds = %92
  %96 = load i32* %char_class_pos, align 4
  %97 = icmp sge i32 %96, 0
  br i1 %97, label %98, label %101

; <label>:98                                      ; preds = %95, %92
  %99 = load i8** %b, align 8
  %100 = load i32* %ch, align 4
  call void @add1_buffer(i8* %99, i32 %100)
  br label %3

; <label>:101                                     ; preds = %95
  br label %102

; <label>:102                                     ; preds = %101
  br label %103

; <label>:103                                     ; preds = %102
  br label %104

; <label>:104                                     ; preds = %103
  br label %105

; <label>:105                                     ; preds = %104
  %106 = call i32 @inchar()
  store i32 %106, i32* %ch, align 4
  %107 = load i32* %ch, align 4
  switch i32 %107, label %111 [
    i32 110, label %108
    i32 -1, label %110
  ]

; <label>:108                                     ; preds = %105
  %109 = load i8** %b, align 8
  call void @add1_buffer(i8* %109, i32 10)
  br label %115

; <label>:110                                     ; preds = %105
  br label %115

; <label>:111                                     ; preds = %105
  %112 = load i8** %b, align 8
  call void @add1_buffer(i8* %112, i32 92)
  %113 = load i8** %b, align 8
  %114 = load i32* %ch, align 4
  call void @add1_buffer(i8* %113, i32 %114)
  br label %115

; <label>:115                                     ; preds = %111, %110, %108
  br label %3

; <label>:116                                     ; preds = %15
  %117 = load i32* %ch, align 4
  %118 = icmp eq i32 %117, -1
  br i1 %118, label %119, label %120

; <label>:119                                     ; preds = %116
  call void (...)* bitcast (void (i8*)* @bad_prog to void (...)*)(i8* getelementptr inbounds ([23 x i8]* @BAD_EOF, i32 0, i32 0))
  br label %120

; <label>:120                                     ; preds = %119, %116
  %121 = load i8** %b, align 8
  %122 = call i32 @size_buffer(i8* %121)
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %151

; <label>:124                                     ; preds = %120
  %125 = call i8* @ck_malloc(i32 64)
  %126 = bitcast i8* %125 to %struct.re_pattern_buffer*
  store %struct.re_pattern_buffer* %126, %struct.re_pattern_buffer** @last_regex, align 8
  %127 = load i8** %b, align 8
  %128 = call i32 @size_buffer(i8* %127)
  %129 = add nsw i32 %128, 10
  %130 = sext i32 %129 to i64
  %131 = load %struct.re_pattern_buffer** @last_regex, align 8
  %132 = getelementptr inbounds %struct.re_pattern_buffer* %131, i32 0, i32 1
  store i64 %130, i64* %132, align 8
  %133 = load %struct.re_pattern_buffer** @last_regex, align 8
  %134 = getelementptr inbounds %struct.re_pattern_buffer* %133, i32 0, i32 1
  %135 = load i64* %134, align 8
  %136 = trunc i64 %135 to i32
  %137 = call i8* @ck_malloc(i32 %136)
  %138 = load %struct.re_pattern_buffer** @last_regex, align 8
  %139 = getelementptr inbounds %struct.re_pattern_buffer* %138, i32 0, i32 0
  store i8* %137, i8** %139, align 8
  %140 = call i8* @ck_malloc(i32 256)
  %141 = load %struct.re_pattern_buffer** @last_regex, align 8
  %142 = getelementptr inbounds %struct.re_pattern_buffer* %141, i32 0, i32 4
  store i8* %140, i8** %142, align 8
  %143 = load %struct.re_pattern_buffer** @last_regex, align 8
  %144 = getelementptr inbounds %struct.re_pattern_buffer* %143, i32 0, i32 5
  store i8* null, i8** %144, align 8
  %145 = load i8** %b, align 8
  %146 = call i8* @get_buffer(i8* %145)
  %147 = load i8** %b, align 8
  %148 = call i32 @size_buffer(i8* %147)
  %149 = load %struct.re_pattern_buffer** @last_regex, align 8
  %150 = call i8* @re_compile_pattern(i8* %146, i32 %148, %struct.re_pattern_buffer* %149)
  br label %156

; <label>:151                                     ; preds = %120
  %152 = load %struct.re_pattern_buffer** @last_regex, align 8
  %153 = icmp ne %struct.re_pattern_buffer* %152, null
  br i1 %153, label %155, label %154

; <label>:154                                     ; preds = %151
  call void (...)* bitcast (void (i8*)* @bad_prog to void (...)*)(i8* getelementptr inbounds ([31 x i8]* @NO_REGEX, i32 0, i32 0))
  br label %155

; <label>:155                                     ; preds = %154, %151
  br label %156

; <label>:156                                     ; preds = %155, %124
  %157 = load i8** %b, align 8
  call void @flush_buffer(i8* %157)
  ret void
}

declare i32 @feof(%struct._IO_FILE*) nounwind

define i8* @re_compile_pattern(i8* %pattern, i32 %length, %struct.re_pattern_buffer* %bufp) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca %struct.re_pattern_buffer*, align 8
  %ret = alloca i32, align 4
  store i8* %pattern, i8** %1, align 8
  store i32 %length, i32* %2, align 4
  store %struct.re_pattern_buffer* %bufp, %struct.re_pattern_buffer** %3, align 8
  %4 = load %struct.re_pattern_buffer** %3, align 8
  %5 = bitcast %struct.re_pattern_buffer* %4 to i8*
  %6 = getelementptr i8* %5, i32 56
  %7 = bitcast i8* %6 to i32*
  %8 = load i32* %7, align 8
  %9 = and i32 %8, -7
  store i32 %9, i32* %7, align 8
  %10 = load %struct.re_pattern_buffer** %3, align 8
  %11 = bitcast %struct.re_pattern_buffer* %10 to i8*
  %12 = getelementptr i8* %11, i32 56
  %13 = bitcast i8* %12 to i32*
  %14 = load i32* %13, align 8
  %15 = and i32 %14, -17
  store i32 %15, i32* %13, align 8
  %16 = load %struct.re_pattern_buffer** %3, align 8
  %17 = bitcast %struct.re_pattern_buffer* %16 to i8*
  %18 = getelementptr i8* %17, i32 56
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 8
  %21 = and i32 %20, -129
  %22 = or i32 %21, 128
  store i32 %22, i32* %19, align 8
  %23 = load i8** %1, align 8
  %24 = load i32* %2, align 4
  %25 = load i32* @re_syntax_options, align 4
  %26 = load %struct.re_pattern_buffer** %3, align 8
  %27 = call i32 (...)* bitcast (i32 (i8*, i32, i32, %struct.re_pattern_buffer*)* @regex_compile to i32 (...)*)(i8* %23, i32 %24, i32 %25, %struct.re_pattern_buffer* %26)
  store i32 %27, i32* %ret, align 4
  %28 = load i32* %ret, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [17 x i8*]* @re_error_msg, i32 0, i64 %29
  %31 = load i8** %30, align 8
  ret i8* %31
}

define i8* @ck_strdup(i8* %str) nounwind uwtable {
  %1 = alloca i8*, align 8
  %ret = alloca i8*, align 8
  store i8* %str, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = call i64 @strlen(i8* %2) nounwind readonly
  %4 = add i64 %3, 2
  %5 = trunc i64 %4 to i32
  %6 = call i8* (...)* bitcast (i8* (i32)* @ck_malloc to i8* (...)*)(i32 %5)
  store i8* %6, i8** %ret, align 8
  %7 = load i8** %ret, align 8
  %8 = load i8** %1, align 8
  %9 = call i8* @strcpy(i8* %7, i8* %8) nounwind
  %10 = load i8** %ret, align 8
  ret i8* %10
}

declare %struct._IO_FILE* @fopen(i8*, i8*)

declare i8* @strerror(i32) nounwind

declare i32* @__errno_location() nounwind readnone

define i32 @read_pattern_space() nounwind uwtable {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %p = alloca i8*, align 8
  %ch = alloca i32, align 4
  %2 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  store i8* %2, i8** %p, align 8
  %3 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  store i32 %3, i32* %n, align 4
  %4 = load %struct._IO_FILE** @input_file, align 8
  %5 = call i32 @feof(%struct._IO_FILE* %4) nounwind
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 0, i32* %1
  br label %77

; <label>:8                                       ; preds = %0
  %9 = load i32* @input_line_number, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* @input_line_number, align 4
  store i32 0, i32* @replaced, align 4
  br label %11

; <label>:11                                      ; preds = %59, %8
  %12 = load i32* %n, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %26

; <label>:14                                      ; preds = %11
  %15 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %16 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %17 = mul nsw i32 %16, 2
  %18 = call i8* @ck_realloc(i8* %15, i32 %17)
  store i8* %18, i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %19 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %20 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8* %19, i64 %21
  store i8* %22, i8** %p, align 8
  %23 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  store i32 %23, i32* %n, align 4
  %24 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %25 = mul nsw i32 %24, 2
  store i32 %25, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  br label %26

; <label>:26                                      ; preds = %14, %11
  %27 = load %struct._IO_FILE** @input_file, align 8
  %28 = call i32 @_IO_getc(%struct._IO_FILE* %27)
  store i32 %28, i32* %ch, align 4
  %29 = load i32* %ch, align 4
  %30 = icmp eq i32 %29, -1
  br i1 %30, label %31, label %46

; <label>:31                                      ; preds = %26
  %32 = load i32* %n, align 4
  %33 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %34 = icmp eq i32 %32, %33
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %31
  store i32 0, i32* %1
  br label %77

; <label>:36                                      ; preds = %31
  %37 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %38 = load i32* %n, align 4
  %39 = sub nsw i32 %37, %38
  store i32 %39, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %40 = load i32* @last_input_file, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %45

; <label>:42                                      ; preds = %36
  %43 = load i32* @input_EOF, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* @input_EOF, align 4
  br label %45

; <label>:45                                      ; preds = %42, %36
  store i32 1, i32* %1
  br label %77

; <label>:46                                      ; preds = %26
  %47 = load i32* %ch, align 4
  %48 = trunc i32 %47 to i8
  %49 = load i8** %p, align 8
  %50 = getelementptr inbounds i8* %49, i32 1
  store i8* %50, i8** %p, align 8
  store i8 %48, i8* %49, align 1
  %51 = load i32* %n, align 4
  %52 = add nsw i32 %51, -1
  store i32 %52, i32* %n, align 4
  %53 = load i32* %ch, align 4
  %54 = icmp eq i32 %53, 10
  br i1 %54, label %55, label %59

; <label>:55                                      ; preds = %46
  %56 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %57 = load i32* %n, align 4
  %58 = sub nsw i32 %56, %57
  store i32 %58, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  br label %60

; <label>:59                                      ; preds = %46
  br label %11

; <label>:60                                      ; preds = %55
  %61 = load %struct._IO_FILE** @input_file, align 8
  %62 = call i32 @_IO_getc(%struct._IO_FILE* %61)
  store i32 %62, i32* %ch, align 4
  %63 = load i32* %ch, align 4
  %64 = icmp ne i32 %63, -1
  br i1 %64, label %65, label %69

; <label>:65                                      ; preds = %60
  %66 = load i32* %ch, align 4
  %67 = load %struct._IO_FILE** @input_file, align 8
  %68 = call i32 @ungetc(i32 %66, %struct._IO_FILE* %67)
  br label %76

; <label>:69                                      ; preds = %60
  %70 = load i32* @last_input_file, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %75

; <label>:72                                      ; preds = %69
  %73 = load i32* @input_EOF, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* @input_EOF, align 4
  br label %75

; <label>:75                                      ; preds = %72, %69
  br label %76

; <label>:76                                      ; preds = %75, %65
  store i32 1, i32* %1
  br label %77

; <label>:77                                      ; preds = %76, %45, %35, %7
  %78 = load i32* %1
  ret i32 %78
}

define void @execute_program(%struct.vector* %vec) nounwind uwtable {
  %1 = alloca %struct.vector*, align 8
  %cur_cmd = alloca %struct.sed_cmd*, align 8
  %n = alloca i32, align 4
  %addr_matched = alloca i32, align 4
  %start = alloca i32, align 4
  %remain = alloca i32, align 4
  %offset = alloca i32, align 4
  %t = alloca %struct.line, align 8
  %rep = alloca i8*, align 8
  %rep_end = alloca i8*, align 8
  %rep_next = alloca i8*, align 8
  %rep_cur = alloca i8*, align 8
  %count = alloca i32, align 4
  %restart_vec = alloca %struct.vector*, align 8
  %j = alloca %struct.sed_label*, align 8
  %tmp = alloca i8*, align 8
  %newlength = alloca i32, align 4
  %tmp1 = alloca i8*, align 8
  %n2 = alloca i32, align 4
  %width = alloca i32, align 4
  %tmp3 = alloca i8*, align 8
  %n4 = alloca i32, align 4
  %trail_nl_p = alloca i32, align 4
  %matched = alloca i32, align 4
  %n5 = alloca i32, align 4
  %j6 = alloca %struct.sed_label*, align 8
  %tmp7 = alloca %struct.line, align 8
  %p = alloca i8*, align 8
  %e = alloca i8*, align 8
  store %struct.vector* %vec, %struct.vector** %1, align 8
  %2 = load %struct.vector** %1, align 8
  store %struct.vector* %2, %struct.vector** %restart_vec, align 8
  br label %3

; <label>:3                                       ; preds = %243, %0
  %4 = load %struct.vector** %restart_vec, align 8
  store %struct.vector* %4, %struct.vector** %1, align 8
  store i32 0, i32* %count, align 4
  store i32 0, i32* @execute_program.end_cycle, align 4
  %5 = load %struct.vector** %1, align 8
  %6 = getelementptr inbounds %struct.vector* %5, i32 0, i32 0
  %7 = load %struct.sed_cmd** %6, align 8
  store %struct.sed_cmd* %7, %struct.sed_cmd** %cur_cmd, align 8
  %8 = load %struct.vector** %1, align 8
  %9 = getelementptr inbounds %struct.vector* %8, i32 0, i32 1
  %10 = load i32* %9, align 4
  store i32 %10, i32* %n, align 4
  br label %11

; <label>:11                                      ; preds = %899, %3
  %12 = load i32* %n, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %904

; <label>:14                                      ; preds = %11
  br label %15

; <label>:15                                      ; preds = %821, %178, %90, %14
  store i32 0, i32* %addr_matched, align 4
  %16 = load %struct.sed_cmd** %cur_cmd, align 8
  %17 = getelementptr inbounds %struct.sed_cmd* %16, i32 0, i32 2
  %18 = load i32* %17, align 4
  %19 = and i32 %18, 1
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %32

; <label>:21                                      ; preds = %15
  store i32 1, i32* %addr_matched, align 4
  %22 = load %struct.sed_cmd** %cur_cmd, align 8
  %23 = getelementptr inbounds %struct.sed_cmd* %22, i32 0, i32 1
  %24 = call i32 @match_address(%struct.addr* %23)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %31

; <label>:26                                      ; preds = %21
  %27 = load %struct.sed_cmd** %cur_cmd, align 8
  %28 = getelementptr inbounds %struct.sed_cmd* %27, i32 0, i32 2
  %29 = load i32* %28, align 4
  %30 = and i32 %29, -2
  store i32 %30, i32* %28, align 4
  br label %31

; <label>:31                                      ; preds = %26, %21
  br label %62

; <label>:32                                      ; preds = %15
  %33 = load %struct.sed_cmd** %cur_cmd, align 8
  %34 = getelementptr inbounds %struct.sed_cmd* %33, i32 0, i32 0
  %35 = call i32 @match_address(%struct.addr* %34)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %61

; <label>:37                                      ; preds = %32
  store i32 1, i32* %addr_matched, align 4
  %38 = load %struct.sed_cmd** %cur_cmd, align 8
  %39 = getelementptr inbounds %struct.sed_cmd* %38, i32 0, i32 1
  %40 = getelementptr inbounds %struct.addr* %39, i32 0, i32 0
  %41 = load i32* %40, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %60

; <label>:43                                      ; preds = %37
  %44 = load %struct.sed_cmd** %cur_cmd, align 8
  %45 = getelementptr inbounds %struct.sed_cmd* %44, i32 0, i32 1
  %46 = getelementptr inbounds %struct.addr* %45, i32 0, i32 0
  %47 = load i32* %46, align 4
  %48 = icmp eq i32 %47, 2
  br i1 %48, label %54, label %49

; <label>:49                                      ; preds = %43
  %50 = load %struct.sed_cmd** %cur_cmd, align 8
  %51 = getelementptr inbounds %struct.sed_cmd* %50, i32 0, i32 1
  %52 = call i32 @match_address(%struct.addr* %51)
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %59, label %54

; <label>:54                                      ; preds = %49, %43
  %55 = load %struct.sed_cmd** %cur_cmd, align 8
  %56 = getelementptr inbounds %struct.sed_cmd* %55, i32 0, i32 2
  %57 = load i32* %56, align 4
  %58 = or i32 %57, 1
  store i32 %58, i32* %56, align 4
  br label %59

; <label>:59                                      ; preds = %54, %49
  br label %60

; <label>:60                                      ; preds = %59, %37
  br label %61

; <label>:61                                      ; preds = %60, %32
  br label %62

; <label>:62                                      ; preds = %61, %31
  %63 = load %struct.sed_cmd** %cur_cmd, align 8
  %64 = getelementptr inbounds %struct.sed_cmd* %63, i32 0, i32 2
  %65 = load i32* %64, align 4
  %66 = and i32 %65, 2
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %73

; <label>:68                                      ; preds = %62
  %69 = load i32* %addr_matched, align 4
  %70 = icmp ne i32 %69, 0
  %71 = xor i1 %70, true
  %72 = zext i1 %71 to i32
  store i32 %72, i32* %addr_matched, align 4
  br label %73

; <label>:73                                      ; preds = %68, %62
  %74 = load i32* %addr_matched, align 4
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %77, label %76

; <label>:76                                      ; preds = %73
  br label %899

; <label>:77                                      ; preds = %73
  %78 = load %struct.sed_cmd** %cur_cmd, align 8
  %79 = getelementptr inbounds %struct.sed_cmd* %78, i32 0, i32 3
  %80 = load i8* %79, align 1
  %81 = sext i8 %80 to i32
  switch i32 %81, label %889 [
    i32 123, label %82
    i32 125, label %102
    i32 58, label %125
    i32 61, label %126
    i32 97, label %129
    i32 98, label %169
    i32 99, label %203
    i32 100, label %224
    i32 68, label %227
    i32 103, label %252
    i32 71, label %253
    i32 104, label %254
    i32 72, label %255
    i32 105, label %256
    i32 108, label %268
    i32 110, label %364
    i32 78, label %378
    i32 112, label %384
    i32 80, label %388
    i32 113, label %409
    i32 114, label %415
    i32 115, label %467
    i32 116, label %809
    i32 119, label %847
    i32 120, label %861
    i32 121, label %864
  ]

; <label>:82                                      ; preds = %77
  %83 = load %struct.sed_cmd** %cur_cmd, align 8
  %84 = getelementptr inbounds %struct.sed_cmd* %83, i32 0, i32 4
  %85 = bitcast %union.anon* %84 to %struct.vector**
  %86 = load %struct.vector** %85, align 8
  %87 = getelementptr inbounds %struct.vector* %86, i32 0, i32 1
  %88 = load i32* %87, align 4
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %90, label %101

; <label>:90                                      ; preds = %82
  %91 = load %struct.sed_cmd** %cur_cmd, align 8
  %92 = getelementptr inbounds %struct.sed_cmd* %91, i32 0, i32 4
  %93 = bitcast %union.anon* %92 to %struct.vector**
  %94 = load %struct.vector** %93, align 8
  store %struct.vector* %94, %struct.vector** %1, align 8
  %95 = load %struct.vector** %1, align 8
  %96 = getelementptr inbounds %struct.vector* %95, i32 0, i32 0
  %97 = load %struct.sed_cmd** %96, align 8
  store %struct.sed_cmd* %97, %struct.sed_cmd** %cur_cmd, align 8
  %98 = load %struct.vector** %1, align 8
  %99 = getelementptr inbounds %struct.vector* %98, i32 0, i32 1
  %100 = load i32* %99, align 4
  store i32 %100, i32* %n, align 4
  br label %15

; <label>:101                                     ; preds = %82
  br label %894

; <label>:102                                     ; preds = %77
  %103 = load %struct.vector** %1, align 8
  %104 = getelementptr inbounds %struct.vector* %103, i32 0, i32 3
  %105 = load %struct.vector** %104, align 8
  %106 = getelementptr inbounds %struct.vector* %105, i32 0, i32 0
  %107 = load %struct.sed_cmd** %106, align 8
  %108 = load %struct.vector** %1, align 8
  %109 = getelementptr inbounds %struct.vector* %108, i32 0, i32 4
  %110 = load i32* %109, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds %struct.sed_cmd* %107, i64 %111
  store %struct.sed_cmd* %112, %struct.sed_cmd** %cur_cmd, align 8
  %113 = load %struct.vector** %1, align 8
  %114 = getelementptr inbounds %struct.vector* %113, i32 0, i32 3
  %115 = load %struct.vector** %114, align 8
  %116 = getelementptr inbounds %struct.vector* %115, i32 0, i32 1
  %117 = load i32* %116, align 4
  %118 = load %struct.vector** %1, align 8
  %119 = getelementptr inbounds %struct.vector* %118, i32 0, i32 4
  %120 = load i32* %119, align 4
  %121 = sub nsw i32 %117, %120
  store i32 %121, i32* %n, align 4
  %122 = load %struct.vector** %1, align 8
  %123 = getelementptr inbounds %struct.vector* %122, i32 0, i32 3
  %124 = load %struct.vector** %123, align 8
  store %struct.vector* %124, %struct.vector** %1, align 8
  br label %894

; <label>:125                                     ; preds = %77
  br label %894

; <label>:126                                     ; preds = %77
  %127 = load i32* @input_line_number, align 4
  %128 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str28, i32 0, i32 0), i32 %127)
  br label %894

; <label>:129                                     ; preds = %77
  br label %130

; <label>:130                                     ; preds = %140, %129
  %131 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 2), align 4
  %132 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  %133 = sub nsw i32 %131, %132
  %134 = load %struct.sed_cmd** %cur_cmd, align 8
  %135 = getelementptr inbounds %struct.sed_cmd* %134, i32 0, i32 4
  %136 = bitcast %union.anon* %135 to %struct.anon*
  %137 = getelementptr inbounds %struct.anon* %136, i32 0, i32 1
  %138 = load i32* %137, align 4
  %139 = icmp slt i32 %133, %138
  br i1 %139, label %140, label %146

; <label>:140                                     ; preds = %130
  %141 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 2), align 4
  %142 = mul nsw i32 %141, 2
  store i32 %142, i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 2), align 4
  %143 = load i8** getelementptr inbounds (%struct.line* @append, i32 0, i32 0), align 8
  %144 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 2), align 4
  %145 = call i8* @ck_realloc(i8* %143, i32 %144)
  store i8* %145, i8** getelementptr inbounds (%struct.line* @append, i32 0, i32 0), align 8
  br label %130

; <label>:146                                     ; preds = %130
  %147 = load %struct.sed_cmd** %cur_cmd, align 8
  %148 = getelementptr inbounds %struct.sed_cmd* %147, i32 0, i32 4
  %149 = bitcast %union.anon* %148 to %struct.anon*
  %150 = getelementptr inbounds %struct.anon* %149, i32 0, i32 0
  %151 = load i8** %150, align 8
  %152 = load i8** getelementptr inbounds (%struct.line* @append, i32 0, i32 0), align 8
  %153 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds i8* %152, i64 %154
  %156 = load %struct.sed_cmd** %cur_cmd, align 8
  %157 = getelementptr inbounds %struct.sed_cmd* %156, i32 0, i32 4
  %158 = bitcast %union.anon* %157 to %struct.anon*
  %159 = getelementptr inbounds %struct.anon* %158, i32 0, i32 1
  %160 = load i32* %159, align 4
  %161 = sext i32 %160 to i64
  call void @bcopy(i8* %151, i8* %155, i64 %161) nounwind
  %162 = load %struct.sed_cmd** %cur_cmd, align 8
  %163 = getelementptr inbounds %struct.sed_cmd* %162, i32 0, i32 4
  %164 = bitcast %union.anon* %163 to %struct.anon*
  %165 = getelementptr inbounds %struct.anon* %164, i32 0, i32 1
  %166 = load i32* %165, align 4
  %167 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  %168 = add nsw i32 %167, %166
  store i32 %168, i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  br label %894

; <label>:169                                     ; preds = %77
  %170 = load %struct.sed_cmd** %cur_cmd, align 8
  %171 = getelementptr inbounds %struct.sed_cmd* %170, i32 0, i32 4
  %172 = bitcast %union.anon* %171 to %struct.sed_label**
  %173 = load %struct.sed_label** %172, align 8
  %174 = icmp ne %struct.sed_label* %173, null
  br i1 %174, label %178, label %175

; <label>:175                                     ; preds = %169
  %176 = load i32* @execute_program.end_cycle, align 4
  %177 = add nsw i32 %176, 1
  store i32 %177, i32* @execute_program.end_cycle, align 4
  br label %202

; <label>:178                                     ; preds = %169
  %179 = load %struct.sed_cmd** %cur_cmd, align 8
  %180 = getelementptr inbounds %struct.sed_cmd* %179, i32 0, i32 4
  %181 = bitcast %union.anon* %180 to %struct.sed_label**
  %182 = load %struct.sed_label** %181, align 8
  store %struct.sed_label* %182, %struct.sed_label** %j, align 8
  %183 = load %struct.sed_label** %j, align 8
  %184 = getelementptr inbounds %struct.sed_label* %183, i32 0, i32 0
  %185 = load %struct.vector** %184, align 8
  %186 = getelementptr inbounds %struct.vector* %185, i32 0, i32 1
  %187 = load i32* %186, align 4
  %188 = load %struct.sed_label** %j, align 8
  %189 = getelementptr inbounds %struct.sed_label* %188, i32 0, i32 1
  %190 = load i32* %189, align 4
  %191 = sub nsw i32 %187, %190
  store i32 %191, i32* %n, align 4
  %192 = load %struct.sed_label** %j, align 8
  %193 = getelementptr inbounds %struct.sed_label* %192, i32 0, i32 0
  %194 = load %struct.vector** %193, align 8
  %195 = getelementptr inbounds %struct.vector* %194, i32 0, i32 0
  %196 = load %struct.sed_cmd** %195, align 8
  %197 = load %struct.sed_label** %j, align 8
  %198 = getelementptr inbounds %struct.sed_label* %197, i32 0, i32 1
  %199 = load i32* %198, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds %struct.sed_cmd* %196, i64 %200
  store %struct.sed_cmd* %201, %struct.sed_cmd** %cur_cmd, align 8
  br label %15

; <label>:202                                     ; preds = %175
  br label %894

; <label>:203                                     ; preds = %77
  store i32 0, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %204 = load %struct.sed_cmd** %cur_cmd, align 8
  %205 = getelementptr inbounds %struct.sed_cmd* %204, i32 0, i32 2
  %206 = load i32* %205, align 4
  %207 = and i32 %206, 1
  %208 = icmp ne i32 %207, 0
  br i1 %208, label %221, label %209

; <label>:209                                     ; preds = %203
  %210 = load %struct.sed_cmd** %cur_cmd, align 8
  %211 = getelementptr inbounds %struct.sed_cmd* %210, i32 0, i32 4
  %212 = bitcast %union.anon* %211 to %struct.anon*
  %213 = getelementptr inbounds %struct.anon* %212, i32 0, i32 0
  %214 = load i8** %213, align 8
  %215 = load %struct.sed_cmd** %cur_cmd, align 8
  %216 = getelementptr inbounds %struct.sed_cmd* %215, i32 0, i32 4
  %217 = bitcast %union.anon* %216 to %struct.anon*
  %218 = getelementptr inbounds %struct.anon* %217, i32 0, i32 1
  %219 = load i32* %218, align 4
  %220 = load %struct._IO_FILE** @stdout, align 8
  call void @ck_fwrite(i8* %214, i32 1, i32 %219, %struct._IO_FILE* %220)
  br label %221

; <label>:221                                     ; preds = %209, %203
  %222 = load i32* @execute_program.end_cycle, align 4
  %223 = add nsw i32 %222, 1
  store i32 %223, i32* @execute_program.end_cycle, align 4
  br label %894

; <label>:224                                     ; preds = %77
  store i32 0, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %225 = load i32* @execute_program.end_cycle, align 4
  %226 = add nsw i32 %225, 1
  store i32 %226, i32* @execute_program.end_cycle, align 4
  br label %894

; <label>:227                                     ; preds = %77
  %228 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %229 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %230 = call i8* (...)* bitcast (i8* (i8*, i32)* @eol_pos to i8* (...)*)(i8* %228, i32 %229)
  store i8* %230, i8** %tmp, align 8
  %231 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %232 = sext i32 %231 to i64
  %233 = load i8** %tmp, align 8
  %234 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %235 = ptrtoint i8* %233 to i64
  %236 = ptrtoint i8* %234 to i64
  %237 = sub i64 %235, %236
  %238 = sub nsw i64 %232, %237
  %239 = sub nsw i64 %238, 1
  %240 = trunc i64 %239 to i32
  store i32 %240, i32* %newlength, align 4
  %241 = load i32* %newlength, align 4
  %242 = icmp ne i32 %241, 0
  br i1 %242, label %243, label %249

; <label>:243                                     ; preds = %227
  %244 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %245 = load i8** %tmp, align 8
  %246 = getelementptr inbounds i8* %245, i64 1
  %247 = load i32* %newlength, align 4
  call void (...)* bitcast (void (i8*, i8*, i32)* @chr_copy to void (...)*)(i8* %244, i8* %246, i32 %247)
  %248 = load i32* %newlength, align 4
  store i32 %248, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  br label %3

; <label>:249                                     ; preds = %227
  store i32 0, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %250 = load i32* @execute_program.end_cycle, align 4
  %251 = add nsw i32 %250, 1
  store i32 %251, i32* @execute_program.end_cycle, align 4
  br label %894

; <label>:252                                     ; preds = %77
  call void @line_copy(%struct.line* @hold, %struct.line* @line)
  br label %894

; <label>:253                                     ; preds = %77
  call void @line_append(%struct.line* @hold, %struct.line* @line)
  br label %894

; <label>:254                                     ; preds = %77
  call void @line_copy(%struct.line* @line, %struct.line* @hold)
  br label %894

; <label>:255                                     ; preds = %77
  call void @line_append(%struct.line* @line, %struct.line* @hold)
  br label %894

; <label>:256                                     ; preds = %77
  %257 = load %struct.sed_cmd** %cur_cmd, align 8
  %258 = getelementptr inbounds %struct.sed_cmd* %257, i32 0, i32 4
  %259 = bitcast %union.anon* %258 to %struct.anon*
  %260 = getelementptr inbounds %struct.anon* %259, i32 0, i32 0
  %261 = load i8** %260, align 8
  %262 = load %struct.sed_cmd** %cur_cmd, align 8
  %263 = getelementptr inbounds %struct.sed_cmd* %262, i32 0, i32 4
  %264 = bitcast %union.anon* %263 to %struct.anon*
  %265 = getelementptr inbounds %struct.anon* %264, i32 0, i32 1
  %266 = load i32* %265, align 4
  %267 = load %struct._IO_FILE** @stdout, align 8
  call void @ck_fwrite(i8* %261, i32 1, i32 %266, %struct._IO_FILE* %267)
  br label %894

; <label>:268                                     ; preds = %77
  store i32 0, i32* %width, align 4
  %269 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  store i32 %269, i32* %n2, align 4
  %270 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  store i8* %270, i8** %tmp1, align 8
  br label %271

; <label>:271                                     ; preds = %359, %268
  %272 = load i32* %n2, align 4
  %273 = add nsw i32 %272, -1
  store i32 %273, i32* %n2, align 4
  %274 = icmp ne i32 %272, 0
  br i1 %274, label %275, label %362

; <label>:275                                     ; preds = %271
  %276 = load i32* %n2, align 4
  %277 = icmp ne i32 %276, 0
  br i1 %277, label %284, label %278

; <label>:278                                     ; preds = %275
  %279 = load i8** %tmp1, align 8
  %280 = load i8* %279, align 1
  %281 = sext i8 %280 to i32
  %282 = icmp eq i32 %281, 10
  br i1 %282, label %283, label %284

; <label>:283                                     ; preds = %278
  br label %362

; <label>:284                                     ; preds = %278, %275
  %285 = load i32* %width, align 4
  %286 = icmp sgt i32 %285, 77
  br i1 %286, label %287, label %289

; <label>:287                                     ; preds = %284
  store i32 0, i32* %width, align 4
  %288 = call i32 @putchar(i32 10)
  br label %289

; <label>:289                                     ; preds = %287, %284
  %290 = load i8** %tmp1, align 8
  %291 = load i8* %290, align 1
  %292 = sext i8 %291 to i32
  %293 = icmp eq i32 %292, 92
  br i1 %293, label %294, label %298

; <label>:294                                     ; preds = %289
  %295 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str29, i32 0, i32 0))
  %296 = load i32* %width, align 4
  %297 = add nsw i32 %296, 2
  store i32 %297, i32* %width, align 4
  br label %359

; <label>:298                                     ; preds = %289
  %299 = load i8** %tmp1, align 8
  %300 = load i8* %299, align 1
  %301 = sext i8 %300 to i32
  %302 = sext i32 %301 to i64
  %303 = call i16** @__ctype_b_loc() nounwind readnone
  %304 = load i16** %303, align 8
  %305 = getelementptr inbounds i16* %304, i64 %302
  %306 = load i16* %305, align 2
  %307 = zext i16 %306 to i32
  %308 = and i32 %307, 16384
  %309 = icmp ne i32 %308, 0
  br i1 %309, label %310, label %317

; <label>:310                                     ; preds = %298
  %311 = load i8** %tmp1, align 8
  %312 = load i8* %311, align 1
  %313 = sext i8 %312 to i32
  %314 = call i32 @putchar(i32 %313)
  %315 = load i32* %width, align 4
  %316 = add nsw i32 %315, 1
  store i32 %316, i32* %width, align 4
  br label %358

; <label>:317                                     ; preds = %298
  %318 = load i8** %tmp1, align 8
  %319 = load i8* %318, align 1
  %320 = sext i8 %319 to i32
  switch i32 %320, label %349 [
    i32 7, label %321
    i32 8, label %325
    i32 12, label %329
    i32 10, label %333
    i32 13, label %337
    i32 9, label %341
    i32 11, label %345
  ]

; <label>:321                                     ; preds = %317
  %322 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str30, i32 0, i32 0))
  %323 = load i32* %width, align 4
  %324 = add nsw i32 %323, 2
  store i32 %324, i32* %width, align 4
  br label %357

; <label>:325                                     ; preds = %317
  %326 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str31, i32 0, i32 0))
  %327 = load i32* %width, align 4
  %328 = add nsw i32 %327, 2
  store i32 %328, i32* %width, align 4
  br label %357

; <label>:329                                     ; preds = %317
  %330 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str32, i32 0, i32 0))
  %331 = load i32* %width, align 4
  %332 = add nsw i32 %331, 2
  store i32 %332, i32* %width, align 4
  br label %357

; <label>:333                                     ; preds = %317
  %334 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str33, i32 0, i32 0))
  %335 = load i32* %width, align 4
  %336 = add nsw i32 %335, 2
  store i32 %336, i32* %width, align 4
  br label %357

; <label>:337                                     ; preds = %317
  %338 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str34, i32 0, i32 0))
  %339 = load i32* %width, align 4
  %340 = add nsw i32 %339, 2
  store i32 %340, i32* %width, align 4
  br label %357

; <label>:341                                     ; preds = %317
  %342 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str35, i32 0, i32 0))
  %343 = load i32* %width, align 4
  %344 = add nsw i32 %343, 2
  store i32 %344, i32* %width, align 4
  br label %357

; <label>:345                                     ; preds = %317
  %346 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str36, i32 0, i32 0))
  %347 = load i32* %width, align 4
  %348 = add nsw i32 %347, 2
  store i32 %348, i32* %width, align 4
  br label %357

; <label>:349                                     ; preds = %317
  %350 = load i8** %tmp1, align 8
  %351 = load i8* %350, align 1
  %352 = sext i8 %351 to i32
  %353 = and i32 %352, 255
  %354 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str37, i32 0, i32 0), i32 %353)
  %355 = load i32* %width, align 4
  %356 = add nsw i32 %355, 2
  store i32 %356, i32* %width, align 4
  br label %357

; <label>:357                                     ; preds = %349, %345, %341, %337, %333, %329, %325, %321
  br label %358

; <label>:358                                     ; preds = %357, %310
  br label %359

; <label>:359                                     ; preds = %358, %294
  %360 = load i8** %tmp1, align 8
  %361 = getelementptr inbounds i8* %360, i32 1
  store i8* %361, i8** %tmp1, align 8
  br label %271

; <label>:362                                     ; preds = %283, %271
  %363 = call i32 @putchar(i32 10)
  br label %894

; <label>:364                                     ; preds = %77
  %365 = load %struct._IO_FILE** @input_file, align 8
  %366 = call i32 @feof(%struct._IO_FILE* %365) nounwind
  %367 = icmp ne i32 %366, 0
  br i1 %367, label %368, label %369

; <label>:368                                     ; preds = %364
  br label %410

; <label>:369                                     ; preds = %364
  %370 = load i32* @no_default_output, align 4
  %371 = icmp ne i32 %370, 0
  br i1 %371, label %376, label %372

; <label>:372                                     ; preds = %369
  %373 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %374 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %375 = load %struct._IO_FILE** @stdout, align 8
  call void @ck_fwrite(i8* %373, i32 1, i32 %374, %struct._IO_FILE* %375)
  br label %376

; <label>:376                                     ; preds = %372, %369
  %377 = call i32 @read_pattern_space()
  br label %894

; <label>:378                                     ; preds = %77
  %379 = load %struct._IO_FILE** @input_file, align 8
  %380 = call i32 @feof(%struct._IO_FILE* %379) nounwind
  %381 = icmp ne i32 %380, 0
  br i1 %381, label %382, label %383

; <label>:382                                     ; preds = %378
  store i32 0, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  br label %410

; <label>:383                                     ; preds = %378
  call void @append_pattern_space()
  br label %894

; <label>:384                                     ; preds = %77
  %385 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %386 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %387 = load %struct._IO_FILE** @stdout, align 8
  call void @ck_fwrite(i8* %385, i32 1, i32 %386, %struct._IO_FILE* %387)
  br label %894

; <label>:388                                     ; preds = %77
  %389 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %390 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %391 = call i8* (...)* bitcast (i8* (i8*, i32)* @eol_pos to i8* (...)*)(i8* %389, i32 %390)
  store i8* %391, i8** %tmp3, align 8
  %392 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %393 = load i8** %tmp3, align 8
  %394 = icmp ne i8* %393, null
  br i1 %394, label %395, label %402

; <label>:395                                     ; preds = %388
  %396 = load i8** %tmp3, align 8
  %397 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %398 = ptrtoint i8* %396 to i64
  %399 = ptrtoint i8* %397 to i64
  %400 = sub i64 %398, %399
  %401 = add nsw i64 %400, 1
  br label %405

; <label>:402                                     ; preds = %388
  %403 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %404 = sext i32 %403 to i64
  br label %405

; <label>:405                                     ; preds = %402, %395
  %406 = phi i64 [ %401, %395 ], [ %404, %402 ]
  %407 = trunc i64 %406 to i32
  %408 = load %struct._IO_FILE** @stdout, align 8
  call void @ck_fwrite(i8* %392, i32 1, i32 %407, %struct._IO_FILE* %408)
  br label %894

; <label>:409                                     ; preds = %77
  br label %410

; <label>:410                                     ; preds = %409, %382, %368
  %411 = load i32* @quit_cmd, align 4
  %412 = add nsw i32 %411, 1
  store i32 %412, i32* @quit_cmd, align 4
  %413 = load i32* @execute_program.end_cycle, align 4
  %414 = add nsw i32 %413, 1
  store i32 %414, i32* @execute_program.end_cycle, align 4
  br label %894

; <label>:415                                     ; preds = %77
  store i32 0, i32* %n4, align 4
  %416 = load %struct.sed_cmd** %cur_cmd, align 8
  %417 = getelementptr inbounds %struct.sed_cmd* %416, i32 0, i32 4
  %418 = bitcast %union.anon* %417 to %struct._IO_FILE**
  %419 = load %struct._IO_FILE** %418, align 8
  %420 = icmp ne %struct._IO_FILE* %419, null
  br i1 %420, label %421, label %466

; <label>:421                                     ; preds = %415
  %422 = load %struct.sed_cmd** %cur_cmd, align 8
  %423 = getelementptr inbounds %struct.sed_cmd* %422, i32 0, i32 4
  %424 = bitcast %union.anon* %423 to %struct._IO_FILE**
  %425 = load %struct._IO_FILE** %424, align 8
  call void @rewind(%struct._IO_FILE* %425)
  br label %426

; <label>:426                                     ; preds = %454, %421
  %427 = load i32* %n4, align 4
  %428 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  %429 = add nsw i32 %428, %427
  store i32 %429, i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  %430 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  %431 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 2), align 4
  %432 = icmp eq i32 %430, %431
  br i1 %432, label %433, label %439

; <label>:433                                     ; preds = %426
  %434 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 2), align 4
  %435 = mul nsw i32 %434, 2
  store i32 %435, i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 2), align 4
  %436 = load i8** getelementptr inbounds (%struct.line* @append, i32 0, i32 0), align 8
  %437 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 2), align 4
  %438 = call i8* @ck_realloc(i8* %436, i32 %437)
  store i8* %438, i8** getelementptr inbounds (%struct.line* @append, i32 0, i32 0), align 8
  br label %439

; <label>:439                                     ; preds = %433, %426
  %440 = load i8** getelementptr inbounds (%struct.line* @append, i32 0, i32 0), align 8
  %441 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  %442 = sext i32 %441 to i64
  %443 = getelementptr inbounds i8* %440, i64 %442
  %444 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 2), align 4
  %445 = load i32* getelementptr inbounds (%struct.line* @append, i32 0, i32 1), align 4
  %446 = sub nsw i32 %444, %445
  %447 = sext i32 %446 to i64
  %448 = load %struct.sed_cmd** %cur_cmd, align 8
  %449 = getelementptr inbounds %struct.sed_cmd* %448, i32 0, i32 4
  %450 = bitcast %union.anon* %449 to %struct._IO_FILE**
  %451 = load %struct._IO_FILE** %450, align 8
  %452 = call i64 @fread(i8* %443, i64 1, i64 %447, %struct._IO_FILE* %451)
  %453 = trunc i64 %452 to i32
  store i32 %453, i32* %n4, align 4
  br label %454

; <label>:454                                     ; preds = %439
  %455 = load i32* %n4, align 4
  %456 = icmp sgt i32 %455, 0
  br i1 %456, label %426, label %457

; <label>:457                                     ; preds = %454
  %458 = load %struct.sed_cmd** %cur_cmd, align 8
  %459 = getelementptr inbounds %struct.sed_cmd* %458, i32 0, i32 4
  %460 = bitcast %union.anon* %459 to %struct._IO_FILE**
  %461 = load %struct._IO_FILE** %460, align 8
  %462 = call i32 @ferror(%struct._IO_FILE* %461) nounwind
  %463 = icmp ne i32 %462, 0
  br i1 %463, label %464, label %465

; <label>:464                                     ; preds = %457
  call void (i8*, ...)* @panic(i8* getelementptr inbounds ([40 x i8]* @.str38, i32 0, i32 0))
  br label %465

; <label>:465                                     ; preds = %464, %457
  br label %466

; <label>:466                                     ; preds = %465, %415
  br label %894

; <label>:467                                     ; preds = %77
  %468 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %469 = sub nsw i32 %468, 1
  %470 = sext i32 %469 to i64
  %471 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %472 = getelementptr inbounds i8* %471, i64 %470
  %473 = load i8* %472, align 1
  %474 = sext i8 %473 to i32
  %475 = icmp eq i32 %474, 10
  %476 = zext i1 %475 to i32
  store i32 %476, i32* %trail_nl_p, align 4
  %477 = load i32* getelementptr inbounds (%struct.line* @execute_program.tmp, i32 0, i32 2), align 4
  %478 = icmp ne i32 %477, 0
  br i1 %478, label %481, label %479

; <label>:479                                     ; preds = %467
  store i32 50, i32* getelementptr inbounds (%struct.line* @execute_program.tmp, i32 0, i32 2), align 4
  %480 = call i8* @ck_malloc(i32 50)
  store i8* %480, i8** getelementptr inbounds (%struct.line* @execute_program.tmp, i32 0, i32 0), align 8
  br label %481

; <label>:481                                     ; preds = %479, %467
  store i32 0, i32* %count, align 4
  store i32 0, i32* %start, align 4
  %482 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %483 = load i32* %trail_nl_p, align 4
  %484 = sub nsw i32 %482, %483
  store i32 %484, i32* %remain, align 4
  store i32 0, i32* getelementptr inbounds (%struct.line* @execute_program.tmp, i32 0, i32 1), align 4
  %485 = load %struct.sed_cmd** %cur_cmd, align 8
  %486 = getelementptr inbounds %struct.sed_cmd* %485, i32 0, i32 4
  %487 = bitcast %union.anon* %486 to %struct.anon.0*
  %488 = getelementptr inbounds %struct.anon.0* %487, i32 0, i32 1
  %489 = load i8** %488, align 8
  store i8* %489, i8** %rep, align 8
  %490 = load i8** %rep, align 8
  %491 = load %struct.sed_cmd** %cur_cmd, align 8
  %492 = getelementptr inbounds %struct.sed_cmd* %491, i32 0, i32 4
  %493 = bitcast %union.anon* %492 to %struct.anon.0*
  %494 = getelementptr inbounds %struct.anon.0* %493, i32 0, i32 2
  %495 = load i32* %494, align 4
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds i8* %490, i64 %496
  store i8* %497, i8** %rep_end, align 8
  br label %498

; <label>:498                                     ; preds = %746, %574, %481
  %499 = load %struct.sed_cmd** %cur_cmd, align 8
  %500 = getelementptr inbounds %struct.sed_cmd* %499, i32 0, i32 4
  %501 = bitcast %union.anon* %500 to %struct.anon.0*
  %502 = getelementptr inbounds %struct.anon.0* %501, i32 0, i32 0
  %503 = load %struct.re_pattern_buffer** %502, align 8
  %504 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %505 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %506 = load i32* %trail_nl_p, align 4
  %507 = sub nsw i32 %505, %506
  %508 = load i32* %start, align 4
  %509 = load i32* %remain, align 4
  %510 = call i32 @re_search(%struct.re_pattern_buffer* %503, i8* %504, i32 %507, i32 %508, i32 %509, %struct.re_registers* @regs)
  store i32 %510, i32* %offset, align 4
  %511 = icmp sge i32 %510, 0
  br i1 %511, label %512, label %747

; <label>:512                                     ; preds = %498
  %513 = load i32* %count, align 4
  %514 = add nsw i32 %513, 1
  store i32 %514, i32* %count, align 4
  %515 = load i32* %offset, align 4
  %516 = load i32* %start, align 4
  %517 = sub nsw i32 %515, %516
  %518 = icmp ne i32 %517, 0
  br i1 %518, label %519, label %527

; <label>:519                                     ; preds = %512
  %520 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %521 = load i32* %start, align 4
  %522 = sext i32 %521 to i64
  %523 = getelementptr inbounds i8* %520, i64 %522
  %524 = load i32* %offset, align 4
  %525 = load i32* %start, align 4
  %526 = sub nsw i32 %524, %525
  call void @str_append(%struct.line* @execute_program.tmp, i8* %523, i32 %526)
  br label %527

; <label>:527                                     ; preds = %519, %512
  %528 = load %struct.sed_cmd** %cur_cmd, align 8
  %529 = getelementptr inbounds %struct.sed_cmd* %528, i32 0, i32 4
  %530 = bitcast %union.anon* %529 to %struct.anon.0*
  %531 = getelementptr inbounds %struct.anon.0* %530, i32 0, i32 3
  %532 = load i32* %531, align 4
  %533 = and i32 %532, 8
  %534 = icmp ne i32 %533, 0
  br i1 %534, label %535, label %582

; <label>:535                                     ; preds = %527
  %536 = load i32* %count, align 4
  %537 = load %struct.sed_cmd** %cur_cmd, align 8
  %538 = getelementptr inbounds %struct.sed_cmd* %537, i32 0, i32 4
  %539 = bitcast %union.anon* %538 to %struct.anon.0*
  %540 = getelementptr inbounds %struct.anon.0* %539, i32 0, i32 4
  %541 = load i32* %540, align 4
  %542 = icmp ne i32 %536, %541
  br i1 %542, label %543, label %581

; <label>:543                                     ; preds = %535
  %544 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 2), align 8
  %545 = getelementptr inbounds i32* %544, i64 0
  %546 = load i32* %545, align 4
  %547 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 1), align 8
  %548 = getelementptr inbounds i32* %547, i64 0
  %549 = load i32* %548, align 4
  %550 = sub nsw i32 %546, %549
  store i32 %550, i32* %matched, align 4
  %551 = load i32* %matched, align 4
  %552 = icmp ne i32 %551, 0
  br i1 %552, label %554, label %553

; <label>:553                                     ; preds = %543
  store i32 1, i32* %matched, align 4
  br label %554

; <label>:554                                     ; preds = %553, %543
  %555 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %556 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 1), align 8
  %557 = getelementptr inbounds i32* %556, i64 0
  %558 = load i32* %557, align 4
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds i8* %555, i64 %559
  %561 = load i32* %matched, align 4
  call void @str_append(%struct.line* @execute_program.tmp, i8* %560, i32 %561)
  %562 = load i32* %offset, align 4
  %563 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 2), align 8
  %564 = getelementptr inbounds i32* %563, i64 0
  %565 = load i32* %564, align 4
  %566 = icmp eq i32 %562, %565
  br i1 %566, label %567, label %570

; <label>:567                                     ; preds = %554
  %568 = load i32* %offset, align 4
  %569 = add nsw i32 %568, 1
  br label %574

; <label>:570                                     ; preds = %554
  %571 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 2), align 8
  %572 = getelementptr inbounds i32* %571, i64 0
  %573 = load i32* %572, align 4
  br label %574

; <label>:574                                     ; preds = %570, %567
  %575 = phi i32 [ %569, %567 ], [ %573, %570 ]
  store i32 %575, i32* %start, align 4
  %576 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %577 = load i32* %trail_nl_p, align 4
  %578 = sub nsw i32 %576, %577
  %579 = load i32* %start, align 4
  %580 = sub nsw i32 %578, %579
  store i32 %580, i32* %remain, align 4
  br label %498

; <label>:581                                     ; preds = %535
  br label %582

; <label>:582                                     ; preds = %581, %527
  %583 = load i8** %rep, align 8
  store i8* %583, i8** %rep_cur, align 8
  store i8* %583, i8** %rep_next, align 8
  br label %584

; <label>:584                                     ; preds = %692, %582
  %585 = load i8** %rep_next, align 8
  %586 = load i8** %rep_end, align 8
  %587 = icmp ult i8* %585, %586
  br i1 %587, label %588, label %695

; <label>:588                                     ; preds = %584
  %589 = load i8** %rep_next, align 8
  %590 = load i8* %589, align 1
  %591 = sext i8 %590 to i32
  %592 = icmp eq i32 %591, 38
  br i1 %592, label %593, label %624

; <label>:593                                     ; preds = %588
  %594 = load i8** %rep_next, align 8
  %595 = load i8** %rep_cur, align 8
  %596 = ptrtoint i8* %594 to i64
  %597 = ptrtoint i8* %595 to i64
  %598 = sub i64 %596, %597
  %599 = icmp ne i64 %598, 0
  br i1 %599, label %600, label %608

; <label>:600                                     ; preds = %593
  %601 = load i8** %rep_cur, align 8
  %602 = load i8** %rep_next, align 8
  %603 = load i8** %rep_cur, align 8
  %604 = ptrtoint i8* %602 to i64
  %605 = ptrtoint i8* %603 to i64
  %606 = sub i64 %604, %605
  %607 = trunc i64 %606 to i32
  call void @str_append(%struct.line* @execute_program.tmp, i8* %601, i32 %607)
  br label %608

; <label>:608                                     ; preds = %600, %593
  %609 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %610 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 1), align 8
  %611 = getelementptr inbounds i32* %610, i64 0
  %612 = load i32* %611, align 4
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds i8* %609, i64 %613
  %615 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 2), align 8
  %616 = getelementptr inbounds i32* %615, i64 0
  %617 = load i32* %616, align 4
  %618 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 1), align 8
  %619 = getelementptr inbounds i32* %618, i64 0
  %620 = load i32* %619, align 4
  %621 = sub nsw i32 %617, %620
  call void @str_append(%struct.line* @execute_program.tmp, i8* %614, i32 %621)
  %622 = load i8** %rep_next, align 8
  %623 = getelementptr inbounds i8* %622, i64 1
  store i8* %623, i8** %rep_cur, align 8
  br label %691

; <label>:624                                     ; preds = %588
  %625 = load i8** %rep_next, align 8
  %626 = load i8* %625, align 1
  %627 = sext i8 %626 to i32
  %628 = icmp eq i32 %627, 92
  br i1 %628, label %629, label %690

; <label>:629                                     ; preds = %624
  %630 = load i8** %rep_next, align 8
  %631 = load i8** %rep_cur, align 8
  %632 = ptrtoint i8* %630 to i64
  %633 = ptrtoint i8* %631 to i64
  %634 = sub i64 %632, %633
  %635 = icmp ne i64 %634, 0
  br i1 %635, label %636, label %644

; <label>:636                                     ; preds = %629
  %637 = load i8** %rep_cur, align 8
  %638 = load i8** %rep_next, align 8
  %639 = load i8** %rep_cur, align 8
  %640 = ptrtoint i8* %638 to i64
  %641 = ptrtoint i8* %639 to i64
  %642 = sub i64 %640, %641
  %643 = trunc i64 %642 to i32
  call void @str_append(%struct.line* @execute_program.tmp, i8* %637, i32 %643)
  br label %644

; <label>:644                                     ; preds = %636, %629
  %645 = load i8** %rep_next, align 8
  %646 = getelementptr inbounds i8* %645, i32 1
  store i8* %646, i8** %rep_next, align 8
  %647 = load i8** %rep_next, align 8
  %648 = load i8** %rep_end, align 8
  %649 = icmp ne i8* %647, %648
  br i1 %649, label %650, label %687

; <label>:650                                     ; preds = %644
  %651 = load i8** %rep_next, align 8
  %652 = load i8* %651, align 1
  %653 = sext i8 %652 to i32
  %654 = icmp sge i32 %653, 48
  br i1 %654, label %655, label %684

; <label>:655                                     ; preds = %650
  %656 = load i8** %rep_next, align 8
  %657 = load i8* %656, align 1
  %658 = sext i8 %657 to i32
  %659 = icmp sle i32 %658, 57
  br i1 %659, label %660, label %684

; <label>:660                                     ; preds = %655
  %661 = load i8** %rep_next, align 8
  %662 = load i8* %661, align 1
  %663 = sext i8 %662 to i32
  %664 = sub nsw i32 %663, 48
  store i32 %664, i32* %n5, align 4
  %665 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %666 = load i32* %n5, align 4
  %667 = sext i32 %666 to i64
  %668 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 1), align 8
  %669 = getelementptr inbounds i32* %668, i64 %667
  %670 = load i32* %669, align 4
  %671 = sext i32 %670 to i64
  %672 = getelementptr inbounds i8* %665, i64 %671
  %673 = load i32* %n5, align 4
  %674 = sext i32 %673 to i64
  %675 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 2), align 8
  %676 = getelementptr inbounds i32* %675, i64 %674
  %677 = load i32* %676, align 4
  %678 = load i32* %n5, align 4
  %679 = sext i32 %678 to i64
  %680 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 1), align 8
  %681 = getelementptr inbounds i32* %680, i64 %679
  %682 = load i32* %681, align 4
  %683 = sub nsw i32 %677, %682
  call void @str_append(%struct.line* @execute_program.tmp, i8* %672, i32 %683)
  br label %686

; <label>:684                                     ; preds = %655, %650
  %685 = load i8** %rep_next, align 8
  call void @str_append(%struct.line* @execute_program.tmp, i8* %685, i32 1)
  br label %686

; <label>:686                                     ; preds = %684, %660
  br label %687

; <label>:687                                     ; preds = %686, %644
  %688 = load i8** %rep_next, align 8
  %689 = getelementptr inbounds i8* %688, i64 1
  store i8* %689, i8** %rep_cur, align 8
  br label %690

; <label>:690                                     ; preds = %687, %624
  br label %691

; <label>:691                                     ; preds = %690, %608
  br label %692

; <label>:692                                     ; preds = %691
  %693 = load i8** %rep_next, align 8
  %694 = getelementptr inbounds i8* %693, i32 1
  store i8* %694, i8** %rep_next, align 8
  br label %584

; <label>:695                                     ; preds = %584
  %696 = load i8** %rep_next, align 8
  %697 = load i8** %rep_cur, align 8
  %698 = ptrtoint i8* %696 to i64
  %699 = ptrtoint i8* %697 to i64
  %700 = sub i64 %698, %699
  %701 = icmp ne i64 %700, 0
  br i1 %701, label %702, label %710

; <label>:702                                     ; preds = %695
  %703 = load i8** %rep_cur, align 8
  %704 = load i8** %rep_next, align 8
  %705 = load i8** %rep_cur, align 8
  %706 = ptrtoint i8* %704 to i64
  %707 = ptrtoint i8* %705 to i64
  %708 = sub i64 %706, %707
  %709 = trunc i64 %708 to i32
  call void @str_append(%struct.line* @execute_program.tmp, i8* %703, i32 %709)
  br label %710

; <label>:710                                     ; preds = %702, %695
  %711 = load i32* %offset, align 4
  %712 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 2), align 8
  %713 = getelementptr inbounds i32* %712, i64 0
  %714 = load i32* %713, align 4
  %715 = icmp eq i32 %711, %714
  br i1 %715, label %716, label %725

; <label>:716                                     ; preds = %710
  %717 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %718 = load i32* %offset, align 4
  %719 = sext i32 %718 to i64
  %720 = getelementptr inbounds i8* %717, i64 %719
  call void @str_append(%struct.line* @execute_program.tmp, i8* %720, i32 1)
  %721 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 2), align 8
  %722 = getelementptr inbounds i32* %721, i64 0
  %723 = load i32* %722, align 4
  %724 = add nsw i32 %723, 1
  store i32 %724, i32* %722, align 4
  br label %725

; <label>:725                                     ; preds = %716, %710
  %726 = load i32** getelementptr inbounds (%struct.re_registers* @regs, i32 0, i32 2), align 8
  %727 = getelementptr inbounds i32* %726, i64 0
  %728 = load i32* %727, align 4
  store i32 %728, i32* %start, align 4
  %729 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %730 = load i32* %trail_nl_p, align 4
  %731 = sub nsw i32 %729, %730
  %732 = load i32* %start, align 4
  %733 = sub nsw i32 %731, %732
  store i32 %733, i32* %remain, align 4
  %734 = load i32* %remain, align 4
  %735 = icmp slt i32 %734, 0
  br i1 %735, label %736, label %737

; <label>:736                                     ; preds = %725
  br label %747

; <label>:737                                     ; preds = %725
  %738 = load %struct.sed_cmd** %cur_cmd, align 8
  %739 = getelementptr inbounds %struct.sed_cmd* %738, i32 0, i32 4
  %740 = bitcast %union.anon* %739 to %struct.anon.0*
  %741 = getelementptr inbounds %struct.anon.0* %740, i32 0, i32 3
  %742 = load i32* %741, align 4
  %743 = and i32 %742, 1
  %744 = icmp ne i32 %743, 0
  br i1 %744, label %746, label %745

; <label>:745                                     ; preds = %737
  br label %747

; <label>:746                                     ; preds = %737
  br label %498

; <label>:747                                     ; preds = %745, %736, %498
  %748 = load i32* %count, align 4
  %749 = icmp ne i32 %748, 0
  br i1 %749, label %751, label %750

; <label>:750                                     ; preds = %747
  br label %894

; <label>:751                                     ; preds = %747
  store i32 1, i32* @replaced, align 4
  %752 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %753 = load i32* %start, align 4
  %754 = sext i32 %753 to i64
  %755 = getelementptr inbounds i8* %752, i64 %754
  %756 = load i32* %remain, align 4
  %757 = load i32* %trail_nl_p, align 4
  %758 = add nsw i32 %756, %757
  call void @str_append(%struct.line* @execute_program.tmp, i8* %755, i32 %758)
  %759 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %760 = getelementptr inbounds %struct.line* %t, i32 0, i32 0
  store i8* %759, i8** %760, align 8
  %761 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %762 = getelementptr inbounds %struct.line* %t, i32 0, i32 1
  store i32 %761, i32* %762, align 4
  %763 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %764 = getelementptr inbounds %struct.line* %t, i32 0, i32 2
  store i32 %763, i32* %764, align 4
  %765 = load i8** getelementptr inbounds (%struct.line* @execute_program.tmp, i32 0, i32 0), align 8
  store i8* %765, i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %766 = load i32* getelementptr inbounds (%struct.line* @execute_program.tmp, i32 0, i32 1), align 4
  store i32 %766, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %767 = load i32* getelementptr inbounds (%struct.line* @execute_program.tmp, i32 0, i32 2), align 4
  store i32 %767, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %768 = getelementptr inbounds %struct.line* %t, i32 0, i32 0
  %769 = load i8** %768, align 8
  store i8* %769, i8** getelementptr inbounds (%struct.line* @execute_program.tmp, i32 0, i32 0), align 8
  %770 = getelementptr inbounds %struct.line* %t, i32 0, i32 1
  %771 = load i32* %770, align 4
  store i32 %771, i32* getelementptr inbounds (%struct.line* @execute_program.tmp, i32 0, i32 1), align 4
  %772 = getelementptr inbounds %struct.line* %t, i32 0, i32 2
  %773 = load i32* %772, align 4
  store i32 %773, i32* getelementptr inbounds (%struct.line* @execute_program.tmp, i32 0, i32 2), align 4
  %774 = load %struct.sed_cmd** %cur_cmd, align 8
  %775 = getelementptr inbounds %struct.sed_cmd* %774, i32 0, i32 4
  %776 = bitcast %union.anon* %775 to %struct.anon.0*
  %777 = getelementptr inbounds %struct.anon.0* %776, i32 0, i32 3
  %778 = load i32* %777, align 4
  %779 = and i32 %778, 4
  %780 = icmp ne i32 %779, 0
  br i1 %780, label %781, label %796

; <label>:781                                     ; preds = %751
  %782 = load %struct.sed_cmd** %cur_cmd, align 8
  %783 = getelementptr inbounds %struct.sed_cmd* %782, i32 0, i32 4
  %784 = bitcast %union.anon* %783 to %struct.anon.0*
  %785 = getelementptr inbounds %struct.anon.0* %784, i32 0, i32 5
  %786 = load %struct._IO_FILE** %785, align 8
  %787 = icmp ne %struct._IO_FILE* %786, null
  br i1 %787, label %788, label %796

; <label>:788                                     ; preds = %781
  %789 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %790 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %791 = load %struct.sed_cmd** %cur_cmd, align 8
  %792 = getelementptr inbounds %struct.sed_cmd* %791, i32 0, i32 4
  %793 = bitcast %union.anon* %792 to %struct.anon.0*
  %794 = getelementptr inbounds %struct.anon.0* %793, i32 0, i32 5
  %795 = load %struct._IO_FILE** %794, align 8
  call void @ck_fwrite(i8* %789, i32 1, i32 %790, %struct._IO_FILE* %795)
  br label %796

; <label>:796                                     ; preds = %788, %781, %751
  %797 = load %struct.sed_cmd** %cur_cmd, align 8
  %798 = getelementptr inbounds %struct.sed_cmd* %797, i32 0, i32 4
  %799 = bitcast %union.anon* %798 to %struct.anon.0*
  %800 = getelementptr inbounds %struct.anon.0* %799, i32 0, i32 3
  %801 = load i32* %800, align 4
  %802 = and i32 %801, 2
  %803 = icmp ne i32 %802, 0
  br i1 %803, label %804, label %808

; <label>:804                                     ; preds = %796
  %805 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %806 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %807 = load %struct._IO_FILE** @stdout, align 8
  call void @ck_fwrite(i8* %805, i32 1, i32 %806, %struct._IO_FILE* %807)
  br label %808

; <label>:808                                     ; preds = %804, %796
  br label %894

; <label>:809                                     ; preds = %77
  %810 = load i32* @replaced, align 4
  %811 = icmp ne i32 %810, 0
  br i1 %811, label %812, label %846

; <label>:812                                     ; preds = %809
  store i32 0, i32* @replaced, align 4
  %813 = load %struct.sed_cmd** %cur_cmd, align 8
  %814 = getelementptr inbounds %struct.sed_cmd* %813, i32 0, i32 4
  %815 = bitcast %union.anon* %814 to %struct.sed_label**
  %816 = load %struct.sed_label** %815, align 8
  %817 = icmp ne %struct.sed_label* %816, null
  br i1 %817, label %821, label %818

; <label>:818                                     ; preds = %812
  %819 = load i32* @execute_program.end_cycle, align 4
  %820 = add nsw i32 %819, 1
  store i32 %820, i32* @execute_program.end_cycle, align 4
  br label %845

; <label>:821                                     ; preds = %812
  %822 = load %struct.sed_cmd** %cur_cmd, align 8
  %823 = getelementptr inbounds %struct.sed_cmd* %822, i32 0, i32 4
  %824 = bitcast %union.anon* %823 to %struct.sed_label**
  %825 = load %struct.sed_label** %824, align 8
  store %struct.sed_label* %825, %struct.sed_label** %j6, align 8
  %826 = load %struct.sed_label** %j6, align 8
  %827 = getelementptr inbounds %struct.sed_label* %826, i32 0, i32 0
  %828 = load %struct.vector** %827, align 8
  %829 = getelementptr inbounds %struct.vector* %828, i32 0, i32 1
  %830 = load i32* %829, align 4
  %831 = load %struct.sed_label** %j6, align 8
  %832 = getelementptr inbounds %struct.sed_label* %831, i32 0, i32 1
  %833 = load i32* %832, align 4
  %834 = sub nsw i32 %830, %833
  store i32 %834, i32* %n, align 4
  %835 = load %struct.sed_label** %j6, align 8
  %836 = getelementptr inbounds %struct.sed_label* %835, i32 0, i32 0
  %837 = load %struct.vector** %836, align 8
  %838 = getelementptr inbounds %struct.vector* %837, i32 0, i32 0
  %839 = load %struct.sed_cmd** %838, align 8
  %840 = load %struct.sed_label** %j6, align 8
  %841 = getelementptr inbounds %struct.sed_label* %840, i32 0, i32 1
  %842 = load i32* %841, align 4
  %843 = sext i32 %842 to i64
  %844 = getelementptr inbounds %struct.sed_cmd* %839, i64 %843
  store %struct.sed_cmd* %844, %struct.sed_cmd** %cur_cmd, align 8
  br label %15

; <label>:845                                     ; preds = %818
  br label %846

; <label>:846                                     ; preds = %845, %809
  br label %894

; <label>:847                                     ; preds = %77
  %848 = load %struct.sed_cmd** %cur_cmd, align 8
  %849 = getelementptr inbounds %struct.sed_cmd* %848, i32 0, i32 4
  %850 = bitcast %union.anon* %849 to %struct._IO_FILE**
  %851 = load %struct._IO_FILE** %850, align 8
  %852 = icmp ne %struct._IO_FILE* %851, null
  br i1 %852, label %853, label %860

; <label>:853                                     ; preds = %847
  %854 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %855 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %856 = load %struct.sed_cmd** %cur_cmd, align 8
  %857 = getelementptr inbounds %struct.sed_cmd* %856, i32 0, i32 4
  %858 = bitcast %union.anon* %857 to %struct._IO_FILE**
  %859 = load %struct._IO_FILE** %858, align 8
  call void @ck_fwrite(i8* %854, i32 1, i32 %855, %struct._IO_FILE* %859)
  br label %860

; <label>:860                                     ; preds = %853, %847
  br label %894

; <label>:861                                     ; preds = %77
  %862 = bitcast %struct.line* %tmp7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %862, i8* bitcast (%struct.line* @line to i8*), i64 16, i32 8, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.line* @line to i8*), i8* bitcast (%struct.line* @hold to i8*), i64 16, i32 8, i1 false)
  %863 = bitcast %struct.line* %tmp7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.line* @hold to i8*), i8* %863, i64 16, i32 8, i1 false)
  br label %894

; <label>:864                                     ; preds = %77
  %865 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  store i8* %865, i8** %p, align 8
  %866 = load i8** %p, align 8
  %867 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %868 = sext i32 %867 to i64
  %869 = getelementptr inbounds i8* %866, i64 %868
  store i8* %869, i8** %e, align 8
  br label %870

; <label>:870                                     ; preds = %885, %864
  %871 = load i8** %p, align 8
  %872 = load i8** %e, align 8
  %873 = icmp ult i8* %871, %872
  br i1 %873, label %874, label %888

; <label>:874                                     ; preds = %870
  %875 = load i8** %p, align 8
  %876 = load i8* %875, align 1
  %877 = zext i8 %876 to i64
  %878 = load %struct.sed_cmd** %cur_cmd, align 8
  %879 = getelementptr inbounds %struct.sed_cmd* %878, i32 0, i32 4
  %880 = bitcast %union.anon* %879 to i8**
  %881 = load i8** %880, align 8
  %882 = getelementptr inbounds i8* %881, i64 %877
  %883 = load i8* %882, align 1
  %884 = load i8** %p, align 8
  store i8 %883, i8* %884, align 1
  br label %885

; <label>:885                                     ; preds = %874
  %886 = load i8** %p, align 8
  %887 = getelementptr inbounds i8* %886, i32 1
  store i8* %887, i8** %p, align 8
  br label %870

; <label>:888                                     ; preds = %870
  br label %894

; <label>:889                                     ; preds = %77
  %890 = load %struct.sed_cmd** %cur_cmd, align 8
  %891 = getelementptr inbounds %struct.sed_cmd* %890, i32 0, i32 3
  %892 = load i8* %891, align 1
  %893 = sext i8 %892 to i32
  call void (i8*, ...)* @panic(i8* getelementptr inbounds ([27 x i8]* @.str39, i32 0, i32 0), i32 %893)
  br label %894

; <label>:894                                     ; preds = %889, %888, %861, %860, %846, %808, %750, %466, %410, %405, %384, %383, %376, %362, %256, %255, %254, %253, %252, %249, %224, %221, %202, %146, %126, %125, %102, %101
  %895 = load i32* @execute_program.end_cycle, align 4
  %896 = icmp ne i32 %895, 0
  br i1 %896, label %897, label %898

; <label>:897                                     ; preds = %894
  br label %904

; <label>:898                                     ; preds = %894
  br label %899

; <label>:899                                     ; preds = %898, %76
  %900 = load %struct.sed_cmd** %cur_cmd, align 8
  %901 = getelementptr inbounds %struct.sed_cmd* %900, i32 1
  store %struct.sed_cmd* %901, %struct.sed_cmd** %cur_cmd, align 8
  %902 = load i32* %n, align 4
  %903 = add nsw i32 %902, -1
  store i32 %903, i32* %n, align 4
  br label %11

; <label>:904                                     ; preds = %897, %11
  ret void
}

define void @ck_fwrite(i8* %ptr, i32 %size, i32 %nmemb, %struct._IO_FILE* %stream) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct._IO_FILE*, align 8
  store i8* %ptr, i8** %1, align 8
  store i32 %size, i32* %2, align 4
  store i32 %nmemb, i32* %3, align 4
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %4, align 8
  %5 = load i8** %1, align 8
  %6 = load i32* %2, align 4
  %7 = sext i32 %6 to i64
  %8 = load i32* %3, align 4
  %9 = sext i32 %8 to i64
  %10 = load %struct._IO_FILE** %4, align 8
  %11 = call i64 @fwrite(i8* %5, i64 %7, i64 %9, %struct._IO_FILE* %10)
  %12 = load i32* %3, align 4
  %13 = sext i32 %12 to i64
  %14 = icmp ne i64 %11, %13
  br i1 %14, label %15, label %19

; <label>:15                                      ; preds = %0
  %16 = load i32* %3, align 4
  %17 = load %struct._IO_FILE** %4, align 8
  %18 = call i8* (...)* bitcast (i8* (%struct._IO_FILE*)* @__fp_name to i8* (...)*)(%struct._IO_FILE* %17)
  call void (i8*, ...)* @panic(i8* getelementptr inbounds ([30 x i8]* @.str46, i32 0, i32 0), i32 %16, i8* %18)
  br label %19

; <label>:19                                      ; preds = %15, %0
  ret void
}

define void @ck_fclose(%struct._IO_FILE* %stream) nounwind uwtable {
  %1 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %1, align 8
  %2 = load %struct._IO_FILE** %1, align 8
  %3 = call i32 @fclose(%struct._IO_FILE* %2)
  %4 = icmp eq i32 %3, -1
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load %struct._IO_FILE** %1, align 8
  %7 = call i8* (...)* bitcast (i8* (%struct._IO_FILE*)* @__fp_name to i8* (...)*)(%struct._IO_FILE* %6)
  call void (i8*, ...)* @panic(i8* getelementptr inbounds ([18 x i8]* @.str47, i32 0, i32 0), i8* %7)
  br label %8

; <label>:8                                       ; preds = %5, %0
  ret void
}

define i32 @match_address(%struct.addr* %addr) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca %struct.addr*, align 8
  %trail_nl_p = alloca i32, align 4
  store %struct.addr* %addr, %struct.addr** %2, align 8
  %3 = load %struct.addr** %2, align 8
  %4 = getelementptr inbounds %struct.addr* %3, i32 0, i32 0
  %5 = load i32* %4, align 4
  switch i32 %5, label %41 [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %14
    i32 3, label %37
  ]

; <label>:6                                       ; preds = %0
  store i32 1, i32* %1
  br label %43

; <label>:7                                       ; preds = %0
  %8 = load i32* @input_line_number, align 4
  %9 = load %struct.addr** %2, align 8
  %10 = getelementptr inbounds %struct.addr* %9, i32 0, i32 2
  %11 = load i32* %10, align 4
  %12 = icmp eq i32 %8, %11
  %13 = zext i1 %12 to i32
  store i32 %13, i32* %1
  br label %43

; <label>:14                                      ; preds = %0
  %15 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %16 = sub nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %19 = getelementptr inbounds i8* %18, i64 %17
  %20 = load i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp eq i32 %21, 10
  %23 = zext i1 %22 to i32
  store i32 %23, i32* %trail_nl_p, align 4
  %24 = load %struct.addr** %2, align 8
  %25 = getelementptr inbounds %struct.addr* %24, i32 0, i32 1
  %26 = load %struct.re_pattern_buffer** %25, align 8
  %27 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %28 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %29 = load i32* %trail_nl_p, align 4
  %30 = sub nsw i32 %28, %29
  %31 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %32 = load i32* %trail_nl_p, align 4
  %33 = sub nsw i32 %31, %32
  %34 = call i32 @re_search(%struct.re_pattern_buffer* %26, i8* %27, i32 %30, i32 0, i32 %33, %struct.re_registers* null)
  %35 = icmp sge i32 %34, 0
  %36 = select i1 %35, i32 1, i32 0
  store i32 %36, i32* %1
  br label %43

; <label>:37                                      ; preds = %0
  %38 = load i32* @input_EOF, align 4
  %39 = icmp ne i32 %38, 0
  %40 = select i1 %39, i32 1, i32 0
  store i32 %40, i32* %1
  br label %43

; <label>:41                                      ; preds = %0
  call void (i8*, ...)* @panic(i8* getelementptr inbounds ([33 x i8]* @.str40, i32 0, i32 0))
  br label %42

; <label>:42                                      ; preds = %41
  store i32 -1, i32* %1
  br label %43

; <label>:43                                      ; preds = %42, %37, %14, %7, %6
  %44 = load i32* %1
  ret i32 %44
}

declare i32 @printf(i8*, ...)

define internal i8* @eol_pos(i8* %str, i32 %len) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %str, i8** %2, align 8
  store i32 %len, i32* %3, align 4
  br label %4

; <label>:4                                       ; preds = %17, %0
  %5 = load i32* %3, align 4
  %6 = add nsw i32 %5, -1
  store i32 %6, i32* %3, align 4
  %7 = icmp ne i32 %5, 0
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %4
  %9 = load i8** %2, align 8
  %10 = getelementptr inbounds i8* %9, i32 1
  store i8* %10, i8** %2, align 8
  %11 = load i8* %9, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 10
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %8
  %15 = load i8** %2, align 8
  %16 = getelementptr inbounds i8* %15, i32 -1
  store i8* %16, i8** %2, align 8
  store i8* %16, i8** %1
  br label %21

; <label>:17                                      ; preds = %8
  br label %4

; <label>:18                                      ; preds = %4
  %19 = load i8** %2, align 8
  %20 = getelementptr inbounds i8* %19, i32 -1
  store i8* %20, i8** %2, align 8
  store i8* %20, i8** %1
  br label %21

; <label>:21                                      ; preds = %18, %14
  %22 = load i8** %1
  ret i8* %22
}

define internal void @chr_copy(i8* %dest, i8* %src, i32 %len) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %dest, i8** %1, align 8
  store i8* %src, i8** %2, align 8
  store i32 %len, i32* %3, align 4
  br label %4

; <label>:4                                       ; preds = %8, %0
  %5 = load i32* %3, align 4
  %6 = add nsw i32 %5, -1
  store i32 %6, i32* %3, align 4
  %7 = icmp ne i32 %5, 0
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %4
  %9 = load i8** %2, align 8
  %10 = getelementptr inbounds i8* %9, i32 1
  store i8* %10, i8** %2, align 8
  %11 = load i8* %9, align 1
  %12 = load i8** %1, align 8
  %13 = getelementptr inbounds i8* %12, i32 1
  store i8* %13, i8** %1, align 8
  store i8 %11, i8* %12, align 1
  br label %4

; <label>:14                                      ; preds = %4
  ret void
}

define void @line_copy(%struct.line* %from, %struct.line* %to) nounwind uwtable {
  %1 = alloca %struct.line*, align 8
  %2 = alloca %struct.line*, align 8
  store %struct.line* %from, %struct.line** %1, align 8
  store %struct.line* %to, %struct.line** %2, align 8
  %3 = load %struct.line** %1, align 8
  %4 = getelementptr inbounds %struct.line* %3, i32 0, i32 1
  %5 = load i32* %4, align 4
  %6 = load %struct.line** %2, align 8
  %7 = getelementptr inbounds %struct.line* %6, i32 0, i32 2
  %8 = load i32* %7, align 4
  %9 = icmp sgt i32 %5, %8
  br i1 %9, label %10, label %25

; <label>:10                                      ; preds = %0
  %11 = load %struct.line** %1, align 8
  %12 = getelementptr inbounds %struct.line* %11, i32 0, i32 1
  %13 = load i32* %12, align 4
  %14 = load %struct.line** %2, align 8
  %15 = getelementptr inbounds %struct.line* %14, i32 0, i32 2
  store i32 %13, i32* %15, align 4
  %16 = load %struct.line** %2, align 8
  %17 = getelementptr inbounds %struct.line* %16, i32 0, i32 0
  %18 = load i8** %17, align 8
  %19 = load %struct.line** %2, align 8
  %20 = getelementptr inbounds %struct.line* %19, i32 0, i32 2
  %21 = load i32* %20, align 4
  %22 = call i8* @ck_realloc(i8* %18, i32 %21)
  %23 = load %struct.line** %2, align 8
  %24 = getelementptr inbounds %struct.line* %23, i32 0, i32 0
  store i8* %22, i8** %24, align 8
  br label %25

; <label>:25                                      ; preds = %10, %0
  %26 = load %struct.line** %1, align 8
  %27 = getelementptr inbounds %struct.line* %26, i32 0, i32 0
  %28 = load i8** %27, align 8
  %29 = load %struct.line** %2, align 8
  %30 = getelementptr inbounds %struct.line* %29, i32 0, i32 0
  %31 = load i8** %30, align 8
  %32 = load %struct.line** %1, align 8
  %33 = getelementptr inbounds %struct.line* %32, i32 0, i32 1
  %34 = load i32* %33, align 4
  %35 = sext i32 %34 to i64
  call void @bcopy(i8* %28, i8* %31, i64 %35) nounwind
  %36 = load %struct.line** %1, align 8
  %37 = getelementptr inbounds %struct.line* %36, i32 0, i32 1
  %38 = load i32* %37, align 4
  %39 = load %struct.line** %2, align 8
  %40 = getelementptr inbounds %struct.line* %39, i32 0, i32 1
  store i32 %38, i32* %40, align 4
  ret void
}

define void @line_append(%struct.line* %from, %struct.line* %to) nounwind uwtable {
  %1 = alloca %struct.line*, align 8
  %2 = alloca %struct.line*, align 8
  store %struct.line* %from, %struct.line** %1, align 8
  store %struct.line* %to, %struct.line** %2, align 8
  %3 = load %struct.line** %1, align 8
  %4 = getelementptr inbounds %struct.line* %3, i32 0, i32 1
  %5 = load i32* %4, align 4
  %6 = load %struct.line** %2, align 8
  %7 = getelementptr inbounds %struct.line* %6, i32 0, i32 2
  %8 = load i32* %7, align 4
  %9 = load %struct.line** %2, align 8
  %10 = getelementptr inbounds %struct.line* %9, i32 0, i32 1
  %11 = load i32* %10, align 4
  %12 = sub nsw i32 %8, %11
  %13 = icmp sgt i32 %5, %12
  br i1 %13, label %14, label %31

; <label>:14                                      ; preds = %0
  %15 = load %struct.line** %1, align 8
  %16 = getelementptr inbounds %struct.line* %15, i32 0, i32 1
  %17 = load i32* %16, align 4
  %18 = load %struct.line** %2, align 8
  %19 = getelementptr inbounds %struct.line* %18, i32 0, i32 2
  %20 = load i32* %19, align 4
  %21 = add nsw i32 %20, %17
  store i32 %21, i32* %19, align 4
  %22 = load %struct.line** %2, align 8
  %23 = getelementptr inbounds %struct.line* %22, i32 0, i32 0
  %24 = load i8** %23, align 8
  %25 = load %struct.line** %2, align 8
  %26 = getelementptr inbounds %struct.line* %25, i32 0, i32 2
  %27 = load i32* %26, align 4
  %28 = call i8* @ck_realloc(i8* %24, i32 %27)
  %29 = load %struct.line** %2, align 8
  %30 = getelementptr inbounds %struct.line* %29, i32 0, i32 0
  store i8* %28, i8** %30, align 8
  br label %31

; <label>:31                                      ; preds = %14, %0
  %32 = load %struct.line** %1, align 8
  %33 = getelementptr inbounds %struct.line* %32, i32 0, i32 0
  %34 = load i8** %33, align 8
  %35 = load %struct.line** %2, align 8
  %36 = getelementptr inbounds %struct.line* %35, i32 0, i32 0
  %37 = load i8** %36, align 8
  %38 = load %struct.line** %2, align 8
  %39 = getelementptr inbounds %struct.line* %38, i32 0, i32 1
  %40 = load i32* %39, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8* %37, i64 %41
  %43 = load %struct.line** %1, align 8
  %44 = getelementptr inbounds %struct.line* %43, i32 0, i32 1
  %45 = load i32* %44, align 4
  %46 = sext i32 %45 to i64
  call void @bcopy(i8* %34, i8* %42, i64 %46) nounwind
  %47 = load %struct.line** %1, align 8
  %48 = getelementptr inbounds %struct.line* %47, i32 0, i32 1
  %49 = load i32* %48, align 4
  %50 = load %struct.line** %2, align 8
  %51 = getelementptr inbounds %struct.line* %50, i32 0, i32 1
  %52 = load i32* %51, align 4
  %53 = add nsw i32 %52, %49
  store i32 %53, i32* %51, align 4
  ret void
}

declare i32 @putchar(i32)

define void @append_pattern_space() nounwind uwtable {
  %p = alloca i8*, align 8
  %n = alloca i32, align 4
  %ch = alloca i32, align 4
  %1 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %2 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds i8* %1, i64 %3
  store i8* %4, i8** %p, align 8
  %5 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %6 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %7 = sub nsw i32 %5, %6
  store i32 %7, i32* %n, align 4
  %8 = load i32* @input_line_number, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* @input_line_number, align 4
  store i32 0, i32* @replaced, align 4
  br label %10

; <label>:10                                      ; preds = %58, %0
  %11 = load %struct._IO_FILE** @input_file, align 8
  %12 = call i32 @_IO_getc(%struct._IO_FILE* %11)
  store i32 %12, i32* %ch, align 4
  %13 = load i32* %ch, align 4
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %15, label %30

; <label>:15                                      ; preds = %10
  %16 = load i32* %n, align 4
  %17 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %15
  br label %75

; <label>:20                                      ; preds = %15
  %21 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %22 = load i32* %n, align 4
  %23 = sub nsw i32 %21, %22
  store i32 %23, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  %24 = load i32* @last_input_file, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %29

; <label>:26                                      ; preds = %20
  %27 = load i32* @input_EOF, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* @input_EOF, align 4
  br label %29

; <label>:29                                      ; preds = %26, %20
  br label %75

; <label>:30                                      ; preds = %10
  %31 = load i32* %n, align 4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %45

; <label>:33                                      ; preds = %30
  %34 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %35 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %36 = mul nsw i32 %35, 2
  %37 = call i8* @ck_realloc(i8* %34, i32 %36)
  store i8* %37, i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %38 = load i8** getelementptr inbounds (%struct.line* @line, i32 0, i32 0), align 8
  %39 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8* %38, i64 %40
  store i8* %41, i8** %p, align 8
  %42 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  store i32 %42, i32* %n, align 4
  %43 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %44 = mul nsw i32 %43, 2
  store i32 %44, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  br label %45

; <label>:45                                      ; preds = %33, %30
  %46 = load i32* %ch, align 4
  %47 = trunc i32 %46 to i8
  %48 = load i8** %p, align 8
  %49 = getelementptr inbounds i8* %48, i32 1
  store i8* %49, i8** %p, align 8
  store i8 %47, i8* %48, align 1
  %50 = load i32* %n, align 4
  %51 = add nsw i32 %50, -1
  store i32 %51, i32* %n, align 4
  %52 = load i32* %ch, align 4
  %53 = icmp eq i32 %52, 10
  br i1 %53, label %54, label %58

; <label>:54                                      ; preds = %45
  %55 = load i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 2), align 4
  %56 = load i32* %n, align 4
  %57 = sub nsw i32 %55, %56
  store i32 %57, i32* getelementptr inbounds (%struct.line* @line, i32 0, i32 1), align 4
  br label %59

; <label>:58                                      ; preds = %45
  br label %10

; <label>:59                                      ; preds = %54
  %60 = load %struct._IO_FILE** @input_file, align 8
  %61 = call i32 @_IO_getc(%struct._IO_FILE* %60)
  store i32 %61, i32* %ch, align 4
  %62 = load i32* %ch, align 4
  %63 = icmp ne i32 %62, -1
  br i1 %63, label %64, label %68

; <label>:64                                      ; preds = %59
  %65 = load i32* %ch, align 4
  %66 = load %struct._IO_FILE** @input_file, align 8
  %67 = call i32 @ungetc(i32 %65, %struct._IO_FILE* %66)
  br label %75

; <label>:68                                      ; preds = %59
  %69 = load i32* @last_input_file, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %74

; <label>:71                                      ; preds = %68
  %72 = load i32* @input_EOF, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* @input_EOF, align 4
  br label %74

; <label>:74                                      ; preds = %71, %68
  br label %75

; <label>:75                                      ; preds = %74, %64, %29, %19
  ret void
}

declare void @rewind(%struct._IO_FILE*)

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*)

declare i32 @ferror(%struct._IO_FILE*) nounwind

define i32 @re_search(%struct.re_pattern_buffer* %bufp, i8* %string, i32 %size, i32 %startpos, i32 %range, %struct.re_registers* %regs) nounwind uwtable {
  %1 = alloca %struct.re_pattern_buffer*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.re_registers*, align 8
  store %struct.re_pattern_buffer* %bufp, %struct.re_pattern_buffer** %1, align 8
  store i8* %string, i8** %2, align 8
  store i32 %size, i32* %3, align 4
  store i32 %startpos, i32* %4, align 4
  store i32 %range, i32* %5, align 4
  store %struct.re_registers* %regs, %struct.re_registers** %6, align 8
  %7 = load %struct.re_pattern_buffer** %1, align 8
  %8 = load i8** %2, align 8
  %9 = load i32* %3, align 4
  %10 = load i32* %4, align 4
  %11 = load i32* %5, align 4
  %12 = load %struct.re_registers** %6, align 8
  %13 = load i32* %3, align 4
  %14 = call i32 @re_search_2(%struct.re_pattern_buffer* %7, i8* null, i32 0, i8* %8, i32 %9, i32 %10, i32 %11, %struct.re_registers* %12, i32 %13)
  ret i32 %14
}

define void @str_append(%struct.line* %to, i8* %string, i32 %length) nounwind uwtable {
  %1 = alloca %struct.line*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store %struct.line* %to, %struct.line** %1, align 8
  store i8* %string, i8** %2, align 8
  store i32 %length, i32* %3, align 4
  %4 = load i32* %3, align 4
  %5 = load %struct.line** %1, align 8
  %6 = getelementptr inbounds %struct.line* %5, i32 0, i32 2
  %7 = load i32* %6, align 4
  %8 = load %struct.line** %1, align 8
  %9 = getelementptr inbounds %struct.line* %8, i32 0, i32 1
  %10 = load i32* %9, align 4
  %11 = sub nsw i32 %7, %10
  %12 = icmp sgt i32 %4, %11
  br i1 %12, label %13, label %28

; <label>:13                                      ; preds = %0
  %14 = load i32* %3, align 4
  %15 = load %struct.line** %1, align 8
  %16 = getelementptr inbounds %struct.line* %15, i32 0, i32 2
  %17 = load i32* %16, align 4
  %18 = add nsw i32 %17, %14
  store i32 %18, i32* %16, align 4
  %19 = load %struct.line** %1, align 8
  %20 = getelementptr inbounds %struct.line* %19, i32 0, i32 0
  %21 = load i8** %20, align 8
  %22 = load %struct.line** %1, align 8
  %23 = getelementptr inbounds %struct.line* %22, i32 0, i32 2
  %24 = load i32* %23, align 4
  %25 = call i8* @ck_realloc(i8* %21, i32 %24)
  %26 = load %struct.line** %1, align 8
  %27 = getelementptr inbounds %struct.line* %26, i32 0, i32 0
  store i8* %25, i8** %27, align 8
  br label %28

; <label>:28                                      ; preds = %13, %0
  %29 = load i8** %2, align 8
  %30 = load %struct.line** %1, align 8
  %31 = getelementptr inbounds %struct.line* %30, i32 0, i32 0
  %32 = load i8** %31, align 8
  %33 = load %struct.line** %1, align 8
  %34 = getelementptr inbounds %struct.line* %33, i32 0, i32 1
  %35 = load i32* %34, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8* %32, i64 %36
  %38 = load i32* %3, align 4
  %39 = sext i32 %38 to i64
  call void @bcopy(i8* %29, i8* %37, i64 %39) nounwind
  %40 = load i32* %3, align 4
  %41 = load %struct.line** %1, align 8
  %42 = getelementptr inbounds %struct.line* %41, i32 0, i32 1
  %43 = load i32* %42, align 4
  %44 = add nsw i32 %43, %40
  store i32 %44, i32* %42, align 4
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.va_start(i8*) nounwind

declare i32 @vfprintf(%struct._IO_FILE*, i8*, %struct.__va_list_tag*)

declare void @llvm.va_end(i8*) nounwind

declare i32 @_IO_putc(i32, %struct._IO_FILE*)

define i8* @__fp_name(%struct._IO_FILE* %fp) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %n = alloca i32, align 4
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %2, align 8
  store i32 0, i32* %n, align 4
  br label %3

; <label>:3                                       ; preds = %21, %0
  %4 = load i32* %n, align 4
  %5 = icmp slt i32 %4, 32
  br i1 %5, label %6, label %24

; <label>:6                                       ; preds = %3
  %7 = load i32* %n, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [32 x %struct.id]* @__id_s, i32 0, i64 %8
  %10 = getelementptr inbounds %struct.id* %9, i32 0, i32 0
  %11 = load %struct._IO_FILE** %10, align 8
  %12 = load %struct._IO_FILE** %2, align 8
  %13 = icmp eq %struct._IO_FILE* %11, %12
  br i1 %13, label %14, label %20

; <label>:14                                      ; preds = %6
  %15 = load i32* %n, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [32 x %struct.id]* @__id_s, i32 0, i64 %16
  %18 = getelementptr inbounds %struct.id* %17, i32 0, i32 1
  %19 = load i8** %18, align 8
  store i8* %19, i8** %1
  br label %25

; <label>:20                                      ; preds = %6
  br label %21

; <label>:21                                      ; preds = %20
  %22 = load i32* %n, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %n, align 4
  br label %3

; <label>:24                                      ; preds = %3
  store i8* getelementptr inbounds ([23 x i8]* @.str43, i32 0, i32 0), i8** %1
  br label %25

; <label>:25                                      ; preds = %24, %14
  %26 = load i8** %1
  ret i8* %26
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*)

declare noalias i8* @malloc(i64) nounwind

define i8* @xmalloc(i32 %size) nounwind uwtable {
  %1 = alloca i32, align 4
  store i32 %size, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = call i8* (...)* bitcast (i8* (i32)* @ck_malloc to i8* (...)*)(i32 %2)
  ret i8* %3
}

declare noalias i8* @realloc(i8*, i64) nounwind

define void @add_buffer(i8* %bb, i8* %p, i32 %n) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %b = alloca %struct.buffer*, align 8
  %x = alloca i32, align 4
  %cp = alloca i8*, align 8
  store i8* %bb, i8** %1, align 8
  store i8* %p, i8** %2, align 8
  store i32 %n, i32* %3, align 4
  %4 = load i8** %1, align 8
  %5 = bitcast i8* %4 to %struct.buffer*
  store %struct.buffer* %5, %struct.buffer** %b, align 8
  %6 = load %struct.buffer** %b, align 8
  %7 = getelementptr inbounds %struct.buffer* %6, i32 0, i32 1
  %8 = load i32* %7, align 4
  %9 = load i32* %3, align 4
  %10 = add nsw i32 %8, %9
  %11 = load %struct.buffer** %b, align 8
  %12 = getelementptr inbounds %struct.buffer* %11, i32 0, i32 0
  %13 = load i32* %12, align 4
  %14 = icmp sgt i32 %10, %13
  br i1 %14, label %15, label %29

; <label>:15                                      ; preds = %0
  %16 = load %struct.buffer** %b, align 8
  %17 = getelementptr inbounds %struct.buffer* %16, i32 0, i32 0
  %18 = load i32* %17, align 4
  %19 = mul nsw i32 %18, 2
  store i32 %19, i32* %17, align 4
  %20 = load %struct.buffer** %b, align 8
  %21 = getelementptr inbounds %struct.buffer* %20, i32 0, i32 2
  %22 = load i8** %21, align 8
  %23 = load %struct.buffer** %b, align 8
  %24 = getelementptr inbounds %struct.buffer* %23, i32 0, i32 0
  %25 = load i32* %24, align 4
  %26 = call i8* (...)* bitcast (i8* (i8*, i32)* @ck_realloc to i8* (...)*)(i8* %22, i32 %25)
  %27 = load %struct.buffer** %b, align 8
  %28 = getelementptr inbounds %struct.buffer* %27, i32 0, i32 2
  store i8* %26, i8** %28, align 8
  br label %29

; <label>:29                                      ; preds = %15, %0
  %30 = load i32* %3, align 4
  store i32 %30, i32* %x, align 4
  %31 = load %struct.buffer** %b, align 8
  %32 = getelementptr inbounds %struct.buffer* %31, i32 0, i32 2
  %33 = load i8** %32, align 8
  %34 = load %struct.buffer** %b, align 8
  %35 = getelementptr inbounds %struct.buffer* %34, i32 0, i32 1
  %36 = load i32* %35, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8* %33, i64 %37
  store i8* %38, i8** %cp, align 8
  br label %39

; <label>:39                                      ; preds = %43, %29
  %40 = load i32* %x, align 4
  %41 = add nsw i32 %40, -1
  store i32 %41, i32* %x, align 4
  %42 = icmp ne i32 %40, 0
  br i1 %42, label %43, label %49

; <label>:43                                      ; preds = %39
  %44 = load i8** %2, align 8
  %45 = getelementptr inbounds i8* %44, i32 1
  store i8* %45, i8** %2, align 8
  %46 = load i8* %44, align 1
  %47 = load i8** %cp, align 8
  %48 = getelementptr inbounds i8* %47, i32 1
  store i8* %48, i8** %cp, align 8
  store i8 %46, i8* %47, align 1
  br label %39

; <label>:49                                      ; preds = %39
  %50 = load i32* %3, align 4
  %51 = load %struct.buffer** %b, align 8
  %52 = getelementptr inbounds %struct.buffer* %51, i32 0, i32 1
  %53 = load i32* %52, align 4
  %54 = add nsw i32 %53, %50
  store i32 %54, i32* %52, align 4
  ret void
}

define i32 @re_compile_fastmap(%struct.re_pattern_buffer* %bufp) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca %struct.re_pattern_buffer*, align 8
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %fail_stack = alloca %struct.fail_stack_type, align 8
  %destination = alloca i8*, align 8
  %num_regs = alloca i32, align 4
  %fastmap = alloca i8*, align 8
  %pattern = alloca i8*, align 8
  %size = alloca i64, align 8
  %p = alloca i8*, align 8
  %pend = alloca i8*, align 8
  %path_can_be_null = alloca i8, align 1
  %succeed_n_p = alloca i8, align 1
  store %struct.re_pattern_buffer* %bufp, %struct.re_pattern_buffer** %2, align 8
  store i32 0, i32* %num_regs, align 4
  %3 = load %struct.re_pattern_buffer** %2, align 8
  %4 = getelementptr inbounds %struct.re_pattern_buffer* %3, i32 0, i32 4
  %5 = load i8** %4, align 8
  store i8* %5, i8** %fastmap, align 8
  %6 = load %struct.re_pattern_buffer** %2, align 8
  %7 = getelementptr inbounds %struct.re_pattern_buffer* %6, i32 0, i32 0
  %8 = load i8** %7, align 8
  store i8* %8, i8** %pattern, align 8
  %9 = load %struct.re_pattern_buffer** %2, align 8
  %10 = getelementptr inbounds %struct.re_pattern_buffer* %9, i32 0, i32 2
  %11 = load i64* %10, align 8
  store i64 %11, i64* %size, align 8
  %12 = load i8** %pattern, align 8
  store i8* %12, i8** %p, align 8
  %13 = load i8** %pattern, align 8
  %14 = load i64* %size, align 8
  %15 = getelementptr inbounds i8* %13, i64 %14
  store i8* %15, i8** %pend, align 8
  store i8 1, i8* %path_can_be_null, align 1
  store i8 0, i8* %succeed_n_p, align 1
  br label %16

; <label>:16                                      ; preds = %0
  %17 = alloca i8, i64 40
  %18 = bitcast i8* %17 to i8**
  %19 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  store i8** %18, i8*** %19, align 8
  %20 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %21 = load i8*** %20, align 8
  %22 = icmp eq i8** %21, null
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %16
  store i32 -2, i32* %1
  br label %508

; <label>:24                                      ; preds = %16
  %25 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  store i32 5, i32* %25, align 4
  %26 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  store i32 0, i32* %26, align 4
  br label %27

; <label>:27                                      ; preds = %24
  %28 = load i8** %fastmap, align 8
  call void @llvm.memset.p0i8.i64(i8* %28, i8 0, i64 256, i32 1, i1 false)
  %29 = load %struct.re_pattern_buffer** %2, align 8
  %30 = bitcast %struct.re_pattern_buffer* %29 to i8*
  %31 = getelementptr i8* %30, i32 56
  %32 = bitcast i8* %31 to i32*
  %33 = load i32* %32, align 8
  %34 = and i32 %33, -9
  %35 = or i32 %34, 8
  store i32 %35, i32* %32, align 8
  %36 = load %struct.re_pattern_buffer** %2, align 8
  %37 = bitcast %struct.re_pattern_buffer* %36 to i8*
  %38 = getelementptr i8* %37, i32 56
  %39 = bitcast i8* %38 to i32*
  %40 = load i32* %39, align 8
  %41 = and i32 %40, -2
  store i32 %41, i32* %39, align 8
  br label %42

; <label>:42                                      ; preds = %488, %484, %481, %480, %454, %338, %295, %284, %259, %27
  %43 = load i8** %p, align 8
  %44 = load i8** %pend, align 8
  %45 = icmp ne i8* %43, %44
  br i1 %45, label %51, label %46

; <label>:46                                      ; preds = %42
  %47 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %48 = load i32* %47, align 4
  %49 = icmp eq i32 %48, 0
  %50 = xor i1 %49, true
  br label %51

; <label>:51                                      ; preds = %46, %42
  %52 = phi i1 [ true, %42 ], [ %50, %46 ]
  br i1 %52, label %53, label %490

; <label>:53                                      ; preds = %51
  %54 = load i8** %p, align 8
  %55 = load i8** %pend, align 8
  %56 = icmp eq i8* %54, %55
  br i1 %56, label %57, label %83

; <label>:57                                      ; preds = %53
  %58 = load i8* %path_can_be_null, align 1
  %59 = sext i8 %58 to i32
  %60 = load %struct.re_pattern_buffer** %2, align 8
  %61 = bitcast %struct.re_pattern_buffer* %60 to i8*
  %62 = getelementptr i8* %61, i32 56
  %63 = bitcast i8* %62 to i32*
  %64 = load i32* %63, align 8
  %65 = and i32 %64, 1
  %66 = or i32 %65, %59
  %67 = and i32 %66, 1
  %68 = bitcast %struct.re_pattern_buffer* %60 to i8*
  %69 = getelementptr i8* %68, i32 56
  %70 = bitcast i8* %69 to i32*
  %71 = and i32 %67, 1
  %72 = load i32* %70, align 8
  %73 = and i32 %72, -2
  %74 = or i32 %73, %71
  store i32 %74, i32* %70, align 8
  store i8 1, i8* %path_can_be_null, align 1
  %75 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %76 = load i32* %75, align 4
  %77 = add i32 %76, -1
  store i32 %77, i32* %75, align 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %80 = load i8*** %79, align 8
  %81 = getelementptr inbounds i8** %80, i64 %78
  %82 = load i8** %81, align 8
  store i8* %82, i8** %p, align 8
  br label %83

; <label>:83                                      ; preds = %57, %53
  %84 = load i8** %p, align 8
  %85 = getelementptr inbounds i8* %84, i32 1
  store i8* %85, i8** %p, align 8
  %86 = load i8* %84, align 1
  %87 = zext i8 %86 to i32
  switch i32 %87, label %487 [
    i32 7, label %88
    i32 1, label %96
    i32 3, label %103
    i32 4, label %136
    i32 23, label %185
    i32 24, label %206
    i32 2, label %227
    i32 0, label %259
    i32 8, label %259
    i32 9, label %259
    i32 10, label %259
    i32 11, label %259
    i32 27, label %259
    i32 28, label %259
    i32 25, label %259
    i32 26, label %259
    i32 19, label %259
    i32 21, label %260
    i32 16, label %260
    i32 17, label %260
    i32 12, label %260
    i32 13, label %260
    i32 18, label %260
    i32 14, label %339
    i32 15, label %339
    i32 20, label %455
    i32 22, label %481
    i32 5, label %484
    i32 6, label %484
  ]

; <label>:88                                      ; preds = %83
  %89 = load %struct.re_pattern_buffer** %2, align 8
  %90 = bitcast %struct.re_pattern_buffer* %89 to i8*
  %91 = getelementptr i8* %90, i32 56
  %92 = bitcast i8* %91 to i32*
  %93 = load i32* %92, align 8
  %94 = and i32 %93, -2
  %95 = or i32 %94, 1
  store i32 %95, i32* %92, align 8
  store i32 0, i32* %1
  br label %508

; <label>:96                                      ; preds = %83
  %97 = load i8** %p, align 8
  %98 = getelementptr inbounds i8* %97, i64 1
  %99 = load i8* %98, align 1
  %100 = zext i8 %99 to i64
  %101 = load i8** %fastmap, align 8
  %102 = getelementptr inbounds i8* %101, i64 %100
  store i8 1, i8* %102, align 1
  br label %488

; <label>:103                                     ; preds = %83
  %104 = load i8** %p, align 8
  %105 = getelementptr inbounds i8* %104, i32 1
  store i8* %105, i8** %p, align 8
  %106 = load i8* %104, align 1
  %107 = zext i8 %106 to i32
  %108 = mul nsw i32 %107, 8
  %109 = sub nsw i32 %108, 1
  store i32 %109, i32* %j, align 4
  br label %110

; <label>:110                                     ; preds = %132, %103
  %111 = load i32* %j, align 4
  %112 = icmp sge i32 %111, 0
  br i1 %112, label %113, label %135

; <label>:113                                     ; preds = %110
  %114 = load i32* %j, align 4
  %115 = sdiv i32 %114, 8
  %116 = sext i32 %115 to i64
  %117 = load i8** %p, align 8
  %118 = getelementptr inbounds i8* %117, i64 %116
  %119 = load i8* %118, align 1
  %120 = zext i8 %119 to i32
  %121 = load i32* %j, align 4
  %122 = srem i32 %121, 8
  %123 = shl i32 1, %122
  %124 = and i32 %120, %123
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %131

; <label>:126                                     ; preds = %113
  %127 = load i32* %j, align 4
  %128 = sext i32 %127 to i64
  %129 = load i8** %fastmap, align 8
  %130 = getelementptr inbounds i8* %129, i64 %128
  store i8 1, i8* %130, align 1
  br label %131

; <label>:131                                     ; preds = %126, %113
  br label %132

; <label>:132                                     ; preds = %131
  %133 = load i32* %j, align 4
  %134 = add nsw i32 %133, -1
  store i32 %134, i32* %j, align 4
  br label %110

; <label>:135                                     ; preds = %110
  br label %488

; <label>:136                                     ; preds = %83
  %137 = load i8** %p, align 8
  %138 = load i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = mul nsw i32 %139, 8
  store i32 %140, i32* %j, align 4
  br label %141

; <label>:141                                     ; preds = %149, %136
  %142 = load i32* %j, align 4
  %143 = icmp slt i32 %142, 256
  br i1 %143, label %144, label %152

; <label>:144                                     ; preds = %141
  %145 = load i32* %j, align 4
  %146 = sext i32 %145 to i64
  %147 = load i8** %fastmap, align 8
  %148 = getelementptr inbounds i8* %147, i64 %146
  store i8 1, i8* %148, align 1
  br label %149

; <label>:149                                     ; preds = %144
  %150 = load i32* %j, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %j, align 4
  br label %141

; <label>:152                                     ; preds = %141
  %153 = load i8** %p, align 8
  %154 = getelementptr inbounds i8* %153, i32 1
  store i8* %154, i8** %p, align 8
  %155 = load i8* %153, align 1
  %156 = zext i8 %155 to i32
  %157 = mul nsw i32 %156, 8
  %158 = sub nsw i32 %157, 1
  store i32 %158, i32* %j, align 4
  br label %159

; <label>:159                                     ; preds = %181, %152
  %160 = load i32* %j, align 4
  %161 = icmp sge i32 %160, 0
  br i1 %161, label %162, label %184

; <label>:162                                     ; preds = %159
  %163 = load i32* %j, align 4
  %164 = sdiv i32 %163, 8
  %165 = sext i32 %164 to i64
  %166 = load i8** %p, align 8
  %167 = getelementptr inbounds i8* %166, i64 %165
  %168 = load i8* %167, align 1
  %169 = zext i8 %168 to i32
  %170 = load i32* %j, align 4
  %171 = srem i32 %170, 8
  %172 = shl i32 1, %171
  %173 = and i32 %169, %172
  %174 = icmp ne i32 %173, 0
  br i1 %174, label %180, label %175

; <label>:175                                     ; preds = %162
  %176 = load i32* %j, align 4
  %177 = sext i32 %176 to i64
  %178 = load i8** %fastmap, align 8
  %179 = getelementptr inbounds i8* %178, i64 %177
  store i8 1, i8* %179, align 1
  br label %180

; <label>:180                                     ; preds = %175, %162
  br label %181

; <label>:181                                     ; preds = %180
  %182 = load i32* %j, align 4
  %183 = add nsw i32 %182, -1
  store i32 %183, i32* %j, align 4
  br label %159

; <label>:184                                     ; preds = %159
  br label %488

; <label>:185                                     ; preds = %83
  store i32 0, i32* %j, align 4
  br label %186

; <label>:186                                     ; preds = %202, %185
  %187 = load i32* %j, align 4
  %188 = icmp slt i32 %187, 256
  br i1 %188, label %189, label %205

; <label>:189                                     ; preds = %186
  %190 = load i32* %j, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %191
  %193 = load i8* %192, align 1
  %194 = sext i8 %193 to i32
  %195 = icmp eq i32 %194, 1
  br i1 %195, label %196, label %201

; <label>:196                                     ; preds = %189
  %197 = load i32* %j, align 4
  %198 = sext i32 %197 to i64
  %199 = load i8** %fastmap, align 8
  %200 = getelementptr inbounds i8* %199, i64 %198
  store i8 1, i8* %200, align 1
  br label %201

; <label>:201                                     ; preds = %196, %189
  br label %202

; <label>:202                                     ; preds = %201
  %203 = load i32* %j, align 4
  %204 = add nsw i32 %203, 1
  store i32 %204, i32* %j, align 4
  br label %186

; <label>:205                                     ; preds = %186
  br label %488

; <label>:206                                     ; preds = %83
  store i32 0, i32* %j, align 4
  br label %207

; <label>:207                                     ; preds = %223, %206
  %208 = load i32* %j, align 4
  %209 = icmp slt i32 %208, 256
  br i1 %209, label %210, label %226

; <label>:210                                     ; preds = %207
  %211 = load i32* %j, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %212
  %214 = load i8* %213, align 1
  %215 = sext i8 %214 to i32
  %216 = icmp ne i32 %215, 1
  br i1 %216, label %217, label %222

; <label>:217                                     ; preds = %210
  %218 = load i32* %j, align 4
  %219 = sext i32 %218 to i64
  %220 = load i8** %fastmap, align 8
  %221 = getelementptr inbounds i8* %220, i64 %219
  store i8 1, i8* %221, align 1
  br label %222

; <label>:222                                     ; preds = %217, %210
  br label %223

; <label>:223                                     ; preds = %222
  %224 = load i32* %j, align 4
  %225 = add nsw i32 %224, 1
  store i32 %225, i32* %j, align 4
  br label %207

; <label>:226                                     ; preds = %207
  br label %488

; <label>:227                                     ; preds = %83
  store i32 0, i32* %j, align 4
  br label %228

; <label>:228                                     ; preds = %236, %227
  %229 = load i32* %j, align 4
  %230 = icmp slt i32 %229, 256
  br i1 %230, label %231, label %239

; <label>:231                                     ; preds = %228
  %232 = load i32* %j, align 4
  %233 = sext i32 %232 to i64
  %234 = load i8** %fastmap, align 8
  %235 = getelementptr inbounds i8* %234, i64 %233
  store i8 1, i8* %235, align 1
  br label %236

; <label>:236                                     ; preds = %231
  %237 = load i32* %j, align 4
  %238 = add nsw i32 %237, 1
  store i32 %238, i32* %j, align 4
  br label %228

; <label>:239                                     ; preds = %228
  %240 = load %struct.re_pattern_buffer** %2, align 8
  %241 = getelementptr inbounds %struct.re_pattern_buffer* %240, i32 0, i32 3
  %242 = load i32* %241, align 4
  %243 = and i32 %242, 64
  %244 = icmp ne i32 %243, 0
  br i1 %244, label %248, label %245

; <label>:245                                     ; preds = %239
  %246 = load i8** %fastmap, align 8
  %247 = getelementptr inbounds i8* %246, i64 10
  store i8 0, i8* %247, align 1
  br label %258

; <label>:248                                     ; preds = %239
  %249 = load %struct.re_pattern_buffer** %2, align 8
  %250 = bitcast %struct.re_pattern_buffer* %249 to i8*
  %251 = getelementptr i8* %250, i32 56
  %252 = bitcast i8* %251 to i32*
  %253 = load i32* %252, align 8
  %254 = and i32 %253, 1
  %255 = icmp ne i32 %254, 0
  br i1 %255, label %256, label %257

; <label>:256                                     ; preds = %248
  store i32 0, i32* %1
  br label %508

; <label>:257                                     ; preds = %248
  br label %258

; <label>:258                                     ; preds = %257, %245
  br label %488

; <label>:259                                     ; preds = %83, %83, %83, %83, %83, %83, %83, %83, %83, %83
  br label %42

; <label>:260                                     ; preds = %83, %83, %83, %83, %83, %83
  br label %261

; <label>:261                                     ; preds = %260
  br label %262

; <label>:262                                     ; preds = %261
  %263 = load i8** %p, align 8
  %264 = load i8* %263, align 1
  %265 = zext i8 %264 to i32
  %266 = and i32 %265, 255
  store i32 %266, i32* %j, align 4
  %267 = load i8** %p, align 8
  %268 = getelementptr inbounds i8* %267, i64 1
  %269 = load i8* %268, align 1
  %270 = sext i8 %269 to i32
  %271 = shl i32 %270, 8
  %272 = load i32* %j, align 4
  %273 = add nsw i32 %272, %271
  store i32 %273, i32* %j, align 4
  br label %274

; <label>:274                                     ; preds = %262
  %275 = load i8** %p, align 8
  %276 = getelementptr inbounds i8* %275, i64 2
  store i8* %276, i8** %p, align 8
  br label %277

; <label>:277                                     ; preds = %274
  %278 = load i32* %j, align 4
  %279 = load i8** %p, align 8
  %280 = sext i32 %278 to i64
  %281 = getelementptr inbounds i8* %279, i64 %280
  store i8* %281, i8** %p, align 8
  %282 = load i32* %j, align 4
  %283 = icmp sgt i32 %282, 0
  br i1 %283, label %284, label %285

; <label>:284                                     ; preds = %277
  br label %42

; <label>:285                                     ; preds = %277
  %286 = load i8** %p, align 8
  %287 = load i8* %286, align 1
  %288 = zext i8 %287 to i32
  %289 = icmp ne i32 %288, 14
  br i1 %289, label %290, label %296

; <label>:290                                     ; preds = %285
  %291 = load i8** %p, align 8
  %292 = load i8* %291, align 1
  %293 = zext i8 %292 to i32
  %294 = icmp ne i32 %293, 20
  br i1 %294, label %295, label %296

; <label>:295                                     ; preds = %290
  br label %42

; <label>:296                                     ; preds = %290, %285
  %297 = load i8** %p, align 8
  %298 = getelementptr inbounds i8* %297, i32 1
  store i8* %298, i8** %p, align 8
  br label %299

; <label>:299                                     ; preds = %296
  br label %300

; <label>:300                                     ; preds = %299
  %301 = load i8** %p, align 8
  %302 = load i8* %301, align 1
  %303 = zext i8 %302 to i32
  %304 = and i32 %303, 255
  store i32 %304, i32* %j, align 4
  %305 = load i8** %p, align 8
  %306 = getelementptr inbounds i8* %305, i64 1
  %307 = load i8* %306, align 1
  %308 = sext i8 %307 to i32
  %309 = shl i32 %308, 8
  %310 = load i32* %j, align 4
  %311 = add nsw i32 %310, %309
  store i32 %311, i32* %j, align 4
  br label %312

; <label>:312                                     ; preds = %300
  %313 = load i8** %p, align 8
  %314 = getelementptr inbounds i8* %313, i64 2
  store i8* %314, i8** %p, align 8
  br label %315

; <label>:315                                     ; preds = %312
  %316 = load i32* %j, align 4
  %317 = load i8** %p, align 8
  %318 = sext i32 %316 to i64
  %319 = getelementptr inbounds i8* %317, i64 %318
  store i8* %319, i8** %p, align 8
  %320 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %321 = load i32* %320, align 4
  %322 = icmp eq i32 %321, 0
  br i1 %322, label %338, label %323

; <label>:323                                     ; preds = %315
  %324 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %325 = load i32* %324, align 4
  %326 = sub i32 %325, 1
  %327 = zext i32 %326 to i64
  %328 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %329 = load i8*** %328, align 8
  %330 = getelementptr inbounds i8** %329, i64 %327
  %331 = load i8** %330, align 8
  %332 = load i8** %p, align 8
  %333 = icmp eq i8* %331, %332
  br i1 %333, label %334, label %338

; <label>:334                                     ; preds = %323
  %335 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %336 = load i32* %335, align 4
  %337 = add i32 %336, -1
  store i32 %337, i32* %335, align 4
  br label %338

; <label>:338                                     ; preds = %334, %323, %315
  br label %42

; <label>:339                                     ; preds = %83, %83
  br label %340

; <label>:340                                     ; preds = %477, %339
  br label %341

; <label>:341                                     ; preds = %340
  br label %342

; <label>:342                                     ; preds = %341
  %343 = load i8** %p, align 8
  %344 = load i8* %343, align 1
  %345 = zext i8 %344 to i32
  %346 = and i32 %345, 255
  store i32 %346, i32* %j, align 4
  %347 = load i8** %p, align 8
  %348 = getelementptr inbounds i8* %347, i64 1
  %349 = load i8* %348, align 1
  %350 = sext i8 %349 to i32
  %351 = shl i32 %350, 8
  %352 = load i32* %j, align 4
  %353 = add nsw i32 %352, %351
  store i32 %353, i32* %j, align 4
  br label %354

; <label>:354                                     ; preds = %342
  %355 = load i8** %p, align 8
  %356 = getelementptr inbounds i8* %355, i64 2
  store i8* %356, i8** %p, align 8
  br label %357

; <label>:357                                     ; preds = %354
  %358 = load i8** %p, align 8
  %359 = load i32* %j, align 4
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds i8* %358, i64 %360
  %362 = load i8** %pend, align 8
  %363 = icmp ult i8* %361, %362
  br i1 %363, label %364, label %425

; <label>:364                                     ; preds = %357
  %365 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %366 = load i32* %365, align 4
  %367 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %368 = load i32* %367, align 4
  %369 = icmp eq i32 %366, %368
  br i1 %369, label %370, label %411

; <label>:370                                     ; preds = %364
  %371 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %372 = load i32* %371, align 4
  %373 = load i32* @re_max_failures, align 4
  %374 = load i32* %num_regs, align 4
  %375 = sub i32 %374, 1
  %376 = mul i32 %375, 3
  %377 = add i32 %376, 4
  %378 = mul i32 %373, %377
  %379 = icmp ugt i32 %372, %378
  br i1 %379, label %380, label %381

; <label>:380                                     ; preds = %370
  br i1 false, label %411, label %410

; <label>:381                                     ; preds = %370
  %382 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %383 = load i32* %382, align 4
  %384 = shl i32 %383, 1
  %385 = zext i32 %384 to i64
  %386 = mul i64 %385, 8
  %387 = alloca i8, i64 %386
  store i8* %387, i8** %destination, align 8
  %388 = load i8** %destination, align 8
  %389 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %390 = load i8*** %389, align 8
  %391 = bitcast i8** %390 to i8*
  %392 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %393 = load i32* %392, align 4
  %394 = zext i32 %393 to i64
  %395 = mul i64 %394, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %388, i8* %391, i64 %395, i32 1, i1 false)
  %396 = load i8** %destination, align 8
  %397 = bitcast i8* %396 to i8**
  %398 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  store i8** %397, i8*** %398, align 8
  %399 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %400 = load i8*** %399, align 8
  %401 = icmp eq i8** %400, null
  br i1 %401, label %402, label %403

; <label>:402                                     ; preds = %381
  br label %407

; <label>:403                                     ; preds = %381
  %404 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %405 = load i32* %404, align 4
  %406 = shl i32 %405, 1
  store i32 %406, i32* %404, align 4
  br label %407

; <label>:407                                     ; preds = %403, %402
  %408 = phi i32 [ 0, %402 ], [ 1, %403 ]
  %409 = icmp ne i32 %408, 0
  br i1 %409, label %411, label %410

; <label>:410                                     ; preds = %407, %380
  br i1 false, label %424, label %423

; <label>:411                                     ; preds = %407, %380, %364
  %412 = load i8** %p, align 8
  %413 = load i32* %j, align 4
  %414 = sext i32 %413 to i64
  %415 = getelementptr inbounds i8* %412, i64 %414
  %416 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %417 = load i32* %416, align 4
  %418 = add i32 %417, 1
  store i32 %418, i32* %416, align 4
  %419 = zext i32 %417 to i64
  %420 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %421 = load i8*** %420, align 8
  %422 = getelementptr inbounds i8** %421, i64 %419
  store i8* %415, i8** %422, align 8
  br i1 true, label %424, label %423

; <label>:423                                     ; preds = %411, %410
  store i32 -2, i32* %1
  br label %508

; <label>:424                                     ; preds = %411, %410
  br label %433

; <label>:425                                     ; preds = %357
  %426 = load %struct.re_pattern_buffer** %2, align 8
  %427 = bitcast %struct.re_pattern_buffer* %426 to i8*
  %428 = getelementptr i8* %427, i32 56
  %429 = bitcast i8* %428 to i32*
  %430 = load i32* %429, align 8
  %431 = and i32 %430, -2
  %432 = or i32 %431, 1
  store i32 %432, i32* %429, align 8
  br label %433

; <label>:433                                     ; preds = %425, %424
  %434 = load i8* %succeed_n_p, align 1
  %435 = icmp ne i8 %434, 0
  br i1 %435, label %436, label %454

; <label>:436                                     ; preds = %433
  br label %437

; <label>:437                                     ; preds = %436
  br label %438

; <label>:438                                     ; preds = %437
  %439 = load i8** %p, align 8
  %440 = load i8* %439, align 1
  %441 = zext i8 %440 to i32
  %442 = and i32 %441, 255
  store i32 %442, i32* %k, align 4
  %443 = load i8** %p, align 8
  %444 = getelementptr inbounds i8* %443, i64 1
  %445 = load i8* %444, align 1
  %446 = sext i8 %445 to i32
  %447 = shl i32 %446, 8
  %448 = load i32* %k, align 4
  %449 = add nsw i32 %448, %447
  store i32 %449, i32* %k, align 4
  br label %450

; <label>:450                                     ; preds = %438
  %451 = load i8** %p, align 8
  %452 = getelementptr inbounds i8* %451, i64 2
  store i8* %452, i8** %p, align 8
  br label %453

; <label>:453                                     ; preds = %450
  store i8 0, i8* %succeed_n_p, align 1
  br label %454

; <label>:454                                     ; preds = %453, %433
  br label %42

; <label>:455                                     ; preds = %83
  %456 = load i8** %p, align 8
  %457 = getelementptr inbounds i8* %456, i64 2
  store i8* %457, i8** %p, align 8
  br label %458

; <label>:458                                     ; preds = %455
  br label %459

; <label>:459                                     ; preds = %458
  %460 = load i8** %p, align 8
  %461 = load i8* %460, align 1
  %462 = zext i8 %461 to i32
  %463 = and i32 %462, 255
  store i32 %463, i32* %k, align 4
  %464 = load i8** %p, align 8
  %465 = getelementptr inbounds i8* %464, i64 1
  %466 = load i8* %465, align 1
  %467 = sext i8 %466 to i32
  %468 = shl i32 %467, 8
  %469 = load i32* %k, align 4
  %470 = add nsw i32 %469, %468
  store i32 %470, i32* %k, align 4
  br label %471

; <label>:471                                     ; preds = %459
  %472 = load i8** %p, align 8
  %473 = getelementptr inbounds i8* %472, i64 2
  store i8* %473, i8** %p, align 8
  br label %474

; <label>:474                                     ; preds = %471
  %475 = load i32* %k, align 4
  %476 = icmp eq i32 %475, 0
  br i1 %476, label %477, label %480

; <label>:477                                     ; preds = %474
  %478 = load i8** %p, align 8
  %479 = getelementptr inbounds i8* %478, i64 -4
  store i8* %479, i8** %p, align 8
  store i8 1, i8* %succeed_n_p, align 1
  br label %340

; <label>:480                                     ; preds = %474
  br label %42

; <label>:481                                     ; preds = %83
  %482 = load i8** %p, align 8
  %483 = getelementptr inbounds i8* %482, i64 4
  store i8* %483, i8** %p, align 8
  br label %42

; <label>:484                                     ; preds = %83, %83
  %485 = load i8** %p, align 8
  %486 = getelementptr inbounds i8* %485, i64 2
  store i8* %486, i8** %p, align 8
  br label %42

; <label>:487                                     ; preds = %83
  call void @abort() noreturn nounwind
  unreachable

; <label>:488                                     ; preds = %258, %226, %205, %184, %135, %96
  store i8 0, i8* %path_can_be_null, align 1
  %489 = load i8** %pend, align 8
  store i8* %489, i8** %p, align 8
  br label %42

; <label>:490                                     ; preds = %51
  %491 = load i8* %path_can_be_null, align 1
  %492 = sext i8 %491 to i32
  %493 = load %struct.re_pattern_buffer** %2, align 8
  %494 = bitcast %struct.re_pattern_buffer* %493 to i8*
  %495 = getelementptr i8* %494, i32 56
  %496 = bitcast i8* %495 to i32*
  %497 = load i32* %496, align 8
  %498 = and i32 %497, 1
  %499 = or i32 %498, %492
  %500 = and i32 %499, 1
  %501 = bitcast %struct.re_pattern_buffer* %493 to i8*
  %502 = getelementptr i8* %501, i32 56
  %503 = bitcast i8* %502 to i32*
  %504 = and i32 %500, 1
  %505 = load i32* %503, align 8
  %506 = and i32 %505, -2
  %507 = or i32 %506, %504
  store i32 %507, i32* %503, align 8
  store i32 0, i32* %1
  br label %508

; <label>:508                                     ; preds = %490, %423, %256, %88, %23
  %509 = load i32* %1
  ret i32 %509
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

define void @re_set_registers(%struct.re_pattern_buffer* %bufp, %struct.re_registers* %regs, i32 %num_regs, i32* %starts, i32* %ends) nounwind uwtable {
  %1 = alloca %struct.re_pattern_buffer*, align 8
  %2 = alloca %struct.re_registers*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  store %struct.re_pattern_buffer* %bufp, %struct.re_pattern_buffer** %1, align 8
  store %struct.re_registers* %regs, %struct.re_registers** %2, align 8
  store i32 %num_regs, i32* %3, align 4
  store i32* %starts, i32** %4, align 8
  store i32* %ends, i32** %5, align 8
  %6 = load i32* %3, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %25

; <label>:8                                       ; preds = %0
  %9 = load %struct.re_pattern_buffer** %1, align 8
  %10 = bitcast %struct.re_pattern_buffer* %9 to i8*
  %11 = getelementptr i8* %10, i32 56
  %12 = bitcast i8* %11 to i32*
  %13 = load i32* %12, align 8
  %14 = and i32 %13, -7
  %15 = or i32 %14, 2
  store i32 %15, i32* %12, align 8
  %16 = load i32* %3, align 4
  %17 = load %struct.re_registers** %2, align 8
  %18 = getelementptr inbounds %struct.re_registers* %17, i32 0, i32 0
  store i32 %16, i32* %18, align 4
  %19 = load i32** %4, align 8
  %20 = load %struct.re_registers** %2, align 8
  %21 = getelementptr inbounds %struct.re_registers* %20, i32 0, i32 1
  store i32* %19, i32** %21, align 8
  %22 = load i32** %5, align 8
  %23 = load %struct.re_registers** %2, align 8
  %24 = getelementptr inbounds %struct.re_registers* %23, i32 0, i32 2
  store i32* %22, i32** %24, align 8
  br label %38

; <label>:25                                      ; preds = %0
  %26 = load %struct.re_pattern_buffer** %1, align 8
  %27 = bitcast %struct.re_pattern_buffer* %26 to i8*
  %28 = getelementptr i8* %27, i32 56
  %29 = bitcast i8* %28 to i32*
  %30 = load i32* %29, align 8
  %31 = and i32 %30, -7
  store i32 %31, i32* %29, align 8
  %32 = load %struct.re_registers** %2, align 8
  %33 = getelementptr inbounds %struct.re_registers* %32, i32 0, i32 0
  store i32 0, i32* %33, align 4
  %34 = load %struct.re_registers** %2, align 8
  %35 = getelementptr inbounds %struct.re_registers* %34, i32 0, i32 2
  store i32* null, i32** %35, align 8
  %36 = load %struct.re_registers** %2, align 8
  %37 = getelementptr inbounds %struct.re_registers* %36, i32 0, i32 1
  store i32* null, i32** %37, align 8
  br label %38

; <label>:38                                      ; preds = %25, %8
  ret void
}

define i32 @re_search_2(%struct.re_pattern_buffer* %bufp, i8* %string1, i32 %size1, i8* %string2, i32 %size2, i32 %startpos, i32 %range, %struct.re_registers* %regs, i32 %stop) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca %struct.re_pattern_buffer*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.re_registers*, align 8
  %10 = alloca i32, align 4
  %val = alloca i32, align 4
  %fastmap = alloca i8*, align 8
  %translate = alloca i8*, align 8
  %total_size = alloca i32, align 4
  %endpos = alloca i32, align 4
  %d = alloca i8*, align 8
  %lim = alloca i32, align 4
  %irange = alloca i32, align 4
  %c = alloca i8, align 1
  store %struct.re_pattern_buffer* %bufp, %struct.re_pattern_buffer** %2, align 8
  store i8* %string1, i8** %3, align 8
  store i32 %size1, i32* %4, align 4
  store i8* %string2, i8** %5, align 8
  store i32 %size2, i32* %6, align 4
  store i32 %startpos, i32* %7, align 4
  store i32 %range, i32* %8, align 4
  store %struct.re_registers* %regs, %struct.re_registers** %9, align 8
  store i32 %stop, i32* %10, align 4
  %11 = load %struct.re_pattern_buffer** %2, align 8
  %12 = getelementptr inbounds %struct.re_pattern_buffer* %11, i32 0, i32 4
  %13 = load i8** %12, align 8
  store i8* %13, i8** %fastmap, align 8
  %14 = load %struct.re_pattern_buffer** %2, align 8
  %15 = getelementptr inbounds %struct.re_pattern_buffer* %14, i32 0, i32 5
  %16 = load i8** %15, align 8
  store i8* %16, i8** %translate, align 8
  %17 = load i32* %4, align 4
  %18 = load i32* %6, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, i32* %total_size, align 4
  %20 = load i32* %7, align 4
  %21 = load i32* %8, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, i32* %endpos, align 4
  %23 = load i32* %7, align 4
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %29, label %25

; <label>:25                                      ; preds = %0
  %26 = load i32* %7, align 4
  %27 = load i32* %total_size, align 4
  %28 = icmp sgt i32 %26, %27
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %25, %0
  store i32 -1, i32* %1
  br label %299

; <label>:30                                      ; preds = %25
  %31 = load i32* %endpos, align 4
  %32 = icmp slt i32 %31, -1
  br i1 %32, label %33, label %36

; <label>:33                                      ; preds = %30
  %34 = load i32* %7, align 4
  %35 = sub nsw i32 -1, %34
  store i32 %35, i32* %8, align 4
  br label %45

; <label>:36                                      ; preds = %30
  %37 = load i32* %endpos, align 4
  %38 = load i32* %total_size, align 4
  %39 = icmp sgt i32 %37, %38
  br i1 %39, label %40, label %44

; <label>:40                                      ; preds = %36
  %41 = load i32* %total_size, align 4
  %42 = load i32* %7, align 4
  %43 = sub nsw i32 %41, %42
  store i32 %43, i32* %8, align 4
  br label %44

; <label>:44                                      ; preds = %40, %36
  br label %45

; <label>:45                                      ; preds = %44, %33
  %46 = load %struct.re_pattern_buffer** %2, align 8
  %47 = getelementptr inbounds %struct.re_pattern_buffer* %46, i32 0, i32 2
  %48 = load i64* %47, align 8
  %49 = icmp ugt i64 %48, 0
  br i1 %49, label %50, label %67

; <label>:50                                      ; preds = %45
  %51 = load %struct.re_pattern_buffer** %2, align 8
  %52 = getelementptr inbounds %struct.re_pattern_buffer* %51, i32 0, i32 0
  %53 = load i8** %52, align 8
  %54 = getelementptr inbounds i8* %53, i64 0
  %55 = load i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = icmp eq i32 %56, 10
  br i1 %57, label %58, label %67

; <label>:58                                      ; preds = %50
  %59 = load i32* %8, align 4
  %60 = icmp sgt i32 %59, 0
  br i1 %60, label %61, label %67

; <label>:61                                      ; preds = %58
  %62 = load i32* %7, align 4
  %63 = icmp sgt i32 %62, 0
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %61
  store i32 -1, i32* %1
  br label %299

; <label>:65                                      ; preds = %61
  store i32 1, i32* %8, align 4
  br label %66

; <label>:66                                      ; preds = %65
  br label %67

; <label>:67                                      ; preds = %66, %58, %50, %45
  %68 = load i8** %fastmap, align 8
  %69 = icmp ne i8* %68, null
  br i1 %69, label %70, label %85

; <label>:70                                      ; preds = %67
  %71 = load %struct.re_pattern_buffer** %2, align 8
  %72 = bitcast %struct.re_pattern_buffer* %71 to i8*
  %73 = getelementptr i8* %72, i32 56
  %74 = bitcast i8* %73 to i32*
  %75 = load i32* %74, align 8
  %76 = lshr i32 %75, 3
  %77 = and i32 %76, 1
  %78 = icmp ne i32 %77, 0
  br i1 %78, label %85, label %79

; <label>:79                                      ; preds = %70
  %80 = load %struct.re_pattern_buffer** %2, align 8
  %81 = call i32 (...)* bitcast (i32 (%struct.re_pattern_buffer*)* @re_compile_fastmap to i32 (...)*)(%struct.re_pattern_buffer* %80)
  %82 = icmp eq i32 %81, -2
  br i1 %82, label %83, label %84

; <label>:83                                      ; preds = %79
  store i32 -2, i32* %1
  br label %299

; <label>:84                                      ; preds = %79
  br label %85

; <label>:85                                      ; preds = %84, %70, %67
  br label %86

; <label>:86                                      ; preds = %297, %85
  %87 = load i8** %fastmap, align 8
  %88 = icmp ne i8* %87, null
  br i1 %88, label %89, label %241

; <label>:89                                      ; preds = %86
  %90 = load i32* %7, align 4
  %91 = load i32* %total_size, align 4
  %92 = icmp slt i32 %90, %91
  br i1 %92, label %93, label %241

; <label>:93                                      ; preds = %89
  %94 = load %struct.re_pattern_buffer** %2, align 8
  %95 = bitcast %struct.re_pattern_buffer* %94 to i8*
  %96 = getelementptr i8* %95, i32 56
  %97 = bitcast i8* %96 to i32*
  %98 = load i32* %97, align 8
  %99 = and i32 %98, 1
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %241, label %101

; <label>:101                                     ; preds = %93
  %102 = load i32* %8, align 4
  %103 = icmp sgt i32 %102, 0
  br i1 %103, label %104, label %192

; <label>:104                                     ; preds = %101
  store i32 0, i32* %lim, align 4
  %105 = load i32* %8, align 4
  store i32 %105, i32* %irange, align 4
  %106 = load i32* %7, align 4
  %107 = load i32* %4, align 4
  %108 = icmp slt i32 %106, %107
  br i1 %108, label %109, label %121

; <label>:109                                     ; preds = %104
  %110 = load i32* %7, align 4
  %111 = load i32* %8, align 4
  %112 = add nsw i32 %110, %111
  %113 = load i32* %4, align 4
  %114 = icmp sge i32 %112, %113
  br i1 %114, label %115, label %121

; <label>:115                                     ; preds = %109
  %116 = load i32* %8, align 4
  %117 = load i32* %4, align 4
  %118 = load i32* %7, align 4
  %119 = sub nsw i32 %117, %118
  %120 = sub nsw i32 %116, %119
  store i32 %120, i32* %lim, align 4
  br label %121

; <label>:121                                     ; preds = %115, %109, %104
  %122 = load i32* %7, align 4
  %123 = load i32* %4, align 4
  %124 = icmp sge i32 %122, %123
  br i1 %124, label %125, label %131

; <label>:125                                     ; preds = %121
  %126 = load i8** %5, align 8
  %127 = load i32* %4, align 4
  %128 = sext i32 %127 to i64
  %129 = sub i64 0, %128
  %130 = getelementptr inbounds i8* %126, i64 %129
  br label %133

; <label>:131                                     ; preds = %121
  %132 = load i8** %3, align 8
  br label %133

; <label>:133                                     ; preds = %131, %125
  %134 = phi i8* [ %130, %125 ], [ %132, %131 ]
  %135 = load i32* %7, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i8* %134, i64 %136
  store i8* %137, i8** %d, align 8
  %138 = load i8** %translate, align 8
  %139 = icmp ne i8* %138, null
  br i1 %139, label %140, label %165

; <label>:140                                     ; preds = %133
  br label %141

; <label>:141                                     ; preds = %161, %140
  %142 = load i32* %8, align 4
  %143 = load i32* %lim, align 4
  %144 = icmp sgt i32 %142, %143
  br i1 %144, label %145, label %159

; <label>:145                                     ; preds = %141
  %146 = load i8** %d, align 8
  %147 = getelementptr inbounds i8* %146, i32 1
  store i8* %147, i8** %d, align 8
  %148 = load i8* %146, align 1
  %149 = zext i8 %148 to i64
  %150 = load i8** %translate, align 8
  %151 = getelementptr inbounds i8* %150, i64 %149
  %152 = load i8* %151, align 1
  %153 = zext i8 %152 to i64
  %154 = load i8** %fastmap, align 8
  %155 = getelementptr inbounds i8* %154, i64 %153
  %156 = load i8* %155, align 1
  %157 = icmp ne i8 %156, 0
  %158 = xor i1 %157, true
  br label %159

; <label>:159                                     ; preds = %145, %141
  %160 = phi i1 [ false, %141 ], [ %158, %145 ]
  br i1 %160, label %161, label %164

; <label>:161                                     ; preds = %159
  %162 = load i32* %8, align 4
  %163 = add nsw i32 %162, -1
  store i32 %163, i32* %8, align 4
  br label %141

; <label>:164                                     ; preds = %159
  br label %186

; <label>:165                                     ; preds = %133
  br label %166

; <label>:166                                     ; preds = %182, %165
  %167 = load i32* %8, align 4
  %168 = load i32* %lim, align 4
  %169 = icmp sgt i32 %167, %168
  br i1 %169, label %170, label %180

; <label>:170                                     ; preds = %166
  %171 = load i8** %d, align 8
  %172 = getelementptr inbounds i8* %171, i32 1
  store i8* %172, i8** %d, align 8
  %173 = load i8* %171, align 1
  %174 = zext i8 %173 to i64
  %175 = load i8** %fastmap, align 8
  %176 = getelementptr inbounds i8* %175, i64 %174
  %177 = load i8* %176, align 1
  %178 = icmp ne i8 %177, 0
  %179 = xor i1 %178, true
  br label %180

; <label>:180                                     ; preds = %170, %166
  %181 = phi i1 [ false, %166 ], [ %179, %170 ]
  br i1 %181, label %182, label %185

; <label>:182                                     ; preds = %180
  %183 = load i32* %8, align 4
  %184 = add nsw i32 %183, -1
  store i32 %184, i32* %8, align 4
  br label %166

; <label>:185                                     ; preds = %180
  br label %186

; <label>:186                                     ; preds = %185, %164
  %187 = load i32* %irange, align 4
  %188 = load i32* %8, align 4
  %189 = sub nsw i32 %187, %188
  %190 = load i32* %7, align 4
  %191 = add nsw i32 %190, %189
  store i32 %191, i32* %7, align 4
  br label %240

; <label>:192                                     ; preds = %101
  %193 = load i32* %4, align 4
  %194 = icmp eq i32 %193, 0
  br i1 %194, label %199, label %195

; <label>:195                                     ; preds = %192
  %196 = load i32* %7, align 4
  %197 = load i32* %4, align 4
  %198 = icmp sge i32 %196, %197
  br i1 %198, label %199, label %208

; <label>:199                                     ; preds = %195, %192
  %200 = load i32* %7, align 4
  %201 = load i32* %4, align 4
  %202 = sub nsw i32 %200, %201
  %203 = sext i32 %202 to i64
  %204 = load i8** %5, align 8
  %205 = getelementptr inbounds i8* %204, i64 %203
  %206 = load i8* %205, align 1
  %207 = sext i8 %206 to i32
  br label %215

; <label>:208                                     ; preds = %195
  %209 = load i32* %7, align 4
  %210 = sext i32 %209 to i64
  %211 = load i8** %3, align 8
  %212 = getelementptr inbounds i8* %211, i64 %210
  %213 = load i8* %212, align 1
  %214 = sext i8 %213 to i32
  br label %215

; <label>:215                                     ; preds = %208, %199
  %216 = phi i32 [ %207, %199 ], [ %214, %208 ]
  %217 = trunc i32 %216 to i8
  store i8 %217, i8* %c, align 1
  %218 = load i8** %translate, align 8
  %219 = icmp ne i8* %218, null
  br i1 %219, label %220, label %227

; <label>:220                                     ; preds = %215
  %221 = load i8* %c, align 1
  %222 = zext i8 %221 to i64
  %223 = load i8** %translate, align 8
  %224 = getelementptr inbounds i8* %223, i64 %222
  %225 = load i8* %224, align 1
  %226 = sext i8 %225 to i32
  br label %230

; <label>:227                                     ; preds = %215
  %228 = load i8* %c, align 1
  %229 = sext i8 %228 to i32
  br label %230

; <label>:230                                     ; preds = %227, %220
  %231 = phi i32 [ %226, %220 ], [ %229, %227 ]
  %232 = trunc i32 %231 to i8
  %233 = zext i8 %232 to i64
  %234 = load i8** %fastmap, align 8
  %235 = getelementptr inbounds i8* %234, i64 %233
  %236 = load i8* %235, align 1
  %237 = icmp ne i8 %236, 0
  br i1 %237, label %239, label %238

; <label>:238                                     ; preds = %230
  br label %279

; <label>:239                                     ; preds = %230
  br label %240

; <label>:240                                     ; preds = %239, %186
  br label %241

; <label>:241                                     ; preds = %240, %93, %89, %86
  %242 = load i32* %8, align 4
  %243 = icmp sge i32 %242, 0
  br i1 %243, label %244, label %260

; <label>:244                                     ; preds = %241
  %245 = load i32* %7, align 4
  %246 = load i32* %total_size, align 4
  %247 = icmp eq i32 %245, %246
  br i1 %247, label %248, label %260

; <label>:248                                     ; preds = %244
  %249 = load i8** %fastmap, align 8
  %250 = icmp ne i8* %249, null
  br i1 %250, label %251, label %260

; <label>:251                                     ; preds = %248
  %252 = load %struct.re_pattern_buffer** %2, align 8
  %253 = bitcast %struct.re_pattern_buffer* %252 to i8*
  %254 = getelementptr i8* %253, i32 56
  %255 = bitcast i8* %254 to i32*
  %256 = load i32* %255, align 8
  %257 = and i32 %256, 1
  %258 = icmp ne i32 %257, 0
  br i1 %258, label %260, label %259

; <label>:259                                     ; preds = %251
  store i32 -1, i32* %1
  br label %299

; <label>:260                                     ; preds = %251, %248, %244, %241
  %261 = load %struct.re_pattern_buffer** %2, align 8
  %262 = load i8** %3, align 8
  %263 = load i32* %4, align 4
  %264 = load i8** %5, align 8
  %265 = load i32* %6, align 4
  %266 = load i32* %7, align 4
  %267 = load %struct.re_registers** %9, align 8
  %268 = load i32* %10, align 4
  %269 = call i32 @re_match_2(%struct.re_pattern_buffer* %261, i8* %262, i32 %263, i8* %264, i32 %265, i32 %266, %struct.re_registers* %267, i32 %268)
  store i32 %269, i32* %val, align 4
  %270 = load i32* %val, align 4
  %271 = icmp sge i32 %270, 0
  br i1 %271, label %272, label %274

; <label>:272                                     ; preds = %260
  %273 = load i32* %7, align 4
  store i32 %273, i32* %1
  br label %299

; <label>:274                                     ; preds = %260
  %275 = load i32* %val, align 4
  %276 = icmp eq i32 %275, -2
  br i1 %276, label %277, label %278

; <label>:277                                     ; preds = %274
  store i32 -2, i32* %1
  br label %299

; <label>:278                                     ; preds = %274
  br label %279

; <label>:279                                     ; preds = %278, %238
  %280 = load i32* %8, align 4
  %281 = icmp ne i32 %280, 0
  br i1 %281, label %283, label %282

; <label>:282                                     ; preds = %279
  br label %298

; <label>:283                                     ; preds = %279
  %284 = load i32* %8, align 4
  %285 = icmp sgt i32 %284, 0
  br i1 %285, label %286, label %291

; <label>:286                                     ; preds = %283
  %287 = load i32* %8, align 4
  %288 = add nsw i32 %287, -1
  store i32 %288, i32* %8, align 4
  %289 = load i32* %7, align 4
  %290 = add nsw i32 %289, 1
  store i32 %290, i32* %7, align 4
  br label %296

; <label>:291                                     ; preds = %283
  %292 = load i32* %8, align 4
  %293 = add nsw i32 %292, 1
  store i32 %293, i32* %8, align 4
  %294 = load i32* %7, align 4
  %295 = add nsw i32 %294, -1
  store i32 %295, i32* %7, align 4
  br label %296

; <label>:296                                     ; preds = %291, %286
  br label %297

; <label>:297                                     ; preds = %296
  br label %86

; <label>:298                                     ; preds = %282
  store i32 -1, i32* %1
  br label %299

; <label>:299                                     ; preds = %298, %277, %272, %259, %83, %64, %29
  %300 = load i32* %1
  ret i32 %300
}

define i32 @re_match_2(%struct.re_pattern_buffer* %bufp, i8* %string1, i32 %size1, i8* %string2, i32 %size2, i32 %pos, %struct.re_registers* %regs, i32 %stop) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca %struct.re_pattern_buffer*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.re_registers*, align 8
  %9 = alloca i32, align 4
  %mcnt = alloca i32, align 4
  %p1 = alloca i8*, align 8
  %end1 = alloca i8*, align 8
  %end2 = alloca i8*, align 8
  %end_match_1 = alloca i8*, align 8
  %end_match_2 = alloca i8*, align 8
  %d = alloca i8*, align 8
  %dend = alloca i8*, align 8
  %p = alloca i8*, align 8
  %pend = alloca i8*, align 8
  %translate = alloca i8*, align 8
  %fail_stack = alloca %struct.fail_stack_type, align 8
  %num_regs = alloca i32, align 4
  %lowest_active_reg = alloca i32, align 4
  %highest_active_reg = alloca i32, align 4
  %regstart = alloca i8**, align 8
  %regend = alloca i8**, align 8
  %old_regstart = alloca i8**, align 8
  %old_regend = alloca i8**, align 8
  %reg_info = alloca %union.register_info_type*, align 8
  %best_regs_set = alloca i32, align 4
  %best_regstart = alloca i8**, align 8
  %best_regend = alloca i8**, align 8
  %match_end = alloca i8*, align 8
  %reg_dummy = alloca i8**, align 8
  %reg_info_dummy = alloca %union.register_info_type*, align 8
  %same_str_p = alloca i8, align 1
  %r = alloca i32, align 4
  %r1 = alloca i32, align 4
  %c = alloca i8, align 1
  %not = alloca i8, align 1
  %r2 = alloca i32, align 4
  %r3 = alloca i8, align 1
  %is_a_jump_n = alloca i8, align 1
  %r4 = alloca i32, align 4
  %destination = alloca i8*, align 8
  %this_reg = alloca i32, align 4
  %d2 = alloca i8*, align 8
  %dend2 = alloca i8*, align 8
  %regno = alloca i32, align 4
  %destination5 = alloca i8*, align 8
  %this_reg6 = alloca i32, align 4
  %destination7 = alloca i8*, align 8
  %this_reg8 = alloca i32, align 4
  %p2 = alloca i8*, align 8
  %c9 = alloca i8, align 1
  %not10 = alloca i32, align 4
  %dummy_low_reg = alloca i32, align 4
  %dummy_high_reg = alloca i32, align 4
  %pdummy = alloca i8*, align 8
  %sdummy = alloca i8*, align 8
  %this_reg11 = alloca i32, align 4
  %string_temp = alloca i8*, align 8
  %destination12 = alloca i8*, align 8
  %this_reg13 = alloca i32, align 4
  %destination14 = alloca i8*, align 8
  %this_reg15 = alloca i32, align 4
  %r16 = alloca i32, align 4
  %r17 = alloca i32, align 4
  %this_reg18 = alloca i32, align 4
  %string_temp19 = alloca i8*, align 8
  %is_a_jump_n20 = alloca i8, align 1
  store %struct.re_pattern_buffer* %bufp, %struct.re_pattern_buffer** %2, align 8
  store i8* %string1, i8** %3, align 8
  store i32 %size1, i32* %4, align 4
  store i8* %string2, i8** %5, align 8
  store i32 %size2, i32* %6, align 4
  store i32 %pos, i32* %7, align 4
  store %struct.re_registers* %regs, %struct.re_registers** %8, align 8
  store i32 %stop, i32* %9, align 4
  %10 = load %struct.re_pattern_buffer** %2, align 8
  %11 = getelementptr inbounds %struct.re_pattern_buffer* %10, i32 0, i32 0
  %12 = load i8** %11, align 8
  store i8* %12, i8** %p, align 8
  %13 = load i8** %p, align 8
  %14 = load %struct.re_pattern_buffer** %2, align 8
  %15 = getelementptr inbounds %struct.re_pattern_buffer* %14, i32 0, i32 2
  %16 = load i64* %15, align 8
  %17 = getelementptr inbounds i8* %13, i64 %16
  store i8* %17, i8** %pend, align 8
  %18 = load %struct.re_pattern_buffer** %2, align 8
  %19 = getelementptr inbounds %struct.re_pattern_buffer* %18, i32 0, i32 5
  %20 = load i8** %19, align 8
  store i8* %20, i8** %translate, align 8
  %21 = load %struct.re_pattern_buffer** %2, align 8
  %22 = getelementptr inbounds %struct.re_pattern_buffer* %21, i32 0, i32 6
  %23 = load i64* %22, align 8
  %24 = add i64 %23, 1
  %25 = trunc i64 %24 to i32
  store i32 %25, i32* %num_regs, align 4
  store i32 257, i32* %lowest_active_reg, align 4
  store i32 256, i32* %highest_active_reg, align 4
  store i32 0, i32* %best_regs_set, align 4
  store i8* null, i8** %match_end, align 8
  br label %26

; <label>:26                                      ; preds = %0
  %27 = alloca i8, i64 40
  %28 = bitcast i8* %27 to i8**
  %29 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  store i8** %28, i8*** %29, align 8
  %30 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %31 = load i8*** %30, align 8
  %32 = icmp eq i8** %31, null
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %26
  store i32 -2, i32* %1
  br label %3618

; <label>:34                                      ; preds = %26
  %35 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  store i32 5, i32* %35, align 4
  %36 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  store i32 0, i32* %36, align 4
  br label %37

; <label>:37                                      ; preds = %34
  %38 = load %struct.re_pattern_buffer** %2, align 8
  %39 = getelementptr inbounds %struct.re_pattern_buffer* %38, i32 0, i32 6
  %40 = load i64* %39, align 8
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %117

; <label>:42                                      ; preds = %37
  %43 = load i32* %num_regs, align 4
  %44 = zext i32 %43 to i64
  %45 = mul i64 %44, 8
  %46 = alloca i8, i64 %45
  %47 = bitcast i8* %46 to i8**
  store i8** %47, i8*** %regstart, align 8
  %48 = load i32* %num_regs, align 4
  %49 = zext i32 %48 to i64
  %50 = mul i64 %49, 8
  %51 = alloca i8, i64 %50
  %52 = bitcast i8* %51 to i8**
  store i8** %52, i8*** %regend, align 8
  %53 = load i32* %num_regs, align 4
  %54 = zext i32 %53 to i64
  %55 = mul i64 %54, 8
  %56 = alloca i8, i64 %55
  %57 = bitcast i8* %56 to i8**
  store i8** %57, i8*** %old_regstart, align 8
  %58 = load i32* %num_regs, align 4
  %59 = zext i32 %58 to i64
  %60 = mul i64 %59, 8
  %61 = alloca i8, i64 %60
  %62 = bitcast i8* %61 to i8**
  store i8** %62, i8*** %old_regend, align 8
  %63 = load i32* %num_regs, align 4
  %64 = zext i32 %63 to i64
  %65 = mul i64 %64, 8
  %66 = alloca i8, i64 %65
  %67 = bitcast i8* %66 to i8**
  store i8** %67, i8*** %best_regstart, align 8
  %68 = load i32* %num_regs, align 4
  %69 = zext i32 %68 to i64
  %70 = mul i64 %69, 8
  %71 = alloca i8, i64 %70
  %72 = bitcast i8* %71 to i8**
  store i8** %72, i8*** %best_regend, align 8
  %73 = load i32* %num_regs, align 4
  %74 = zext i32 %73 to i64
  %75 = mul i64 %74, 8
  %76 = alloca i8, i64 %75
  %77 = bitcast i8* %76 to %union.register_info_type*
  store %union.register_info_type* %77, %union.register_info_type** %reg_info, align 8
  %78 = load i32* %num_regs, align 4
  %79 = zext i32 %78 to i64
  %80 = mul i64 %79, 8
  %81 = alloca i8, i64 %80
  %82 = bitcast i8* %81 to i8**
  store i8** %82, i8*** %reg_dummy, align 8
  %83 = load i32* %num_regs, align 4
  %84 = zext i32 %83 to i64
  %85 = mul i64 %84, 8
  %86 = alloca i8, i64 %85
  %87 = bitcast i8* %86 to %union.register_info_type*
  store %union.register_info_type* %87, %union.register_info_type** %reg_info_dummy, align 8
  %88 = load i8*** %regstart, align 8
  %89 = icmp ne i8** %88, null
  br i1 %89, label %90, label %114

; <label>:90                                      ; preds = %42
  %91 = load i8*** %regend, align 8
  %92 = icmp ne i8** %91, null
  br i1 %92, label %93, label %114

; <label>:93                                      ; preds = %90
  %94 = load i8*** %old_regstart, align 8
  %95 = icmp ne i8** %94, null
  br i1 %95, label %96, label %114

; <label>:96                                      ; preds = %93
  %97 = load i8*** %old_regend, align 8
  %98 = icmp ne i8** %97, null
  br i1 %98, label %99, label %114

; <label>:99                                      ; preds = %96
  %100 = load %union.register_info_type** %reg_info, align 8
  %101 = icmp ne %union.register_info_type* %100, null
  br i1 %101, label %102, label %114

; <label>:102                                     ; preds = %99
  %103 = load i8*** %best_regstart, align 8
  %104 = icmp ne i8** %103, null
  br i1 %104, label %105, label %114

; <label>:105                                     ; preds = %102
  %106 = load i8*** %best_regend, align 8
  %107 = icmp ne i8** %106, null
  br i1 %107, label %108, label %114

; <label>:108                                     ; preds = %105
  %109 = load i8*** %reg_dummy, align 8
  %110 = icmp ne i8** %109, null
  br i1 %110, label %111, label %114

; <label>:111                                     ; preds = %108
  %112 = load %union.register_info_type** %reg_info_dummy, align 8
  %113 = icmp ne %union.register_info_type* %112, null
  br i1 %113, label %116, label %114

; <label>:114                                     ; preds = %111, %108, %105, %102, %99, %96, %93, %90, %42
  %115 = alloca i8, i64 0
  store i32 -2, i32* %1
  br label %3618

; <label>:116                                     ; preds = %111
  br label %117

; <label>:117                                     ; preds = %116, %37
  %118 = load i32* %7, align 4
  %119 = icmp slt i32 %118, 0
  br i1 %119, label %126, label %120

; <label>:120                                     ; preds = %117
  %121 = load i32* %7, align 4
  %122 = load i32* %4, align 4
  %123 = load i32* %6, align 4
  %124 = add nsw i32 %122, %123
  %125 = icmp sgt i32 %121, %124
  br i1 %125, label %126, label %128

; <label>:126                                     ; preds = %120, %117
  %127 = alloca i8, i64 0
  store i32 -1, i32* %1
  br label %3618

; <label>:128                                     ; preds = %120
  store i32 1, i32* %mcnt, align 4
  br label %129

; <label>:129                                     ; preds = %183, %128
  %130 = load i32* %mcnt, align 4
  %131 = load i32* %num_regs, align 4
  %132 = icmp ult i32 %130, %131
  br i1 %132, label %133, label %186

; <label>:133                                     ; preds = %129
  %134 = load i32* %mcnt, align 4
  %135 = sext i32 %134 to i64
  %136 = load i8*** %old_regend, align 8
  %137 = getelementptr inbounds i8** %136, i64 %135
  store i8* inttoptr (i64 -1 to i8*), i8** %137, align 8
  %138 = load i32* %mcnt, align 4
  %139 = sext i32 %138 to i64
  %140 = load i8*** %old_regstart, align 8
  %141 = getelementptr inbounds i8** %140, i64 %139
  store i8* inttoptr (i64 -1 to i8*), i8** %141, align 8
  %142 = load i32* %mcnt, align 4
  %143 = sext i32 %142 to i64
  %144 = load i8*** %regend, align 8
  %145 = getelementptr inbounds i8** %144, i64 %143
  store i8* inttoptr (i64 -1 to i8*), i8** %145, align 8
  %146 = load i32* %mcnt, align 4
  %147 = sext i32 %146 to i64
  %148 = load i8*** %regstart, align 8
  %149 = getelementptr inbounds i8** %148, i64 %147
  store i8* inttoptr (i64 -1 to i8*), i8** %149, align 8
  %150 = load i32* %mcnt, align 4
  %151 = sext i32 %150 to i64
  %152 = load %union.register_info_type** %reg_info, align 8
  %153 = getelementptr inbounds %union.register_info_type* %152, i64 %151
  %154 = bitcast %union.register_info_type* %153 to %struct.anon.2*
  %155 = bitcast %struct.anon.2* %154 to i32*
  %156 = load i32* %155, align 4
  %157 = and i32 %156, -4
  %158 = or i32 %157, 3
  store i32 %158, i32* %155, align 4
  %159 = load i32* %mcnt, align 4
  %160 = sext i32 %159 to i64
  %161 = load %union.register_info_type** %reg_info, align 8
  %162 = getelementptr inbounds %union.register_info_type* %161, i64 %160
  %163 = bitcast %union.register_info_type* %162 to %struct.anon.2*
  %164 = bitcast %struct.anon.2* %163 to i32*
  %165 = load i32* %164, align 4
  %166 = and i32 %165, -5
  store i32 %166, i32* %164, align 4
  %167 = load i32* %mcnt, align 4
  %168 = sext i32 %167 to i64
  %169 = load %union.register_info_type** %reg_info, align 8
  %170 = getelementptr inbounds %union.register_info_type* %169, i64 %168
  %171 = bitcast %union.register_info_type* %170 to %struct.anon.2*
  %172 = bitcast %struct.anon.2* %171 to i32*
  %173 = load i32* %172, align 4
  %174 = and i32 %173, -9
  store i32 %174, i32* %172, align 4
  %175 = load i32* %mcnt, align 4
  %176 = sext i32 %175 to i64
  %177 = load %union.register_info_type** %reg_info, align 8
  %178 = getelementptr inbounds %union.register_info_type* %177, i64 %176
  %179 = bitcast %union.register_info_type* %178 to %struct.anon.2*
  %180 = bitcast %struct.anon.2* %179 to i32*
  %181 = load i32* %180, align 4
  %182 = and i32 %181, -17
  store i32 %182, i32* %180, align 4
  br label %183

; <label>:183                                     ; preds = %133
  %184 = load i32* %mcnt, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %mcnt, align 4
  br label %129

; <label>:186                                     ; preds = %129
  %187 = load i32* %6, align 4
  %188 = icmp eq i32 %187, 0
  br i1 %188, label %189, label %195

; <label>:189                                     ; preds = %186
  %190 = load i8** %3, align 8
  %191 = icmp ne i8* %190, null
  br i1 %191, label %192, label %195

; <label>:192                                     ; preds = %189
  %193 = load i8** %3, align 8
  store i8* %193, i8** %5, align 8
  %194 = load i32* %4, align 4
  store i32 %194, i32* %6, align 4
  store i8* null, i8** %3, align 8
  store i32 0, i32* %4, align 4
  br label %195

; <label>:195                                     ; preds = %192, %189, %186
  %196 = load i8** %3, align 8
  %197 = load i32* %4, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds i8* %196, i64 %198
  store i8* %199, i8** %end1, align 8
  %200 = load i8** %5, align 8
  %201 = load i32* %6, align 4
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i8* %200, i64 %202
  store i8* %203, i8** %end2, align 8
  %204 = load i32* %9, align 4
  %205 = load i32* %4, align 4
  %206 = icmp sle i32 %204, %205
  br i1 %206, label %207, label %213

; <label>:207                                     ; preds = %195
  %208 = load i8** %3, align 8
  %209 = load i32* %9, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i8* %208, i64 %210
  store i8* %211, i8** %end_match_1, align 8
  %212 = load i8** %5, align 8
  store i8* %212, i8** %end_match_2, align 8
  br label %223

; <label>:213                                     ; preds = %195
  %214 = load i8** %end1, align 8
  store i8* %214, i8** %end_match_1, align 8
  %215 = load i8** %5, align 8
  %216 = load i32* %9, align 4
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds i8* %215, i64 %217
  %219 = load i32* %4, align 4
  %220 = sext i32 %219 to i64
  %221 = sub i64 0, %220
  %222 = getelementptr inbounds i8* %218, i64 %221
  store i8* %222, i8** %end_match_2, align 8
  br label %223

; <label>:223                                     ; preds = %213, %207
  %224 = load i32* %4, align 4
  %225 = icmp sgt i32 %224, 0
  br i1 %225, label %226, label %236

; <label>:226                                     ; preds = %223
  %227 = load i32* %7, align 4
  %228 = load i32* %4, align 4
  %229 = icmp sle i32 %227, %228
  br i1 %229, label %230, label %236

; <label>:230                                     ; preds = %226
  %231 = load i8** %3, align 8
  %232 = load i32* %7, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds i8* %231, i64 %233
  store i8* %234, i8** %d, align 8
  %235 = load i8** %end_match_1, align 8
  store i8* %235, i8** %dend, align 8
  br label %246

; <label>:236                                     ; preds = %226, %223
  %237 = load i8** %5, align 8
  %238 = load i32* %7, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds i8* %237, i64 %239
  %241 = load i32* %4, align 4
  %242 = sext i32 %241 to i64
  %243 = sub i64 0, %242
  %244 = getelementptr inbounds i8* %240, i64 %243
  store i8* %244, i8** %d, align 8
  %245 = load i8** %end_match_2, align 8
  store i8* %245, i8** %dend, align 8
  br label %246

; <label>:246                                     ; preds = %236, %230
  br label %247

; <label>:247                                     ; preds = %3611, %3451, %246
  %248 = load i8** %p, align 8
  %249 = load i8** %pend, align 8
  %250 = icmp eq i8* %248, %249
  br i1 %250, label %251, label %749

; <label>:251                                     ; preds = %247
  %252 = load i8** %d, align 8
  %253 = load i8** %end_match_2, align 8
  %254 = icmp ne i8* %252, %253
  br i1 %254, label %255, label %378

; <label>:255                                     ; preds = %251
  %256 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %257 = load i32* %256, align 4
  %258 = icmp eq i32 %257, 0
  br i1 %258, label %330, label %259

; <label>:259                                     ; preds = %255
  %260 = load i32* %4, align 4
  %261 = icmp ne i32 %260, 0
  br i1 %261, label %262, label %273

; <label>:262                                     ; preds = %259
  %263 = load i8** %3, align 8
  %264 = load i8** %match_end, align 8
  %265 = icmp ule i8* %263, %264
  br i1 %265, label %266, label %273

; <label>:266                                     ; preds = %262
  %267 = load i8** %match_end, align 8
  %268 = load i8** %3, align 8
  %269 = load i32* %4, align 4
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds i8* %268, i64 %270
  %272 = icmp ule i8* %267, %271
  br label %273

; <label>:273                                     ; preds = %266, %262, %259
  %274 = phi i1 [ false, %262 ], [ false, %259 ], [ %272, %266 ]
  %275 = zext i1 %274 to i32
  %276 = load i8** %dend, align 8
  %277 = load i8** %end_match_1, align 8
  %278 = icmp eq i8* %276, %277
  %279 = zext i1 %278 to i32
  %280 = icmp eq i32 %275, %279
  %281 = zext i1 %280 to i32
  %282 = trunc i32 %281 to i8
  store i8 %282, i8* %same_str_p, align 1
  %283 = load i32* %best_regs_set, align 4
  %284 = icmp ne i32 %283, 0
  br i1 %284, label %285, label %300

; <label>:285                                     ; preds = %273
  %286 = load i8* %same_str_p, align 1
  %287 = sext i8 %286 to i32
  %288 = icmp ne i32 %287, 0
  br i1 %288, label %289, label %293

; <label>:289                                     ; preds = %285
  %290 = load i8** %d, align 8
  %291 = load i8** %match_end, align 8
  %292 = icmp ugt i8* %290, %291
  br i1 %292, label %300, label %293

; <label>:293                                     ; preds = %289, %285
  %294 = load i8* %same_str_p, align 1
  %295 = icmp ne i8 %294, 0
  br i1 %295, label %329, label %296

; <label>:296                                     ; preds = %293
  %297 = load i8** %dend, align 8
  %298 = load i8** %end_match_1, align 8
  %299 = icmp eq i8* %297, %298
  br i1 %299, label %329, label %300

; <label>:300                                     ; preds = %296, %289, %273
  store i32 1, i32* %best_regs_set, align 4
  %301 = load i8** %d, align 8
  store i8* %301, i8** %match_end, align 8
  store i32 1, i32* %mcnt, align 4
  br label %302

; <label>:302                                     ; preds = %325, %300
  %303 = load i32* %mcnt, align 4
  %304 = load i32* %num_regs, align 4
  %305 = icmp ult i32 %303, %304
  br i1 %305, label %306, label %328

; <label>:306                                     ; preds = %302
  %307 = load i32* %mcnt, align 4
  %308 = sext i32 %307 to i64
  %309 = load i8*** %regstart, align 8
  %310 = getelementptr inbounds i8** %309, i64 %308
  %311 = load i8** %310, align 8
  %312 = load i32* %mcnt, align 4
  %313 = sext i32 %312 to i64
  %314 = load i8*** %best_regstart, align 8
  %315 = getelementptr inbounds i8** %314, i64 %313
  store i8* %311, i8** %315, align 8
  %316 = load i32* %mcnt, align 4
  %317 = sext i32 %316 to i64
  %318 = load i8*** %regend, align 8
  %319 = getelementptr inbounds i8** %318, i64 %317
  %320 = load i8** %319, align 8
  %321 = load i32* %mcnt, align 4
  %322 = sext i32 %321 to i64
  %323 = load i8*** %best_regend, align 8
  %324 = getelementptr inbounds i8** %323, i64 %322
  store i8* %320, i8** %324, align 8
  br label %325

; <label>:325                                     ; preds = %306
  %326 = load i32* %mcnt, align 4
  %327 = add nsw i32 %326, 1
  store i32 %327, i32* %mcnt, align 4
  br label %302

; <label>:328                                     ; preds = %302
  br label %329

; <label>:329                                     ; preds = %328, %296, %293
  br label %3452

; <label>:330                                     ; preds = %255
  %331 = load i32* %best_regs_set, align 4
  %332 = icmp ne i32 %331, 0
  br i1 %332, label %333, label %376

; <label>:333                                     ; preds = %330
  br label %334

; <label>:334                                     ; preds = %3615, %333
  %335 = load i8** %match_end, align 8
  store i8* %335, i8** %d, align 8
  %336 = load i8** %d, align 8
  %337 = load i8** %3, align 8
  %338 = icmp uge i8* %336, %337
  br i1 %338, label %339, label %345

; <label>:339                                     ; preds = %334
  %340 = load i8** %d, align 8
  %341 = load i8** %end1, align 8
  %342 = icmp ule i8* %340, %341
  br i1 %342, label %343, label %345

; <label>:343                                     ; preds = %339
  %344 = load i8** %end_match_1, align 8
  br label %347

; <label>:345                                     ; preds = %339, %334
  %346 = load i8** %end_match_2, align 8
  br label %347

; <label>:347                                     ; preds = %345, %343
  %348 = phi i8* [ %344, %343 ], [ %346, %345 ]
  store i8* %348, i8** %dend, align 8
  store i32 1, i32* %mcnt, align 4
  br label %349

; <label>:349                                     ; preds = %372, %347
  %350 = load i32* %mcnt, align 4
  %351 = load i32* %num_regs, align 4
  %352 = icmp ult i32 %350, %351
  br i1 %352, label %353, label %375

; <label>:353                                     ; preds = %349
  %354 = load i32* %mcnt, align 4
  %355 = sext i32 %354 to i64
  %356 = load i8*** %best_regstart, align 8
  %357 = getelementptr inbounds i8** %356, i64 %355
  %358 = load i8** %357, align 8
  %359 = load i32* %mcnt, align 4
  %360 = sext i32 %359 to i64
  %361 = load i8*** %regstart, align 8
  %362 = getelementptr inbounds i8** %361, i64 %360
  store i8* %358, i8** %362, align 8
  %363 = load i32* %mcnt, align 4
  %364 = sext i32 %363 to i64
  %365 = load i8*** %best_regend, align 8
  %366 = getelementptr inbounds i8** %365, i64 %364
  %367 = load i8** %366, align 8
  %368 = load i32* %mcnt, align 4
  %369 = sext i32 %368 to i64
  %370 = load i8*** %regend, align 8
  %371 = getelementptr inbounds i8** %370, i64 %369
  store i8* %367, i8** %371, align 8
  br label %372

; <label>:372                                     ; preds = %353
  %373 = load i32* %mcnt, align 4
  %374 = add nsw i32 %373, 1
  store i32 %374, i32* %mcnt, align 4
  br label %349

; <label>:375                                     ; preds = %349
  br label %376

; <label>:376                                     ; preds = %375, %330
  br label %377

; <label>:377                                     ; preds = %376
  br label %378

; <label>:378                                     ; preds = %377, %251
  %379 = load %struct.re_registers** %8, align 8
  %380 = icmp ne %struct.re_registers* %379, null
  br i1 %380, label %381, label %724

; <label>:381                                     ; preds = %378
  %382 = load %struct.re_pattern_buffer** %2, align 8
  %383 = bitcast %struct.re_pattern_buffer* %382 to i8*
  %384 = getelementptr i8* %383, i32 56
  %385 = bitcast i8* %384 to i32*
  %386 = load i32* %385, align 8
  %387 = lshr i32 %386, 4
  %388 = and i32 %387, 1
  %389 = icmp ne i32 %388, 0
  br i1 %389, label %724, label %390

; <label>:390                                     ; preds = %381
  %391 = load %struct.re_pattern_buffer** %2, align 8
  %392 = bitcast %struct.re_pattern_buffer* %391 to i8*
  %393 = getelementptr i8* %392, i32 56
  %394 = bitcast i8* %393 to i32*
  %395 = load i32* %394, align 8
  %396 = lshr i32 %395, 1
  %397 = and i32 %396, 3
  %398 = icmp eq i32 %397, 0
  br i1 %398, label %399, label %447

; <label>:399                                     ; preds = %390
  %400 = load i32* %num_regs, align 4
  %401 = add i32 %400, 1
  %402 = icmp ugt i32 30, %401
  br i1 %402, label %403, label %404

; <label>:403                                     ; preds = %399
  br label %407

; <label>:404                                     ; preds = %399
  %405 = load i32* %num_regs, align 4
  %406 = add i32 %405, 1
  br label %407

; <label>:407                                     ; preds = %404, %403
  %408 = phi i32 [ 30, %403 ], [ %406, %404 ]
  %409 = load %struct.re_registers** %8, align 8
  %410 = getelementptr inbounds %struct.re_registers* %409, i32 0, i32 0
  store i32 %408, i32* %410, align 4
  %411 = load %struct.re_registers** %8, align 8
  %412 = getelementptr inbounds %struct.re_registers* %411, i32 0, i32 0
  %413 = load i32* %412, align 4
  %414 = zext i32 %413 to i64
  %415 = mul i64 %414, 4
  %416 = call noalias i8* @malloc(i64 %415) nounwind
  %417 = bitcast i8* %416 to i32*
  %418 = load %struct.re_registers** %8, align 8
  %419 = getelementptr inbounds %struct.re_registers* %418, i32 0, i32 1
  store i32* %417, i32** %419, align 8
  %420 = load %struct.re_registers** %8, align 8
  %421 = getelementptr inbounds %struct.re_registers* %420, i32 0, i32 0
  %422 = load i32* %421, align 4
  %423 = zext i32 %422 to i64
  %424 = mul i64 %423, 4
  %425 = call noalias i8* @malloc(i64 %424) nounwind
  %426 = bitcast i8* %425 to i32*
  %427 = load %struct.re_registers** %8, align 8
  %428 = getelementptr inbounds %struct.re_registers* %427, i32 0, i32 2
  store i32* %426, i32** %428, align 8
  %429 = load %struct.re_registers** %8, align 8
  %430 = getelementptr inbounds %struct.re_registers* %429, i32 0, i32 1
  %431 = load i32** %430, align 8
  %432 = icmp eq i32* %431, null
  br i1 %432, label %438, label %433

; <label>:433                                     ; preds = %407
  %434 = load %struct.re_registers** %8, align 8
  %435 = getelementptr inbounds %struct.re_registers* %434, i32 0, i32 2
  %436 = load i32** %435, align 8
  %437 = icmp eq i32* %436, null
  br i1 %437, label %438, label %439

; <label>:438                                     ; preds = %433, %407
  store i32 -2, i32* %1
  br label %3618

; <label>:439                                     ; preds = %433
  %440 = load %struct.re_pattern_buffer** %2, align 8
  %441 = bitcast %struct.re_pattern_buffer* %440 to i8*
  %442 = getelementptr i8* %441, i32 56
  %443 = bitcast i8* %442 to i32*
  %444 = load i32* %443, align 8
  %445 = and i32 %444, -7
  %446 = or i32 %445, 2
  store i32 %446, i32* %443, align 8
  br label %508

; <label>:447                                     ; preds = %390
  %448 = load %struct.re_pattern_buffer** %2, align 8
  %449 = bitcast %struct.re_pattern_buffer* %448 to i8*
  %450 = getelementptr i8* %449, i32 56
  %451 = bitcast i8* %450 to i32*
  %452 = load i32* %451, align 8
  %453 = lshr i32 %452, 1
  %454 = and i32 %453, 3
  %455 = icmp eq i32 %454, 1
  br i1 %455, label %456, label %506

; <label>:456                                     ; preds = %447
  %457 = load %struct.re_registers** %8, align 8
  %458 = getelementptr inbounds %struct.re_registers* %457, i32 0, i32 0
  %459 = load i32* %458, align 4
  %460 = load i32* %num_regs, align 4
  %461 = add i32 %460, 1
  %462 = icmp ult i32 %459, %461
  br i1 %462, label %463, label %505

; <label>:463                                     ; preds = %456
  %464 = load i32* %num_regs, align 4
  %465 = add i32 %464, 1
  %466 = load %struct.re_registers** %8, align 8
  %467 = getelementptr inbounds %struct.re_registers* %466, i32 0, i32 0
  store i32 %465, i32* %467, align 4
  %468 = load %struct.re_registers** %8, align 8
  %469 = getelementptr inbounds %struct.re_registers* %468, i32 0, i32 1
  %470 = load i32** %469, align 8
  %471 = bitcast i32* %470 to i8*
  %472 = load %struct.re_registers** %8, align 8
  %473 = getelementptr inbounds %struct.re_registers* %472, i32 0, i32 0
  %474 = load i32* %473, align 4
  %475 = zext i32 %474 to i64
  %476 = mul i64 %475, 4
  %477 = call noalias i8* @realloc(i8* %471, i64 %476) nounwind
  %478 = bitcast i8* %477 to i32*
  %479 = load %struct.re_registers** %8, align 8
  %480 = getelementptr inbounds %struct.re_registers* %479, i32 0, i32 1
  store i32* %478, i32** %480, align 8
  %481 = load %struct.re_registers** %8, align 8
  %482 = getelementptr inbounds %struct.re_registers* %481, i32 0, i32 2
  %483 = load i32** %482, align 8
  %484 = bitcast i32* %483 to i8*
  %485 = load %struct.re_registers** %8, align 8
  %486 = getelementptr inbounds %struct.re_registers* %485, i32 0, i32 0
  %487 = load i32* %486, align 4
  %488 = zext i32 %487 to i64
  %489 = mul i64 %488, 4
  %490 = call noalias i8* @realloc(i8* %484, i64 %489) nounwind
  %491 = bitcast i8* %490 to i32*
  %492 = load %struct.re_registers** %8, align 8
  %493 = getelementptr inbounds %struct.re_registers* %492, i32 0, i32 2
  store i32* %491, i32** %493, align 8
  %494 = load %struct.re_registers** %8, align 8
  %495 = getelementptr inbounds %struct.re_registers* %494, i32 0, i32 1
  %496 = load i32** %495, align 8
  %497 = icmp eq i32* %496, null
  br i1 %497, label %503, label %498

; <label>:498                                     ; preds = %463
  %499 = load %struct.re_registers** %8, align 8
  %500 = getelementptr inbounds %struct.re_registers* %499, i32 0, i32 2
  %501 = load i32** %500, align 8
  %502 = icmp eq i32* %501, null
  br i1 %502, label %503, label %504

; <label>:503                                     ; preds = %498, %463
  store i32 -2, i32* %1
  br label %3618

; <label>:504                                     ; preds = %498
  br label %505

; <label>:505                                     ; preds = %504, %456
  br label %507

; <label>:506                                     ; preds = %447
  br label %507

; <label>:507                                     ; preds = %506, %505
  br label %508

; <label>:508                                     ; preds = %507, %439
  %509 = load %struct.re_registers** %8, align 8
  %510 = getelementptr inbounds %struct.re_registers* %509, i32 0, i32 0
  %511 = load i32* %510, align 4
  %512 = icmp ugt i32 %511, 0
  br i1 %512, label %513, label %544

; <label>:513                                     ; preds = %508
  %514 = load i32* %7, align 4
  %515 = load %struct.re_registers** %8, align 8
  %516 = getelementptr inbounds %struct.re_registers* %515, i32 0, i32 1
  %517 = load i32** %516, align 8
  %518 = getelementptr inbounds i32* %517, i64 0
  store i32 %514, i32* %518, align 4
  %519 = load i8** %dend, align 8
  %520 = load i8** %end_match_1, align 8
  %521 = icmp eq i8* %519, %520
  br i1 %521, label %522, label %528

; <label>:522                                     ; preds = %513
  %523 = load i8** %d, align 8
  %524 = load i8** %3, align 8
  %525 = ptrtoint i8* %523 to i64
  %526 = ptrtoint i8* %524 to i64
  %527 = sub i64 %525, %526
  br label %537

; <label>:528                                     ; preds = %513
  %529 = load i8** %d, align 8
  %530 = load i8** %5, align 8
  %531 = ptrtoint i8* %529 to i64
  %532 = ptrtoint i8* %530 to i64
  %533 = sub i64 %531, %532
  %534 = load i32* %4, align 4
  %535 = sext i32 %534 to i64
  %536 = add nsw i64 %533, %535
  br label %537

; <label>:537                                     ; preds = %528, %522
  %538 = phi i64 [ %527, %522 ], [ %536, %528 ]
  %539 = trunc i64 %538 to i32
  %540 = load %struct.re_registers** %8, align 8
  %541 = getelementptr inbounds %struct.re_registers* %540, i32 0, i32 2
  %542 = load i32** %541, align 8
  %543 = getelementptr inbounds i32* %542, i64 0
  store i32 %539, i32* %543, align 4
  br label %544

; <label>:544                                     ; preds = %537, %508
  store i32 1, i32* %mcnt, align 4
  br label %545

; <label>:545                                     ; preds = %696, %544
  %546 = load i32* %mcnt, align 4
  %547 = load i32* %num_regs, align 4
  %548 = load %struct.re_registers** %8, align 8
  %549 = getelementptr inbounds %struct.re_registers* %548, i32 0, i32 0
  %550 = load i32* %549, align 4
  %551 = icmp ult i32 %547, %550
  br i1 %551, label %552, label %554

; <label>:552                                     ; preds = %545
  %553 = load i32* %num_regs, align 4
  br label %558

; <label>:554                                     ; preds = %545
  %555 = load %struct.re_registers** %8, align 8
  %556 = getelementptr inbounds %struct.re_registers* %555, i32 0, i32 0
  %557 = load i32* %556, align 4
  br label %558

; <label>:558                                     ; preds = %554, %552
  %559 = phi i32 [ %553, %552 ], [ %557, %554 ]
  %560 = icmp ult i32 %546, %559
  br i1 %560, label %561, label %699

; <label>:561                                     ; preds = %558
  %562 = load i32* %mcnt, align 4
  %563 = sext i32 %562 to i64
  %564 = load i8*** %regstart, align 8
  %565 = getelementptr inbounds i8** %564, i64 %563
  %566 = load i8** %565, align 8
  %567 = icmp eq i8* %566, inttoptr (i64 -1 to i8*)
  br i1 %567, label %575, label %568

; <label>:568                                     ; preds = %561
  %569 = load i32* %mcnt, align 4
  %570 = sext i32 %569 to i64
  %571 = load i8*** %regend, align 8
  %572 = getelementptr inbounds i8** %571, i64 %570
  %573 = load i8** %572, align 8
  %574 = icmp eq i8* %573, inttoptr (i64 -1 to i8*)
  br i1 %574, label %575, label %588

; <label>:575                                     ; preds = %568, %561
  %576 = load i32* %mcnt, align 4
  %577 = sext i32 %576 to i64
  %578 = load %struct.re_registers** %8, align 8
  %579 = getelementptr inbounds %struct.re_registers* %578, i32 0, i32 2
  %580 = load i32** %579, align 8
  %581 = getelementptr inbounds i32* %580, i64 %577
  store i32 -1, i32* %581, align 4
  %582 = load i32* %mcnt, align 4
  %583 = sext i32 %582 to i64
  %584 = load %struct.re_registers** %8, align 8
  %585 = getelementptr inbounds %struct.re_registers* %584, i32 0, i32 1
  %586 = load i32** %585, align 8
  %587 = getelementptr inbounds i32* %586, i64 %583
  store i32 -1, i32* %587, align 4
  br label %695

; <label>:588                                     ; preds = %568
  %589 = load i32* %4, align 4
  %590 = icmp ne i32 %589, 0
  br i1 %590, label %591, label %620

; <label>:591                                     ; preds = %588
  %592 = load i8** %3, align 8
  %593 = load i32* %mcnt, align 4
  %594 = sext i32 %593 to i64
  %595 = load i8*** %regstart, align 8
  %596 = getelementptr inbounds i8** %595, i64 %594
  %597 = load i8** %596, align 8
  %598 = icmp ule i8* %592, %597
  br i1 %598, label %599, label %620

; <label>:599                                     ; preds = %591
  %600 = load i32* %mcnt, align 4
  %601 = sext i32 %600 to i64
  %602 = load i8*** %regstart, align 8
  %603 = getelementptr inbounds i8** %602, i64 %601
  %604 = load i8** %603, align 8
  %605 = load i8** %3, align 8
  %606 = load i32* %4, align 4
  %607 = sext i32 %606 to i64
  %608 = getelementptr inbounds i8* %605, i64 %607
  %609 = icmp ule i8* %604, %608
  br i1 %609, label %610, label %620

; <label>:610                                     ; preds = %599
  %611 = load i32* %mcnt, align 4
  %612 = sext i32 %611 to i64
  %613 = load i8*** %regstart, align 8
  %614 = getelementptr inbounds i8** %613, i64 %612
  %615 = load i8** %614, align 8
  %616 = load i8** %3, align 8
  %617 = ptrtoint i8* %615 to i64
  %618 = ptrtoint i8* %616 to i64
  %619 = sub i64 %617, %618
  br label %633

; <label>:620                                     ; preds = %599, %591, %588
  %621 = load i32* %mcnt, align 4
  %622 = sext i32 %621 to i64
  %623 = load i8*** %regstart, align 8
  %624 = getelementptr inbounds i8** %623, i64 %622
  %625 = load i8** %624, align 8
  %626 = load i8** %5, align 8
  %627 = ptrtoint i8* %625 to i64
  %628 = ptrtoint i8* %626 to i64
  %629 = sub i64 %627, %628
  %630 = load i32* %4, align 4
  %631 = sext i32 %630 to i64
  %632 = add nsw i64 %629, %631
  br label %633

; <label>:633                                     ; preds = %620, %610
  %634 = phi i64 [ %619, %610 ], [ %632, %620 ]
  %635 = trunc i64 %634 to i32
  %636 = load i32* %mcnt, align 4
  %637 = sext i32 %636 to i64
  %638 = load %struct.re_registers** %8, align 8
  %639 = getelementptr inbounds %struct.re_registers* %638, i32 0, i32 1
  %640 = load i32** %639, align 8
  %641 = getelementptr inbounds i32* %640, i64 %637
  store i32 %635, i32* %641, align 4
  %642 = load i32* %4, align 4
  %643 = icmp ne i32 %642, 0
  br i1 %643, label %644, label %673

; <label>:644                                     ; preds = %633
  %645 = load i8** %3, align 8
  %646 = load i32* %mcnt, align 4
  %647 = sext i32 %646 to i64
  %648 = load i8*** %regend, align 8
  %649 = getelementptr inbounds i8** %648, i64 %647
  %650 = load i8** %649, align 8
  %651 = icmp ule i8* %645, %650
  br i1 %651, label %652, label %673

; <label>:652                                     ; preds = %644
  %653 = load i32* %mcnt, align 4
  %654 = sext i32 %653 to i64
  %655 = load i8*** %regend, align 8
  %656 = getelementptr inbounds i8** %655, i64 %654
  %657 = load i8** %656, align 8
  %658 = load i8** %3, align 8
  %659 = load i32* %4, align 4
  %660 = sext i32 %659 to i64
  %661 = getelementptr inbounds i8* %658, i64 %660
  %662 = icmp ule i8* %657, %661
  br i1 %662, label %663, label %673

; <label>:663                                     ; preds = %652
  %664 = load i32* %mcnt, align 4
  %665 = sext i32 %664 to i64
  %666 = load i8*** %regend, align 8
  %667 = getelementptr inbounds i8** %666, i64 %665
  %668 = load i8** %667, align 8
  %669 = load i8** %3, align 8
  %670 = ptrtoint i8* %668 to i64
  %671 = ptrtoint i8* %669 to i64
  %672 = sub i64 %670, %671
  br label %686

; <label>:673                                     ; preds = %652, %644, %633
  %674 = load i32* %mcnt, align 4
  %675 = sext i32 %674 to i64
  %676 = load i8*** %regend, align 8
  %677 = getelementptr inbounds i8** %676, i64 %675
  %678 = load i8** %677, align 8
  %679 = load i8** %5, align 8
  %680 = ptrtoint i8* %678 to i64
  %681 = ptrtoint i8* %679 to i64
  %682 = sub i64 %680, %681
  %683 = load i32* %4, align 4
  %684 = sext i32 %683 to i64
  %685 = add nsw i64 %682, %684
  br label %686

; <label>:686                                     ; preds = %673, %663
  %687 = phi i64 [ %672, %663 ], [ %685, %673 ]
  %688 = trunc i64 %687 to i32
  %689 = load i32* %mcnt, align 4
  %690 = sext i32 %689 to i64
  %691 = load %struct.re_registers** %8, align 8
  %692 = getelementptr inbounds %struct.re_registers* %691, i32 0, i32 2
  %693 = load i32** %692, align 8
  %694 = getelementptr inbounds i32* %693, i64 %690
  store i32 %688, i32* %694, align 4
  br label %695

; <label>:695                                     ; preds = %686, %575
  br label %696

; <label>:696                                     ; preds = %695
  %697 = load i32* %mcnt, align 4
  %698 = add nsw i32 %697, 1
  store i32 %698, i32* %mcnt, align 4
  br label %545

; <label>:699                                     ; preds = %558
  %700 = load i32* %num_regs, align 4
  store i32 %700, i32* %mcnt, align 4
  br label %701

; <label>:701                                     ; preds = %720, %699
  %702 = load i32* %mcnt, align 4
  %703 = load %struct.re_registers** %8, align 8
  %704 = getelementptr inbounds %struct.re_registers* %703, i32 0, i32 0
  %705 = load i32* %704, align 4
  %706 = icmp ult i32 %702, %705
  br i1 %706, label %707, label %723

; <label>:707                                     ; preds = %701
  %708 = load i32* %mcnt, align 4
  %709 = sext i32 %708 to i64
  %710 = load %struct.re_registers** %8, align 8
  %711 = getelementptr inbounds %struct.re_registers* %710, i32 0, i32 2
  %712 = load i32** %711, align 8
  %713 = getelementptr inbounds i32* %712, i64 %709
  store i32 -1, i32* %713, align 4
  %714 = load i32* %mcnt, align 4
  %715 = sext i32 %714 to i64
  %716 = load %struct.re_registers** %8, align 8
  %717 = getelementptr inbounds %struct.re_registers* %716, i32 0, i32 1
  %718 = load i32** %717, align 8
  %719 = getelementptr inbounds i32* %718, i64 %715
  store i32 -1, i32* %719, align 4
  br label %720

; <label>:720                                     ; preds = %707
  %721 = load i32* %mcnt, align 4
  %722 = add nsw i32 %721, 1
  store i32 %722, i32* %mcnt, align 4
  br label %701

; <label>:723                                     ; preds = %701
  br label %724

; <label>:724                                     ; preds = %723, %381, %378
  %725 = alloca i8, i64 0
  %726 = load i8** %d, align 8
  %727 = load i32* %7, align 4
  %728 = sext i32 %727 to i64
  %729 = sub i64 0, %728
  %730 = getelementptr inbounds i8* %726, i64 %729
  %731 = load i8** %dend, align 8
  %732 = load i8** %end_match_1, align 8
  %733 = icmp eq i8* %731, %732
  br i1 %733, label %734, label %736

; <label>:734                                     ; preds = %724
  %735 = load i8** %3, align 8
  br label %742

; <label>:736                                     ; preds = %724
  %737 = load i8** %5, align 8
  %738 = load i32* %4, align 4
  %739 = sext i32 %738 to i64
  %740 = sub i64 0, %739
  %741 = getelementptr inbounds i8* %737, i64 %740
  br label %742

; <label>:742                                     ; preds = %736, %734
  %743 = phi i8* [ %735, %734 ], [ %741, %736 ]
  %744 = ptrtoint i8* %730 to i64
  %745 = ptrtoint i8* %743 to i64
  %746 = sub i64 %744, %745
  %747 = trunc i64 %746 to i32
  store i32 %747, i32* %mcnt, align 4
  %748 = load i32* %mcnt, align 4
  store i32 %748, i32* %1
  br label %3618

; <label>:749                                     ; preds = %247
  %750 = load i8** %p, align 8
  %751 = getelementptr inbounds i8* %750, i32 1
  store i8* %751, i8** %p, align 8
  %752 = load i8* %750, align 1
  %753 = zext i8 %752 to i32
  switch i32 %753, label %3450 [
    i32 0, label %754
    i32 1, label %755
    i32 2, label %859
    i32 3, label %954
    i32 4, label %954
    i32 5, label %1065
    i32 6, label %1175
    i32 7, label %1599
    i32 8, label %1777
    i32 9, label %1820
    i32 10, label %1862
    i32 11, label %1878
    i32 15, label %1884
    i32 14, label %2045
    i32 17, label %2251
    i32 16, label %2424
    i32 12, label %2511
    i32 13, label %2534
    i32 18, label %2535
    i32 19, label %2675
    i32 20, label %2815
    i32 21, label %2864
    i32 22, label %2903
    i32 27, label %2954
    i32 28, label %3041
    i32 25, label %3128
    i32 26, label %3209
    i32 23, label %3294
    i32 24, label %3372
  ]

; <label>:754                                     ; preds = %749
  br label %3451

; <label>:755                                     ; preds = %749
  %756 = load i8** %p, align 8
  %757 = getelementptr inbounds i8* %756, i32 1
  store i8* %757, i8** %p, align 8
  %758 = load i8* %756, align 1
  %759 = zext i8 %758 to i32
  store i32 %759, i32* %mcnt, align 4
  %760 = load i8** %translate, align 8
  %761 = icmp ne i8* %760, null
  br i1 %761, label %762, label %797

; <label>:762                                     ; preds = %755
  br label %763

; <label>:763                                     ; preds = %792, %762
  br label %764

; <label>:764                                     ; preds = %773, %763
  %765 = load i8** %d, align 8
  %766 = load i8** %dend, align 8
  %767 = icmp eq i8* %765, %766
  br i1 %767, label %768, label %776

; <label>:768                                     ; preds = %764
  %769 = load i8** %dend, align 8
  %770 = load i8** %end_match_2, align 8
  %771 = icmp eq i8* %769, %770
  br i1 %771, label %772, label %773

; <label>:772                                     ; preds = %768
  br label %3452

; <label>:773                                     ; preds = %768
  %774 = load i8** %5, align 8
  store i8* %774, i8** %d, align 8
  %775 = load i8** %end_match_2, align 8
  store i8* %775, i8** %dend, align 8
  br label %764

; <label>:776                                     ; preds = %764
  %777 = load i8** %d, align 8
  %778 = getelementptr inbounds i8* %777, i32 1
  store i8* %778, i8** %d, align 8
  %779 = load i8* %777, align 1
  %780 = zext i8 %779 to i64
  %781 = load i8** %translate, align 8
  %782 = getelementptr inbounds i8* %781, i64 %780
  %783 = load i8* %782, align 1
  %784 = sext i8 %783 to i32
  %785 = load i8** %p, align 8
  %786 = getelementptr inbounds i8* %785, i32 1
  store i8* %786, i8** %p, align 8
  %787 = load i8* %785, align 1
  %788 = sext i8 %787 to i32
  %789 = icmp ne i32 %784, %788
  br i1 %789, label %790, label %791

; <label>:790                                     ; preds = %776
  br label %3452

; <label>:791                                     ; preds = %776
  br label %792

; <label>:792                                     ; preds = %791
  %793 = load i32* %mcnt, align 4
  %794 = add nsw i32 %793, -1
  store i32 %794, i32* %mcnt, align 4
  %795 = icmp ne i32 %794, 0
  br i1 %795, label %763, label %796

; <label>:796                                     ; preds = %792
  br label %828

; <label>:797                                     ; preds = %755
  br label %798

; <label>:798                                     ; preds = %823, %797
  br label %799

; <label>:799                                     ; preds = %808, %798
  %800 = load i8** %d, align 8
  %801 = load i8** %dend, align 8
  %802 = icmp eq i8* %800, %801
  br i1 %802, label %803, label %811

; <label>:803                                     ; preds = %799
  %804 = load i8** %dend, align 8
  %805 = load i8** %end_match_2, align 8
  %806 = icmp eq i8* %804, %805
  br i1 %806, label %807, label %808

; <label>:807                                     ; preds = %803
  br label %3452

; <label>:808                                     ; preds = %803
  %809 = load i8** %5, align 8
  store i8* %809, i8** %d, align 8
  %810 = load i8** %end_match_2, align 8
  store i8* %810, i8** %dend, align 8
  br label %799

; <label>:811                                     ; preds = %799
  %812 = load i8** %d, align 8
  %813 = getelementptr inbounds i8* %812, i32 1
  store i8* %813, i8** %d, align 8
  %814 = load i8* %812, align 1
  %815 = sext i8 %814 to i32
  %816 = load i8** %p, align 8
  %817 = getelementptr inbounds i8* %816, i32 1
  store i8* %817, i8** %p, align 8
  %818 = load i8* %816, align 1
  %819 = sext i8 %818 to i32
  %820 = icmp ne i32 %815, %819
  br i1 %820, label %821, label %822

; <label>:821                                     ; preds = %811
  br label %3452

; <label>:822                                     ; preds = %811
  br label %823

; <label>:823                                     ; preds = %822
  %824 = load i32* %mcnt, align 4
  %825 = add nsw i32 %824, -1
  store i32 %825, i32* %mcnt, align 4
  %826 = icmp ne i32 %825, 0
  br i1 %826, label %798, label %827

; <label>:827                                     ; preds = %823
  br label %828

; <label>:828                                     ; preds = %827, %796
  br label %829

; <label>:829                                     ; preds = %828
  %830 = load i32* %lowest_active_reg, align 4
  store i32 %830, i32* %r, align 4
  br label %831

; <label>:831                                     ; preds = %854, %829
  %832 = load i32* %r, align 4
  %833 = load i32* %highest_active_reg, align 4
  %834 = icmp ule i32 %832, %833
  br i1 %834, label %835, label %857

; <label>:835                                     ; preds = %831
  %836 = load i32* %r, align 4
  %837 = zext i32 %836 to i64
  %838 = load %union.register_info_type** %reg_info, align 8
  %839 = getelementptr inbounds %union.register_info_type* %838, i64 %837
  %840 = bitcast %union.register_info_type* %839 to %struct.anon.2*
  %841 = bitcast %struct.anon.2* %840 to i32*
  %842 = load i32* %841, align 4
  %843 = and i32 %842, -17
  %844 = or i32 %843, 16
  store i32 %844, i32* %841, align 4
  %845 = load i32* %r, align 4
  %846 = zext i32 %845 to i64
  %847 = load %union.register_info_type** %reg_info, align 8
  %848 = getelementptr inbounds %union.register_info_type* %847, i64 %846
  %849 = bitcast %union.register_info_type* %848 to %struct.anon.2*
  %850 = bitcast %struct.anon.2* %849 to i32*
  %851 = load i32* %850, align 4
  %852 = and i32 %851, -9
  %853 = or i32 %852, 8
  store i32 %853, i32* %850, align 4
  br label %854

; <label>:854                                     ; preds = %835
  %855 = load i32* %r, align 4
  %856 = add i32 %855, 1
  store i32 %856, i32* %r, align 4
  br label %831

; <label>:857                                     ; preds = %831
  br label %858

; <label>:858                                     ; preds = %857
  br label %3451

; <label>:859                                     ; preds = %749
  br label %860

; <label>:860                                     ; preds = %869, %859
  %861 = load i8** %d, align 8
  %862 = load i8** %dend, align 8
  %863 = icmp eq i8* %861, %862
  br i1 %863, label %864, label %872

; <label>:864                                     ; preds = %860
  %865 = load i8** %dend, align 8
  %866 = load i8** %end_match_2, align 8
  %867 = icmp eq i8* %865, %866
  br i1 %867, label %868, label %869

; <label>:868                                     ; preds = %864
  br label %3452

; <label>:869                                     ; preds = %864
  %870 = load i8** %5, align 8
  store i8* %870, i8** %d, align 8
  %871 = load i8** %end_match_2, align 8
  store i8* %871, i8** %dend, align 8
  br label %860

; <label>:872                                     ; preds = %860
  %873 = load %struct.re_pattern_buffer** %2, align 8
  %874 = getelementptr inbounds %struct.re_pattern_buffer* %873, i32 0, i32 3
  %875 = load i32* %874, align 4
  %876 = and i32 %875, 64
  %877 = icmp ne i32 %876, 0
  br i1 %877, label %896, label %878

; <label>:878                                     ; preds = %872
  %879 = load i8** %translate, align 8
  %880 = icmp ne i8* %879, null
  br i1 %880, label %881, label %889

; <label>:881                                     ; preds = %878
  %882 = load i8** %d, align 8
  %883 = load i8* %882, align 1
  %884 = zext i8 %883 to i64
  %885 = load i8** %translate, align 8
  %886 = getelementptr inbounds i8* %885, i64 %884
  %887 = load i8* %886, align 1
  %888 = sext i8 %887 to i32
  br label %893

; <label>:889                                     ; preds = %878
  %890 = load i8** %d, align 8
  %891 = load i8* %890, align 1
  %892 = sext i8 %891 to i32
  br label %893

; <label>:893                                     ; preds = %889, %881
  %894 = phi i32 [ %888, %881 ], [ %892, %889 ]
  %895 = icmp eq i32 %894, 10
  br i1 %895, label %920, label %896

; <label>:896                                     ; preds = %893, %872
  %897 = load %struct.re_pattern_buffer** %2, align 8
  %898 = getelementptr inbounds %struct.re_pattern_buffer* %897, i32 0, i32 3
  %899 = load i32* %898, align 4
  %900 = and i32 %899, 128
  %901 = icmp ne i32 %900, 0
  br i1 %901, label %902, label %921

; <label>:902                                     ; preds = %896
  %903 = load i8** %translate, align 8
  %904 = icmp ne i8* %903, null
  br i1 %904, label %905, label %913

; <label>:905                                     ; preds = %902
  %906 = load i8** %d, align 8
  %907 = load i8* %906, align 1
  %908 = zext i8 %907 to i64
  %909 = load i8** %translate, align 8
  %910 = getelementptr inbounds i8* %909, i64 %908
  %911 = load i8* %910, align 1
  %912 = sext i8 %911 to i32
  br label %917

; <label>:913                                     ; preds = %902
  %914 = load i8** %d, align 8
  %915 = load i8* %914, align 1
  %916 = sext i8 %915 to i32
  br label %917

; <label>:917                                     ; preds = %913, %905
  %918 = phi i32 [ %912, %905 ], [ %916, %913 ]
  %919 = icmp eq i32 %918, 0
  br i1 %919, label %920, label %921

; <label>:920                                     ; preds = %917, %893
  br label %3452

; <label>:921                                     ; preds = %917, %896
  br label %922

; <label>:922                                     ; preds = %921
  %923 = load i32* %lowest_active_reg, align 4
  store i32 %923, i32* %r1, align 4
  br label %924

; <label>:924                                     ; preds = %947, %922
  %925 = load i32* %r1, align 4
  %926 = load i32* %highest_active_reg, align 4
  %927 = icmp ule i32 %925, %926
  br i1 %927, label %928, label %950

; <label>:928                                     ; preds = %924
  %929 = load i32* %r1, align 4
  %930 = zext i32 %929 to i64
  %931 = load %union.register_info_type** %reg_info, align 8
  %932 = getelementptr inbounds %union.register_info_type* %931, i64 %930
  %933 = bitcast %union.register_info_type* %932 to %struct.anon.2*
  %934 = bitcast %struct.anon.2* %933 to i32*
  %935 = load i32* %934, align 4
  %936 = and i32 %935, -17
  %937 = or i32 %936, 16
  store i32 %937, i32* %934, align 4
  %938 = load i32* %r1, align 4
  %939 = zext i32 %938 to i64
  %940 = load %union.register_info_type** %reg_info, align 8
  %941 = getelementptr inbounds %union.register_info_type* %940, i64 %939
  %942 = bitcast %union.register_info_type* %941 to %struct.anon.2*
  %943 = bitcast %struct.anon.2* %942 to i32*
  %944 = load i32* %943, align 4
  %945 = and i32 %944, -9
  %946 = or i32 %945, 8
  store i32 %946, i32* %943, align 4
  br label %947

; <label>:947                                     ; preds = %928
  %948 = load i32* %r1, align 4
  %949 = add i32 %948, 1
  store i32 %949, i32* %r1, align 4
  br label %924

; <label>:950                                     ; preds = %924
  br label %951

; <label>:951                                     ; preds = %950
  %952 = load i8** %d, align 8
  %953 = getelementptr inbounds i8* %952, i32 1
  store i8* %953, i8** %d, align 8
  br label %3451

; <label>:954                                     ; preds = %749, %749
  %955 = load i8** %p, align 8
  %956 = getelementptr inbounds i8* %955, i64 -1
  %957 = load i8* %956, align 1
  %958 = zext i8 %957 to i32
  %959 = icmp eq i32 %958, 4
  %960 = zext i1 %959 to i32
  %961 = trunc i32 %960 to i8
  store i8 %961, i8* %not, align 1
  br label %962

; <label>:962                                     ; preds = %971, %954
  %963 = load i8** %d, align 8
  %964 = load i8** %dend, align 8
  %965 = icmp eq i8* %963, %964
  br i1 %965, label %966, label %974

; <label>:966                                     ; preds = %962
  %967 = load i8** %dend, align 8
  %968 = load i8** %end_match_2, align 8
  %969 = icmp eq i8* %967, %968
  br i1 %969, label %970, label %971

; <label>:970                                     ; preds = %966
  br label %3452

; <label>:971                                     ; preds = %966
  %972 = load i8** %5, align 8
  store i8* %972, i8** %d, align 8
  %973 = load i8** %end_match_2, align 8
  store i8* %973, i8** %dend, align 8
  br label %962

; <label>:974                                     ; preds = %962
  %975 = load i8** %translate, align 8
  %976 = icmp ne i8* %975, null
  br i1 %976, label %977, label %985

; <label>:977                                     ; preds = %974
  %978 = load i8** %d, align 8
  %979 = load i8* %978, align 1
  %980 = zext i8 %979 to i64
  %981 = load i8** %translate, align 8
  %982 = getelementptr inbounds i8* %981, i64 %980
  %983 = load i8* %982, align 1
  %984 = sext i8 %983 to i32
  br label %989

; <label>:985                                     ; preds = %974
  %986 = load i8** %d, align 8
  %987 = load i8* %986, align 1
  %988 = sext i8 %987 to i32
  br label %989

; <label>:989                                     ; preds = %985, %977
  %990 = phi i32 [ %984, %977 ], [ %988, %985 ]
  %991 = trunc i32 %990 to i8
  store i8 %991, i8* %c, align 1
  %992 = load i8* %c, align 1
  %993 = zext i8 %992 to i32
  %994 = load i8** %p, align 8
  %995 = load i8* %994, align 1
  %996 = zext i8 %995 to i32
  %997 = mul nsw i32 %996, 8
  %998 = icmp ult i32 %993, %997
  br i1 %998, label %999, label %1021

; <label>:999                                     ; preds = %989
  %1000 = load i8* %c, align 1
  %1001 = zext i8 %1000 to i32
  %1002 = sdiv i32 %1001, 8
  %1003 = add nsw i32 1, %1002
  %1004 = sext i32 %1003 to i64
  %1005 = load i8** %p, align 8
  %1006 = getelementptr inbounds i8* %1005, i64 %1004
  %1007 = load i8* %1006, align 1
  %1008 = zext i8 %1007 to i32
  %1009 = load i8* %c, align 1
  %1010 = zext i8 %1009 to i32
  %1011 = srem i32 %1010, 8
  %1012 = shl i32 1, %1011
  %1013 = and i32 %1008, %1012
  %1014 = icmp ne i32 %1013, 0
  br i1 %1014, label %1015, label %1021

; <label>:1015                                    ; preds = %999
  %1016 = load i8* %not, align 1
  %1017 = icmp ne i8 %1016, 0
  %1018 = xor i1 %1017, true
  %1019 = zext i1 %1018 to i32
  %1020 = trunc i32 %1019 to i8
  store i8 %1020, i8* %not, align 1
  br label %1021

; <label>:1021                                    ; preds = %1015, %999, %989
  %1022 = load i8** %p, align 8
  %1023 = load i8* %1022, align 1
  %1024 = zext i8 %1023 to i32
  %1025 = add nsw i32 1, %1024
  %1026 = load i8** %p, align 8
  %1027 = sext i32 %1025 to i64
  %1028 = getelementptr inbounds i8* %1026, i64 %1027
  store i8* %1028, i8** %p, align 8
  %1029 = load i8* %not, align 1
  %1030 = icmp ne i8 %1029, 0
  br i1 %1030, label %1032, label %1031

; <label>:1031                                    ; preds = %1021
  br label %3452

; <label>:1032                                    ; preds = %1021
  br label %1033

; <label>:1033                                    ; preds = %1032
  %1034 = load i32* %lowest_active_reg, align 4
  store i32 %1034, i32* %r2, align 4
  br label %1035

; <label>:1035                                    ; preds = %1058, %1033
  %1036 = load i32* %r2, align 4
  %1037 = load i32* %highest_active_reg, align 4
  %1038 = icmp ule i32 %1036, %1037
  br i1 %1038, label %1039, label %1061

; <label>:1039                                    ; preds = %1035
  %1040 = load i32* %r2, align 4
  %1041 = zext i32 %1040 to i64
  %1042 = load %union.register_info_type** %reg_info, align 8
  %1043 = getelementptr inbounds %union.register_info_type* %1042, i64 %1041
  %1044 = bitcast %union.register_info_type* %1043 to %struct.anon.2*
  %1045 = bitcast %struct.anon.2* %1044 to i32*
  %1046 = load i32* %1045, align 4
  %1047 = and i32 %1046, -17
  %1048 = or i32 %1047, 16
  store i32 %1048, i32* %1045, align 4
  %1049 = load i32* %r2, align 4
  %1050 = zext i32 %1049 to i64
  %1051 = load %union.register_info_type** %reg_info, align 8
  %1052 = getelementptr inbounds %union.register_info_type* %1051, i64 %1050
  %1053 = bitcast %union.register_info_type* %1052 to %struct.anon.2*
  %1054 = bitcast %struct.anon.2* %1053 to i32*
  %1055 = load i32* %1054, align 4
  %1056 = and i32 %1055, -9
  %1057 = or i32 %1056, 8
  store i32 %1057, i32* %1054, align 4
  br label %1058

; <label>:1058                                    ; preds = %1039
  %1059 = load i32* %r2, align 4
  %1060 = add i32 %1059, 1
  store i32 %1060, i32* %r2, align 4
  br label %1035

; <label>:1061                                    ; preds = %1035
  br label %1062

; <label>:1062                                    ; preds = %1061
  %1063 = load i8** %d, align 8
  %1064 = getelementptr inbounds i8* %1063, i32 1
  store i8* %1064, i8** %d, align 8
  br label %3451

; <label>:1065                                    ; preds = %749
  %1066 = load i8** %p, align 8
  store i8* %1066, i8** %p1, align 8
  %1067 = load i8** %p, align 8
  %1068 = load i8* %1067, align 1
  %1069 = zext i8 %1068 to i64
  %1070 = load %union.register_info_type** %reg_info, align 8
  %1071 = getelementptr inbounds %union.register_info_type* %1070, i64 %1069
  %1072 = bitcast %union.register_info_type* %1071 to %struct.anon.2*
  %1073 = bitcast %struct.anon.2* %1072 to i32*
  %1074 = load i32* %1073, align 4
  %1075 = and i32 %1074, 3
  %1076 = icmp eq i32 %1075, 3
  br i1 %1076, label %1077, label %1094

; <label>:1077                                    ; preds = %1065
  %1078 = load i8** %pend, align 8
  %1079 = load %union.register_info_type** %reg_info, align 8
  %1080 = call signext i8 (...)* bitcast (i8 (i8**, i8*, %union.register_info_type*)* @group_match_null_string_p to i8 (...)*)(i8** %p1, i8* %1078, %union.register_info_type* %1079)
  %1081 = sext i8 %1080 to i32
  %1082 = load i8** %p, align 8
  %1083 = load i8* %1082, align 1
  %1084 = zext i8 %1083 to i64
  %1085 = load %union.register_info_type** %reg_info, align 8
  %1086 = getelementptr inbounds %union.register_info_type* %1085, i64 %1084
  %1087 = bitcast %union.register_info_type* %1086 to %struct.anon.2*
  %1088 = and i32 %1081, 3
  %1089 = bitcast %struct.anon.2* %1087 to i32*
  %1090 = and i32 %1088, 3
  %1091 = load i32* %1089, align 4
  %1092 = and i32 %1091, -4
  %1093 = or i32 %1092, %1090
  store i32 %1093, i32* %1089, align 4
  br label %1094

; <label>:1094                                    ; preds = %1077, %1065
  %1095 = load i8** %p, align 8
  %1096 = load i8* %1095, align 1
  %1097 = zext i8 %1096 to i64
  %1098 = load %union.register_info_type** %reg_info, align 8
  %1099 = getelementptr inbounds %union.register_info_type* %1098, i64 %1097
  %1100 = bitcast %union.register_info_type* %1099 to %struct.anon.2*
  %1101 = bitcast %struct.anon.2* %1100 to i32*
  %1102 = load i32* %1101, align 4
  %1103 = and i32 %1102, 3
  %1104 = icmp ne i32 %1103, 0
  br i1 %1104, label %1105, label %1124

; <label>:1105                                    ; preds = %1094
  %1106 = load i8** %p, align 8
  %1107 = load i8* %1106, align 1
  %1108 = zext i8 %1107 to i64
  %1109 = load i8*** %regstart, align 8
  %1110 = getelementptr inbounds i8** %1109, i64 %1108
  %1111 = load i8** %1110, align 8
  %1112 = icmp eq i8* %1111, inttoptr (i64 -1 to i8*)
  br i1 %1112, label %1113, label %1115

; <label>:1113                                    ; preds = %1105
  %1114 = load i8** %d, align 8
  br label %1122

; <label>:1115                                    ; preds = %1105
  %1116 = load i8** %p, align 8
  %1117 = load i8* %1116, align 1
  %1118 = zext i8 %1117 to i64
  %1119 = load i8*** %regstart, align 8
  %1120 = getelementptr inbounds i8** %1119, i64 %1118
  %1121 = load i8** %1120, align 8
  br label %1122

; <label>:1122                                    ; preds = %1115, %1113
  %1123 = phi i8* [ %1114, %1113 ], [ %1121, %1115 ]
  br label %1131

; <label>:1124                                    ; preds = %1094
  %1125 = load i8** %p, align 8
  %1126 = load i8* %1125, align 1
  %1127 = zext i8 %1126 to i64
  %1128 = load i8*** %regstart, align 8
  %1129 = getelementptr inbounds i8** %1128, i64 %1127
  %1130 = load i8** %1129, align 8
  br label %1131

; <label>:1131                                    ; preds = %1124, %1122
  %1132 = phi i8* [ %1123, %1122 ], [ %1130, %1124 ]
  %1133 = load i8** %p, align 8
  %1134 = load i8* %1133, align 1
  %1135 = zext i8 %1134 to i64
  %1136 = load i8*** %old_regstart, align 8
  %1137 = getelementptr inbounds i8** %1136, i64 %1135
  store i8* %1132, i8** %1137, align 8
  %1138 = load i8** %d, align 8
  %1139 = load i8** %p, align 8
  %1140 = load i8* %1139, align 1
  %1141 = zext i8 %1140 to i64
  %1142 = load i8*** %regstart, align 8
  %1143 = getelementptr inbounds i8** %1142, i64 %1141
  store i8* %1138, i8** %1143, align 8
  %1144 = load i8** %p, align 8
  %1145 = load i8* %1144, align 1
  %1146 = zext i8 %1145 to i64
  %1147 = load %union.register_info_type** %reg_info, align 8
  %1148 = getelementptr inbounds %union.register_info_type* %1147, i64 %1146
  %1149 = bitcast %union.register_info_type* %1148 to %struct.anon.2*
  %1150 = bitcast %struct.anon.2* %1149 to i32*
  %1151 = load i32* %1150, align 4
  %1152 = and i32 %1151, -5
  %1153 = or i32 %1152, 4
  store i32 %1153, i32* %1150, align 4
  %1154 = load i8** %p, align 8
  %1155 = load i8* %1154, align 1
  %1156 = zext i8 %1155 to i64
  %1157 = load %union.register_info_type** %reg_info, align 8
  %1158 = getelementptr inbounds %union.register_info_type* %1157, i64 %1156
  %1159 = bitcast %union.register_info_type* %1158 to %struct.anon.2*
  %1160 = bitcast %struct.anon.2* %1159 to i32*
  %1161 = load i32* %1160, align 4
  %1162 = and i32 %1161, -9
  store i32 %1162, i32* %1160, align 4
  %1163 = load i8** %p, align 8
  %1164 = load i8* %1163, align 1
  %1165 = zext i8 %1164 to i32
  store i32 %1165, i32* %highest_active_reg, align 4
  %1166 = load i32* %lowest_active_reg, align 4
  %1167 = icmp eq i32 %1166, 257
  br i1 %1167, label %1168, label %1172

; <label>:1168                                    ; preds = %1131
  %1169 = load i8** %p, align 8
  %1170 = load i8* %1169, align 1
  %1171 = zext i8 %1170 to i32
  store i32 %1171, i32* %lowest_active_reg, align 4
  br label %1172

; <label>:1172                                    ; preds = %1168, %1131
  %1173 = load i8** %p, align 8
  %1174 = getelementptr inbounds i8* %1173, i64 2
  store i8* %1174, i8** %p, align 8
  br label %3451

; <label>:1175                                    ; preds = %749
  %1176 = load i8** %p, align 8
  %1177 = load i8* %1176, align 1
  %1178 = zext i8 %1177 to i64
  %1179 = load %union.register_info_type** %reg_info, align 8
  %1180 = getelementptr inbounds %union.register_info_type* %1179, i64 %1178
  %1181 = bitcast %union.register_info_type* %1180 to %struct.anon.2*
  %1182 = bitcast %struct.anon.2* %1181 to i32*
  %1183 = load i32* %1182, align 4
  %1184 = and i32 %1183, 3
  %1185 = icmp ne i32 %1184, 0
  br i1 %1185, label %1186, label %1205

; <label>:1186                                    ; preds = %1175
  %1187 = load i8** %p, align 8
  %1188 = load i8* %1187, align 1
  %1189 = zext i8 %1188 to i64
  %1190 = load i8*** %regend, align 8
  %1191 = getelementptr inbounds i8** %1190, i64 %1189
  %1192 = load i8** %1191, align 8
  %1193 = icmp eq i8* %1192, inttoptr (i64 -1 to i8*)
  br i1 %1193, label %1194, label %1196

; <label>:1194                                    ; preds = %1186
  %1195 = load i8** %d, align 8
  br label %1203

; <label>:1196                                    ; preds = %1186
  %1197 = load i8** %p, align 8
  %1198 = load i8* %1197, align 1
  %1199 = zext i8 %1198 to i64
  %1200 = load i8*** %regend, align 8
  %1201 = getelementptr inbounds i8** %1200, i64 %1199
  %1202 = load i8** %1201, align 8
  br label %1203

; <label>:1203                                    ; preds = %1196, %1194
  %1204 = phi i8* [ %1195, %1194 ], [ %1202, %1196 ]
  br label %1212

; <label>:1205                                    ; preds = %1175
  %1206 = load i8** %p, align 8
  %1207 = load i8* %1206, align 1
  %1208 = zext i8 %1207 to i64
  %1209 = load i8*** %regend, align 8
  %1210 = getelementptr inbounds i8** %1209, i64 %1208
  %1211 = load i8** %1210, align 8
  br label %1212

; <label>:1212                                    ; preds = %1205, %1203
  %1213 = phi i8* [ %1204, %1203 ], [ %1211, %1205 ]
  %1214 = load i8** %p, align 8
  %1215 = load i8* %1214, align 1
  %1216 = zext i8 %1215 to i64
  %1217 = load i8*** %old_regend, align 8
  %1218 = getelementptr inbounds i8** %1217, i64 %1216
  store i8* %1213, i8** %1218, align 8
  %1219 = load i8** %d, align 8
  %1220 = load i8** %p, align 8
  %1221 = load i8* %1220, align 1
  %1222 = zext i8 %1221 to i64
  %1223 = load i8*** %regend, align 8
  %1224 = getelementptr inbounds i8** %1223, i64 %1222
  store i8* %1219, i8** %1224, align 8
  %1225 = load i8** %p, align 8
  %1226 = load i8* %1225, align 1
  %1227 = zext i8 %1226 to i64
  %1228 = load %union.register_info_type** %reg_info, align 8
  %1229 = getelementptr inbounds %union.register_info_type* %1228, i64 %1227
  %1230 = bitcast %union.register_info_type* %1229 to %struct.anon.2*
  %1231 = bitcast %struct.anon.2* %1230 to i32*
  %1232 = load i32* %1231, align 4
  %1233 = and i32 %1232, -5
  store i32 %1233, i32* %1231, align 4
  %1234 = load i32* %lowest_active_reg, align 4
  %1235 = load i32* %highest_active_reg, align 4
  %1236 = icmp eq i32 %1234, %1235
  br i1 %1236, label %1237, label %1238

; <label>:1237                                    ; preds = %1212
  store i32 257, i32* %lowest_active_reg, align 4
  store i32 256, i32* %highest_active_reg, align 4
  br label %1274

; <label>:1238                                    ; preds = %1212
  %1239 = load i8** %p, align 8
  %1240 = load i8* %1239, align 1
  %1241 = zext i8 %1240 to i32
  %1242 = sub nsw i32 %1241, 1
  %1243 = trunc i32 %1242 to i8
  store i8 %1243, i8* %r3, align 1
  br label %1244

; <label>:1244                                    ; preds = %1262, %1238
  %1245 = load i8* %r3, align 1
  %1246 = zext i8 %1245 to i32
  %1247 = icmp sgt i32 %1246, 0
  br i1 %1247, label %1248, label %1260

; <label>:1248                                    ; preds = %1244
  %1249 = load i8* %r3, align 1
  %1250 = zext i8 %1249 to i64
  %1251 = load %union.register_info_type** %reg_info, align 8
  %1252 = getelementptr inbounds %union.register_info_type* %1251, i64 %1250
  %1253 = bitcast %union.register_info_type* %1252 to %struct.anon.2*
  %1254 = bitcast %struct.anon.2* %1253 to i32*
  %1255 = load i32* %1254, align 4
  %1256 = lshr i32 %1255, 2
  %1257 = and i32 %1256, 1
  %1258 = icmp ne i32 %1257, 0
  %1259 = xor i1 %1258, true
  br label %1260

; <label>:1260                                    ; preds = %1248, %1244
  %1261 = phi i1 [ false, %1244 ], [ %1259, %1248 ]
  br i1 %1261, label %1262, label %1265

; <label>:1262                                    ; preds = %1260
  %1263 = load i8* %r3, align 1
  %1264 = add i8 %1263, -1
  store i8 %1264, i8* %r3, align 1
  br label %1244

; <label>:1265                                    ; preds = %1260
  %1266 = load i8* %r3, align 1
  %1267 = zext i8 %1266 to i32
  %1268 = icmp eq i32 %1267, 0
  br i1 %1268, label %1269, label %1270

; <label>:1269                                    ; preds = %1265
  store i32 257, i32* %lowest_active_reg, align 4
  store i32 256, i32* %highest_active_reg, align 4
  br label %1273

; <label>:1270                                    ; preds = %1265
  %1271 = load i8* %r3, align 1
  %1272 = zext i8 %1271 to i32
  store i32 %1272, i32* %highest_active_reg, align 4
  br label %1273

; <label>:1273                                    ; preds = %1270, %1269
  br label %1274

; <label>:1274                                    ; preds = %1273, %1237
  %1275 = load i8** %p, align 8
  %1276 = load i8* %1275, align 1
  %1277 = zext i8 %1276 to i64
  %1278 = load %union.register_info_type** %reg_info, align 8
  %1279 = getelementptr inbounds %union.register_info_type* %1278, i64 %1277
  %1280 = bitcast %union.register_info_type* %1279 to %struct.anon.2*
  %1281 = bitcast %struct.anon.2* %1280 to i32*
  %1282 = load i32* %1281, align 4
  %1283 = lshr i32 %1282, 3
  %1284 = and i32 %1283, 1
  %1285 = icmp ne i32 %1284, 0
  br i1 %1285, label %1286, label %1292

; <label>:1286                                    ; preds = %1274
  %1287 = load i8** %p, align 8
  %1288 = getelementptr inbounds i8* %1287, i64 -3
  %1289 = load i8* %1288, align 1
  %1290 = zext i8 %1289 to i32
  %1291 = icmp eq i32 %1290, 5
  br i1 %1291, label %1292, label %1596

; <label>:1292                                    ; preds = %1286, %1274
  %1293 = load i8** %p, align 8
  %1294 = getelementptr inbounds i8* %1293, i64 2
  %1295 = load i8** %pend, align 8
  %1296 = icmp ult i8* %1294, %1295
  br i1 %1296, label %1297, label %1596

; <label>:1297                                    ; preds = %1292
  store i8 0, i8* %is_a_jump_n, align 1
  %1298 = load i8** %p, align 8
  %1299 = getelementptr inbounds i8* %1298, i64 2
  store i8* %1299, i8** %p1, align 8
  store i32 0, i32* %mcnt, align 4
  %1300 = load i8** %p1, align 8
  %1301 = getelementptr inbounds i8* %1300, i32 1
  store i8* %1301, i8** %p1, align 8
  %1302 = load i8* %1300, align 1
  %1303 = zext i8 %1302 to i32
  switch i32 %1303, label %1329 [
    i32 21, label %1304
    i32 16, label %1305
    i32 17, label %1305
    i32 12, label %1305
    i32 18, label %1305
  ]

; <label>:1304                                    ; preds = %1297
  store i8 1, i8* %is_a_jump_n, align 1
  br label %1305

; <label>:1305                                    ; preds = %1304, %1297, %1297, %1297, %1297
  br label %1306

; <label>:1306                                    ; preds = %1305
  br label %1307

; <label>:1307                                    ; preds = %1306
  %1308 = load i8** %p1, align 8
  %1309 = load i8* %1308, align 1
  %1310 = zext i8 %1309 to i32
  %1311 = and i32 %1310, 255
  store i32 %1311, i32* %mcnt, align 4
  %1312 = load i8** %p1, align 8
  %1313 = getelementptr inbounds i8* %1312, i64 1
  %1314 = load i8* %1313, align 1
  %1315 = sext i8 %1314 to i32
  %1316 = shl i32 %1315, 8
  %1317 = load i32* %mcnt, align 4
  %1318 = add nsw i32 %1317, %1316
  store i32 %1318, i32* %mcnt, align 4
  br label %1319

; <label>:1319                                    ; preds = %1307
  %1320 = load i8** %p1, align 8
  %1321 = getelementptr inbounds i8* %1320, i64 2
  store i8* %1321, i8** %p1, align 8
  br label %1322

; <label>:1322                                    ; preds = %1319
  %1323 = load i8* %is_a_jump_n, align 1
  %1324 = icmp ne i8 %1323, 0
  br i1 %1324, label %1325, label %1328

; <label>:1325                                    ; preds = %1322
  %1326 = load i8** %p1, align 8
  %1327 = getelementptr inbounds i8* %1326, i64 2
  store i8* %1327, i8** %p1, align 8
  br label %1328

; <label>:1328                                    ; preds = %1325, %1322
  br label %1330

; <label>:1329                                    ; preds = %1297
  br label %1330

; <label>:1330                                    ; preds = %1329, %1328
  %1331 = load i32* %mcnt, align 4
  %1332 = load i8** %p1, align 8
  %1333 = sext i32 %1331 to i64
  %1334 = getelementptr inbounds i8* %1332, i64 %1333
  store i8* %1334, i8** %p1, align 8
  %1335 = load i32* %mcnt, align 4
  %1336 = icmp slt i32 %1335, 0
  br i1 %1336, label %1337, label %1595

; <label>:1337                                    ; preds = %1330
  %1338 = load i8** %p1, align 8
  %1339 = load i8* %1338, align 1
  %1340 = zext i8 %1339 to i32
  %1341 = icmp eq i32 %1340, 14
  br i1 %1341, label %1342, label %1595

; <label>:1342                                    ; preds = %1337
  %1343 = load i8** %p1, align 8
  %1344 = getelementptr inbounds i8* %1343, i64 3
  %1345 = load i8* %1344, align 1
  %1346 = zext i8 %1345 to i32
  %1347 = icmp eq i32 %1346, 5
  br i1 %1347, label %1348, label %1595

; <label>:1348                                    ; preds = %1342
  %1349 = load i8** %p1, align 8
  %1350 = getelementptr inbounds i8* %1349, i64 4
  %1351 = load i8* %1350, align 1
  %1352 = zext i8 %1351 to i32
  %1353 = load i8** %p, align 8
  %1354 = load i8* %1353, align 1
  %1355 = zext i8 %1354 to i32
  %1356 = icmp eq i32 %1352, %1355
  br i1 %1356, label %1357, label %1595

; <label>:1357                                    ; preds = %1348
  %1358 = load i8** %p, align 8
  %1359 = load i8* %1358, align 1
  %1360 = zext i8 %1359 to i64
  %1361 = load %union.register_info_type** %reg_info, align 8
  %1362 = getelementptr inbounds %union.register_info_type* %1361, i64 %1360
  %1363 = bitcast %union.register_info_type* %1362 to %struct.anon.2*
  %1364 = bitcast %struct.anon.2* %1363 to i32*
  %1365 = load i32* %1364, align 4
  %1366 = lshr i32 %1365, 4
  %1367 = and i32 %1366, 1
  %1368 = icmp ne i32 %1367, 0
  br i1 %1368, label %1369, label %1431

; <label>:1369                                    ; preds = %1357
  %1370 = load i8** %p, align 8
  %1371 = load i8* %1370, align 1
  %1372 = zext i8 %1371 to i64
  %1373 = load %union.register_info_type** %reg_info, align 8
  %1374 = getelementptr inbounds %union.register_info_type* %1373, i64 %1372
  %1375 = bitcast %union.register_info_type* %1374 to %struct.anon.2*
  %1376 = bitcast %struct.anon.2* %1375 to i32*
  %1377 = load i32* %1376, align 4
  %1378 = and i32 %1377, -17
  store i32 %1378, i32* %1376, align 4
  %1379 = load i8** %p, align 8
  %1380 = load i8* %1379, align 1
  %1381 = zext i8 %1380 to i32
  store i32 %1381, i32* %r4, align 4
  br label %1382

; <label>:1382                                    ; preds = %1427, %1369
  %1383 = load i32* %r4, align 4
  %1384 = load i8** %p, align 8
  %1385 = load i8* %1384, align 1
  %1386 = zext i8 %1385 to i32
  %1387 = load i8** %p, align 8
  %1388 = getelementptr inbounds i8* %1387, i64 1
  %1389 = load i8* %1388, align 1
  %1390 = zext i8 %1389 to i32
  %1391 = add nsw i32 %1386, %1390
  %1392 = icmp ult i32 %1383, %1391
  br i1 %1392, label %1393, label %1430

; <label>:1393                                    ; preds = %1382
  %1394 = load i32* %r4, align 4
  %1395 = zext i32 %1394 to i64
  %1396 = load i8*** %old_regstart, align 8
  %1397 = getelementptr inbounds i8** %1396, i64 %1395
  %1398 = load i8** %1397, align 8
  %1399 = load i32* %r4, align 4
  %1400 = zext i32 %1399 to i64
  %1401 = load i8*** %regstart, align 8
  %1402 = getelementptr inbounds i8** %1401, i64 %1400
  store i8* %1398, i8** %1402, align 8
  %1403 = load i32* %r4, align 4
  %1404 = zext i32 %1403 to i64
  %1405 = load i8*** %old_regend, align 8
  %1406 = getelementptr inbounds i8** %1405, i64 %1404
  %1407 = load i8** %1406, align 8
  %1408 = ptrtoint i8* %1407 to i32
  %1409 = load i32* %r4, align 4
  %1410 = zext i32 %1409 to i64
  %1411 = load i8*** %regstart, align 8
  %1412 = getelementptr inbounds i8** %1411, i64 %1410
  %1413 = load i8** %1412, align 8
  %1414 = ptrtoint i8* %1413 to i32
  %1415 = icmp sge i32 %1408, %1414
  br i1 %1415, label %1416, label %1426

; <label>:1416                                    ; preds = %1393
  %1417 = load i32* %r4, align 4
  %1418 = zext i32 %1417 to i64
  %1419 = load i8*** %old_regend, align 8
  %1420 = getelementptr inbounds i8** %1419, i64 %1418
  %1421 = load i8** %1420, align 8
  %1422 = load i32* %r4, align 4
  %1423 = zext i32 %1422 to i64
  %1424 = load i8*** %regend, align 8
  %1425 = getelementptr inbounds i8** %1424, i64 %1423
  store i8* %1421, i8** %1425, align 8
  br label %1426

; <label>:1426                                    ; preds = %1416, %1393
  br label %1427

; <label>:1427                                    ; preds = %1426
  %1428 = load i32* %r4, align 4
  %1429 = add i32 %1428, 1
  store i32 %1429, i32* %r4, align 4
  br label %1382

; <label>:1430                                    ; preds = %1382
  br label %1431

; <label>:1431                                    ; preds = %1430, %1357
  %1432 = load i8** %p1, align 8
  %1433 = getelementptr inbounds i8* %1432, i32 1
  store i8* %1433, i8** %p1, align 8
  br label %1434

; <label>:1434                                    ; preds = %1431
  br label %1435

; <label>:1435                                    ; preds = %1434
  %1436 = load i8** %p1, align 8
  %1437 = load i8* %1436, align 1
  %1438 = zext i8 %1437 to i32
  %1439 = and i32 %1438, 255
  store i32 %1439, i32* %mcnt, align 4
  %1440 = load i8** %p1, align 8
  %1441 = getelementptr inbounds i8* %1440, i64 1
  %1442 = load i8* %1441, align 1
  %1443 = sext i8 %1442 to i32
  %1444 = shl i32 %1443, 8
  %1445 = load i32* %mcnt, align 4
  %1446 = add nsw i32 %1445, %1444
  store i32 %1446, i32* %mcnt, align 4
  br label %1447

; <label>:1447                                    ; preds = %1435
  %1448 = load i8** %p1, align 8
  %1449 = getelementptr inbounds i8* %1448, i64 2
  store i8* %1449, i8** %p1, align 8
  br label %1450

; <label>:1450                                    ; preds = %1447
  br label %1451

; <label>:1451                                    ; preds = %1450
  br label %1452

; <label>:1452                                    ; preds = %1506, %1451
  %1453 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %1454 = load i32* %1453, align 4
  %1455 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %1456 = load i32* %1455, align 4
  %1457 = sub i32 %1454, %1456
  %1458 = load i32* %highest_active_reg, align 4
  %1459 = load i32* %lowest_active_reg, align 4
  %1460 = sub i32 %1458, %1459
  %1461 = add i32 %1460, 1
  %1462 = mul i32 %1461, 3
  %1463 = add i32 %1462, 4
  %1464 = icmp ult i32 %1457, %1463
  br i1 %1464, label %1465, label %1507

; <label>:1465                                    ; preds = %1452
  %1466 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %1467 = load i32* %1466, align 4
  %1468 = load i32* @re_max_failures, align 4
  %1469 = load i32* %num_regs, align 4
  %1470 = sub i32 %1469, 1
  %1471 = mul i32 %1470, 3
  %1472 = add i32 %1471, 4
  %1473 = mul i32 %1468, %1472
  %1474 = icmp ugt i32 %1467, %1473
  br i1 %1474, label %1475, label %1476

; <label>:1475                                    ; preds = %1465
  br i1 false, label %1506, label %1505

; <label>:1476                                    ; preds = %1465
  %1477 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %1478 = load i32* %1477, align 4
  %1479 = shl i32 %1478, 1
  %1480 = zext i32 %1479 to i64
  %1481 = mul i64 %1480, 8
  %1482 = alloca i8, i64 %1481
  store i8* %1482, i8** %destination, align 8
  %1483 = load i8** %destination, align 8
  %1484 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1485 = load i8*** %1484, align 8
  %1486 = bitcast i8** %1485 to i8*
  %1487 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %1488 = load i32* %1487, align 4
  %1489 = zext i32 %1488 to i64
  %1490 = mul i64 %1489, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1483, i8* %1486, i64 %1490, i32 1, i1 false)
  %1491 = load i8** %destination, align 8
  %1492 = bitcast i8* %1491 to i8**
  %1493 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  store i8** %1492, i8*** %1493, align 8
  %1494 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1495 = load i8*** %1494, align 8
  %1496 = icmp eq i8** %1495, null
  br i1 %1496, label %1497, label %1498

; <label>:1497                                    ; preds = %1476
  br label %1502

; <label>:1498                                    ; preds = %1476
  %1499 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %1500 = load i32* %1499, align 4
  %1501 = shl i32 %1500, 1
  store i32 %1501, i32* %1499, align 4
  br label %1502

; <label>:1502                                    ; preds = %1498, %1497
  %1503 = phi i32 [ 0, %1497 ], [ 1, %1498 ]
  %1504 = icmp ne i32 %1503, 0
  br i1 %1504, label %1506, label %1505

; <label>:1505                                    ; preds = %1502, %1475
  store i32 -2, i32* %1
  br label %3618

; <label>:1506                                    ; preds = %1502, %1475
  br label %1452

; <label>:1507                                    ; preds = %1452
  %1508 = load i32* %lowest_active_reg, align 4
  store i32 %1508, i32* %this_reg, align 4
  br label %1509

; <label>:1509                                    ; preds = %1551, %1507
  %1510 = load i32* %this_reg, align 4
  %1511 = load i32* %highest_active_reg, align 4
  %1512 = icmp ule i32 %1510, %1511
  br i1 %1512, label %1513, label %1554

; <label>:1513                                    ; preds = %1509
  %1514 = load i32* %this_reg, align 4
  %1515 = sext i32 %1514 to i64
  %1516 = load i8*** %regstart, align 8
  %1517 = getelementptr inbounds i8** %1516, i64 %1515
  %1518 = load i8** %1517, align 8
  %1519 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %1520 = load i32* %1519, align 4
  %1521 = add i32 %1520, 1
  store i32 %1521, i32* %1519, align 4
  %1522 = zext i32 %1520 to i64
  %1523 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1524 = load i8*** %1523, align 8
  %1525 = getelementptr inbounds i8** %1524, i64 %1522
  store i8* %1518, i8** %1525, align 8
  %1526 = load i32* %this_reg, align 4
  %1527 = sext i32 %1526 to i64
  %1528 = load i8*** %regend, align 8
  %1529 = getelementptr inbounds i8** %1528, i64 %1527
  %1530 = load i8** %1529, align 8
  %1531 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %1532 = load i32* %1531, align 4
  %1533 = add i32 %1532, 1
  store i32 %1533, i32* %1531, align 4
  %1534 = zext i32 %1532 to i64
  %1535 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1536 = load i8*** %1535, align 8
  %1537 = getelementptr inbounds i8** %1536, i64 %1534
  store i8* %1530, i8** %1537, align 8
  %1538 = load i32* %this_reg, align 4
  %1539 = sext i32 %1538 to i64
  %1540 = load %union.register_info_type** %reg_info, align 8
  %1541 = getelementptr inbounds %union.register_info_type* %1540, i64 %1539
  %1542 = bitcast %union.register_info_type* %1541 to i8**
  %1543 = load i8** %1542, align 8
  %1544 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %1545 = load i32* %1544, align 4
  %1546 = add i32 %1545, 1
  store i32 %1546, i32* %1544, align 4
  %1547 = zext i32 %1545 to i64
  %1548 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1549 = load i8*** %1548, align 8
  %1550 = getelementptr inbounds i8** %1549, i64 %1547
  store i8* %1543, i8** %1550, align 8
  br label %1551

; <label>:1551                                    ; preds = %1513
  %1552 = load i32* %this_reg, align 4
  %1553 = add nsw i32 %1552, 1
  store i32 %1553, i32* %this_reg, align 4
  br label %1509

; <label>:1554                                    ; preds = %1509
  %1555 = load i32* %lowest_active_reg, align 4
  %1556 = zext i32 %1555 to i64
  %1557 = inttoptr i64 %1556 to i8*
  %1558 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %1559 = load i32* %1558, align 4
  %1560 = add i32 %1559, 1
  store i32 %1560, i32* %1558, align 4
  %1561 = zext i32 %1559 to i64
  %1562 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1563 = load i8*** %1562, align 8
  %1564 = getelementptr inbounds i8** %1563, i64 %1561
  store i8* %1557, i8** %1564, align 8
  %1565 = load i32* %highest_active_reg, align 4
  %1566 = zext i32 %1565 to i64
  %1567 = inttoptr i64 %1566 to i8*
  %1568 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %1569 = load i32* %1568, align 4
  %1570 = add i32 %1569, 1
  store i32 %1570, i32* %1568, align 4
  %1571 = zext i32 %1569 to i64
  %1572 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1573 = load i8*** %1572, align 8
  %1574 = getelementptr inbounds i8** %1573, i64 %1571
  store i8* %1567, i8** %1574, align 8
  %1575 = load i8** %p1, align 8
  %1576 = load i32* %mcnt, align 4
  %1577 = sext i32 %1576 to i64
  %1578 = getelementptr inbounds i8* %1575, i64 %1577
  %1579 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %1580 = load i32* %1579, align 4
  %1581 = add i32 %1580, 1
  store i32 %1581, i32* %1579, align 4
  %1582 = zext i32 %1580 to i64
  %1583 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1584 = load i8*** %1583, align 8
  %1585 = getelementptr inbounds i8** %1584, i64 %1582
  store i8* %1578, i8** %1585, align 8
  %1586 = load i8** %d, align 8
  %1587 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %1588 = load i32* %1587, align 4
  %1589 = add i32 %1588, 1
  store i32 %1589, i32* %1587, align 4
  %1590 = zext i32 %1588 to i64
  %1591 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1592 = load i8*** %1591, align 8
  %1593 = getelementptr inbounds i8** %1592, i64 %1590
  store i8* %1586, i8** %1593, align 8
  br label %1594

; <label>:1594                                    ; preds = %1554
  br label %3452

; <label>:1595                                    ; preds = %1348, %1342, %1337, %1330
  br label %1596

; <label>:1596                                    ; preds = %1595, %1292, %1286
  %1597 = load i8** %p, align 8
  %1598 = getelementptr inbounds i8* %1597, i64 2
  store i8* %1598, i8** %p, align 8
  br label %3451

; <label>:1599                                    ; preds = %749
  %1600 = load i8** %p, align 8
  %1601 = getelementptr inbounds i8* %1600, i32 1
  store i8* %1601, i8** %p, align 8
  %1602 = load i8* %1600, align 1
  %1603 = zext i8 %1602 to i32
  store i32 %1603, i32* %regno, align 4
  %1604 = load i32* %regno, align 4
  %1605 = sext i32 %1604 to i64
  %1606 = load i8*** %regstart, align 8
  %1607 = getelementptr inbounds i8** %1606, i64 %1605
  %1608 = load i8** %1607, align 8
  %1609 = icmp eq i8* %1608, inttoptr (i64 -1 to i8*)
  br i1 %1609, label %1617, label %1610

; <label>:1610                                    ; preds = %1599
  %1611 = load i32* %regno, align 4
  %1612 = sext i32 %1611 to i64
  %1613 = load i8*** %regend, align 8
  %1614 = getelementptr inbounds i8** %1613, i64 %1612
  %1615 = load i8** %1614, align 8
  %1616 = icmp eq i8* %1615, inttoptr (i64 -1 to i8*)
  br i1 %1616, label %1617, label %1618

; <label>:1617                                    ; preds = %1610, %1599
  br label %3452

; <label>:1618                                    ; preds = %1610
  %1619 = load i32* %regno, align 4
  %1620 = sext i32 %1619 to i64
  %1621 = load i8*** %regstart, align 8
  %1622 = getelementptr inbounds i8** %1621, i64 %1620
  %1623 = load i8** %1622, align 8
  store i8* %1623, i8** %d2, align 8
  %1624 = load i32* %4, align 4
  %1625 = icmp ne i32 %1624, 0
  br i1 %1625, label %1626, label %1645

; <label>:1626                                    ; preds = %1618
  %1627 = load i8** %3, align 8
  %1628 = load i32* %regno, align 4
  %1629 = sext i32 %1628 to i64
  %1630 = load i8*** %regstart, align 8
  %1631 = getelementptr inbounds i8** %1630, i64 %1629
  %1632 = load i8** %1631, align 8
  %1633 = icmp ule i8* %1627, %1632
  br i1 %1633, label %1634, label %1645

; <label>:1634                                    ; preds = %1626
  %1635 = load i32* %regno, align 4
  %1636 = sext i32 %1635 to i64
  %1637 = load i8*** %regstart, align 8
  %1638 = getelementptr inbounds i8** %1637, i64 %1636
  %1639 = load i8** %1638, align 8
  %1640 = load i8** %3, align 8
  %1641 = load i32* %4, align 4
  %1642 = sext i32 %1641 to i64
  %1643 = getelementptr inbounds i8* %1640, i64 %1642
  %1644 = icmp ule i8* %1639, %1643
  br label %1645

; <label>:1645                                    ; preds = %1634, %1626, %1618
  %1646 = phi i1 [ false, %1626 ], [ false, %1618 ], [ %1644, %1634 ]
  %1647 = zext i1 %1646 to i32
  %1648 = load i32* %4, align 4
  %1649 = icmp ne i32 %1648, 0
  br i1 %1649, label %1650, label %1669

; <label>:1650                                    ; preds = %1645
  %1651 = load i8** %3, align 8
  %1652 = load i32* %regno, align 4
  %1653 = sext i32 %1652 to i64
  %1654 = load i8*** %regend, align 8
  %1655 = getelementptr inbounds i8** %1654, i64 %1653
  %1656 = load i8** %1655, align 8
  %1657 = icmp ule i8* %1651, %1656
  br i1 %1657, label %1658, label %1669

; <label>:1658                                    ; preds = %1650
  %1659 = load i32* %regno, align 4
  %1660 = sext i32 %1659 to i64
  %1661 = load i8*** %regend, align 8
  %1662 = getelementptr inbounds i8** %1661, i64 %1660
  %1663 = load i8** %1662, align 8
  %1664 = load i8** %3, align 8
  %1665 = load i32* %4, align 4
  %1666 = sext i32 %1665 to i64
  %1667 = getelementptr inbounds i8* %1664, i64 %1666
  %1668 = icmp ule i8* %1663, %1667
  br label %1669

; <label>:1669                                    ; preds = %1658, %1650, %1645
  %1670 = phi i1 [ false, %1650 ], [ false, %1645 ], [ %1668, %1658 ]
  %1671 = zext i1 %1670 to i32
  %1672 = icmp eq i32 %1647, %1671
  br i1 %1672, label %1673, label %1679

; <label>:1673                                    ; preds = %1669
  %1674 = load i32* %regno, align 4
  %1675 = sext i32 %1674 to i64
  %1676 = load i8*** %regend, align 8
  %1677 = getelementptr inbounds i8** %1676, i64 %1675
  %1678 = load i8** %1677, align 8
  br label %1681

; <label>:1679                                    ; preds = %1669
  %1680 = load i8** %end_match_1, align 8
  br label %1681

; <label>:1681                                    ; preds = %1679, %1673
  %1682 = phi i8* [ %1678, %1673 ], [ %1680, %1679 ]
  store i8* %1682, i8** %dend2, align 8
  br label %1683

; <label>:1683                                    ; preds = %1767, %1681
  br label %1684

; <label>:1684                                    ; preds = %1702, %1683
  %1685 = load i8** %d2, align 8
  %1686 = load i8** %dend2, align 8
  %1687 = icmp eq i8* %1685, %1686
  br i1 %1687, label %1688, label %1709

; <label>:1688                                    ; preds = %1684
  %1689 = load i8** %dend2, align 8
  %1690 = load i8** %end_match_2, align 8
  %1691 = icmp eq i8* %1689, %1690
  br i1 %1691, label %1692, label %1693

; <label>:1692                                    ; preds = %1688
  br label %1709

; <label>:1693                                    ; preds = %1688
  %1694 = load i8** %dend2, align 8
  %1695 = load i32* %regno, align 4
  %1696 = sext i32 %1695 to i64
  %1697 = load i8*** %regend, align 8
  %1698 = getelementptr inbounds i8** %1697, i64 %1696
  %1699 = load i8** %1698, align 8
  %1700 = icmp eq i8* %1694, %1699
  br i1 %1700, label %1701, label %1702

; <label>:1701                                    ; preds = %1693
  br label %1709

; <label>:1702                                    ; preds = %1693
  %1703 = load i8** %5, align 8
  store i8* %1703, i8** %d2, align 8
  %1704 = load i32* %regno, align 4
  %1705 = sext i32 %1704 to i64
  %1706 = load i8*** %regend, align 8
  %1707 = getelementptr inbounds i8** %1706, i64 %1705
  %1708 = load i8** %1707, align 8
  store i8* %1708, i8** %dend2, align 8
  br label %1684

; <label>:1709                                    ; preds = %1701, %1692, %1684
  %1710 = load i8** %d2, align 8
  %1711 = load i8** %dend2, align 8
  %1712 = icmp eq i8* %1710, %1711
  br i1 %1712, label %1713, label %1714

; <label>:1713                                    ; preds = %1709
  br label %1776

; <label>:1714                                    ; preds = %1709
  br label %1715

; <label>:1715                                    ; preds = %1724, %1714
  %1716 = load i8** %d, align 8
  %1717 = load i8** %dend, align 8
  %1718 = icmp eq i8* %1716, %1717
  br i1 %1718, label %1719, label %1727

; <label>:1719                                    ; preds = %1715
  %1720 = load i8** %dend, align 8
  %1721 = load i8** %end_match_2, align 8
  %1722 = icmp eq i8* %1720, %1721
  br i1 %1722, label %1723, label %1724

; <label>:1723                                    ; preds = %1719
  br label %3452

; <label>:1724                                    ; preds = %1719
  %1725 = load i8** %5, align 8
  store i8* %1725, i8** %d, align 8
  %1726 = load i8** %end_match_2, align 8
  store i8* %1726, i8** %dend, align 8
  br label %1715

; <label>:1727                                    ; preds = %1715
  %1728 = load i8** %dend, align 8
  %1729 = load i8** %d, align 8
  %1730 = ptrtoint i8* %1728 to i64
  %1731 = ptrtoint i8* %1729 to i64
  %1732 = sub i64 %1730, %1731
  %1733 = trunc i64 %1732 to i32
  store i32 %1733, i32* %mcnt, align 4
  %1734 = load i32* %mcnt, align 4
  %1735 = sext i32 %1734 to i64
  %1736 = load i8** %dend2, align 8
  %1737 = load i8** %d2, align 8
  %1738 = ptrtoint i8* %1736 to i64
  %1739 = ptrtoint i8* %1737 to i64
  %1740 = sub i64 %1738, %1739
  %1741 = icmp sgt i64 %1735, %1740
  br i1 %1741, label %1742, label %1749

; <label>:1742                                    ; preds = %1727
  %1743 = load i8** %dend2, align 8
  %1744 = load i8** %d2, align 8
  %1745 = ptrtoint i8* %1743 to i64
  %1746 = ptrtoint i8* %1744 to i64
  %1747 = sub i64 %1745, %1746
  %1748 = trunc i64 %1747 to i32
  store i32 %1748, i32* %mcnt, align 4
  br label %1749

; <label>:1749                                    ; preds = %1742, %1727
  %1750 = load i8** %translate, align 8
  %1751 = icmp ne i8* %1750, null
  br i1 %1751, label %1752, label %1759

; <label>:1752                                    ; preds = %1749
  %1753 = load i8** %d, align 8
  %1754 = load i8** %d2, align 8
  %1755 = load i32* %mcnt, align 4
  %1756 = load i8** %translate, align 8
  %1757 = call i32 (...)* bitcast (i32 (i8*, i8*, i32, i8*)* @bcmp_translate to i32 (...)*)(i8* %1753, i8* %1754, i32 %1755, i8* %1756)
  %1758 = icmp ne i32 %1757, 0
  br i1 %1758, label %1766, label %1767

; <label>:1759                                    ; preds = %1749
  %1760 = load i8** %d, align 8
  %1761 = load i8** %d2, align 8
  %1762 = load i32* %mcnt, align 4
  %1763 = sext i32 %1762 to i64
  %1764 = call i32 @memcmp(i8* %1760, i8* %1761, i64 %1763) nounwind readonly
  %1765 = icmp ne i32 %1764, 0
  br i1 %1765, label %1766, label %1767

; <label>:1766                                    ; preds = %1759, %1752
  br label %3452

; <label>:1767                                    ; preds = %1759, %1752
  %1768 = load i32* %mcnt, align 4
  %1769 = load i8** %d, align 8
  %1770 = sext i32 %1768 to i64
  %1771 = getelementptr inbounds i8* %1769, i64 %1770
  store i8* %1771, i8** %d, align 8
  %1772 = load i32* %mcnt, align 4
  %1773 = load i8** %d2, align 8
  %1774 = sext i32 %1772 to i64
  %1775 = getelementptr inbounds i8* %1773, i64 %1774
  store i8* %1775, i8** %d2, align 8
  br label %1683

; <label>:1776                                    ; preds = %1713
  br label %3451

; <label>:1777                                    ; preds = %749
  %1778 = load i8** %d, align 8
  %1779 = load i32* %4, align 4
  %1780 = icmp ne i32 %1779, 0
  br i1 %1780, label %1781, label %1783

; <label>:1781                                    ; preds = %1777
  %1782 = load i8** %3, align 8
  br label %1785

; <label>:1783                                    ; preds = %1777
  %1784 = load i8** %5, align 8
  br label %1785

; <label>:1785                                    ; preds = %1783, %1781
  %1786 = phi i8* [ %1782, %1781 ], [ %1784, %1783 ]
  %1787 = icmp eq i8* %1778, %1786
  br i1 %1787, label %1791, label %1788

; <label>:1788                                    ; preds = %1785
  %1789 = load i32* %6, align 4
  %1790 = icmp ne i32 %1789, 0
  br i1 %1790, label %1802, label %1791

; <label>:1791                                    ; preds = %1788, %1785
  %1792 = load %struct.re_pattern_buffer** %2, align 8
  %1793 = bitcast %struct.re_pattern_buffer* %1792 to i8*
  %1794 = getelementptr i8* %1793, i32 56
  %1795 = bitcast i8* %1794 to i32*
  %1796 = load i32* %1795, align 8
  %1797 = lshr i32 %1796, 5
  %1798 = and i32 %1797, 1
  %1799 = icmp ne i32 %1798, 0
  br i1 %1799, label %1801, label %1800

; <label>:1800                                    ; preds = %1791
  br label %3451

; <label>:1801                                    ; preds = %1791
  br label %1819

; <label>:1802                                    ; preds = %1788
  %1803 = load i8** %d, align 8
  %1804 = getelementptr inbounds i8* %1803, i64 -1
  %1805 = load i8* %1804, align 1
  %1806 = sext i8 %1805 to i32
  %1807 = icmp eq i32 %1806, 10
  br i1 %1807, label %1808, label %1818

; <label>:1808                                    ; preds = %1802
  %1809 = load %struct.re_pattern_buffer** %2, align 8
  %1810 = bitcast %struct.re_pattern_buffer* %1809 to i8*
  %1811 = getelementptr i8* %1810, i32 56
  %1812 = bitcast i8* %1811 to i32*
  %1813 = load i32* %1812, align 8
  %1814 = lshr i32 %1813, 7
  %1815 = and i32 %1814, 1
  %1816 = icmp ne i32 %1815, 0
  br i1 %1816, label %1817, label %1818

; <label>:1817                                    ; preds = %1808
  br label %3451

; <label>:1818                                    ; preds = %1808, %1802
  br label %1819

; <label>:1819                                    ; preds = %1818, %1801
  br label %3452

; <label>:1820                                    ; preds = %749
  %1821 = load i8** %d, align 8
  %1822 = load i8** %end2, align 8
  %1823 = icmp eq i8* %1821, %1822
  br i1 %1823, label %1824, label %1835

; <label>:1824                                    ; preds = %1820
  %1825 = load %struct.re_pattern_buffer** %2, align 8
  %1826 = bitcast %struct.re_pattern_buffer* %1825 to i8*
  %1827 = getelementptr i8* %1826, i32 56
  %1828 = bitcast i8* %1827 to i32*
  %1829 = load i32* %1828, align 8
  %1830 = lshr i32 %1829, 6
  %1831 = and i32 %1830, 1
  %1832 = icmp ne i32 %1831, 0
  br i1 %1832, label %1834, label %1833

; <label>:1833                                    ; preds = %1824
  br label %3451

; <label>:1834                                    ; preds = %1824
  br label %1861

; <label>:1835                                    ; preds = %1820
  %1836 = load i8** %d, align 8
  %1837 = load i8** %end1, align 8
  %1838 = icmp eq i8* %1836, %1837
  br i1 %1838, label %1839, label %1843

; <label>:1839                                    ; preds = %1835
  %1840 = load i8** %5, align 8
  %1841 = load i8* %1840, align 1
  %1842 = sext i8 %1841 to i32
  br label %1847

; <label>:1843                                    ; preds = %1835
  %1844 = load i8** %d, align 8
  %1845 = load i8* %1844, align 1
  %1846 = sext i8 %1845 to i32
  br label %1847

; <label>:1847                                    ; preds = %1843, %1839
  %1848 = phi i32 [ %1842, %1839 ], [ %1846, %1843 ]
  %1849 = icmp eq i32 %1848, 10
  br i1 %1849, label %1850, label %1860

; <label>:1850                                    ; preds = %1847
  %1851 = load %struct.re_pattern_buffer** %2, align 8
  %1852 = bitcast %struct.re_pattern_buffer* %1851 to i8*
  %1853 = getelementptr i8* %1852, i32 56
  %1854 = bitcast i8* %1853 to i32*
  %1855 = load i32* %1854, align 8
  %1856 = lshr i32 %1855, 7
  %1857 = and i32 %1856, 1
  %1858 = icmp ne i32 %1857, 0
  br i1 %1858, label %1859, label %1860

; <label>:1859                                    ; preds = %1850
  br label %3451

; <label>:1860                                    ; preds = %1850, %1847
  br label %1861

; <label>:1861                                    ; preds = %1860, %1834
  br label %3452

; <label>:1862                                    ; preds = %749
  %1863 = load i8** %d, align 8
  %1864 = load i32* %4, align 4
  %1865 = icmp ne i32 %1864, 0
  br i1 %1865, label %1866, label %1868

; <label>:1866                                    ; preds = %1862
  %1867 = load i8** %3, align 8
  br label %1870

; <label>:1868                                    ; preds = %1862
  %1869 = load i8** %5, align 8
  br label %1870

; <label>:1870                                    ; preds = %1868, %1866
  %1871 = phi i8* [ %1867, %1866 ], [ %1869, %1868 ]
  %1872 = icmp eq i8* %1863, %1871
  br i1 %1872, label %1876, label %1873

; <label>:1873                                    ; preds = %1870
  %1874 = load i32* %6, align 4
  %1875 = icmp ne i32 %1874, 0
  br i1 %1875, label %1877, label %1876

; <label>:1876                                    ; preds = %1873, %1870
  br label %3451

; <label>:1877                                    ; preds = %1873
  br label %3452

; <label>:1878                                    ; preds = %749
  %1879 = load i8** %d, align 8
  %1880 = load i8** %end2, align 8
  %1881 = icmp eq i8* %1879, %1880
  br i1 %1881, label %1882, label %1883

; <label>:1882                                    ; preds = %1878
  br label %3451

; <label>:1883                                    ; preds = %1878
  br label %3452

; <label>:1884                                    ; preds = %749
  br label %1885

; <label>:1885                                    ; preds = %1884
  br label %1886

; <label>:1886                                    ; preds = %1885
  %1887 = load i8** %p, align 8
  %1888 = load i8* %1887, align 1
  %1889 = zext i8 %1888 to i32
  %1890 = and i32 %1889, 255
  store i32 %1890, i32* %mcnt, align 4
  %1891 = load i8** %p, align 8
  %1892 = getelementptr inbounds i8* %1891, i64 1
  %1893 = load i8* %1892, align 1
  %1894 = sext i8 %1893 to i32
  %1895 = shl i32 %1894, 8
  %1896 = load i32* %mcnt, align 4
  %1897 = add nsw i32 %1896, %1895
  store i32 %1897, i32* %mcnt, align 4
  br label %1898

; <label>:1898                                    ; preds = %1886
  %1899 = load i8** %p, align 8
  %1900 = getelementptr inbounds i8* %1899, i64 2
  store i8* %1900, i8** %p, align 8
  br label %1901

; <label>:1901                                    ; preds = %1898
  br label %1902

; <label>:1902                                    ; preds = %1901
  br label %1903

; <label>:1903                                    ; preds = %1957, %1902
  %1904 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %1905 = load i32* %1904, align 4
  %1906 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %1907 = load i32* %1906, align 4
  %1908 = sub i32 %1905, %1907
  %1909 = load i32* %highest_active_reg, align 4
  %1910 = load i32* %lowest_active_reg, align 4
  %1911 = sub i32 %1909, %1910
  %1912 = add i32 %1911, 1
  %1913 = mul i32 %1912, 3
  %1914 = add i32 %1913, 4
  %1915 = icmp ult i32 %1908, %1914
  br i1 %1915, label %1916, label %1958

; <label>:1916                                    ; preds = %1903
  %1917 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %1918 = load i32* %1917, align 4
  %1919 = load i32* @re_max_failures, align 4
  %1920 = load i32* %num_regs, align 4
  %1921 = sub i32 %1920, 1
  %1922 = mul i32 %1921, 3
  %1923 = add i32 %1922, 4
  %1924 = mul i32 %1919, %1923
  %1925 = icmp ugt i32 %1918, %1924
  br i1 %1925, label %1926, label %1927

; <label>:1926                                    ; preds = %1916
  br i1 false, label %1957, label %1956

; <label>:1927                                    ; preds = %1916
  %1928 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %1929 = load i32* %1928, align 4
  %1930 = shl i32 %1929, 1
  %1931 = zext i32 %1930 to i64
  %1932 = mul i64 %1931, 8
  %1933 = alloca i8, i64 %1932
  store i8* %1933, i8** %destination5, align 8
  %1934 = load i8** %destination5, align 8
  %1935 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1936 = load i8*** %1935, align 8
  %1937 = bitcast i8** %1936 to i8*
  %1938 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %1939 = load i32* %1938, align 4
  %1940 = zext i32 %1939 to i64
  %1941 = mul i64 %1940, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1934, i8* %1937, i64 %1941, i32 1, i1 false)
  %1942 = load i8** %destination5, align 8
  %1943 = bitcast i8* %1942 to i8**
  %1944 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  store i8** %1943, i8*** %1944, align 8
  %1945 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1946 = load i8*** %1945, align 8
  %1947 = icmp eq i8** %1946, null
  br i1 %1947, label %1948, label %1949

; <label>:1948                                    ; preds = %1927
  br label %1953

; <label>:1949                                    ; preds = %1927
  %1950 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %1951 = load i32* %1950, align 4
  %1952 = shl i32 %1951, 1
  store i32 %1952, i32* %1950, align 4
  br label %1953

; <label>:1953                                    ; preds = %1949, %1948
  %1954 = phi i32 [ 0, %1948 ], [ 1, %1949 ]
  %1955 = icmp ne i32 %1954, 0
  br i1 %1955, label %1957, label %1956

; <label>:1956                                    ; preds = %1953, %1926
  store i32 -2, i32* %1
  br label %3618

; <label>:1957                                    ; preds = %1953, %1926
  br label %1903

; <label>:1958                                    ; preds = %1903
  %1959 = load i32* %lowest_active_reg, align 4
  store i32 %1959, i32* %this_reg6, align 4
  br label %1960

; <label>:1960                                    ; preds = %2002, %1958
  %1961 = load i32* %this_reg6, align 4
  %1962 = load i32* %highest_active_reg, align 4
  %1963 = icmp ule i32 %1961, %1962
  br i1 %1963, label %1964, label %2005

; <label>:1964                                    ; preds = %1960
  %1965 = load i32* %this_reg6, align 4
  %1966 = sext i32 %1965 to i64
  %1967 = load i8*** %regstart, align 8
  %1968 = getelementptr inbounds i8** %1967, i64 %1966
  %1969 = load i8** %1968, align 8
  %1970 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %1971 = load i32* %1970, align 4
  %1972 = add i32 %1971, 1
  store i32 %1972, i32* %1970, align 4
  %1973 = zext i32 %1971 to i64
  %1974 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1975 = load i8*** %1974, align 8
  %1976 = getelementptr inbounds i8** %1975, i64 %1973
  store i8* %1969, i8** %1976, align 8
  %1977 = load i32* %this_reg6, align 4
  %1978 = sext i32 %1977 to i64
  %1979 = load i8*** %regend, align 8
  %1980 = getelementptr inbounds i8** %1979, i64 %1978
  %1981 = load i8** %1980, align 8
  %1982 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %1983 = load i32* %1982, align 4
  %1984 = add i32 %1983, 1
  store i32 %1984, i32* %1982, align 4
  %1985 = zext i32 %1983 to i64
  %1986 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %1987 = load i8*** %1986, align 8
  %1988 = getelementptr inbounds i8** %1987, i64 %1985
  store i8* %1981, i8** %1988, align 8
  %1989 = load i32* %this_reg6, align 4
  %1990 = sext i32 %1989 to i64
  %1991 = load %union.register_info_type** %reg_info, align 8
  %1992 = getelementptr inbounds %union.register_info_type* %1991, i64 %1990
  %1993 = bitcast %union.register_info_type* %1992 to i8**
  %1994 = load i8** %1993, align 8
  %1995 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %1996 = load i32* %1995, align 4
  %1997 = add i32 %1996, 1
  store i32 %1997, i32* %1995, align 4
  %1998 = zext i32 %1996 to i64
  %1999 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2000 = load i8*** %1999, align 8
  %2001 = getelementptr inbounds i8** %2000, i64 %1998
  store i8* %1994, i8** %2001, align 8
  br label %2002

; <label>:2002                                    ; preds = %1964
  %2003 = load i32* %this_reg6, align 4
  %2004 = add nsw i32 %2003, 1
  store i32 %2004, i32* %this_reg6, align 4
  br label %1960

; <label>:2005                                    ; preds = %1960
  %2006 = load i32* %lowest_active_reg, align 4
  %2007 = zext i32 %2006 to i64
  %2008 = inttoptr i64 %2007 to i8*
  %2009 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2010 = load i32* %2009, align 4
  %2011 = add i32 %2010, 1
  store i32 %2011, i32* %2009, align 4
  %2012 = zext i32 %2010 to i64
  %2013 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2014 = load i8*** %2013, align 8
  %2015 = getelementptr inbounds i8** %2014, i64 %2012
  store i8* %2008, i8** %2015, align 8
  %2016 = load i32* %highest_active_reg, align 4
  %2017 = zext i32 %2016 to i64
  %2018 = inttoptr i64 %2017 to i8*
  %2019 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2020 = load i32* %2019, align 4
  %2021 = add i32 %2020, 1
  store i32 %2021, i32* %2019, align 4
  %2022 = zext i32 %2020 to i64
  %2023 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2024 = load i8*** %2023, align 8
  %2025 = getelementptr inbounds i8** %2024, i64 %2022
  store i8* %2018, i8** %2025, align 8
  %2026 = load i8** %p, align 8
  %2027 = load i32* %mcnt, align 4
  %2028 = sext i32 %2027 to i64
  %2029 = getelementptr inbounds i8* %2026, i64 %2028
  %2030 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2031 = load i32* %2030, align 4
  %2032 = add i32 %2031, 1
  store i32 %2032, i32* %2030, align 4
  %2033 = zext i32 %2031 to i64
  %2034 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2035 = load i8*** %2034, align 8
  %2036 = getelementptr inbounds i8** %2035, i64 %2033
  store i8* %2029, i8** %2036, align 8
  %2037 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2038 = load i32* %2037, align 4
  %2039 = add i32 %2038, 1
  store i32 %2039, i32* %2037, align 4
  %2040 = zext i32 %2038 to i64
  %2041 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2042 = load i8*** %2041, align 8
  %2043 = getelementptr inbounds i8** %2042, i64 %2040
  store i8* null, i8** %2043, align 8
  br label %2044

; <label>:2044                                    ; preds = %2005
  br label %3451

; <label>:2045                                    ; preds = %749
  br label %2046

; <label>:2046                                    ; preds = %2857, %2045
  br label %2047

; <label>:2047                                    ; preds = %2046
  br label %2048

; <label>:2048                                    ; preds = %2047
  %2049 = load i8** %p, align 8
  %2050 = load i8* %2049, align 1
  %2051 = zext i8 %2050 to i32
  %2052 = and i32 %2051, 255
  store i32 %2052, i32* %mcnt, align 4
  %2053 = load i8** %p, align 8
  %2054 = getelementptr inbounds i8* %2053, i64 1
  %2055 = load i8* %2054, align 1
  %2056 = sext i8 %2055 to i32
  %2057 = shl i32 %2056, 8
  %2058 = load i32* %mcnt, align 4
  %2059 = add nsw i32 %2058, %2057
  store i32 %2059, i32* %mcnt, align 4
  br label %2060

; <label>:2060                                    ; preds = %2048
  %2061 = load i8** %p, align 8
  %2062 = getelementptr inbounds i8* %2061, i64 2
  store i8* %2062, i8** %p, align 8
  br label %2063

; <label>:2063                                    ; preds = %2060
  %2064 = load i8** %p, align 8
  store i8* %2064, i8** %p1, align 8
  br label %2065

; <label>:2065                                    ; preds = %2076, %2063
  %2066 = load i8** %p1, align 8
  %2067 = load i8** %pend, align 8
  %2068 = icmp ult i8* %2066, %2067
  br i1 %2068, label %2069, label %2074

; <label>:2069                                    ; preds = %2065
  %2070 = load i8** %p1, align 8
  %2071 = load i8* %2070, align 1
  %2072 = zext i8 %2071 to i32
  %2073 = icmp eq i32 %2072, 0
  br label %2074

; <label>:2074                                    ; preds = %2069, %2065
  %2075 = phi i1 [ false, %2065 ], [ %2073, %2069 ]
  br i1 %2075, label %2076, label %2079

; <label>:2076                                    ; preds = %2074
  %2077 = load i8** %p1, align 8
  %2078 = getelementptr inbounds i8* %2077, i32 1
  store i8* %2078, i8** %p1, align 8
  br label %2065

; <label>:2079                                    ; preds = %2074
  %2080 = load i8** %p1, align 8
  %2081 = load i8** %pend, align 8
  %2082 = icmp ult i8* %2080, %2081
  br i1 %2082, label %2083, label %2106

; <label>:2083                                    ; preds = %2079
  %2084 = load i8** %p1, align 8
  %2085 = load i8* %2084, align 1
  %2086 = zext i8 %2085 to i32
  %2087 = icmp eq i32 %2086, 5
  br i1 %2087, label %2088, label %2106

; <label>:2088                                    ; preds = %2083
  %2089 = load i8** %p1, align 8
  %2090 = getelementptr inbounds i8* %2089, i64 1
  %2091 = load i8* %2090, align 1
  %2092 = zext i8 %2091 to i32
  %2093 = load i8** %p1, align 8
  %2094 = getelementptr inbounds i8* %2093, i64 2
  %2095 = load i8* %2094, align 1
  %2096 = zext i8 %2095 to i32
  %2097 = add nsw i32 %2092, %2096
  store i32 %2097, i32* %highest_active_reg, align 4
  %2098 = load i32* %lowest_active_reg, align 4
  %2099 = icmp eq i32 %2098, 257
  br i1 %2099, label %2100, label %2105

; <label>:2100                                    ; preds = %2088
  %2101 = load i8** %p1, align 8
  %2102 = getelementptr inbounds i8* %2101, i64 1
  %2103 = load i8* %2102, align 1
  %2104 = zext i8 %2103 to i32
  store i32 %2104, i32* %lowest_active_reg, align 4
  br label %2105

; <label>:2105                                    ; preds = %2100, %2088
  br label %2106

; <label>:2106                                    ; preds = %2105, %2083, %2079
  br label %2107

; <label>:2107                                    ; preds = %2106
  br label %2108

; <label>:2108                                    ; preds = %2162, %2107
  %2109 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2110 = load i32* %2109, align 4
  %2111 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2112 = load i32* %2111, align 4
  %2113 = sub i32 %2110, %2112
  %2114 = load i32* %highest_active_reg, align 4
  %2115 = load i32* %lowest_active_reg, align 4
  %2116 = sub i32 %2114, %2115
  %2117 = add i32 %2116, 1
  %2118 = mul i32 %2117, 3
  %2119 = add i32 %2118, 4
  %2120 = icmp ult i32 %2113, %2119
  br i1 %2120, label %2121, label %2163

; <label>:2121                                    ; preds = %2108
  %2122 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2123 = load i32* %2122, align 4
  %2124 = load i32* @re_max_failures, align 4
  %2125 = load i32* %num_regs, align 4
  %2126 = sub i32 %2125, 1
  %2127 = mul i32 %2126, 3
  %2128 = add i32 %2127, 4
  %2129 = mul i32 %2124, %2128
  %2130 = icmp ugt i32 %2123, %2129
  br i1 %2130, label %2131, label %2132

; <label>:2131                                    ; preds = %2121
  br i1 false, label %2162, label %2161

; <label>:2132                                    ; preds = %2121
  %2133 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2134 = load i32* %2133, align 4
  %2135 = shl i32 %2134, 1
  %2136 = zext i32 %2135 to i64
  %2137 = mul i64 %2136, 8
  %2138 = alloca i8, i64 %2137
  store i8* %2138, i8** %destination7, align 8
  %2139 = load i8** %destination7, align 8
  %2140 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2141 = load i8*** %2140, align 8
  %2142 = bitcast i8** %2141 to i8*
  %2143 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2144 = load i32* %2143, align 4
  %2145 = zext i32 %2144 to i64
  %2146 = mul i64 %2145, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2139, i8* %2142, i64 %2146, i32 1, i1 false)
  %2147 = load i8** %destination7, align 8
  %2148 = bitcast i8* %2147 to i8**
  %2149 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  store i8** %2148, i8*** %2149, align 8
  %2150 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2151 = load i8*** %2150, align 8
  %2152 = icmp eq i8** %2151, null
  br i1 %2152, label %2153, label %2154

; <label>:2153                                    ; preds = %2132
  br label %2158

; <label>:2154                                    ; preds = %2132
  %2155 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2156 = load i32* %2155, align 4
  %2157 = shl i32 %2156, 1
  store i32 %2157, i32* %2155, align 4
  br label %2158

; <label>:2158                                    ; preds = %2154, %2153
  %2159 = phi i32 [ 0, %2153 ], [ 1, %2154 ]
  %2160 = icmp ne i32 %2159, 0
  br i1 %2160, label %2162, label %2161

; <label>:2161                                    ; preds = %2158, %2131
  store i32 -2, i32* %1
  br label %3618

; <label>:2162                                    ; preds = %2158, %2131
  br label %2108

; <label>:2163                                    ; preds = %2108
  %2164 = load i32* %lowest_active_reg, align 4
  store i32 %2164, i32* %this_reg8, align 4
  br label %2165

; <label>:2165                                    ; preds = %2207, %2163
  %2166 = load i32* %this_reg8, align 4
  %2167 = load i32* %highest_active_reg, align 4
  %2168 = icmp ule i32 %2166, %2167
  br i1 %2168, label %2169, label %2210

; <label>:2169                                    ; preds = %2165
  %2170 = load i32* %this_reg8, align 4
  %2171 = sext i32 %2170 to i64
  %2172 = load i8*** %regstart, align 8
  %2173 = getelementptr inbounds i8** %2172, i64 %2171
  %2174 = load i8** %2173, align 8
  %2175 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2176 = load i32* %2175, align 4
  %2177 = add i32 %2176, 1
  store i32 %2177, i32* %2175, align 4
  %2178 = zext i32 %2176 to i64
  %2179 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2180 = load i8*** %2179, align 8
  %2181 = getelementptr inbounds i8** %2180, i64 %2178
  store i8* %2174, i8** %2181, align 8
  %2182 = load i32* %this_reg8, align 4
  %2183 = sext i32 %2182 to i64
  %2184 = load i8*** %regend, align 8
  %2185 = getelementptr inbounds i8** %2184, i64 %2183
  %2186 = load i8** %2185, align 8
  %2187 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2188 = load i32* %2187, align 4
  %2189 = add i32 %2188, 1
  store i32 %2189, i32* %2187, align 4
  %2190 = zext i32 %2188 to i64
  %2191 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2192 = load i8*** %2191, align 8
  %2193 = getelementptr inbounds i8** %2192, i64 %2190
  store i8* %2186, i8** %2193, align 8
  %2194 = load i32* %this_reg8, align 4
  %2195 = sext i32 %2194 to i64
  %2196 = load %union.register_info_type** %reg_info, align 8
  %2197 = getelementptr inbounds %union.register_info_type* %2196, i64 %2195
  %2198 = bitcast %union.register_info_type* %2197 to i8**
  %2199 = load i8** %2198, align 8
  %2200 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2201 = load i32* %2200, align 4
  %2202 = add i32 %2201, 1
  store i32 %2202, i32* %2200, align 4
  %2203 = zext i32 %2201 to i64
  %2204 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2205 = load i8*** %2204, align 8
  %2206 = getelementptr inbounds i8** %2205, i64 %2203
  store i8* %2199, i8** %2206, align 8
  br label %2207

; <label>:2207                                    ; preds = %2169
  %2208 = load i32* %this_reg8, align 4
  %2209 = add nsw i32 %2208, 1
  store i32 %2209, i32* %this_reg8, align 4
  br label %2165

; <label>:2210                                    ; preds = %2165
  %2211 = load i32* %lowest_active_reg, align 4
  %2212 = zext i32 %2211 to i64
  %2213 = inttoptr i64 %2212 to i8*
  %2214 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2215 = load i32* %2214, align 4
  %2216 = add i32 %2215, 1
  store i32 %2216, i32* %2214, align 4
  %2217 = zext i32 %2215 to i64
  %2218 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2219 = load i8*** %2218, align 8
  %2220 = getelementptr inbounds i8** %2219, i64 %2217
  store i8* %2213, i8** %2220, align 8
  %2221 = load i32* %highest_active_reg, align 4
  %2222 = zext i32 %2221 to i64
  %2223 = inttoptr i64 %2222 to i8*
  %2224 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2225 = load i32* %2224, align 4
  %2226 = add i32 %2225, 1
  store i32 %2226, i32* %2224, align 4
  %2227 = zext i32 %2225 to i64
  %2228 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2229 = load i8*** %2228, align 8
  %2230 = getelementptr inbounds i8** %2229, i64 %2227
  store i8* %2223, i8** %2230, align 8
  %2231 = load i8** %p, align 8
  %2232 = load i32* %mcnt, align 4
  %2233 = sext i32 %2232 to i64
  %2234 = getelementptr inbounds i8* %2231, i64 %2233
  %2235 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2236 = load i32* %2235, align 4
  %2237 = add i32 %2236, 1
  store i32 %2237, i32* %2235, align 4
  %2238 = zext i32 %2236 to i64
  %2239 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2240 = load i8*** %2239, align 8
  %2241 = getelementptr inbounds i8** %2240, i64 %2238
  store i8* %2234, i8** %2241, align 8
  %2242 = load i8** %d, align 8
  %2243 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2244 = load i32* %2243, align 4
  %2245 = add i32 %2244, 1
  store i32 %2245, i32* %2243, align 4
  %2246 = zext i32 %2244 to i64
  %2247 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2248 = load i8*** %2247, align 8
  %2249 = getelementptr inbounds i8** %2248, i64 %2246
  store i8* %2242, i8** %2249, align 8
  br label %2250

; <label>:2250                                    ; preds = %2210
  br label %3451

; <label>:2251                                    ; preds = %749
  br label %2252

; <label>:2252                                    ; preds = %2251
  br label %2253

; <label>:2253                                    ; preds = %2252
  %2254 = load i8** %p, align 8
  %2255 = load i8* %2254, align 1
  %2256 = zext i8 %2255 to i32
  %2257 = and i32 %2256, 255
  store i32 %2257, i32* %mcnt, align 4
  %2258 = load i8** %p, align 8
  %2259 = getelementptr inbounds i8* %2258, i64 1
  %2260 = load i8* %2259, align 1
  %2261 = sext i8 %2260 to i32
  %2262 = shl i32 %2261, 8
  %2263 = load i32* %mcnt, align 4
  %2264 = add nsw i32 %2263, %2262
  store i32 %2264, i32* %mcnt, align 4
  br label %2265

; <label>:2265                                    ; preds = %2253
  %2266 = load i8** %p, align 8
  %2267 = getelementptr inbounds i8* %2266, i64 2
  store i8* %2267, i8** %p, align 8
  br label %2268

; <label>:2268                                    ; preds = %2265
  %2269 = load i8** %p, align 8
  store i8* %2269, i8** %p2, align 8
  br label %2270

; <label>:2270                                    ; preds = %2289, %2268
  %2271 = load i8** %p2, align 8
  %2272 = getelementptr inbounds i8* %2271, i64 2
  %2273 = load i8** %pend, align 8
  %2274 = icmp ult i8* %2272, %2273
  br i1 %2274, label %2275, label %2287

; <label>:2275                                    ; preds = %2270
  %2276 = load i8** %p2, align 8
  %2277 = load i8* %2276, align 1
  %2278 = zext i8 %2277 to i32
  %2279 = icmp eq i32 %2278, 6
  br i1 %2279, label %2285, label %2280

; <label>:2280                                    ; preds = %2275
  %2281 = load i8** %p2, align 8
  %2282 = load i8* %2281, align 1
  %2283 = zext i8 %2282 to i32
  %2284 = icmp eq i32 %2283, 5
  br label %2285

; <label>:2285                                    ; preds = %2280, %2275
  %2286 = phi i1 [ true, %2275 ], [ %2284, %2280 ]
  br label %2287

; <label>:2287                                    ; preds = %2285, %2270
  %2288 = phi i1 [ false, %2270 ], [ %2286, %2285 ]
  br i1 %2288, label %2289, label %2292

; <label>:2289                                    ; preds = %2287
  %2290 = load i8** %p2, align 8
  %2291 = getelementptr inbounds i8* %2290, i64 3
  store i8* %2291, i8** %p2, align 8
  br label %2270

; <label>:2292                                    ; preds = %2287
  %2293 = load i8** %p2, align 8
  %2294 = load i8** %pend, align 8
  %2295 = icmp eq i8* %2293, %2294
  br i1 %2295, label %2296, label %2299

; <label>:2296                                    ; preds = %2292
  %2297 = load i8** %p, align 8
  %2298 = getelementptr inbounds i8* %2297, i64 -3
  store i8 16, i8* %2298, align 1
  br label %2412

; <label>:2299                                    ; preds = %2292
  %2300 = load i8** %p2, align 8
  %2301 = load i8* %2300, align 1
  %2302 = zext i8 %2301 to i32
  %2303 = icmp eq i32 %2302, 1
  br i1 %2303, label %2318, label %2304

; <label>:2304                                    ; preds = %2299
  %2305 = load %struct.re_pattern_buffer** %2, align 8
  %2306 = bitcast %struct.re_pattern_buffer* %2305 to i8*
  %2307 = getelementptr i8* %2306, i32 56
  %2308 = bitcast i8* %2307 to i32*
  %2309 = load i32* %2308, align 8
  %2310 = lshr i32 %2309, 7
  %2311 = and i32 %2310, 1
  %2312 = icmp ne i32 %2311, 0
  br i1 %2312, label %2313, label %2411

; <label>:2313                                    ; preds = %2304
  %2314 = load i8** %p2, align 8
  %2315 = load i8* %2314, align 1
  %2316 = zext i8 %2315 to i32
  %2317 = icmp eq i32 %2316, 9
  br i1 %2317, label %2318, label %2411

; <label>:2318                                    ; preds = %2313, %2299
  %2319 = load i8** %p2, align 8
  %2320 = load i8* %2319, align 1
  %2321 = zext i8 %2320 to i32
  %2322 = icmp eq i32 %2321, 9
  br i1 %2322, label %2323, label %2324

; <label>:2323                                    ; preds = %2318
  br label %2329

; <label>:2324                                    ; preds = %2318
  %2325 = load i8** %p2, align 8
  %2326 = getelementptr inbounds i8* %2325, i64 2
  %2327 = load i8* %2326, align 1
  %2328 = zext i8 %2327 to i32
  br label %2329

; <label>:2329                                    ; preds = %2324, %2323
  %2330 = phi i32 [ 10, %2323 ], [ %2328, %2324 ]
  %2331 = trunc i32 %2330 to i8
  store i8 %2331, i8* %c9, align 1
  %2332 = load i8** %p, align 8
  %2333 = load i32* %mcnt, align 4
  %2334 = sext i32 %2333 to i64
  %2335 = getelementptr inbounds i8* %2332, i64 %2334
  store i8* %2335, i8** %p1, align 8
  %2336 = load i8** %p1, align 8
  %2337 = getelementptr inbounds i8* %2336, i64 3
  %2338 = load i8* %2337, align 1
  %2339 = zext i8 %2338 to i32
  %2340 = icmp eq i32 %2339, 1
  br i1 %2340, label %2341, label %2352

; <label>:2341                                    ; preds = %2329
  %2342 = load i8** %p1, align 8
  %2343 = getelementptr inbounds i8* %2342, i64 5
  %2344 = load i8* %2343, align 1
  %2345 = zext i8 %2344 to i32
  %2346 = load i8* %c9, align 1
  %2347 = zext i8 %2346 to i32
  %2348 = icmp ne i32 %2345, %2347
  br i1 %2348, label %2349, label %2352

; <label>:2349                                    ; preds = %2341
  %2350 = load i8** %p, align 8
  %2351 = getelementptr inbounds i8* %2350, i64 -3
  store i8 16, i8* %2351, align 1
  br label %2410

; <label>:2352                                    ; preds = %2341, %2329
  %2353 = load i8** %p1, align 8
  %2354 = getelementptr inbounds i8* %2353, i64 3
  %2355 = load i8* %2354, align 1
  %2356 = zext i8 %2355 to i32
  %2357 = icmp eq i32 %2356, 3
  br i1 %2357, label %2364, label %2358

; <label>:2358                                    ; preds = %2352
  %2359 = load i8** %p1, align 8
  %2360 = getelementptr inbounds i8* %2359, i64 3
  %2361 = load i8* %2360, align 1
  %2362 = zext i8 %2361 to i32
  %2363 = icmp eq i32 %2362, 4
  br i1 %2363, label %2364, label %2409

; <label>:2364                                    ; preds = %2358, %2352
  %2365 = load i8** %p1, align 8
  %2366 = getelementptr inbounds i8* %2365, i64 3
  %2367 = load i8* %2366, align 1
  %2368 = zext i8 %2367 to i32
  %2369 = icmp eq i32 %2368, 4
  %2370 = zext i1 %2369 to i32
  store i32 %2370, i32* %not10, align 4
  %2371 = load i8* %c9, align 1
  %2372 = zext i8 %2371 to i32
  %2373 = load i8** %p1, align 8
  %2374 = getelementptr inbounds i8* %2373, i64 4
  %2375 = load i8* %2374, align 1
  %2376 = zext i8 %2375 to i32
  %2377 = mul nsw i32 %2376, 8
  %2378 = trunc i32 %2377 to i8
  %2379 = zext i8 %2378 to i32
  %2380 = icmp slt i32 %2372, %2379
  br i1 %2380, label %2381, label %2402

; <label>:2381                                    ; preds = %2364
  %2382 = load i8* %c9, align 1
  %2383 = zext i8 %2382 to i32
  %2384 = sdiv i32 %2383, 8
  %2385 = add nsw i32 5, %2384
  %2386 = sext i32 %2385 to i64
  %2387 = load i8** %p1, align 8
  %2388 = getelementptr inbounds i8* %2387, i64 %2386
  %2389 = load i8* %2388, align 1
  %2390 = zext i8 %2389 to i32
  %2391 = load i8* %c9, align 1
  %2392 = zext i8 %2391 to i32
  %2393 = srem i32 %2392, 8
  %2394 = shl i32 1, %2393
  %2395 = and i32 %2390, %2394
  %2396 = icmp ne i32 %2395, 0
  br i1 %2396, label %2397, label %2402

; <label>:2397                                    ; preds = %2381
  %2398 = load i32* %not10, align 4
  %2399 = icmp ne i32 %2398, 0
  %2400 = xor i1 %2399, true
  %2401 = zext i1 %2400 to i32
  store i32 %2401, i32* %not10, align 4
  br label %2402

; <label>:2402                                    ; preds = %2397, %2381, %2364
  %2403 = load i32* %not10, align 4
  %2404 = icmp ne i32 %2403, 0
  br i1 %2404, label %2408, label %2405

; <label>:2405                                    ; preds = %2402
  %2406 = load i8** %p, align 8
  %2407 = getelementptr inbounds i8* %2406, i64 -3
  store i8 16, i8* %2407, align 1
  br label %2408

; <label>:2408                                    ; preds = %2405, %2402
  br label %2409

; <label>:2409                                    ; preds = %2408, %2358
  br label %2410

; <label>:2410                                    ; preds = %2409, %2349
  br label %2411

; <label>:2411                                    ; preds = %2410, %2313, %2304
  br label %2412

; <label>:2412                                    ; preds = %2411, %2296
  %2413 = load i8** %p, align 8
  %2414 = getelementptr inbounds i8* %2413, i64 -2
  store i8* %2414, i8** %p, align 8
  %2415 = load i8** %p, align 8
  %2416 = getelementptr inbounds i8* %2415, i64 -1
  %2417 = load i8* %2416, align 1
  %2418 = zext i8 %2417 to i32
  %2419 = icmp ne i32 %2418, 16
  br i1 %2419, label %2420, label %2423

; <label>:2420                                    ; preds = %2412
  %2421 = load i8** %p, align 8
  %2422 = getelementptr inbounds i8* %2421, i64 -1
  store i8 12, i8* %2422, align 1
  br label %2512

; <label>:2423                                    ; preds = %2412
  br label %2424

; <label>:2424                                    ; preds = %2423, %749
  %2425 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2426 = load i32* %2425, align 4
  %2427 = add i32 %2426, -1
  store i32 %2427, i32* %2425, align 4
  %2428 = zext i32 %2427 to i64
  %2429 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2430 = load i8*** %2429, align 8
  %2431 = getelementptr inbounds i8** %2430, i64 %2428
  %2432 = load i8** %2431, align 8
  store i8* %2432, i8** %string_temp, align 8
  %2433 = load i8** %string_temp, align 8
  %2434 = icmp ne i8* %2433, null
  br i1 %2434, label %2435, label %2437

; <label>:2435                                    ; preds = %2424
  %2436 = load i8** %string_temp, align 8
  store i8* %2436, i8** %sdummy, align 8
  br label %2437

; <label>:2437                                    ; preds = %2435, %2424
  %2438 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2439 = load i32* %2438, align 4
  %2440 = add i32 %2439, -1
  store i32 %2440, i32* %2438, align 4
  %2441 = zext i32 %2440 to i64
  %2442 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2443 = load i8*** %2442, align 8
  %2444 = getelementptr inbounds i8** %2443, i64 %2441
  %2445 = load i8** %2444, align 8
  store i8* %2445, i8** %pdummy, align 8
  %2446 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2447 = load i32* %2446, align 4
  %2448 = add i32 %2447, -1
  store i32 %2448, i32* %2446, align 4
  %2449 = zext i32 %2448 to i64
  %2450 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2451 = load i8*** %2450, align 8
  %2452 = getelementptr inbounds i8** %2451, i64 %2449
  %2453 = load i8** %2452, align 8
  %2454 = ptrtoint i8* %2453 to i32
  store i32 %2454, i32* %dummy_high_reg, align 4
  %2455 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2456 = load i32* %2455, align 4
  %2457 = add i32 %2456, -1
  store i32 %2457, i32* %2455, align 4
  %2458 = zext i32 %2457 to i64
  %2459 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2460 = load i8*** %2459, align 8
  %2461 = getelementptr inbounds i8** %2460, i64 %2458
  %2462 = load i8** %2461, align 8
  %2463 = ptrtoint i8* %2462 to i32
  store i32 %2463, i32* %dummy_low_reg, align 4
  %2464 = load i32* %dummy_high_reg, align 4
  store i32 %2464, i32* %this_reg11, align 4
  br label %2465

; <label>:2465                                    ; preds = %2507, %2437
  %2466 = load i32* %this_reg11, align 4
  %2467 = load i32* %dummy_low_reg, align 4
  %2468 = icmp uge i32 %2466, %2467
  br i1 %2468, label %2469, label %2510

; <label>:2469                                    ; preds = %2465
  %2470 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2471 = load i32* %2470, align 4
  %2472 = add i32 %2471, -1
  store i32 %2472, i32* %2470, align 4
  %2473 = zext i32 %2472 to i64
  %2474 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2475 = load i8*** %2474, align 8
  %2476 = getelementptr inbounds i8** %2475, i64 %2473
  %2477 = load i8** %2476, align 8
  %2478 = load i32* %this_reg11, align 4
  %2479 = sext i32 %2478 to i64
  %2480 = load %union.register_info_type** %reg_info_dummy, align 8
  %2481 = getelementptr inbounds %union.register_info_type* %2480, i64 %2479
  %2482 = bitcast %union.register_info_type* %2481 to i8**
  store i8* %2477, i8** %2482, align 8
  %2483 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2484 = load i32* %2483, align 4
  %2485 = add i32 %2484, -1
  store i32 %2485, i32* %2483, align 4
  %2486 = zext i32 %2485 to i64
  %2487 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2488 = load i8*** %2487, align 8
  %2489 = getelementptr inbounds i8** %2488, i64 %2486
  %2490 = load i8** %2489, align 8
  %2491 = load i32* %this_reg11, align 4
  %2492 = sext i32 %2491 to i64
  %2493 = load i8*** %reg_dummy, align 8
  %2494 = getelementptr inbounds i8** %2493, i64 %2492
  store i8* %2490, i8** %2494, align 8
  %2495 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2496 = load i32* %2495, align 4
  %2497 = add i32 %2496, -1
  store i32 %2497, i32* %2495, align 4
  %2498 = zext i32 %2497 to i64
  %2499 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2500 = load i8*** %2499, align 8
  %2501 = getelementptr inbounds i8** %2500, i64 %2498
  %2502 = load i8** %2501, align 8
  %2503 = load i32* %this_reg11, align 4
  %2504 = sext i32 %2503 to i64
  %2505 = load i8*** %reg_dummy, align 8
  %2506 = getelementptr inbounds i8** %2505, i64 %2504
  store i8* %2502, i8** %2506, align 8
  br label %2507

; <label>:2507                                    ; preds = %2469
  %2508 = load i32* %this_reg11, align 4
  %2509 = add nsw i32 %2508, -1
  store i32 %2509, i32* %this_reg11, align 4
  br label %2465

; <label>:2510                                    ; preds = %2465
  br label %2511

; <label>:2511                                    ; preds = %2510, %749
  br label %2512

; <label>:2512                                    ; preds = %2898, %2674, %2534, %2511, %2420
  br label %2513

; <label>:2513                                    ; preds = %2512
  br label %2514

; <label>:2514                                    ; preds = %2513
  %2515 = load i8** %p, align 8
  %2516 = load i8* %2515, align 1
  %2517 = zext i8 %2516 to i32
  %2518 = and i32 %2517, 255
  store i32 %2518, i32* %mcnt, align 4
  %2519 = load i8** %p, align 8
  %2520 = getelementptr inbounds i8* %2519, i64 1
  %2521 = load i8* %2520, align 1
  %2522 = sext i8 %2521 to i32
  %2523 = shl i32 %2522, 8
  %2524 = load i32* %mcnt, align 4
  %2525 = add nsw i32 %2524, %2523
  store i32 %2525, i32* %mcnt, align 4
  br label %2526

; <label>:2526                                    ; preds = %2514
  %2527 = load i8** %p, align 8
  %2528 = getelementptr inbounds i8* %2527, i64 2
  store i8* %2528, i8** %p, align 8
  br label %2529

; <label>:2529                                    ; preds = %2526
  %2530 = load i32* %mcnt, align 4
  %2531 = load i8** %p, align 8
  %2532 = sext i32 %2530 to i64
  %2533 = getelementptr inbounds i8* %2531, i64 %2532
  store i8* %2533, i8** %p, align 8
  br label %3451

; <label>:2534                                    ; preds = %749
  br label %2512

; <label>:2535                                    ; preds = %749
  br label %2536

; <label>:2536                                    ; preds = %2535
  br label %2537

; <label>:2537                                    ; preds = %2591, %2536
  %2538 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2539 = load i32* %2538, align 4
  %2540 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2541 = load i32* %2540, align 4
  %2542 = sub i32 %2539, %2541
  %2543 = load i32* %highest_active_reg, align 4
  %2544 = load i32* %lowest_active_reg, align 4
  %2545 = sub i32 %2543, %2544
  %2546 = add i32 %2545, 1
  %2547 = mul i32 %2546, 3
  %2548 = add i32 %2547, 4
  %2549 = icmp ult i32 %2542, %2548
  br i1 %2549, label %2550, label %2592

; <label>:2550                                    ; preds = %2537
  %2551 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2552 = load i32* %2551, align 4
  %2553 = load i32* @re_max_failures, align 4
  %2554 = load i32* %num_regs, align 4
  %2555 = sub i32 %2554, 1
  %2556 = mul i32 %2555, 3
  %2557 = add i32 %2556, 4
  %2558 = mul i32 %2553, %2557
  %2559 = icmp ugt i32 %2552, %2558
  br i1 %2559, label %2560, label %2561

; <label>:2560                                    ; preds = %2550
  br i1 false, label %2591, label %2590

; <label>:2561                                    ; preds = %2550
  %2562 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2563 = load i32* %2562, align 4
  %2564 = shl i32 %2563, 1
  %2565 = zext i32 %2564 to i64
  %2566 = mul i64 %2565, 8
  %2567 = alloca i8, i64 %2566
  store i8* %2567, i8** %destination12, align 8
  %2568 = load i8** %destination12, align 8
  %2569 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2570 = load i8*** %2569, align 8
  %2571 = bitcast i8** %2570 to i8*
  %2572 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2573 = load i32* %2572, align 4
  %2574 = zext i32 %2573 to i64
  %2575 = mul i64 %2574, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2568, i8* %2571, i64 %2575, i32 1, i1 false)
  %2576 = load i8** %destination12, align 8
  %2577 = bitcast i8* %2576 to i8**
  %2578 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  store i8** %2577, i8*** %2578, align 8
  %2579 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2580 = load i8*** %2579, align 8
  %2581 = icmp eq i8** %2580, null
  br i1 %2581, label %2582, label %2583

; <label>:2582                                    ; preds = %2561
  br label %2587

; <label>:2583                                    ; preds = %2561
  %2584 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2585 = load i32* %2584, align 4
  %2586 = shl i32 %2585, 1
  store i32 %2586, i32* %2584, align 4
  br label %2587

; <label>:2587                                    ; preds = %2583, %2582
  %2588 = phi i32 [ 0, %2582 ], [ 1, %2583 ]
  %2589 = icmp ne i32 %2588, 0
  br i1 %2589, label %2591, label %2590

; <label>:2590                                    ; preds = %2587, %2560
  store i32 -2, i32* %1
  br label %3618

; <label>:2591                                    ; preds = %2587, %2560
  br label %2537

; <label>:2592                                    ; preds = %2537
  %2593 = load i32* %lowest_active_reg, align 4
  store i32 %2593, i32* %this_reg13, align 4
  br label %2594

; <label>:2594                                    ; preds = %2636, %2592
  %2595 = load i32* %this_reg13, align 4
  %2596 = load i32* %highest_active_reg, align 4
  %2597 = icmp ule i32 %2595, %2596
  br i1 %2597, label %2598, label %2639

; <label>:2598                                    ; preds = %2594
  %2599 = load i32* %this_reg13, align 4
  %2600 = sext i32 %2599 to i64
  %2601 = load i8*** %regstart, align 8
  %2602 = getelementptr inbounds i8** %2601, i64 %2600
  %2603 = load i8** %2602, align 8
  %2604 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2605 = load i32* %2604, align 4
  %2606 = add i32 %2605, 1
  store i32 %2606, i32* %2604, align 4
  %2607 = zext i32 %2605 to i64
  %2608 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2609 = load i8*** %2608, align 8
  %2610 = getelementptr inbounds i8** %2609, i64 %2607
  store i8* %2603, i8** %2610, align 8
  %2611 = load i32* %this_reg13, align 4
  %2612 = sext i32 %2611 to i64
  %2613 = load i8*** %regend, align 8
  %2614 = getelementptr inbounds i8** %2613, i64 %2612
  %2615 = load i8** %2614, align 8
  %2616 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2617 = load i32* %2616, align 4
  %2618 = add i32 %2617, 1
  store i32 %2618, i32* %2616, align 4
  %2619 = zext i32 %2617 to i64
  %2620 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2621 = load i8*** %2620, align 8
  %2622 = getelementptr inbounds i8** %2621, i64 %2619
  store i8* %2615, i8** %2622, align 8
  %2623 = load i32* %this_reg13, align 4
  %2624 = sext i32 %2623 to i64
  %2625 = load %union.register_info_type** %reg_info, align 8
  %2626 = getelementptr inbounds %union.register_info_type* %2625, i64 %2624
  %2627 = bitcast %union.register_info_type* %2626 to i8**
  %2628 = load i8** %2627, align 8
  %2629 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2630 = load i32* %2629, align 4
  %2631 = add i32 %2630, 1
  store i32 %2631, i32* %2629, align 4
  %2632 = zext i32 %2630 to i64
  %2633 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2634 = load i8*** %2633, align 8
  %2635 = getelementptr inbounds i8** %2634, i64 %2632
  store i8* %2628, i8** %2635, align 8
  br label %2636

; <label>:2636                                    ; preds = %2598
  %2637 = load i32* %this_reg13, align 4
  %2638 = add nsw i32 %2637, 1
  store i32 %2638, i32* %this_reg13, align 4
  br label %2594

; <label>:2639                                    ; preds = %2594
  %2640 = load i32* %lowest_active_reg, align 4
  %2641 = zext i32 %2640 to i64
  %2642 = inttoptr i64 %2641 to i8*
  %2643 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2644 = load i32* %2643, align 4
  %2645 = add i32 %2644, 1
  store i32 %2645, i32* %2643, align 4
  %2646 = zext i32 %2644 to i64
  %2647 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2648 = load i8*** %2647, align 8
  %2649 = getelementptr inbounds i8** %2648, i64 %2646
  store i8* %2642, i8** %2649, align 8
  %2650 = load i32* %highest_active_reg, align 4
  %2651 = zext i32 %2650 to i64
  %2652 = inttoptr i64 %2651 to i8*
  %2653 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2654 = load i32* %2653, align 4
  %2655 = add i32 %2654, 1
  store i32 %2655, i32* %2653, align 4
  %2656 = zext i32 %2654 to i64
  %2657 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2658 = load i8*** %2657, align 8
  %2659 = getelementptr inbounds i8** %2658, i64 %2656
  store i8* %2652, i8** %2659, align 8
  %2660 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2661 = load i32* %2660, align 4
  %2662 = add i32 %2661, 1
  store i32 %2662, i32* %2660, align 4
  %2663 = zext i32 %2661 to i64
  %2664 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2665 = load i8*** %2664, align 8
  %2666 = getelementptr inbounds i8** %2665, i64 %2663
  store i8* null, i8** %2666, align 8
  %2667 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2668 = load i32* %2667, align 4
  %2669 = add i32 %2668, 1
  store i32 %2669, i32* %2667, align 4
  %2670 = zext i32 %2668 to i64
  %2671 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2672 = load i8*** %2671, align 8
  %2673 = getelementptr inbounds i8** %2672, i64 %2670
  store i8* null, i8** %2673, align 8
  br label %2674

; <label>:2674                                    ; preds = %2639
  br label %2512

; <label>:2675                                    ; preds = %749
  br label %2676

; <label>:2676                                    ; preds = %2675
  br label %2677

; <label>:2677                                    ; preds = %2731, %2676
  %2678 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2679 = load i32* %2678, align 4
  %2680 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2681 = load i32* %2680, align 4
  %2682 = sub i32 %2679, %2681
  %2683 = load i32* %highest_active_reg, align 4
  %2684 = load i32* %lowest_active_reg, align 4
  %2685 = sub i32 %2683, %2684
  %2686 = add i32 %2685, 1
  %2687 = mul i32 %2686, 3
  %2688 = add i32 %2687, 4
  %2689 = icmp ult i32 %2682, %2688
  br i1 %2689, label %2690, label %2732

; <label>:2690                                    ; preds = %2677
  %2691 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2692 = load i32* %2691, align 4
  %2693 = load i32* @re_max_failures, align 4
  %2694 = load i32* %num_regs, align 4
  %2695 = sub i32 %2694, 1
  %2696 = mul i32 %2695, 3
  %2697 = add i32 %2696, 4
  %2698 = mul i32 %2693, %2697
  %2699 = icmp ugt i32 %2692, %2698
  br i1 %2699, label %2700, label %2701

; <label>:2700                                    ; preds = %2690
  br i1 false, label %2731, label %2730

; <label>:2701                                    ; preds = %2690
  %2702 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2703 = load i32* %2702, align 4
  %2704 = shl i32 %2703, 1
  %2705 = zext i32 %2704 to i64
  %2706 = mul i64 %2705, 8
  %2707 = alloca i8, i64 %2706
  store i8* %2707, i8** %destination14, align 8
  %2708 = load i8** %destination14, align 8
  %2709 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2710 = load i8*** %2709, align 8
  %2711 = bitcast i8** %2710 to i8*
  %2712 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2713 = load i32* %2712, align 4
  %2714 = zext i32 %2713 to i64
  %2715 = mul i64 %2714, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2708, i8* %2711, i64 %2715, i32 1, i1 false)
  %2716 = load i8** %destination14, align 8
  %2717 = bitcast i8* %2716 to i8**
  %2718 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  store i8** %2717, i8*** %2718, align 8
  %2719 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2720 = load i8*** %2719, align 8
  %2721 = icmp eq i8** %2720, null
  br i1 %2721, label %2722, label %2723

; <label>:2722                                    ; preds = %2701
  br label %2727

; <label>:2723                                    ; preds = %2701
  %2724 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 1
  %2725 = load i32* %2724, align 4
  %2726 = shl i32 %2725, 1
  store i32 %2726, i32* %2724, align 4
  br label %2727

; <label>:2727                                    ; preds = %2723, %2722
  %2728 = phi i32 [ 0, %2722 ], [ 1, %2723 ]
  %2729 = icmp ne i32 %2728, 0
  br i1 %2729, label %2731, label %2730

; <label>:2730                                    ; preds = %2727, %2700
  store i32 -2, i32* %1
  br label %3618

; <label>:2731                                    ; preds = %2727, %2700
  br label %2677

; <label>:2732                                    ; preds = %2677
  %2733 = load i32* %lowest_active_reg, align 4
  store i32 %2733, i32* %this_reg15, align 4
  br label %2734

; <label>:2734                                    ; preds = %2776, %2732
  %2735 = load i32* %this_reg15, align 4
  %2736 = load i32* %highest_active_reg, align 4
  %2737 = icmp ule i32 %2735, %2736
  br i1 %2737, label %2738, label %2779

; <label>:2738                                    ; preds = %2734
  %2739 = load i32* %this_reg15, align 4
  %2740 = sext i32 %2739 to i64
  %2741 = load i8*** %regstart, align 8
  %2742 = getelementptr inbounds i8** %2741, i64 %2740
  %2743 = load i8** %2742, align 8
  %2744 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2745 = load i32* %2744, align 4
  %2746 = add i32 %2745, 1
  store i32 %2746, i32* %2744, align 4
  %2747 = zext i32 %2745 to i64
  %2748 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2749 = load i8*** %2748, align 8
  %2750 = getelementptr inbounds i8** %2749, i64 %2747
  store i8* %2743, i8** %2750, align 8
  %2751 = load i32* %this_reg15, align 4
  %2752 = sext i32 %2751 to i64
  %2753 = load i8*** %regend, align 8
  %2754 = getelementptr inbounds i8** %2753, i64 %2752
  %2755 = load i8** %2754, align 8
  %2756 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2757 = load i32* %2756, align 4
  %2758 = add i32 %2757, 1
  store i32 %2758, i32* %2756, align 4
  %2759 = zext i32 %2757 to i64
  %2760 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2761 = load i8*** %2760, align 8
  %2762 = getelementptr inbounds i8** %2761, i64 %2759
  store i8* %2755, i8** %2762, align 8
  %2763 = load i32* %this_reg15, align 4
  %2764 = sext i32 %2763 to i64
  %2765 = load %union.register_info_type** %reg_info, align 8
  %2766 = getelementptr inbounds %union.register_info_type* %2765, i64 %2764
  %2767 = bitcast %union.register_info_type* %2766 to i8**
  %2768 = load i8** %2767, align 8
  %2769 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2770 = load i32* %2769, align 4
  %2771 = add i32 %2770, 1
  store i32 %2771, i32* %2769, align 4
  %2772 = zext i32 %2770 to i64
  %2773 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2774 = load i8*** %2773, align 8
  %2775 = getelementptr inbounds i8** %2774, i64 %2772
  store i8* %2768, i8** %2775, align 8
  br label %2776

; <label>:2776                                    ; preds = %2738
  %2777 = load i32* %this_reg15, align 4
  %2778 = add nsw i32 %2777, 1
  store i32 %2778, i32* %this_reg15, align 4
  br label %2734

; <label>:2779                                    ; preds = %2734
  %2780 = load i32* %lowest_active_reg, align 4
  %2781 = zext i32 %2780 to i64
  %2782 = inttoptr i64 %2781 to i8*
  %2783 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2784 = load i32* %2783, align 4
  %2785 = add i32 %2784, 1
  store i32 %2785, i32* %2783, align 4
  %2786 = zext i32 %2784 to i64
  %2787 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2788 = load i8*** %2787, align 8
  %2789 = getelementptr inbounds i8** %2788, i64 %2786
  store i8* %2782, i8** %2789, align 8
  %2790 = load i32* %highest_active_reg, align 4
  %2791 = zext i32 %2790 to i64
  %2792 = inttoptr i64 %2791 to i8*
  %2793 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2794 = load i32* %2793, align 4
  %2795 = add i32 %2794, 1
  store i32 %2795, i32* %2793, align 4
  %2796 = zext i32 %2794 to i64
  %2797 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2798 = load i8*** %2797, align 8
  %2799 = getelementptr inbounds i8** %2798, i64 %2796
  store i8* %2792, i8** %2799, align 8
  %2800 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2801 = load i32* %2800, align 4
  %2802 = add i32 %2801, 1
  store i32 %2802, i32* %2800, align 4
  %2803 = zext i32 %2801 to i64
  %2804 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2805 = load i8*** %2804, align 8
  %2806 = getelementptr inbounds i8** %2805, i64 %2803
  store i8* null, i8** %2806, align 8
  %2807 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %2808 = load i32* %2807, align 4
  %2809 = add i32 %2808, 1
  store i32 %2809, i32* %2807, align 4
  %2810 = zext i32 %2808 to i64
  %2811 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %2812 = load i8*** %2811, align 8
  %2813 = getelementptr inbounds i8** %2812, i64 %2810
  store i8* null, i8** %2813, align 8
  br label %2814

; <label>:2814                                    ; preds = %2779
  br label %3451

; <label>:2815                                    ; preds = %749
  br label %2816

; <label>:2816                                    ; preds = %2815
  %2817 = load i8** %p, align 8
  %2818 = getelementptr inbounds i8* %2817, i64 2
  %2819 = load i8* %2818, align 1
  %2820 = zext i8 %2819 to i32
  %2821 = and i32 %2820, 255
  store i32 %2821, i32* %mcnt, align 4
  %2822 = load i8** %p, align 8
  %2823 = getelementptr inbounds i8* %2822, i64 2
  %2824 = getelementptr inbounds i8* %2823, i64 1
  %2825 = load i8* %2824, align 1
  %2826 = sext i8 %2825 to i32
  %2827 = shl i32 %2826, 8
  %2828 = load i32* %mcnt, align 4
  %2829 = add nsw i32 %2828, %2827
  store i32 %2829, i32* %mcnt, align 4
  br label %2830

; <label>:2830                                    ; preds = %2816
  %2831 = load i32* %mcnt, align 4
  %2832 = icmp sgt i32 %2831, 0
  br i1 %2832, label %2833, label %2854

; <label>:2833                                    ; preds = %2830
  %2834 = load i32* %mcnt, align 4
  %2835 = add nsw i32 %2834, -1
  store i32 %2835, i32* %mcnt, align 4
  %2836 = load i8** %p, align 8
  %2837 = getelementptr inbounds i8* %2836, i64 2
  store i8* %2837, i8** %p, align 8
  br label %2838

; <label>:2838                                    ; preds = %2833
  br label %2839

; <label>:2839                                    ; preds = %2838
  %2840 = load i32* %mcnt, align 4
  %2841 = and i32 %2840, 255
  %2842 = trunc i32 %2841 to i8
  %2843 = load i8** %p, align 8
  %2844 = getelementptr inbounds i8* %2843, i64 0
  store i8 %2842, i8* %2844, align 1
  %2845 = load i32* %mcnt, align 4
  %2846 = ashr i32 %2845, 8
  %2847 = trunc i32 %2846 to i8
  %2848 = load i8** %p, align 8
  %2849 = getelementptr inbounds i8* %2848, i64 1
  store i8 %2847, i8* %2849, align 1
  br label %2850

; <label>:2850                                    ; preds = %2839
  %2851 = load i8** %p, align 8
  %2852 = getelementptr inbounds i8* %2851, i64 2
  store i8* %2852, i8** %p, align 8
  br label %2853

; <label>:2853                                    ; preds = %2850
  br label %2863

; <label>:2854                                    ; preds = %2830
  %2855 = load i32* %mcnt, align 4
  %2856 = icmp eq i32 %2855, 0
  br i1 %2856, label %2857, label %2862

; <label>:2857                                    ; preds = %2854
  %2858 = load i8** %p, align 8
  %2859 = getelementptr inbounds i8* %2858, i64 2
  store i8 0, i8* %2859, align 1
  %2860 = load i8** %p, align 8
  %2861 = getelementptr inbounds i8* %2860, i64 3
  store i8 0, i8* %2861, align 1
  br label %2046

; <label>:2862                                    ; preds = %2854
  br label %2863

; <label>:2863                                    ; preds = %2862, %2853
  br label %3451

; <label>:2864                                    ; preds = %749
  br label %2865

; <label>:2865                                    ; preds = %2864
  %2866 = load i8** %p, align 8
  %2867 = getelementptr inbounds i8* %2866, i64 2
  %2868 = load i8* %2867, align 1
  %2869 = zext i8 %2868 to i32
  %2870 = and i32 %2869, 255
  store i32 %2870, i32* %mcnt, align 4
  %2871 = load i8** %p, align 8
  %2872 = getelementptr inbounds i8* %2871, i64 2
  %2873 = getelementptr inbounds i8* %2872, i64 1
  %2874 = load i8* %2873, align 1
  %2875 = sext i8 %2874 to i32
  %2876 = shl i32 %2875, 8
  %2877 = load i32* %mcnt, align 4
  %2878 = add nsw i32 %2877, %2876
  store i32 %2878, i32* %mcnt, align 4
  br label %2879

; <label>:2879                                    ; preds = %2865
  %2880 = load i32* %mcnt, align 4
  %2881 = icmp ne i32 %2880, 0
  br i1 %2881, label %2882, label %2899

; <label>:2882                                    ; preds = %2879
  %2883 = load i32* %mcnt, align 4
  %2884 = add nsw i32 %2883, -1
  store i32 %2884, i32* %mcnt, align 4
  br label %2885

; <label>:2885                                    ; preds = %2882
  %2886 = load i32* %mcnt, align 4
  %2887 = and i32 %2886, 255
  %2888 = trunc i32 %2887 to i8
  %2889 = load i8** %p, align 8
  %2890 = getelementptr inbounds i8* %2889, i64 2
  %2891 = getelementptr inbounds i8* %2890, i64 0
  store i8 %2888, i8* %2891, align 1
  %2892 = load i32* %mcnt, align 4
  %2893 = ashr i32 %2892, 8
  %2894 = trunc i32 %2893 to i8
  %2895 = load i8** %p, align 8
  %2896 = getelementptr inbounds i8* %2895, i64 2
  %2897 = getelementptr inbounds i8* %2896, i64 1
  store i8 %2894, i8* %2897, align 1
  br label %2898

; <label>:2898                                    ; preds = %2885
  br label %2512

; <label>:2899                                    ; preds = %2879
  %2900 = load i8** %p, align 8
  %2901 = getelementptr inbounds i8* %2900, i64 4
  store i8* %2901, i8** %p, align 8
  br label %2902

; <label>:2902                                    ; preds = %2899
  br label %3451

; <label>:2903                                    ; preds = %749
  br label %2904

; <label>:2904                                    ; preds = %2903
  br label %2905

; <label>:2905                                    ; preds = %2904
  %2906 = load i8** %p, align 8
  %2907 = load i8* %2906, align 1
  %2908 = zext i8 %2907 to i32
  %2909 = and i32 %2908, 255
  store i32 %2909, i32* %mcnt, align 4
  %2910 = load i8** %p, align 8
  %2911 = getelementptr inbounds i8* %2910, i64 1
  %2912 = load i8* %2911, align 1
  %2913 = sext i8 %2912 to i32
  %2914 = shl i32 %2913, 8
  %2915 = load i32* %mcnt, align 4
  %2916 = add nsw i32 %2915, %2914
  store i32 %2916, i32* %mcnt, align 4
  br label %2917

; <label>:2917                                    ; preds = %2905
  %2918 = load i8** %p, align 8
  %2919 = getelementptr inbounds i8* %2918, i64 2
  store i8* %2919, i8** %p, align 8
  br label %2920

; <label>:2920                                    ; preds = %2917
  %2921 = load i8** %p, align 8
  %2922 = load i32* %mcnt, align 4
  %2923 = sext i32 %2922 to i64
  %2924 = getelementptr inbounds i8* %2921, i64 %2923
  store i8* %2924, i8** %p1, align 8
  br label %2925

; <label>:2925                                    ; preds = %2920
  br label %2926

; <label>:2926                                    ; preds = %2925
  %2927 = load i8** %p, align 8
  %2928 = load i8* %2927, align 1
  %2929 = zext i8 %2928 to i32
  %2930 = and i32 %2929, 255
  store i32 %2930, i32* %mcnt, align 4
  %2931 = load i8** %p, align 8
  %2932 = getelementptr inbounds i8* %2931, i64 1
  %2933 = load i8* %2932, align 1
  %2934 = sext i8 %2933 to i32
  %2935 = shl i32 %2934, 8
  %2936 = load i32* %mcnt, align 4
  %2937 = add nsw i32 %2936, %2935
  store i32 %2937, i32* %mcnt, align 4
  br label %2938

; <label>:2938                                    ; preds = %2926
  %2939 = load i8** %p, align 8
  %2940 = getelementptr inbounds i8* %2939, i64 2
  store i8* %2940, i8** %p, align 8
  br label %2941

; <label>:2941                                    ; preds = %2938
  br label %2942

; <label>:2942                                    ; preds = %2941
  %2943 = load i32* %mcnt, align 4
  %2944 = and i32 %2943, 255
  %2945 = trunc i32 %2944 to i8
  %2946 = load i8** %p1, align 8
  %2947 = getelementptr inbounds i8* %2946, i64 0
  store i8 %2945, i8* %2947, align 1
  %2948 = load i32* %mcnt, align 4
  %2949 = ashr i32 %2948, 8
  %2950 = trunc i32 %2949 to i8
  %2951 = load i8** %p1, align 8
  %2952 = getelementptr inbounds i8* %2951, i64 1
  store i8 %2950, i8* %2952, align 1
  br label %2953

; <label>:2953                                    ; preds = %2942
  br label %3451

; <label>:2954                                    ; preds = %749
  %2955 = load i8** %d, align 8
  %2956 = load i32* %4, align 4
  %2957 = icmp ne i32 %2956, 0
  br i1 %2957, label %2958, label %2960

; <label>:2958                                    ; preds = %2954
  %2959 = load i8** %3, align 8
  br label %2962

; <label>:2960                                    ; preds = %2954
  %2961 = load i8** %5, align 8
  br label %2962

; <label>:2962                                    ; preds = %2960, %2958
  %2963 = phi i8* [ %2959, %2958 ], [ %2961, %2960 ]
  %2964 = icmp eq i8* %2955, %2963
  br i1 %2964, label %3039, label %2965

; <label>:2965                                    ; preds = %2962
  %2966 = load i32* %6, align 4
  %2967 = icmp ne i32 %2966, 0
  br i1 %2967, label %2968, label %3039

; <label>:2968                                    ; preds = %2965
  %2969 = load i8** %d, align 8
  %2970 = load i8** %end2, align 8
  %2971 = icmp eq i8* %2969, %2970
  br i1 %2971, label %3039, label %2972

; <label>:2972                                    ; preds = %2968
  %2973 = load i8** %d, align 8
  %2974 = getelementptr inbounds i8* %2973, i64 -1
  %2975 = load i8** %end1, align 8
  %2976 = icmp eq i8* %2974, %2975
  br i1 %2976, label %2977, label %2981

; <label>:2977                                    ; preds = %2972
  %2978 = load i8** %5, align 8
  %2979 = load i8* %2978, align 1
  %2980 = sext i8 %2979 to i32
  br label %2999

; <label>:2981                                    ; preds = %2972
  %2982 = load i8** %d, align 8
  %2983 = getelementptr inbounds i8* %2982, i64 -1
  %2984 = load i8** %5, align 8
  %2985 = getelementptr inbounds i8* %2984, i64 -1
  %2986 = icmp eq i8* %2983, %2985
  br i1 %2986, label %2987, label %2992

; <label>:2987                                    ; preds = %2981
  %2988 = load i8** %end1, align 8
  %2989 = getelementptr inbounds i8* %2988, i64 -1
  %2990 = load i8* %2989, align 1
  %2991 = sext i8 %2990 to i32
  br label %2997

; <label>:2992                                    ; preds = %2981
  %2993 = load i8** %d, align 8
  %2994 = getelementptr inbounds i8* %2993, i64 -1
  %2995 = load i8* %2994, align 1
  %2996 = sext i8 %2995 to i32
  br label %2997

; <label>:2997                                    ; preds = %2992, %2987
  %2998 = phi i32 [ %2991, %2987 ], [ %2996, %2992 ]
  br label %2999

; <label>:2999                                    ; preds = %2997, %2977
  %3000 = phi i32 [ %2980, %2977 ], [ %2998, %2997 ]
  %3001 = sext i32 %3000 to i64
  %3002 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %3001
  %3003 = load i8* %3002, align 1
  %3004 = sext i8 %3003 to i32
  %3005 = icmp eq i32 %3004, 1
  %3006 = zext i1 %3005 to i32
  %3007 = load i8** %d, align 8
  %3008 = load i8** %end1, align 8
  %3009 = icmp eq i8* %3007, %3008
  br i1 %3009, label %3010, label %3014

; <label>:3010                                    ; preds = %2999
  %3011 = load i8** %5, align 8
  %3012 = load i8* %3011, align 1
  %3013 = sext i8 %3012 to i32
  br label %3030

; <label>:3014                                    ; preds = %2999
  %3015 = load i8** %d, align 8
  %3016 = load i8** %5, align 8
  %3017 = getelementptr inbounds i8* %3016, i64 -1
  %3018 = icmp eq i8* %3015, %3017
  br i1 %3018, label %3019, label %3024

; <label>:3019                                    ; preds = %3014
  %3020 = load i8** %end1, align 8
  %3021 = getelementptr inbounds i8* %3020, i64 -1
  %3022 = load i8* %3021, align 1
  %3023 = sext i8 %3022 to i32
  br label %3028

; <label>:3024                                    ; preds = %3014
  %3025 = load i8** %d, align 8
  %3026 = load i8* %3025, align 1
  %3027 = sext i8 %3026 to i32
  br label %3028

; <label>:3028                                    ; preds = %3024, %3019
  %3029 = phi i32 [ %3023, %3019 ], [ %3027, %3024 ]
  br label %3030

; <label>:3030                                    ; preds = %3028, %3010
  %3031 = phi i32 [ %3013, %3010 ], [ %3029, %3028 ]
  %3032 = sext i32 %3031 to i64
  %3033 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %3032
  %3034 = load i8* %3033, align 1
  %3035 = sext i8 %3034 to i32
  %3036 = icmp eq i32 %3035, 1
  %3037 = zext i1 %3036 to i32
  %3038 = icmp ne i32 %3006, %3037
  br i1 %3038, label %3039, label %3040

; <label>:3039                                    ; preds = %3030, %2968, %2965, %2962
  br label %3451

; <label>:3040                                    ; preds = %3030
  br label %3452

; <label>:3041                                    ; preds = %749
  %3042 = load i8** %d, align 8
  %3043 = load i32* %4, align 4
  %3044 = icmp ne i32 %3043, 0
  br i1 %3044, label %3045, label %3047

; <label>:3045                                    ; preds = %3041
  %3046 = load i8** %3, align 8
  br label %3049

; <label>:3047                                    ; preds = %3041
  %3048 = load i8** %5, align 8
  br label %3049

; <label>:3049                                    ; preds = %3047, %3045
  %3050 = phi i8* [ %3046, %3045 ], [ %3048, %3047 ]
  %3051 = icmp eq i8* %3042, %3050
  br i1 %3051, label %3126, label %3052

; <label>:3052                                    ; preds = %3049
  %3053 = load i32* %6, align 4
  %3054 = icmp ne i32 %3053, 0
  br i1 %3054, label %3055, label %3126

; <label>:3055                                    ; preds = %3052
  %3056 = load i8** %d, align 8
  %3057 = load i8** %end2, align 8
  %3058 = icmp eq i8* %3056, %3057
  br i1 %3058, label %3126, label %3059

; <label>:3059                                    ; preds = %3055
  %3060 = load i8** %d, align 8
  %3061 = getelementptr inbounds i8* %3060, i64 -1
  %3062 = load i8** %end1, align 8
  %3063 = icmp eq i8* %3061, %3062
  br i1 %3063, label %3064, label %3068

; <label>:3064                                    ; preds = %3059
  %3065 = load i8** %5, align 8
  %3066 = load i8* %3065, align 1
  %3067 = sext i8 %3066 to i32
  br label %3086

; <label>:3068                                    ; preds = %3059
  %3069 = load i8** %d, align 8
  %3070 = getelementptr inbounds i8* %3069, i64 -1
  %3071 = load i8** %5, align 8
  %3072 = getelementptr inbounds i8* %3071, i64 -1
  %3073 = icmp eq i8* %3070, %3072
  br i1 %3073, label %3074, label %3079

; <label>:3074                                    ; preds = %3068
  %3075 = load i8** %end1, align 8
  %3076 = getelementptr inbounds i8* %3075, i64 -1
  %3077 = load i8* %3076, align 1
  %3078 = sext i8 %3077 to i32
  br label %3084

; <label>:3079                                    ; preds = %3068
  %3080 = load i8** %d, align 8
  %3081 = getelementptr inbounds i8* %3080, i64 -1
  %3082 = load i8* %3081, align 1
  %3083 = sext i8 %3082 to i32
  br label %3084

; <label>:3084                                    ; preds = %3079, %3074
  %3085 = phi i32 [ %3078, %3074 ], [ %3083, %3079 ]
  br label %3086

; <label>:3086                                    ; preds = %3084, %3064
  %3087 = phi i32 [ %3067, %3064 ], [ %3085, %3084 ]
  %3088 = sext i32 %3087 to i64
  %3089 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %3088
  %3090 = load i8* %3089, align 1
  %3091 = sext i8 %3090 to i32
  %3092 = icmp eq i32 %3091, 1
  %3093 = zext i1 %3092 to i32
  %3094 = load i8** %d, align 8
  %3095 = load i8** %end1, align 8
  %3096 = icmp eq i8* %3094, %3095
  br i1 %3096, label %3097, label %3101

; <label>:3097                                    ; preds = %3086
  %3098 = load i8** %5, align 8
  %3099 = load i8* %3098, align 1
  %3100 = sext i8 %3099 to i32
  br label %3117

; <label>:3101                                    ; preds = %3086
  %3102 = load i8** %d, align 8
  %3103 = load i8** %5, align 8
  %3104 = getelementptr inbounds i8* %3103, i64 -1
  %3105 = icmp eq i8* %3102, %3104
  br i1 %3105, label %3106, label %3111

; <label>:3106                                    ; preds = %3101
  %3107 = load i8** %end1, align 8
  %3108 = getelementptr inbounds i8* %3107, i64 -1
  %3109 = load i8* %3108, align 1
  %3110 = sext i8 %3109 to i32
  br label %3115

; <label>:3111                                    ; preds = %3101
  %3112 = load i8** %d, align 8
  %3113 = load i8* %3112, align 1
  %3114 = sext i8 %3113 to i32
  br label %3115

; <label>:3115                                    ; preds = %3111, %3106
  %3116 = phi i32 [ %3110, %3106 ], [ %3114, %3111 ]
  br label %3117

; <label>:3117                                    ; preds = %3115, %3097
  %3118 = phi i32 [ %3100, %3097 ], [ %3116, %3115 ]
  %3119 = sext i32 %3118 to i64
  %3120 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %3119
  %3121 = load i8* %3120, align 1
  %3122 = sext i8 %3121 to i32
  %3123 = icmp eq i32 %3122, 1
  %3124 = zext i1 %3123 to i32
  %3125 = icmp ne i32 %3093, %3124
  br i1 %3125, label %3126, label %3127

; <label>:3126                                    ; preds = %3117, %3055, %3052, %3049
  br label %3452

; <label>:3127                                    ; preds = %3117
  br label %3451

; <label>:3128                                    ; preds = %749
  %3129 = load i8** %d, align 8
  %3130 = load i8** %end1, align 8
  %3131 = icmp eq i8* %3129, %3130
  br i1 %3131, label %3132, label %3136

; <label>:3132                                    ; preds = %3128
  %3133 = load i8** %5, align 8
  %3134 = load i8* %3133, align 1
  %3135 = sext i8 %3134 to i32
  br label %3152

; <label>:3136                                    ; preds = %3128
  %3137 = load i8** %d, align 8
  %3138 = load i8** %5, align 8
  %3139 = getelementptr inbounds i8* %3138, i64 -1
  %3140 = icmp eq i8* %3137, %3139
  br i1 %3140, label %3141, label %3146

; <label>:3141                                    ; preds = %3136
  %3142 = load i8** %end1, align 8
  %3143 = getelementptr inbounds i8* %3142, i64 -1
  %3144 = load i8* %3143, align 1
  %3145 = sext i8 %3144 to i32
  br label %3150

; <label>:3146                                    ; preds = %3136
  %3147 = load i8** %d, align 8
  %3148 = load i8* %3147, align 1
  %3149 = sext i8 %3148 to i32
  br label %3150

; <label>:3150                                    ; preds = %3146, %3141
  %3151 = phi i32 [ %3145, %3141 ], [ %3149, %3146 ]
  br label %3152

; <label>:3152                                    ; preds = %3150, %3132
  %3153 = phi i32 [ %3135, %3132 ], [ %3151, %3150 ]
  %3154 = sext i32 %3153 to i64
  %3155 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %3154
  %3156 = load i8* %3155, align 1
  %3157 = sext i8 %3156 to i32
  %3158 = icmp eq i32 %3157, 1
  br i1 %3158, label %3159, label %3208

; <label>:3159                                    ; preds = %3152
  %3160 = load i8** %d, align 8
  %3161 = load i32* %4, align 4
  %3162 = icmp ne i32 %3161, 0
  br i1 %3162, label %3163, label %3165

; <label>:3163                                    ; preds = %3159
  %3164 = load i8** %3, align 8
  br label %3167

; <label>:3165                                    ; preds = %3159
  %3166 = load i8** %5, align 8
  br label %3167

; <label>:3167                                    ; preds = %3165, %3163
  %3168 = phi i8* [ %3164, %3163 ], [ %3166, %3165 ]
  %3169 = icmp eq i8* %3160, %3168
  br i1 %3169, label %3207, label %3170

; <label>:3170                                    ; preds = %3167
  %3171 = load i32* %6, align 4
  %3172 = icmp ne i32 %3171, 0
  br i1 %3172, label %3173, label %3207

; <label>:3173                                    ; preds = %3170
  %3174 = load i8** %d, align 8
  %3175 = getelementptr inbounds i8* %3174, i64 -1
  %3176 = load i8** %end1, align 8
  %3177 = icmp eq i8* %3175, %3176
  br i1 %3177, label %3178, label %3182

; <label>:3178                                    ; preds = %3173
  %3179 = load i8** %5, align 8
  %3180 = load i8* %3179, align 1
  %3181 = sext i8 %3180 to i32
  br label %3200

; <label>:3182                                    ; preds = %3173
  %3183 = load i8** %d, align 8
  %3184 = getelementptr inbounds i8* %3183, i64 -1
  %3185 = load i8** %5, align 8
  %3186 = getelementptr inbounds i8* %3185, i64 -1
  %3187 = icmp eq i8* %3184, %3186
  br i1 %3187, label %3188, label %3193

; <label>:3188                                    ; preds = %3182
  %3189 = load i8** %end1, align 8
  %3190 = getelementptr inbounds i8* %3189, i64 -1
  %3191 = load i8* %3190, align 1
  %3192 = sext i8 %3191 to i32
  br label %3198

; <label>:3193                                    ; preds = %3182
  %3194 = load i8** %d, align 8
  %3195 = getelementptr inbounds i8* %3194, i64 -1
  %3196 = load i8* %3195, align 1
  %3197 = sext i8 %3196 to i32
  br label %3198

; <label>:3198                                    ; preds = %3193, %3188
  %3199 = phi i32 [ %3192, %3188 ], [ %3197, %3193 ]
  br label %3200

; <label>:3200                                    ; preds = %3198, %3178
  %3201 = phi i32 [ %3181, %3178 ], [ %3199, %3198 ]
  %3202 = sext i32 %3201 to i64
  %3203 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %3202
  %3204 = load i8* %3203, align 1
  %3205 = sext i8 %3204 to i32
  %3206 = icmp eq i32 %3205, 1
  br i1 %3206, label %3208, label %3207

; <label>:3207                                    ; preds = %3200, %3170, %3167
  br label %3451

; <label>:3208                                    ; preds = %3200, %3152
  br label %3452

; <label>:3209                                    ; preds = %749
  %3210 = load i8** %d, align 8
  %3211 = load i32* %4, align 4
  %3212 = icmp ne i32 %3211, 0
  br i1 %3212, label %3213, label %3215

; <label>:3213                                    ; preds = %3209
  %3214 = load i8** %3, align 8
  br label %3217

; <label>:3215                                    ; preds = %3209
  %3216 = load i8** %5, align 8
  br label %3217

; <label>:3217                                    ; preds = %3215, %3213
  %3218 = phi i8* [ %3214, %3213 ], [ %3216, %3215 ]
  %3219 = icmp eq i8* %3210, %3218
  br i1 %3219, label %3293, label %3220

; <label>:3220                                    ; preds = %3217
  %3221 = load i32* %6, align 4
  %3222 = icmp ne i32 %3221, 0
  br i1 %3222, label %3223, label %3293

; <label>:3223                                    ; preds = %3220
  %3224 = load i8** %d, align 8
  %3225 = getelementptr inbounds i8* %3224, i64 -1
  %3226 = load i8** %end1, align 8
  %3227 = icmp eq i8* %3225, %3226
  br i1 %3227, label %3228, label %3232

; <label>:3228                                    ; preds = %3223
  %3229 = load i8** %5, align 8
  %3230 = load i8* %3229, align 1
  %3231 = sext i8 %3230 to i32
  br label %3250

; <label>:3232                                    ; preds = %3223
  %3233 = load i8** %d, align 8
  %3234 = getelementptr inbounds i8* %3233, i64 -1
  %3235 = load i8** %5, align 8
  %3236 = getelementptr inbounds i8* %3235, i64 -1
  %3237 = icmp eq i8* %3234, %3236
  br i1 %3237, label %3238, label %3243

; <label>:3238                                    ; preds = %3232
  %3239 = load i8** %end1, align 8
  %3240 = getelementptr inbounds i8* %3239, i64 -1
  %3241 = load i8* %3240, align 1
  %3242 = sext i8 %3241 to i32
  br label %3248

; <label>:3243                                    ; preds = %3232
  %3244 = load i8** %d, align 8
  %3245 = getelementptr inbounds i8* %3244, i64 -1
  %3246 = load i8* %3245, align 1
  %3247 = sext i8 %3246 to i32
  br label %3248

; <label>:3248                                    ; preds = %3243, %3238
  %3249 = phi i32 [ %3242, %3238 ], [ %3247, %3243 ]
  br label %3250

; <label>:3250                                    ; preds = %3248, %3228
  %3251 = phi i32 [ %3231, %3228 ], [ %3249, %3248 ]
  %3252 = sext i32 %3251 to i64
  %3253 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %3252
  %3254 = load i8* %3253, align 1
  %3255 = sext i8 %3254 to i32
  %3256 = icmp eq i32 %3255, 1
  br i1 %3256, label %3257, label %3293

; <label>:3257                                    ; preds = %3250
  %3258 = load i8** %d, align 8
  %3259 = load i8** %end1, align 8
  %3260 = icmp eq i8* %3258, %3259
  br i1 %3260, label %3261, label %3265

; <label>:3261                                    ; preds = %3257
  %3262 = load i8** %5, align 8
  %3263 = load i8* %3262, align 1
  %3264 = sext i8 %3263 to i32
  br label %3281

; <label>:3265                                    ; preds = %3257
  %3266 = load i8** %d, align 8
  %3267 = load i8** %5, align 8
  %3268 = getelementptr inbounds i8* %3267, i64 -1
  %3269 = icmp eq i8* %3266, %3268
  br i1 %3269, label %3270, label %3275

; <label>:3270                                    ; preds = %3265
  %3271 = load i8** %end1, align 8
  %3272 = getelementptr inbounds i8* %3271, i64 -1
  %3273 = load i8* %3272, align 1
  %3274 = sext i8 %3273 to i32
  br label %3279

; <label>:3275                                    ; preds = %3265
  %3276 = load i8** %d, align 8
  %3277 = load i8* %3276, align 1
  %3278 = sext i8 %3277 to i32
  br label %3279

; <label>:3279                                    ; preds = %3275, %3270
  %3280 = phi i32 [ %3274, %3270 ], [ %3278, %3275 ]
  br label %3281

; <label>:3281                                    ; preds = %3279, %3261
  %3282 = phi i32 [ %3264, %3261 ], [ %3280, %3279 ]
  %3283 = sext i32 %3282 to i64
  %3284 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %3283
  %3285 = load i8* %3284, align 1
  %3286 = sext i8 %3285 to i32
  %3287 = icmp eq i32 %3286, 1
  br i1 %3287, label %3288, label %3292

; <label>:3288                                    ; preds = %3281
  %3289 = load i8** %d, align 8
  %3290 = load i8** %end2, align 8
  %3291 = icmp eq i8* %3289, %3290
  br i1 %3291, label %3292, label %3293

; <label>:3292                                    ; preds = %3288, %3281
  br label %3451

; <label>:3293                                    ; preds = %3288, %3250, %3220, %3217
  br label %3452

; <label>:3294                                    ; preds = %749
  br label %3295

; <label>:3295                                    ; preds = %3304, %3294
  %3296 = load i8** %d, align 8
  %3297 = load i8** %dend, align 8
  %3298 = icmp eq i8* %3296, %3297
  br i1 %3298, label %3299, label %3307

; <label>:3299                                    ; preds = %3295
  %3300 = load i8** %dend, align 8
  %3301 = load i8** %end_match_2, align 8
  %3302 = icmp eq i8* %3300, %3301
  br i1 %3302, label %3303, label %3304

; <label>:3303                                    ; preds = %3299
  br label %3452

; <label>:3304                                    ; preds = %3299
  %3305 = load i8** %5, align 8
  store i8* %3305, i8** %d, align 8
  %3306 = load i8** %end_match_2, align 8
  store i8* %3306, i8** %dend, align 8
  br label %3295

; <label>:3307                                    ; preds = %3295
  %3308 = load i8** %d, align 8
  %3309 = load i8** %end1, align 8
  %3310 = icmp eq i8* %3308, %3309
  br i1 %3310, label %3311, label %3315

; <label>:3311                                    ; preds = %3307
  %3312 = load i8** %5, align 8
  %3313 = load i8* %3312, align 1
  %3314 = sext i8 %3313 to i32
  br label %3331

; <label>:3315                                    ; preds = %3307
  %3316 = load i8** %d, align 8
  %3317 = load i8** %5, align 8
  %3318 = getelementptr inbounds i8* %3317, i64 -1
  %3319 = icmp eq i8* %3316, %3318
  br i1 %3319, label %3320, label %3325

; <label>:3320                                    ; preds = %3315
  %3321 = load i8** %end1, align 8
  %3322 = getelementptr inbounds i8* %3321, i64 -1
  %3323 = load i8* %3322, align 1
  %3324 = sext i8 %3323 to i32
  br label %3329

; <label>:3325                                    ; preds = %3315
  %3326 = load i8** %d, align 8
  %3327 = load i8* %3326, align 1
  %3328 = sext i8 %3327 to i32
  br label %3329

; <label>:3329                                    ; preds = %3325, %3320
  %3330 = phi i32 [ %3324, %3320 ], [ %3328, %3325 ]
  br label %3331

; <label>:3331                                    ; preds = %3329, %3311
  %3332 = phi i32 [ %3314, %3311 ], [ %3330, %3329 ]
  %3333 = sext i32 %3332 to i64
  %3334 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %3333
  %3335 = load i8* %3334, align 1
  %3336 = sext i8 %3335 to i32
  %3337 = icmp eq i32 %3336, 1
  br i1 %3337, label %3339, label %3338

; <label>:3338                                    ; preds = %3331
  br label %3452

; <label>:3339                                    ; preds = %3331
  br label %3340

; <label>:3340                                    ; preds = %3339
  %3341 = load i32* %lowest_active_reg, align 4
  store i32 %3341, i32* %r16, align 4
  br label %3342

; <label>:3342                                    ; preds = %3365, %3340
  %3343 = load i32* %r16, align 4
  %3344 = load i32* %highest_active_reg, align 4
  %3345 = icmp ule i32 %3343, %3344
  br i1 %3345, label %3346, label %3368

; <label>:3346                                    ; preds = %3342
  %3347 = load i32* %r16, align 4
  %3348 = zext i32 %3347 to i64
  %3349 = load %union.register_info_type** %reg_info, align 8
  %3350 = getelementptr inbounds %union.register_info_type* %3349, i64 %3348
  %3351 = bitcast %union.register_info_type* %3350 to %struct.anon.2*
  %3352 = bitcast %struct.anon.2* %3351 to i32*
  %3353 = load i32* %3352, align 4
  %3354 = and i32 %3353, -17
  %3355 = or i32 %3354, 16
  store i32 %3355, i32* %3352, align 4
  %3356 = load i32* %r16, align 4
  %3357 = zext i32 %3356 to i64
  %3358 = load %union.register_info_type** %reg_info, align 8
  %3359 = getelementptr inbounds %union.register_info_type* %3358, i64 %3357
  %3360 = bitcast %union.register_info_type* %3359 to %struct.anon.2*
  %3361 = bitcast %struct.anon.2* %3360 to i32*
  %3362 = load i32* %3361, align 4
  %3363 = and i32 %3362, -9
  %3364 = or i32 %3363, 8
  store i32 %3364, i32* %3361, align 4
  br label %3365

; <label>:3365                                    ; preds = %3346
  %3366 = load i32* %r16, align 4
  %3367 = add i32 %3366, 1
  store i32 %3367, i32* %r16, align 4
  br label %3342

; <label>:3368                                    ; preds = %3342
  br label %3369

; <label>:3369                                    ; preds = %3368
  %3370 = load i8** %d, align 8
  %3371 = getelementptr inbounds i8* %3370, i32 1
  store i8* %3371, i8** %d, align 8
  br label %3451

; <label>:3372                                    ; preds = %749
  br label %3373

; <label>:3373                                    ; preds = %3382, %3372
  %3374 = load i8** %d, align 8
  %3375 = load i8** %dend, align 8
  %3376 = icmp eq i8* %3374, %3375
  br i1 %3376, label %3377, label %3385

; <label>:3377                                    ; preds = %3373
  %3378 = load i8** %dend, align 8
  %3379 = load i8** %end_match_2, align 8
  %3380 = icmp eq i8* %3378, %3379
  br i1 %3380, label %3381, label %3382

; <label>:3381                                    ; preds = %3377
  br label %3452

; <label>:3382                                    ; preds = %3377
  %3383 = load i8** %5, align 8
  store i8* %3383, i8** %d, align 8
  %3384 = load i8** %end_match_2, align 8
  store i8* %3384, i8** %dend, align 8
  br label %3373

; <label>:3385                                    ; preds = %3373
  %3386 = load i8** %d, align 8
  %3387 = load i8** %end1, align 8
  %3388 = icmp eq i8* %3386, %3387
  br i1 %3388, label %3389, label %3393

; <label>:3389                                    ; preds = %3385
  %3390 = load i8** %5, align 8
  %3391 = load i8* %3390, align 1
  %3392 = sext i8 %3391 to i32
  br label %3409

; <label>:3393                                    ; preds = %3385
  %3394 = load i8** %d, align 8
  %3395 = load i8** %5, align 8
  %3396 = getelementptr inbounds i8* %3395, i64 -1
  %3397 = icmp eq i8* %3394, %3396
  br i1 %3397, label %3398, label %3403

; <label>:3398                                    ; preds = %3393
  %3399 = load i8** %end1, align 8
  %3400 = getelementptr inbounds i8* %3399, i64 -1
  %3401 = load i8* %3400, align 1
  %3402 = sext i8 %3401 to i32
  br label %3407

; <label>:3403                                    ; preds = %3393
  %3404 = load i8** %d, align 8
  %3405 = load i8* %3404, align 1
  %3406 = sext i8 %3405 to i32
  br label %3407

; <label>:3407                                    ; preds = %3403, %3398
  %3408 = phi i32 [ %3402, %3398 ], [ %3406, %3403 ]
  br label %3409

; <label>:3409                                    ; preds = %3407, %3389
  %3410 = phi i32 [ %3392, %3389 ], [ %3408, %3407 ]
  %3411 = sext i32 %3410 to i64
  %3412 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %3411
  %3413 = load i8* %3412, align 1
  %3414 = sext i8 %3413 to i32
  %3415 = icmp eq i32 %3414, 1
  br i1 %3415, label %3416, label %3417

; <label>:3416                                    ; preds = %3409
  br label %3452

; <label>:3417                                    ; preds = %3409
  br label %3418

; <label>:3418                                    ; preds = %3417
  %3419 = load i32* %lowest_active_reg, align 4
  store i32 %3419, i32* %r17, align 4
  br label %3420

; <label>:3420                                    ; preds = %3443, %3418
  %3421 = load i32* %r17, align 4
  %3422 = load i32* %highest_active_reg, align 4
  %3423 = icmp ule i32 %3421, %3422
  br i1 %3423, label %3424, label %3446

; <label>:3424                                    ; preds = %3420
  %3425 = load i32* %r17, align 4
  %3426 = zext i32 %3425 to i64
  %3427 = load %union.register_info_type** %reg_info, align 8
  %3428 = getelementptr inbounds %union.register_info_type* %3427, i64 %3426
  %3429 = bitcast %union.register_info_type* %3428 to %struct.anon.2*
  %3430 = bitcast %struct.anon.2* %3429 to i32*
  %3431 = load i32* %3430, align 4
  %3432 = and i32 %3431, -17
  %3433 = or i32 %3432, 16
  store i32 %3433, i32* %3430, align 4
  %3434 = load i32* %r17, align 4
  %3435 = zext i32 %3434 to i64
  %3436 = load %union.register_info_type** %reg_info, align 8
  %3437 = getelementptr inbounds %union.register_info_type* %3436, i64 %3435
  %3438 = bitcast %union.register_info_type* %3437 to %struct.anon.2*
  %3439 = bitcast %struct.anon.2* %3438 to i32*
  %3440 = load i32* %3439, align 4
  %3441 = and i32 %3440, -9
  %3442 = or i32 %3441, 8
  store i32 %3442, i32* %3439, align 4
  br label %3443

; <label>:3443                                    ; preds = %3424
  %3444 = load i32* %r17, align 4
  %3445 = add i32 %3444, 1
  store i32 %3445, i32* %r17, align 4
  br label %3420

; <label>:3446                                    ; preds = %3420
  br label %3447

; <label>:3447                                    ; preds = %3446
  %3448 = load i8** %d, align 8
  %3449 = getelementptr inbounds i8* %3448, i32 1
  store i8* %3449, i8** %d, align 8
  br label %3451

; <label>:3450                                    ; preds = %749
  call void @abort() noreturn nounwind
  unreachable

; <label>:3451                                    ; preds = %3447, %3369, %3292, %3207, %3127, %3039, %2953, %2902, %2863, %2814, %2529, %2250, %2044, %1882, %1876, %1859, %1833, %1817, %1800, %1776, %1596, %1172, %1062, %951, %858, %754
  br label %247

; <label>:3452                                    ; preds = %3595, %3545, %3416, %3381, %3338, %3303, %3293, %3208, %3126, %3040, %1883, %1877, %1861, %1819, %1766, %1723, %1617, %1594, %1031, %970, %920, %868, %821, %807, %790, %772, %329
  %3453 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %3454 = load i32* %3453, align 4
  %3455 = icmp eq i32 %3454, 0
  br i1 %3455, label %3610, label %3456

; <label>:3456                                    ; preds = %3452
  %3457 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %3458 = load i32* %3457, align 4
  %3459 = add i32 %3458, -1
  store i32 %3459, i32* %3457, align 4
  %3460 = zext i32 %3459 to i64
  %3461 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %3462 = load i8*** %3461, align 8
  %3463 = getelementptr inbounds i8** %3462, i64 %3460
  %3464 = load i8** %3463, align 8
  store i8* %3464, i8** %string_temp19, align 8
  %3465 = load i8** %string_temp19, align 8
  %3466 = icmp ne i8* %3465, null
  br i1 %3466, label %3467, label %3469

; <label>:3467                                    ; preds = %3456
  %3468 = load i8** %string_temp19, align 8
  store i8* %3468, i8** %d, align 8
  br label %3469

; <label>:3469                                    ; preds = %3467, %3456
  %3470 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %3471 = load i32* %3470, align 4
  %3472 = add i32 %3471, -1
  store i32 %3472, i32* %3470, align 4
  %3473 = zext i32 %3472 to i64
  %3474 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %3475 = load i8*** %3474, align 8
  %3476 = getelementptr inbounds i8** %3475, i64 %3473
  %3477 = load i8** %3476, align 8
  store i8* %3477, i8** %p, align 8
  %3478 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %3479 = load i32* %3478, align 4
  %3480 = add i32 %3479, -1
  store i32 %3480, i32* %3478, align 4
  %3481 = zext i32 %3480 to i64
  %3482 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %3483 = load i8*** %3482, align 8
  %3484 = getelementptr inbounds i8** %3483, i64 %3481
  %3485 = load i8** %3484, align 8
  %3486 = ptrtoint i8* %3485 to i32
  store i32 %3486, i32* %highest_active_reg, align 4
  %3487 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %3488 = load i32* %3487, align 4
  %3489 = add i32 %3488, -1
  store i32 %3489, i32* %3487, align 4
  %3490 = zext i32 %3489 to i64
  %3491 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %3492 = load i8*** %3491, align 8
  %3493 = getelementptr inbounds i8** %3492, i64 %3490
  %3494 = load i8** %3493, align 8
  %3495 = ptrtoint i8* %3494 to i32
  store i32 %3495, i32* %lowest_active_reg, align 4
  %3496 = load i32* %highest_active_reg, align 4
  store i32 %3496, i32* %this_reg18, align 4
  br label %3497

; <label>:3497                                    ; preds = %3539, %3469
  %3498 = load i32* %this_reg18, align 4
  %3499 = load i32* %lowest_active_reg, align 4
  %3500 = icmp uge i32 %3498, %3499
  br i1 %3500, label %3501, label %3542

; <label>:3501                                    ; preds = %3497
  %3502 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %3503 = load i32* %3502, align 4
  %3504 = add i32 %3503, -1
  store i32 %3504, i32* %3502, align 4
  %3505 = zext i32 %3504 to i64
  %3506 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %3507 = load i8*** %3506, align 8
  %3508 = getelementptr inbounds i8** %3507, i64 %3505
  %3509 = load i8** %3508, align 8
  %3510 = load i32* %this_reg18, align 4
  %3511 = sext i32 %3510 to i64
  %3512 = load %union.register_info_type** %reg_info, align 8
  %3513 = getelementptr inbounds %union.register_info_type* %3512, i64 %3511
  %3514 = bitcast %union.register_info_type* %3513 to i8**
  store i8* %3509, i8** %3514, align 8
  %3515 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %3516 = load i32* %3515, align 4
  %3517 = add i32 %3516, -1
  store i32 %3517, i32* %3515, align 4
  %3518 = zext i32 %3517 to i64
  %3519 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %3520 = load i8*** %3519, align 8
  %3521 = getelementptr inbounds i8** %3520, i64 %3518
  %3522 = load i8** %3521, align 8
  %3523 = load i32* %this_reg18, align 4
  %3524 = sext i32 %3523 to i64
  %3525 = load i8*** %regend, align 8
  %3526 = getelementptr inbounds i8** %3525, i64 %3524
  store i8* %3522, i8** %3526, align 8
  %3527 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 2
  %3528 = load i32* %3527, align 4
  %3529 = add i32 %3528, -1
  store i32 %3529, i32* %3527, align 4
  %3530 = zext i32 %3529 to i64
  %3531 = getelementptr inbounds %struct.fail_stack_type* %fail_stack, i32 0, i32 0
  %3532 = load i8*** %3531, align 8
  %3533 = getelementptr inbounds i8** %3532, i64 %3530
  %3534 = load i8** %3533, align 8
  %3535 = load i32* %this_reg18, align 4
  %3536 = sext i32 %3535 to i64
  %3537 = load i8*** %regstart, align 8
  %3538 = getelementptr inbounds i8** %3537, i64 %3536
  store i8* %3534, i8** %3538, align 8
  br label %3539

; <label>:3539                                    ; preds = %3501
  %3540 = load i32* %this_reg18, align 4
  %3541 = add nsw i32 %3540, -1
  store i32 %3541, i32* %this_reg18, align 4
  br label %3497

; <label>:3542                                    ; preds = %3497
  %3543 = load i8** %p, align 8
  %3544 = icmp ne i8* %3543, null
  br i1 %3544, label %3546, label %3545

; <label>:3545                                    ; preds = %3542
  br label %3452

; <label>:3546                                    ; preds = %3542
  %3547 = load i8** %p, align 8
  %3548 = load i8** %pend, align 8
  %3549 = icmp ult i8* %3547, %3548
  br i1 %3549, label %3550, label %3599

; <label>:3550                                    ; preds = %3546
  store i8 0, i8* %is_a_jump_n20, align 1
  %3551 = load i8** %p, align 8
  %3552 = load i8* %3551, align 1
  %3553 = zext i8 %3552 to i32
  switch i32 %3553, label %3597 [
    i32 21, label %3554
    i32 17, label %3555
    i32 16, label %3555
    i32 12, label %3555
  ]

; <label>:3554                                    ; preds = %3550
  store i8 1, i8* %is_a_jump_n20, align 1
  br label %3555

; <label>:3555                                    ; preds = %3554, %3550, %3550, %3550
  %3556 = load i8** %p, align 8
  %3557 = getelementptr inbounds i8* %3556, i64 1
  store i8* %3557, i8** %p1, align 8
  br label %3558

; <label>:3558                                    ; preds = %3555
  br label %3559

; <label>:3559                                    ; preds = %3558
  %3560 = load i8** %p1, align 8
  %3561 = load i8* %3560, align 1
  %3562 = zext i8 %3561 to i32
  %3563 = and i32 %3562, 255
  store i32 %3563, i32* %mcnt, align 4
  %3564 = load i8** %p1, align 8
  %3565 = getelementptr inbounds i8* %3564, i64 1
  %3566 = load i8* %3565, align 1
  %3567 = sext i8 %3566 to i32
  %3568 = shl i32 %3567, 8
  %3569 = load i32* %mcnt, align 4
  %3570 = add nsw i32 %3569, %3568
  store i32 %3570, i32* %mcnt, align 4
  br label %3571

; <label>:3571                                    ; preds = %3559
  %3572 = load i8** %p1, align 8
  %3573 = getelementptr inbounds i8* %3572, i64 2
  store i8* %3573, i8** %p1, align 8
  br label %3574

; <label>:3574                                    ; preds = %3571
  %3575 = load i32* %mcnt, align 4
  %3576 = load i8** %p1, align 8
  %3577 = sext i32 %3575 to i64
  %3578 = getelementptr inbounds i8* %3576, i64 %3577
  store i8* %3578, i8** %p1, align 8
  %3579 = load i8* %is_a_jump_n20, align 1
  %3580 = sext i8 %3579 to i32
  %3581 = icmp ne i32 %3580, 0
  br i1 %3581, label %3582, label %3587

; <label>:3582                                    ; preds = %3574
  %3583 = load i8** %p1, align 8
  %3584 = load i8* %3583, align 1
  %3585 = zext i8 %3584 to i32
  %3586 = icmp eq i32 %3585, 20
  br i1 %3586, label %3595, label %3587

; <label>:3587                                    ; preds = %3582, %3574
  %3588 = load i8* %is_a_jump_n20, align 1
  %3589 = icmp ne i8 %3588, 0
  br i1 %3589, label %3596, label %3590

; <label>:3590                                    ; preds = %3587
  %3591 = load i8** %p1, align 8
  %3592 = load i8* %3591, align 1
  %3593 = zext i8 %3592 to i32
  %3594 = icmp eq i32 %3593, 14
  br i1 %3594, label %3595, label %3596

; <label>:3595                                    ; preds = %3590, %3582
  br label %3452

; <label>:3596                                    ; preds = %3590, %3587
  br label %3598

; <label>:3597                                    ; preds = %3550
  br label %3598

; <label>:3598                                    ; preds = %3597, %3596
  br label %3599

; <label>:3599                                    ; preds = %3598, %3546
  %3600 = load i8** %d, align 8
  %3601 = load i8** %3, align 8
  %3602 = icmp uge i8* %3600, %3601
  br i1 %3602, label %3603, label %3609

; <label>:3603                                    ; preds = %3599
  %3604 = load i8** %d, align 8
  %3605 = load i8** %end1, align 8
  %3606 = icmp ule i8* %3604, %3605
  br i1 %3606, label %3607, label %3609

; <label>:3607                                    ; preds = %3603
  %3608 = load i8** %end_match_1, align 8
  store i8* %3608, i8** %dend, align 8
  br label %3609

; <label>:3609                                    ; preds = %3607, %3603, %3599
  br label %3611

; <label>:3610                                    ; preds = %3452
  br label %3612

; <label>:3611                                    ; preds = %3609
  br label %247

; <label>:3612                                    ; preds = %3610
  %3613 = load i32* %best_regs_set, align 4
  %3614 = icmp ne i32 %3613, 0
  br i1 %3614, label %3615, label %3616

; <label>:3615                                    ; preds = %3612
  br label %334

; <label>:3616                                    ; preds = %3612
  %3617 = alloca i8, i64 0
  store i32 -1, i32* %1
  br label %3618

; <label>:3618                                    ; preds = %3616, %2730, %2590, %2161, %1956, %1505, %742, %503, %438, %126, %114, %33
  %3619 = load i32* %1
  ret i32 %3619
}

define i32 @re_match(%struct.re_pattern_buffer* %bufp, i8* %string, i32 %size, i32 %pos, %struct.re_registers* %regs) nounwind uwtable {
  %1 = alloca %struct.re_pattern_buffer*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.re_registers*, align 8
  store %struct.re_pattern_buffer* %bufp, %struct.re_pattern_buffer** %1, align 8
  store i8* %string, i8** %2, align 8
  store i32 %size, i32* %3, align 4
  store i32 %pos, i32* %4, align 4
  store %struct.re_registers* %regs, %struct.re_registers** %5, align 8
  %6 = load %struct.re_pattern_buffer** %1, align 8
  %7 = load i8** %2, align 8
  %8 = load i32* %3, align 4
  %9 = load i32* %4, align 4
  %10 = load %struct.re_registers** %5, align 8
  %11 = load i32* %3, align 4
  %12 = call i32 @re_match_2(%struct.re_pattern_buffer* %6, i8* null, i32 0, i8* %7, i32 %8, i32 %9, %struct.re_registers* %10, i32 %11)
  ret i32 %12
}

declare i32 @memcmp(i8*, i8*, i64) nounwind readonly

define internal i32 @regex_compile(i8* %pattern, i32 %size, i32 %syntax, %struct.re_pattern_buffer* %bufp) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.re_pattern_buffer*, align 8
  %c = alloca i8, align 1
  %c1 = alloca i8, align 1
  %p1 = alloca i8*, align 8
  %b = alloca i8*, align 8
  %compile_stack = alloca %struct.compile_stack_type, align 8
  %p = alloca i8*, align 8
  %pend = alloca i8*, align 8
  %translate = alloca i8*, align 8
  %pending_exact = alloca i8*, align 8
  %laststart = alloca i8*, align 8
  %begalt = alloca i8*, align 8
  %beg_interval = alloca i8*, align 8
  %fixup_alt_jump = alloca i8*, align 8
  %regnum = alloca i32, align 4
  %old_buffer = alloca i8*, align 8
  %old_buffer1 = alloca i8*, align 8
  %keep_string_p = alloca i8, align 1
  %zero_times_ok = alloca i8, align 1
  %many_times_ok = alloca i8, align 1
  %old_buffer2 = alloca i8*, align 8
  %old_buffer3 = alloca i8*, align 8
  %old_buffer4 = alloca i8*, align 8
  %old_buffer5 = alloca i8*, align 8
  %had_char_class = alloca i8, align 1
  %old_buffer6 = alloca i8*, align 8
  %old_buffer7 = alloca i8*, align 8
  %old_buffer8 = alloca i8*, align 8
  %ret = alloca i32, align 4
  %ret9 = alloca i32, align 4
  %str = alloca [7 x i8], align 1
  %ch = alloca i32, align 4
  %is_alnum = alloca i8, align 1
  %is_alpha = alloca i8, align 1
  %is_blank = alloca i8, align 1
  %is_cntrl = alloca i8, align 1
  %is_digit = alloca i8, align 1
  %is_graph = alloca i8, align 1
  %is_lower = alloca i8, align 1
  %is_print = alloca i8, align 1
  %is_punct = alloca i8, align 1
  %is_space = alloca i8, align 1
  %is_upper = alloca i8, align 1
  %is_xdigit = alloca i8, align 1
  %old_buffer10 = alloca i8*, align 8
  %old_buffer11 = alloca i8*, align 8
  %this_group_regnum = alloca i32, align 4
  %inner_group_loc = alloca i8*, align 8
  %old_buffer12 = alloca i8*, align 8
  %old_buffer13 = alloca i8*, align 8
  %old_buffer14 = alloca i8*, align 8
  %lower_bound = alloca i32, align 4
  %upper_bound = alloca i32, align 4
  %old_buffer15 = alloca i8*, align 8
  %nbytes = alloca i32, align 4
  %old_buffer16 = alloca i8*, align 8
  %old_buffer17 = alloca i8*, align 8
  %old_buffer18 = alloca i8*, align 8
  %old_buffer19 = alloca i8*, align 8
  %old_buffer20 = alloca i8*, align 8
  %old_buffer21 = alloca i8*, align 8
  %old_buffer22 = alloca i8*, align 8
  %old_buffer23 = alloca i8*, align 8
  %old_buffer24 = alloca i8*, align 8
  %old_buffer25 = alloca i8*, align 8
  %old_buffer26 = alloca i8*, align 8
  %old_buffer27 = alloca i8*, align 8
  store i8* %pattern, i8** %2, align 8
  store i32 %size, i32* %3, align 4
  store i32 %syntax, i32* %4, align 4
  store %struct.re_pattern_buffer* %bufp, %struct.re_pattern_buffer** %5, align 8
  %6 = load i8** %2, align 8
  store i8* %6, i8** %p, align 8
  %7 = load i8** %2, align 8
  %8 = load i32* %3, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i8* %7, i64 %9
  store i8* %10, i8** %pend, align 8
  %11 = load %struct.re_pattern_buffer** %5, align 8
  %12 = getelementptr inbounds %struct.re_pattern_buffer* %11, i32 0, i32 5
  %13 = load i8** %12, align 8
  store i8* %13, i8** %translate, align 8
  store i8* null, i8** %pending_exact, align 8
  store i8* null, i8** %laststart, align 8
  store i8* null, i8** %fixup_alt_jump, align 8
  store i32 0, i32* %regnum, align 4
  %14 = call noalias i8* @malloc(i64 640) nounwind
  %15 = bitcast i8* %14 to %struct.compile_stack_elt_t*
  %16 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  store %struct.compile_stack_elt_t* %15, %struct.compile_stack_elt_t** %16, align 8
  %17 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %18 = load %struct.compile_stack_elt_t** %17, align 8
  %19 = icmp eq %struct.compile_stack_elt_t* %18, null
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %0
  store i32 12, i32* %1
  br label %5348

; <label>:21                                      ; preds = %0
  %22 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 1
  store i32 32, i32* %22, align 4
  %23 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  store i32 0, i32* %23, align 4
  %24 = load i32* %4, align 4
  %25 = load %struct.re_pattern_buffer** %5, align 8
  %26 = getelementptr inbounds %struct.re_pattern_buffer* %25, i32 0, i32 3
  store i32 %24, i32* %26, align 4
  %27 = load %struct.re_pattern_buffer** %5, align 8
  %28 = bitcast %struct.re_pattern_buffer* %27 to i8*
  %29 = getelementptr i8* %28, i32 56
  %30 = bitcast i8* %29 to i32*
  %31 = load i32* %30, align 8
  %32 = and i32 %31, -9
  store i32 %32, i32* %30, align 8
  %33 = load %struct.re_pattern_buffer** %5, align 8
  %34 = bitcast %struct.re_pattern_buffer* %33 to i8*
  %35 = getelementptr i8* %34, i32 56
  %36 = bitcast i8* %35 to i32*
  %37 = load i32* %36, align 8
  %38 = and i32 %37, -65
  store i32 %38, i32* %36, align 8
  %39 = load %struct.re_pattern_buffer** %5, align 8
  %40 = bitcast %struct.re_pattern_buffer* %39 to i8*
  %41 = getelementptr i8* %40, i32 56
  %42 = bitcast i8* %41 to i32*
  %43 = load i32* %42, align 8
  %44 = and i32 %43, -33
  store i32 %44, i32* %42, align 8
  %45 = load %struct.re_pattern_buffer** %5, align 8
  %46 = getelementptr inbounds %struct.re_pattern_buffer* %45, i32 0, i32 2
  store i64 0, i64* %46, align 8
  %47 = load %struct.re_pattern_buffer** %5, align 8
  %48 = getelementptr inbounds %struct.re_pattern_buffer* %47, i32 0, i32 6
  store i64 0, i64* %48, align 8
  call void @init_syntax_once()
  %49 = load %struct.re_pattern_buffer** %5, align 8
  %50 = getelementptr inbounds %struct.re_pattern_buffer* %49, i32 0, i32 1
  %51 = load i64* %50, align 8
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %53, label %78

; <label>:53                                      ; preds = %21
  %54 = load %struct.re_pattern_buffer** %5, align 8
  %55 = getelementptr inbounds %struct.re_pattern_buffer* %54, i32 0, i32 0
  %56 = load i8** %55, align 8
  %57 = icmp ne i8* %56, null
  br i1 %57, label %58, label %65

; <label>:58                                      ; preds = %53
  %59 = load %struct.re_pattern_buffer** %5, align 8
  %60 = getelementptr inbounds %struct.re_pattern_buffer* %59, i32 0, i32 0
  %61 = load i8** %60, align 8
  %62 = call noalias i8* @realloc(i8* %61, i64 32) nounwind
  %63 = load %struct.re_pattern_buffer** %5, align 8
  %64 = getelementptr inbounds %struct.re_pattern_buffer* %63, i32 0, i32 0
  store i8* %62, i8** %64, align 8
  br label %69

; <label>:65                                      ; preds = %53
  %66 = call noalias i8* @malloc(i64 32) nounwind
  %67 = load %struct.re_pattern_buffer** %5, align 8
  %68 = getelementptr inbounds %struct.re_pattern_buffer* %67, i32 0, i32 0
  store i8* %66, i8** %68, align 8
  br label %69

; <label>:69                                      ; preds = %65, %58
  %70 = load %struct.re_pattern_buffer** %5, align 8
  %71 = getelementptr inbounds %struct.re_pattern_buffer* %70, i32 0, i32 0
  %72 = load i8** %71, align 8
  %73 = icmp ne i8* %72, null
  br i1 %73, label %75, label %74

; <label>:74                                      ; preds = %69
  store i32 12, i32* %1
  br label %5348

; <label>:75                                      ; preds = %69
  %76 = load %struct.re_pattern_buffer** %5, align 8
  %77 = getelementptr inbounds %struct.re_pattern_buffer* %76, i32 0, i32 1
  store i64 32, i64* %77, align 8
  br label %78

; <label>:78                                      ; preds = %75, %21
  %79 = load %struct.re_pattern_buffer** %5, align 8
  %80 = getelementptr inbounds %struct.re_pattern_buffer* %79, i32 0, i32 0
  %81 = load i8** %80, align 8
  store i8* %81, i8** %b, align 8
  store i8* %81, i8** %begalt, align 8
  br label %82

; <label>:82                                      ; preds = %5318, %78
  %83 = load i8** %p, align 8
  %84 = load i8** %pend, align 8
  %85 = icmp ne i8* %83, %84
  br i1 %85, label %86, label %5319

; <label>:86                                      ; preds = %82
  br label %87

; <label>:87                                      ; preds = %86
  %88 = load i8** %p, align 8
  %89 = load i8** %pend, align 8
  %90 = icmp eq i8* %88, %89
  br i1 %90, label %91, label %92

; <label>:91                                      ; preds = %87
  store i32 14, i32* %1
  br label %5348

; <label>:92                                      ; preds = %87
  %93 = load i8** %p, align 8
  %94 = getelementptr inbounds i8* %93, i32 1
  store i8* %94, i8** %p, align 8
  %95 = load i8* %93, align 1
  store i8 %95, i8* %c, align 1
  %96 = load i8** %translate, align 8
  %97 = icmp ne i8* %96, null
  br i1 %97, label %98, label %104

; <label>:98                                      ; preds = %92
  %99 = load i8* %c, align 1
  %100 = zext i8 %99 to i64
  %101 = load i8** %translate, align 8
  %102 = getelementptr inbounds i8* %101, i64 %100
  %103 = load i8* %102, align 1
  store i8 %103, i8* %c, align 1
  br label %104

; <label>:104                                     ; preds = %98, %92
  br label %105

; <label>:105                                     ; preds = %104
  %106 = load i8* %c, align 1
  %107 = zext i8 %106 to i32
  switch i32 %107, label %4980 [
    i32 94, label %108
    i32 36, label %248
    i32 43, label %387
    i32 63, label %387
    i32 42, label %398
    i32 46, label %1002
    i32 91, label %1125
    i32 40, label %2252
    i32 41, label %2258
    i32 10, label %2264
    i32 124, label %2270
    i32 123, label %2276
    i32 92, label %2286
  ]

; <label>:108                                     ; preds = %105
  %109 = load i8** %p, align 8
  %110 = load i8** %2, align 8
  %111 = getelementptr inbounds i8* %110, i64 1
  %112 = icmp eq i8* %109, %111
  br i1 %112, label %124, label %113

; <label>:113                                     ; preds = %108
  %114 = load i32* %4, align 4
  %115 = and i32 %114, 8
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %124, label %117

; <label>:117                                     ; preds = %113
  %118 = load i8** %2, align 8
  %119 = load i8** %p, align 8
  %120 = load i32* %4, align 4
  %121 = call signext i8 (...)* bitcast (i8 (i8*, i8*, i32)* @at_begline_loc_p to i8 (...)*)(i8* %118, i8* %119, i32 %120)
  %122 = sext i8 %121 to i32
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %246

; <label>:124                                     ; preds = %117, %113, %108
  br label %125

; <label>:125                                     ; preds = %124
  br label %126

; <label>:126                                     ; preds = %241, %125
  %127 = load i8** %b, align 8
  %128 = load %struct.re_pattern_buffer** %5, align 8
  %129 = getelementptr inbounds %struct.re_pattern_buffer* %128, i32 0, i32 0
  %130 = load i8** %129, align 8
  %131 = ptrtoint i8* %127 to i64
  %132 = ptrtoint i8* %130 to i64
  %133 = sub i64 %131, %132
  %134 = add nsw i64 %133, 1
  %135 = load %struct.re_pattern_buffer** %5, align 8
  %136 = getelementptr inbounds %struct.re_pattern_buffer* %135, i32 0, i32 1
  %137 = load i64* %136, align 8
  %138 = icmp ugt i64 %134, %137
  br i1 %138, label %139, label %242

; <label>:139                                     ; preds = %126
  br label %140

; <label>:140                                     ; preds = %139
  %141 = load %struct.re_pattern_buffer** %5, align 8
  %142 = getelementptr inbounds %struct.re_pattern_buffer* %141, i32 0, i32 0
  %143 = load i8** %142, align 8
  store i8* %143, i8** %old_buffer, align 8
  %144 = load %struct.re_pattern_buffer** %5, align 8
  %145 = getelementptr inbounds %struct.re_pattern_buffer* %144, i32 0, i32 1
  %146 = load i64* %145, align 8
  %147 = icmp eq i64 %146, 65536
  br i1 %147, label %148, label %149

; <label>:148                                     ; preds = %140
  store i32 15, i32* %1
  br label %5348

; <label>:149                                     ; preds = %140
  %150 = load %struct.re_pattern_buffer** %5, align 8
  %151 = getelementptr inbounds %struct.re_pattern_buffer* %150, i32 0, i32 1
  %152 = load i64* %151, align 8
  %153 = shl i64 %152, 1
  store i64 %153, i64* %151, align 8
  %154 = load %struct.re_pattern_buffer** %5, align 8
  %155 = getelementptr inbounds %struct.re_pattern_buffer* %154, i32 0, i32 1
  %156 = load i64* %155, align 8
  %157 = icmp ugt i64 %156, 65536
  br i1 %157, label %158, label %161

; <label>:158                                     ; preds = %149
  %159 = load %struct.re_pattern_buffer** %5, align 8
  %160 = getelementptr inbounds %struct.re_pattern_buffer* %159, i32 0, i32 1
  store i64 65536, i64* %160, align 8
  br label %161

; <label>:161                                     ; preds = %158, %149
  %162 = load %struct.re_pattern_buffer** %5, align 8
  %163 = getelementptr inbounds %struct.re_pattern_buffer* %162, i32 0, i32 0
  %164 = load i8** %163, align 8
  %165 = load %struct.re_pattern_buffer** %5, align 8
  %166 = getelementptr inbounds %struct.re_pattern_buffer* %165, i32 0, i32 1
  %167 = load i64* %166, align 8
  %168 = call noalias i8* @realloc(i8* %164, i64 %167) nounwind
  %169 = load %struct.re_pattern_buffer** %5, align 8
  %170 = getelementptr inbounds %struct.re_pattern_buffer* %169, i32 0, i32 0
  store i8* %168, i8** %170, align 8
  %171 = load %struct.re_pattern_buffer** %5, align 8
  %172 = getelementptr inbounds %struct.re_pattern_buffer* %171, i32 0, i32 0
  %173 = load i8** %172, align 8
  %174 = icmp eq i8* %173, null
  br i1 %174, label %175, label %176

; <label>:175                                     ; preds = %161
  store i32 12, i32* %1
  br label %5348

; <label>:176                                     ; preds = %161
  %177 = load i8** %old_buffer, align 8
  %178 = load %struct.re_pattern_buffer** %5, align 8
  %179 = getelementptr inbounds %struct.re_pattern_buffer* %178, i32 0, i32 0
  %180 = load i8** %179, align 8
  %181 = icmp ne i8* %177, %180
  br i1 %181, label %182, label %240

; <label>:182                                     ; preds = %176
  %183 = load i8** %b, align 8
  %184 = load i8** %old_buffer, align 8
  %185 = ptrtoint i8* %183 to i64
  %186 = ptrtoint i8* %184 to i64
  %187 = sub i64 %185, %186
  %188 = load %struct.re_pattern_buffer** %5, align 8
  %189 = getelementptr inbounds %struct.re_pattern_buffer* %188, i32 0, i32 0
  %190 = load i8** %189, align 8
  %191 = getelementptr inbounds i8* %190, i64 %187
  store i8* %191, i8** %b, align 8
  %192 = load i8** %begalt, align 8
  %193 = load i8** %old_buffer, align 8
  %194 = ptrtoint i8* %192 to i64
  %195 = ptrtoint i8* %193 to i64
  %196 = sub i64 %194, %195
  %197 = load %struct.re_pattern_buffer** %5, align 8
  %198 = getelementptr inbounds %struct.re_pattern_buffer* %197, i32 0, i32 0
  %199 = load i8** %198, align 8
  %200 = getelementptr inbounds i8* %199, i64 %196
  store i8* %200, i8** %begalt, align 8
  %201 = load i8** %fixup_alt_jump, align 8
  %202 = icmp ne i8* %201, null
  br i1 %202, label %203, label %213

; <label>:203                                     ; preds = %182
  %204 = load i8** %fixup_alt_jump, align 8
  %205 = load i8** %old_buffer, align 8
  %206 = ptrtoint i8* %204 to i64
  %207 = ptrtoint i8* %205 to i64
  %208 = sub i64 %206, %207
  %209 = load %struct.re_pattern_buffer** %5, align 8
  %210 = getelementptr inbounds %struct.re_pattern_buffer* %209, i32 0, i32 0
  %211 = load i8** %210, align 8
  %212 = getelementptr inbounds i8* %211, i64 %208
  store i8* %212, i8** %fixup_alt_jump, align 8
  br label %213

; <label>:213                                     ; preds = %203, %182
  %214 = load i8** %laststart, align 8
  %215 = icmp ne i8* %214, null
  br i1 %215, label %216, label %226

; <label>:216                                     ; preds = %213
  %217 = load i8** %laststart, align 8
  %218 = load i8** %old_buffer, align 8
  %219 = ptrtoint i8* %217 to i64
  %220 = ptrtoint i8* %218 to i64
  %221 = sub i64 %219, %220
  %222 = load %struct.re_pattern_buffer** %5, align 8
  %223 = getelementptr inbounds %struct.re_pattern_buffer* %222, i32 0, i32 0
  %224 = load i8** %223, align 8
  %225 = getelementptr inbounds i8* %224, i64 %221
  store i8* %225, i8** %laststart, align 8
  br label %226

; <label>:226                                     ; preds = %216, %213
  %227 = load i8** %pending_exact, align 8
  %228 = icmp ne i8* %227, null
  br i1 %228, label %229, label %239

; <label>:229                                     ; preds = %226
  %230 = load i8** %pending_exact, align 8
  %231 = load i8** %old_buffer, align 8
  %232 = ptrtoint i8* %230 to i64
  %233 = ptrtoint i8* %231 to i64
  %234 = sub i64 %232, %233
  %235 = load %struct.re_pattern_buffer** %5, align 8
  %236 = getelementptr inbounds %struct.re_pattern_buffer* %235, i32 0, i32 0
  %237 = load i8** %236, align 8
  %238 = getelementptr inbounds i8* %237, i64 %234
  store i8* %238, i8** %pending_exact, align 8
  br label %239

; <label>:239                                     ; preds = %229, %226
  br label %240

; <label>:240                                     ; preds = %239, %176
  br label %241

; <label>:241                                     ; preds = %240
  br label %126

; <label>:242                                     ; preds = %126
  %243 = load i8** %b, align 8
  %244 = getelementptr inbounds i8* %243, i32 1
  store i8* %244, i8** %b, align 8
  store i8 8, i8* %243, align 1
  br label %245

; <label>:245                                     ; preds = %242
  br label %247

; <label>:246                                     ; preds = %117
  br label %4981

; <label>:247                                     ; preds = %245
  br label %5318

; <label>:248                                     ; preds = %105
  %249 = load i8** %p, align 8
  %250 = load i8** %pend, align 8
  %251 = icmp eq i8* %249, %250
  br i1 %251, label %263, label %252

; <label>:252                                     ; preds = %248
  %253 = load i32* %4, align 4
  %254 = and i32 %253, 8
  %255 = icmp ne i32 %254, 0
  br i1 %255, label %263, label %256

; <label>:256                                     ; preds = %252
  %257 = load i8** %p, align 8
  %258 = load i8** %pend, align 8
  %259 = load i32* %4, align 4
  %260 = call signext i8 (...)* bitcast (i8 (i8*, i8*, i32)* @at_endline_loc_p to i8 (...)*)(i8* %257, i8* %258, i32 %259)
  %261 = sext i8 %260 to i32
  %262 = icmp ne i32 %261, 0
  br i1 %262, label %263, label %385

; <label>:263                                     ; preds = %256, %252, %248
  br label %264

; <label>:264                                     ; preds = %263
  br label %265

; <label>:265                                     ; preds = %380, %264
  %266 = load i8** %b, align 8
  %267 = load %struct.re_pattern_buffer** %5, align 8
  %268 = getelementptr inbounds %struct.re_pattern_buffer* %267, i32 0, i32 0
  %269 = load i8** %268, align 8
  %270 = ptrtoint i8* %266 to i64
  %271 = ptrtoint i8* %269 to i64
  %272 = sub i64 %270, %271
  %273 = add nsw i64 %272, 1
  %274 = load %struct.re_pattern_buffer** %5, align 8
  %275 = getelementptr inbounds %struct.re_pattern_buffer* %274, i32 0, i32 1
  %276 = load i64* %275, align 8
  %277 = icmp ugt i64 %273, %276
  br i1 %277, label %278, label %381

; <label>:278                                     ; preds = %265
  br label %279

; <label>:279                                     ; preds = %278
  %280 = load %struct.re_pattern_buffer** %5, align 8
  %281 = getelementptr inbounds %struct.re_pattern_buffer* %280, i32 0, i32 0
  %282 = load i8** %281, align 8
  store i8* %282, i8** %old_buffer1, align 8
  %283 = load %struct.re_pattern_buffer** %5, align 8
  %284 = getelementptr inbounds %struct.re_pattern_buffer* %283, i32 0, i32 1
  %285 = load i64* %284, align 8
  %286 = icmp eq i64 %285, 65536
  br i1 %286, label %287, label %288

; <label>:287                                     ; preds = %279
  store i32 15, i32* %1
  br label %5348

; <label>:288                                     ; preds = %279
  %289 = load %struct.re_pattern_buffer** %5, align 8
  %290 = getelementptr inbounds %struct.re_pattern_buffer* %289, i32 0, i32 1
  %291 = load i64* %290, align 8
  %292 = shl i64 %291, 1
  store i64 %292, i64* %290, align 8
  %293 = load %struct.re_pattern_buffer** %5, align 8
  %294 = getelementptr inbounds %struct.re_pattern_buffer* %293, i32 0, i32 1
  %295 = load i64* %294, align 8
  %296 = icmp ugt i64 %295, 65536
  br i1 %296, label %297, label %300

; <label>:297                                     ; preds = %288
  %298 = load %struct.re_pattern_buffer** %5, align 8
  %299 = getelementptr inbounds %struct.re_pattern_buffer* %298, i32 0, i32 1
  store i64 65536, i64* %299, align 8
  br label %300

; <label>:300                                     ; preds = %297, %288
  %301 = load %struct.re_pattern_buffer** %5, align 8
  %302 = getelementptr inbounds %struct.re_pattern_buffer* %301, i32 0, i32 0
  %303 = load i8** %302, align 8
  %304 = load %struct.re_pattern_buffer** %5, align 8
  %305 = getelementptr inbounds %struct.re_pattern_buffer* %304, i32 0, i32 1
  %306 = load i64* %305, align 8
  %307 = call noalias i8* @realloc(i8* %303, i64 %306) nounwind
  %308 = load %struct.re_pattern_buffer** %5, align 8
  %309 = getelementptr inbounds %struct.re_pattern_buffer* %308, i32 0, i32 0
  store i8* %307, i8** %309, align 8
  %310 = load %struct.re_pattern_buffer** %5, align 8
  %311 = getelementptr inbounds %struct.re_pattern_buffer* %310, i32 0, i32 0
  %312 = load i8** %311, align 8
  %313 = icmp eq i8* %312, null
  br i1 %313, label %314, label %315

; <label>:314                                     ; preds = %300
  store i32 12, i32* %1
  br label %5348

; <label>:315                                     ; preds = %300
  %316 = load i8** %old_buffer1, align 8
  %317 = load %struct.re_pattern_buffer** %5, align 8
  %318 = getelementptr inbounds %struct.re_pattern_buffer* %317, i32 0, i32 0
  %319 = load i8** %318, align 8
  %320 = icmp ne i8* %316, %319
  br i1 %320, label %321, label %379

; <label>:321                                     ; preds = %315
  %322 = load i8** %b, align 8
  %323 = load i8** %old_buffer1, align 8
  %324 = ptrtoint i8* %322 to i64
  %325 = ptrtoint i8* %323 to i64
  %326 = sub i64 %324, %325
  %327 = load %struct.re_pattern_buffer** %5, align 8
  %328 = getelementptr inbounds %struct.re_pattern_buffer* %327, i32 0, i32 0
  %329 = load i8** %328, align 8
  %330 = getelementptr inbounds i8* %329, i64 %326
  store i8* %330, i8** %b, align 8
  %331 = load i8** %begalt, align 8
  %332 = load i8** %old_buffer1, align 8
  %333 = ptrtoint i8* %331 to i64
  %334 = ptrtoint i8* %332 to i64
  %335 = sub i64 %333, %334
  %336 = load %struct.re_pattern_buffer** %5, align 8
  %337 = getelementptr inbounds %struct.re_pattern_buffer* %336, i32 0, i32 0
  %338 = load i8** %337, align 8
  %339 = getelementptr inbounds i8* %338, i64 %335
  store i8* %339, i8** %begalt, align 8
  %340 = load i8** %fixup_alt_jump, align 8
  %341 = icmp ne i8* %340, null
  br i1 %341, label %342, label %352

; <label>:342                                     ; preds = %321
  %343 = load i8** %fixup_alt_jump, align 8
  %344 = load i8** %old_buffer1, align 8
  %345 = ptrtoint i8* %343 to i64
  %346 = ptrtoint i8* %344 to i64
  %347 = sub i64 %345, %346
  %348 = load %struct.re_pattern_buffer** %5, align 8
  %349 = getelementptr inbounds %struct.re_pattern_buffer* %348, i32 0, i32 0
  %350 = load i8** %349, align 8
  %351 = getelementptr inbounds i8* %350, i64 %347
  store i8* %351, i8** %fixup_alt_jump, align 8
  br label %352

; <label>:352                                     ; preds = %342, %321
  %353 = load i8** %laststart, align 8
  %354 = icmp ne i8* %353, null
  br i1 %354, label %355, label %365

; <label>:355                                     ; preds = %352
  %356 = load i8** %laststart, align 8
  %357 = load i8** %old_buffer1, align 8
  %358 = ptrtoint i8* %356 to i64
  %359 = ptrtoint i8* %357 to i64
  %360 = sub i64 %358, %359
  %361 = load %struct.re_pattern_buffer** %5, align 8
  %362 = getelementptr inbounds %struct.re_pattern_buffer* %361, i32 0, i32 0
  %363 = load i8** %362, align 8
  %364 = getelementptr inbounds i8* %363, i64 %360
  store i8* %364, i8** %laststart, align 8
  br label %365

; <label>:365                                     ; preds = %355, %352
  %366 = load i8** %pending_exact, align 8
  %367 = icmp ne i8* %366, null
  br i1 %367, label %368, label %378

; <label>:368                                     ; preds = %365
  %369 = load i8** %pending_exact, align 8
  %370 = load i8** %old_buffer1, align 8
  %371 = ptrtoint i8* %369 to i64
  %372 = ptrtoint i8* %370 to i64
  %373 = sub i64 %371, %372
  %374 = load %struct.re_pattern_buffer** %5, align 8
  %375 = getelementptr inbounds %struct.re_pattern_buffer* %374, i32 0, i32 0
  %376 = load i8** %375, align 8
  %377 = getelementptr inbounds i8* %376, i64 %373
  store i8* %377, i8** %pending_exact, align 8
  br label %378

; <label>:378                                     ; preds = %368, %365
  br label %379

; <label>:379                                     ; preds = %378, %315
  br label %380

; <label>:380                                     ; preds = %379
  br label %265

; <label>:381                                     ; preds = %265
  %382 = load i8** %b, align 8
  %383 = getelementptr inbounds i8* %382, i32 1
  store i8* %383, i8** %b, align 8
  store i8 9, i8* %382, align 1
  br label %384

; <label>:384                                     ; preds = %381
  br label %386

; <label>:385                                     ; preds = %256
  br label %4981

; <label>:386                                     ; preds = %384
  br label %5318

; <label>:387                                     ; preds = %105, %105
  %388 = load i32* %4, align 4
  %389 = and i32 %388, 2
  %390 = icmp ne i32 %389, 0
  br i1 %390, label %395, label %391

; <label>:391                                     ; preds = %387
  %392 = load i32* %4, align 4
  %393 = and i32 %392, 1024
  %394 = icmp ne i32 %393, 0
  br i1 %394, label %395, label %396

; <label>:395                                     ; preds = %391, %387
  br label %4981

; <label>:396                                     ; preds = %391
  br label %397

; <label>:397                                     ; preds = %4960, %396
  br label %398

; <label>:398                                     ; preds = %397, %105
  %399 = load i8** %laststart, align 8
  %400 = icmp ne i8* %399, null
  br i1 %400, label %413, label %401

; <label>:401                                     ; preds = %398
  %402 = load i32* %4, align 4
  %403 = and i32 %402, 32
  %404 = icmp ne i32 %403, 0
  br i1 %404, label %405, label %406

; <label>:405                                     ; preds = %401
  store i32 13, i32* %1
  br label %5348

; <label>:406                                     ; preds = %401
  %407 = load i32* %4, align 4
  %408 = and i32 %407, 16
  %409 = icmp ne i32 %408, 0
  br i1 %409, label %411, label %410

; <label>:410                                     ; preds = %406
  br label %4981

; <label>:411                                     ; preds = %406
  br label %412

; <label>:412                                     ; preds = %411
  br label %413

; <label>:413                                     ; preds = %412, %398
  store i8 0, i8* %keep_string_p, align 1
  store i8 0, i8* %zero_times_ok, align 1
  store i8 0, i8* %many_times_ok, align 1
  br label %414

; <label>:414                                     ; preds = %522, %413
  %415 = load i8* %c, align 1
  %416 = zext i8 %415 to i32
  %417 = icmp ne i32 %416, 43
  %418 = zext i1 %417 to i32
  %419 = load i8* %zero_times_ok, align 1
  %420 = sext i8 %419 to i32
  %421 = or i32 %420, %418
  %422 = trunc i32 %421 to i8
  store i8 %422, i8* %zero_times_ok, align 1
  %423 = load i8* %c, align 1
  %424 = zext i8 %423 to i32
  %425 = icmp ne i32 %424, 63
  %426 = zext i1 %425 to i32
  %427 = load i8* %many_times_ok, align 1
  %428 = sext i8 %427 to i32
  %429 = or i32 %428, %426
  %430 = trunc i32 %429 to i8
  store i8 %430, i8* %many_times_ok, align 1
  %431 = load i8** %p, align 8
  %432 = load i8** %pend, align 8
  %433 = icmp eq i8* %431, %432
  br i1 %433, label %434, label %435

; <label>:434                                     ; preds = %414
  br label %523

; <label>:435                                     ; preds = %414
  br label %436

; <label>:436                                     ; preds = %435
  %437 = load i8** %p, align 8
  %438 = load i8** %pend, align 8
  %439 = icmp eq i8* %437, %438
  br i1 %439, label %440, label %441

; <label>:440                                     ; preds = %436
  store i32 14, i32* %1
  br label %5348

; <label>:441                                     ; preds = %436
  %442 = load i8** %p, align 8
  %443 = getelementptr inbounds i8* %442, i32 1
  store i8* %443, i8** %p, align 8
  %444 = load i8* %442, align 1
  store i8 %444, i8* %c, align 1
  %445 = load i8** %translate, align 8
  %446 = icmp ne i8* %445, null
  br i1 %446, label %447, label %453

; <label>:447                                     ; preds = %441
  %448 = load i8* %c, align 1
  %449 = zext i8 %448 to i64
  %450 = load i8** %translate, align 8
  %451 = getelementptr inbounds i8* %450, i64 %449
  %452 = load i8* %451, align 1
  store i8 %452, i8* %c, align 1
  br label %453

; <label>:453                                     ; preds = %447, %441
  br label %454

; <label>:454                                     ; preds = %453
  %455 = load i8* %c, align 1
  %456 = zext i8 %455 to i32
  %457 = icmp eq i32 %456, 42
  br i1 %457, label %470, label %458

; <label>:458                                     ; preds = %454
  %459 = load i32* %4, align 4
  %460 = and i32 %459, 2
  %461 = icmp ne i32 %460, 0
  br i1 %461, label %471, label %462

; <label>:462                                     ; preds = %458
  %463 = load i8* %c, align 1
  %464 = zext i8 %463 to i32
  %465 = icmp eq i32 %464, 43
  br i1 %465, label %470, label %466

; <label>:466                                     ; preds = %462
  %467 = load i8* %c, align 1
  %468 = zext i8 %467 to i32
  %469 = icmp eq i32 %468, 63
  br i1 %469, label %470, label %471

; <label>:470                                     ; preds = %466, %462, %454
  br label %522

; <label>:471                                     ; preds = %466, %458
  %472 = load i32* %4, align 4
  %473 = and i32 %472, 2
  %474 = icmp ne i32 %473, 0
  br i1 %474, label %475, label %518

; <label>:475                                     ; preds = %471
  %476 = load i8* %c, align 1
  %477 = zext i8 %476 to i32
  %478 = icmp eq i32 %477, 92
  br i1 %478, label %479, label %518

; <label>:479                                     ; preds = %475
  %480 = load i8** %p, align 8
  %481 = load i8** %pend, align 8
  %482 = icmp eq i8* %480, %481
  br i1 %482, label %483, label %484

; <label>:483                                     ; preds = %479
  store i32 5, i32* %1
  br label %5348

; <label>:484                                     ; preds = %479
  br label %485

; <label>:485                                     ; preds = %484
  %486 = load i8** %p, align 8
  %487 = load i8** %pend, align 8
  %488 = icmp eq i8* %486, %487
  br i1 %488, label %489, label %490

; <label>:489                                     ; preds = %485
  store i32 14, i32* %1
  br label %5348

; <label>:490                                     ; preds = %485
  %491 = load i8** %p, align 8
  %492 = getelementptr inbounds i8* %491, i32 1
  store i8* %492, i8** %p, align 8
  %493 = load i8* %491, align 1
  store i8 %493, i8* %c1, align 1
  %494 = load i8** %translate, align 8
  %495 = icmp ne i8* %494, null
  br i1 %495, label %496, label %502

; <label>:496                                     ; preds = %490
  %497 = load i8* %c1, align 1
  %498 = zext i8 %497 to i64
  %499 = load i8** %translate, align 8
  %500 = getelementptr inbounds i8* %499, i64 %498
  %501 = load i8* %500, align 1
  store i8 %501, i8* %c1, align 1
  br label %502

; <label>:502                                     ; preds = %496, %490
  br label %503

; <label>:503                                     ; preds = %502
  %504 = load i8* %c1, align 1
  %505 = zext i8 %504 to i32
  %506 = icmp eq i32 %505, 43
  br i1 %506, label %516, label %507

; <label>:507                                     ; preds = %503
  %508 = load i8* %c1, align 1
  %509 = zext i8 %508 to i32
  %510 = icmp eq i32 %509, 63
  br i1 %510, label %516, label %511

; <label>:511                                     ; preds = %507
  %512 = load i8** %p, align 8
  %513 = getelementptr inbounds i8* %512, i32 -1
  store i8* %513, i8** %p, align 8
  %514 = load i8** %p, align 8
  %515 = getelementptr inbounds i8* %514, i32 -1
  store i8* %515, i8** %p, align 8
  br label %523

; <label>:516                                     ; preds = %507, %503
  %517 = load i8* %c1, align 1
  store i8 %517, i8* %c, align 1
  br label %521

; <label>:518                                     ; preds = %475, %471
  %519 = load i8** %p, align 8
  %520 = getelementptr inbounds i8* %519, i32 -1
  store i8* %520, i8** %p, align 8
  br label %523

; <label>:521                                     ; preds = %516
  br label %522

; <label>:522                                     ; preds = %521, %470
  br label %414

; <label>:523                                     ; preds = %518, %511, %434
  %524 = load i8** %laststart, align 8
  %525 = icmp ne i8* %524, null
  br i1 %525, label %527, label %526

; <label>:526                                     ; preds = %523
  br label %5318

; <label>:527                                     ; preds = %523
  %528 = load i8* %many_times_ok, align 1
  %529 = icmp ne i8 %528, 0
  br i1 %529, label %530, label %737

; <label>:530                                     ; preds = %527
  br label %531

; <label>:531                                     ; preds = %646, %530
  %532 = load i8** %b, align 8
  %533 = load %struct.re_pattern_buffer** %5, align 8
  %534 = getelementptr inbounds %struct.re_pattern_buffer* %533, i32 0, i32 0
  %535 = load i8** %534, align 8
  %536 = ptrtoint i8* %532 to i64
  %537 = ptrtoint i8* %535 to i64
  %538 = sub i64 %536, %537
  %539 = add nsw i64 %538, 3
  %540 = load %struct.re_pattern_buffer** %5, align 8
  %541 = getelementptr inbounds %struct.re_pattern_buffer* %540, i32 0, i32 1
  %542 = load i64* %541, align 8
  %543 = icmp ugt i64 %539, %542
  br i1 %543, label %544, label %647

; <label>:544                                     ; preds = %531
  br label %545

; <label>:545                                     ; preds = %544
  %546 = load %struct.re_pattern_buffer** %5, align 8
  %547 = getelementptr inbounds %struct.re_pattern_buffer* %546, i32 0, i32 0
  %548 = load i8** %547, align 8
  store i8* %548, i8** %old_buffer2, align 8
  %549 = load %struct.re_pattern_buffer** %5, align 8
  %550 = getelementptr inbounds %struct.re_pattern_buffer* %549, i32 0, i32 1
  %551 = load i64* %550, align 8
  %552 = icmp eq i64 %551, 65536
  br i1 %552, label %553, label %554

; <label>:553                                     ; preds = %545
  store i32 15, i32* %1
  br label %5348

; <label>:554                                     ; preds = %545
  %555 = load %struct.re_pattern_buffer** %5, align 8
  %556 = getelementptr inbounds %struct.re_pattern_buffer* %555, i32 0, i32 1
  %557 = load i64* %556, align 8
  %558 = shl i64 %557, 1
  store i64 %558, i64* %556, align 8
  %559 = load %struct.re_pattern_buffer** %5, align 8
  %560 = getelementptr inbounds %struct.re_pattern_buffer* %559, i32 0, i32 1
  %561 = load i64* %560, align 8
  %562 = icmp ugt i64 %561, 65536
  br i1 %562, label %563, label %566

; <label>:563                                     ; preds = %554
  %564 = load %struct.re_pattern_buffer** %5, align 8
  %565 = getelementptr inbounds %struct.re_pattern_buffer* %564, i32 0, i32 1
  store i64 65536, i64* %565, align 8
  br label %566

; <label>:566                                     ; preds = %563, %554
  %567 = load %struct.re_pattern_buffer** %5, align 8
  %568 = getelementptr inbounds %struct.re_pattern_buffer* %567, i32 0, i32 0
  %569 = load i8** %568, align 8
  %570 = load %struct.re_pattern_buffer** %5, align 8
  %571 = getelementptr inbounds %struct.re_pattern_buffer* %570, i32 0, i32 1
  %572 = load i64* %571, align 8
  %573 = call noalias i8* @realloc(i8* %569, i64 %572) nounwind
  %574 = load %struct.re_pattern_buffer** %5, align 8
  %575 = getelementptr inbounds %struct.re_pattern_buffer* %574, i32 0, i32 0
  store i8* %573, i8** %575, align 8
  %576 = load %struct.re_pattern_buffer** %5, align 8
  %577 = getelementptr inbounds %struct.re_pattern_buffer* %576, i32 0, i32 0
  %578 = load i8** %577, align 8
  %579 = icmp eq i8* %578, null
  br i1 %579, label %580, label %581

; <label>:580                                     ; preds = %566
  store i32 12, i32* %1
  br label %5348

; <label>:581                                     ; preds = %566
  %582 = load i8** %old_buffer2, align 8
  %583 = load %struct.re_pattern_buffer** %5, align 8
  %584 = getelementptr inbounds %struct.re_pattern_buffer* %583, i32 0, i32 0
  %585 = load i8** %584, align 8
  %586 = icmp ne i8* %582, %585
  br i1 %586, label %587, label %645

; <label>:587                                     ; preds = %581
  %588 = load i8** %b, align 8
  %589 = load i8** %old_buffer2, align 8
  %590 = ptrtoint i8* %588 to i64
  %591 = ptrtoint i8* %589 to i64
  %592 = sub i64 %590, %591
  %593 = load %struct.re_pattern_buffer** %5, align 8
  %594 = getelementptr inbounds %struct.re_pattern_buffer* %593, i32 0, i32 0
  %595 = load i8** %594, align 8
  %596 = getelementptr inbounds i8* %595, i64 %592
  store i8* %596, i8** %b, align 8
  %597 = load i8** %begalt, align 8
  %598 = load i8** %old_buffer2, align 8
  %599 = ptrtoint i8* %597 to i64
  %600 = ptrtoint i8* %598 to i64
  %601 = sub i64 %599, %600
  %602 = load %struct.re_pattern_buffer** %5, align 8
  %603 = getelementptr inbounds %struct.re_pattern_buffer* %602, i32 0, i32 0
  %604 = load i8** %603, align 8
  %605 = getelementptr inbounds i8* %604, i64 %601
  store i8* %605, i8** %begalt, align 8
  %606 = load i8** %fixup_alt_jump, align 8
  %607 = icmp ne i8* %606, null
  br i1 %607, label %608, label %618

; <label>:608                                     ; preds = %587
  %609 = load i8** %fixup_alt_jump, align 8
  %610 = load i8** %old_buffer2, align 8
  %611 = ptrtoint i8* %609 to i64
  %612 = ptrtoint i8* %610 to i64
  %613 = sub i64 %611, %612
  %614 = load %struct.re_pattern_buffer** %5, align 8
  %615 = getelementptr inbounds %struct.re_pattern_buffer* %614, i32 0, i32 0
  %616 = load i8** %615, align 8
  %617 = getelementptr inbounds i8* %616, i64 %613
  store i8* %617, i8** %fixup_alt_jump, align 8
  br label %618

; <label>:618                                     ; preds = %608, %587
  %619 = load i8** %laststart, align 8
  %620 = icmp ne i8* %619, null
  br i1 %620, label %621, label %631

; <label>:621                                     ; preds = %618
  %622 = load i8** %laststart, align 8
  %623 = load i8** %old_buffer2, align 8
  %624 = ptrtoint i8* %622 to i64
  %625 = ptrtoint i8* %623 to i64
  %626 = sub i64 %624, %625
  %627 = load %struct.re_pattern_buffer** %5, align 8
  %628 = getelementptr inbounds %struct.re_pattern_buffer* %627, i32 0, i32 0
  %629 = load i8** %628, align 8
  %630 = getelementptr inbounds i8* %629, i64 %626
  store i8* %630, i8** %laststart, align 8
  br label %631

; <label>:631                                     ; preds = %621, %618
  %632 = load i8** %pending_exact, align 8
  %633 = icmp ne i8* %632, null
  br i1 %633, label %634, label %644

; <label>:634                                     ; preds = %631
  %635 = load i8** %pending_exact, align 8
  %636 = load i8** %old_buffer2, align 8
  %637 = ptrtoint i8* %635 to i64
  %638 = ptrtoint i8* %636 to i64
  %639 = sub i64 %637, %638
  %640 = load %struct.re_pattern_buffer** %5, align 8
  %641 = getelementptr inbounds %struct.re_pattern_buffer* %640, i32 0, i32 0
  %642 = load i8** %641, align 8
  %643 = getelementptr inbounds i8* %642, i64 %639
  store i8* %643, i8** %pending_exact, align 8
  br label %644

; <label>:644                                     ; preds = %634, %631
  br label %645

; <label>:645                                     ; preds = %644, %581
  br label %646

; <label>:646                                     ; preds = %645
  br label %531

; <label>:647                                     ; preds = %531
  %648 = load i8** %translate, align 8
  %649 = icmp ne i8* %648, null
  br i1 %649, label %650, label %659

; <label>:650                                     ; preds = %647
  %651 = load i8** %p, align 8
  %652 = getelementptr inbounds i8* %651, i64 -2
  %653 = load i8* %652, align 1
  %654 = zext i8 %653 to i64
  %655 = load i8** %translate, align 8
  %656 = getelementptr inbounds i8* %655, i64 %654
  %657 = load i8* %656, align 1
  %658 = sext i8 %657 to i32
  br label %664

; <label>:659                                     ; preds = %647
  %660 = load i8** %p, align 8
  %661 = getelementptr inbounds i8* %660, i64 -2
  %662 = load i8* %661, align 1
  %663 = sext i8 %662 to i32
  br label %664

; <label>:664                                     ; preds = %659, %650
  %665 = phi i32 [ %658, %650 ], [ %663, %659 ]
  %666 = load i8** %translate, align 8
  %667 = icmp ne i8* %666, null
  br i1 %667, label %668, label %673

; <label>:668                                     ; preds = %664
  %669 = load i8** %translate, align 8
  %670 = getelementptr inbounds i8* %669, i64 46
  %671 = load i8* %670, align 1
  %672 = sext i8 %671 to i32
  br label %674

; <label>:673                                     ; preds = %664
  br label %674

; <label>:674                                     ; preds = %673, %668
  %675 = phi i32 [ %672, %668 ], [ 46, %673 ]
  %676 = icmp eq i32 %665, %675
  br i1 %676, label %677, label %725

; <label>:677                                     ; preds = %674
  %678 = load i8* %zero_times_ok, align 1
  %679 = sext i8 %678 to i32
  %680 = icmp ne i32 %679, 0
  br i1 %680, label %681, label %725

; <label>:681                                     ; preds = %677
  %682 = load i8** %p, align 8
  %683 = load i8** %pend, align 8
  %684 = icmp ult i8* %682, %683
  br i1 %684, label %685, label %725

; <label>:685                                     ; preds = %681
  %686 = load i8** %translate, align 8
  %687 = icmp ne i8* %686, null
  br i1 %687, label %688, label %696

; <label>:688                                     ; preds = %685
  %689 = load i8** %p, align 8
  %690 = load i8* %689, align 1
  %691 = zext i8 %690 to i64
  %692 = load i8** %translate, align 8
  %693 = getelementptr inbounds i8* %692, i64 %691
  %694 = load i8* %693, align 1
  %695 = sext i8 %694 to i32
  br label %700

; <label>:696                                     ; preds = %685
  %697 = load i8** %p, align 8
  %698 = load i8* %697, align 1
  %699 = sext i8 %698 to i32
  br label %700

; <label>:700                                     ; preds = %696, %688
  %701 = phi i32 [ %695, %688 ], [ %699, %696 ]
  %702 = load i8** %translate, align 8
  %703 = icmp ne i8* %702, null
  br i1 %703, label %704, label %709

; <label>:704                                     ; preds = %700
  %705 = load i8** %translate, align 8
  %706 = getelementptr inbounds i8* %705, i64 10
  %707 = load i8* %706, align 1
  %708 = sext i8 %707 to i32
  br label %710

; <label>:709                                     ; preds = %700
  br label %710

; <label>:710                                     ; preds = %709, %704
  %711 = phi i32 [ %708, %704 ], [ 10, %709 ]
  %712 = icmp eq i32 %701, %711
  br i1 %712, label %713, label %725

; <label>:713                                     ; preds = %710
  %714 = load i32* %4, align 4
  %715 = and i32 %714, 64
  %716 = icmp ne i32 %715, 0
  br i1 %716, label %725, label %717

; <label>:717                                     ; preds = %713
  %718 = load i8** %b, align 8
  %719 = load i8** %laststart, align 8
  %720 = load i8** %b, align 8
  %721 = ptrtoint i8* %719 to i64
  %722 = ptrtoint i8* %720 to i64
  %723 = sub i64 %721, %722
  %724 = sub nsw i64 %723, 3
  call void (...)* bitcast (void (i32, i8*, i32)* @store_op1 to void (...)*)(i32 12, i8* %718, i64 %724)
  store i8 1, i8* %keep_string_p, align 1
  br label %734

; <label>:725                                     ; preds = %713, %710, %681, %677, %674
  %726 = load i8** %b, align 8
  %727 = load i8** %laststart, align 8
  %728 = getelementptr inbounds i8* %727, i64 -3
  %729 = load i8** %b, align 8
  %730 = ptrtoint i8* %728 to i64
  %731 = ptrtoint i8* %729 to i64
  %732 = sub i64 %730, %731
  %733 = sub nsw i64 %732, 3
  call void (...)* bitcast (void (i32, i8*, i32)* @store_op1 to void (...)*)(i32 17, i8* %726, i64 %733)
  br label %734

; <label>:734                                     ; preds = %725, %717
  %735 = load i8** %b, align 8
  %736 = getelementptr inbounds i8* %735, i64 3
  store i8* %736, i8** %b, align 8
  br label %737

; <label>:737                                     ; preds = %734, %527
  br label %738

; <label>:738                                     ; preds = %853, %737
  %739 = load i8** %b, align 8
  %740 = load %struct.re_pattern_buffer** %5, align 8
  %741 = getelementptr inbounds %struct.re_pattern_buffer* %740, i32 0, i32 0
  %742 = load i8** %741, align 8
  %743 = ptrtoint i8* %739 to i64
  %744 = ptrtoint i8* %742 to i64
  %745 = sub i64 %743, %744
  %746 = add nsw i64 %745, 3
  %747 = load %struct.re_pattern_buffer** %5, align 8
  %748 = getelementptr inbounds %struct.re_pattern_buffer* %747, i32 0, i32 1
  %749 = load i64* %748, align 8
  %750 = icmp ugt i64 %746, %749
  br i1 %750, label %751, label %854

; <label>:751                                     ; preds = %738
  br label %752

; <label>:752                                     ; preds = %751
  %753 = load %struct.re_pattern_buffer** %5, align 8
  %754 = getelementptr inbounds %struct.re_pattern_buffer* %753, i32 0, i32 0
  %755 = load i8** %754, align 8
  store i8* %755, i8** %old_buffer3, align 8
  %756 = load %struct.re_pattern_buffer** %5, align 8
  %757 = getelementptr inbounds %struct.re_pattern_buffer* %756, i32 0, i32 1
  %758 = load i64* %757, align 8
  %759 = icmp eq i64 %758, 65536
  br i1 %759, label %760, label %761

; <label>:760                                     ; preds = %752
  store i32 15, i32* %1
  br label %5348

; <label>:761                                     ; preds = %752
  %762 = load %struct.re_pattern_buffer** %5, align 8
  %763 = getelementptr inbounds %struct.re_pattern_buffer* %762, i32 0, i32 1
  %764 = load i64* %763, align 8
  %765 = shl i64 %764, 1
  store i64 %765, i64* %763, align 8
  %766 = load %struct.re_pattern_buffer** %5, align 8
  %767 = getelementptr inbounds %struct.re_pattern_buffer* %766, i32 0, i32 1
  %768 = load i64* %767, align 8
  %769 = icmp ugt i64 %768, 65536
  br i1 %769, label %770, label %773

; <label>:770                                     ; preds = %761
  %771 = load %struct.re_pattern_buffer** %5, align 8
  %772 = getelementptr inbounds %struct.re_pattern_buffer* %771, i32 0, i32 1
  store i64 65536, i64* %772, align 8
  br label %773

; <label>:773                                     ; preds = %770, %761
  %774 = load %struct.re_pattern_buffer** %5, align 8
  %775 = getelementptr inbounds %struct.re_pattern_buffer* %774, i32 0, i32 0
  %776 = load i8** %775, align 8
  %777 = load %struct.re_pattern_buffer** %5, align 8
  %778 = getelementptr inbounds %struct.re_pattern_buffer* %777, i32 0, i32 1
  %779 = load i64* %778, align 8
  %780 = call noalias i8* @realloc(i8* %776, i64 %779) nounwind
  %781 = load %struct.re_pattern_buffer** %5, align 8
  %782 = getelementptr inbounds %struct.re_pattern_buffer* %781, i32 0, i32 0
  store i8* %780, i8** %782, align 8
  %783 = load %struct.re_pattern_buffer** %5, align 8
  %784 = getelementptr inbounds %struct.re_pattern_buffer* %783, i32 0, i32 0
  %785 = load i8** %784, align 8
  %786 = icmp eq i8* %785, null
  br i1 %786, label %787, label %788

; <label>:787                                     ; preds = %773
  store i32 12, i32* %1
  br label %5348

; <label>:788                                     ; preds = %773
  %789 = load i8** %old_buffer3, align 8
  %790 = load %struct.re_pattern_buffer** %5, align 8
  %791 = getelementptr inbounds %struct.re_pattern_buffer* %790, i32 0, i32 0
  %792 = load i8** %791, align 8
  %793 = icmp ne i8* %789, %792
  br i1 %793, label %794, label %852

; <label>:794                                     ; preds = %788
  %795 = load i8** %b, align 8
  %796 = load i8** %old_buffer3, align 8
  %797 = ptrtoint i8* %795 to i64
  %798 = ptrtoint i8* %796 to i64
  %799 = sub i64 %797, %798
  %800 = load %struct.re_pattern_buffer** %5, align 8
  %801 = getelementptr inbounds %struct.re_pattern_buffer* %800, i32 0, i32 0
  %802 = load i8** %801, align 8
  %803 = getelementptr inbounds i8* %802, i64 %799
  store i8* %803, i8** %b, align 8
  %804 = load i8** %begalt, align 8
  %805 = load i8** %old_buffer3, align 8
  %806 = ptrtoint i8* %804 to i64
  %807 = ptrtoint i8* %805 to i64
  %808 = sub i64 %806, %807
  %809 = load %struct.re_pattern_buffer** %5, align 8
  %810 = getelementptr inbounds %struct.re_pattern_buffer* %809, i32 0, i32 0
  %811 = load i8** %810, align 8
  %812 = getelementptr inbounds i8* %811, i64 %808
  store i8* %812, i8** %begalt, align 8
  %813 = load i8** %fixup_alt_jump, align 8
  %814 = icmp ne i8* %813, null
  br i1 %814, label %815, label %825

; <label>:815                                     ; preds = %794
  %816 = load i8** %fixup_alt_jump, align 8
  %817 = load i8** %old_buffer3, align 8
  %818 = ptrtoint i8* %816 to i64
  %819 = ptrtoint i8* %817 to i64
  %820 = sub i64 %818, %819
  %821 = load %struct.re_pattern_buffer** %5, align 8
  %822 = getelementptr inbounds %struct.re_pattern_buffer* %821, i32 0, i32 0
  %823 = load i8** %822, align 8
  %824 = getelementptr inbounds i8* %823, i64 %820
  store i8* %824, i8** %fixup_alt_jump, align 8
  br label %825

; <label>:825                                     ; preds = %815, %794
  %826 = load i8** %laststart, align 8
  %827 = icmp ne i8* %826, null
  br i1 %827, label %828, label %838

; <label>:828                                     ; preds = %825
  %829 = load i8** %laststart, align 8
  %830 = load i8** %old_buffer3, align 8
  %831 = ptrtoint i8* %829 to i64
  %832 = ptrtoint i8* %830 to i64
  %833 = sub i64 %831, %832
  %834 = load %struct.re_pattern_buffer** %5, align 8
  %835 = getelementptr inbounds %struct.re_pattern_buffer* %834, i32 0, i32 0
  %836 = load i8** %835, align 8
  %837 = getelementptr inbounds i8* %836, i64 %833
  store i8* %837, i8** %laststart, align 8
  br label %838

; <label>:838                                     ; preds = %828, %825
  %839 = load i8** %pending_exact, align 8
  %840 = icmp ne i8* %839, null
  br i1 %840, label %841, label %851

; <label>:841                                     ; preds = %838
  %842 = load i8** %pending_exact, align 8
  %843 = load i8** %old_buffer3, align 8
  %844 = ptrtoint i8* %842 to i64
  %845 = ptrtoint i8* %843 to i64
  %846 = sub i64 %844, %845
  %847 = load %struct.re_pattern_buffer** %5, align 8
  %848 = getelementptr inbounds %struct.re_pattern_buffer* %847, i32 0, i32 0
  %849 = load i8** %848, align 8
  %850 = getelementptr inbounds i8* %849, i64 %846
  store i8* %850, i8** %pending_exact, align 8
  br label %851

; <label>:851                                     ; preds = %841, %838
  br label %852

; <label>:852                                     ; preds = %851, %788
  br label %853

; <label>:853                                     ; preds = %852
  br label %738

; <label>:854                                     ; preds = %738
  %855 = load i8* %keep_string_p, align 1
  %856 = sext i8 %855 to i32
  %857 = icmp ne i32 %856, 0
  %858 = select i1 %857, i32 15, i32 14
  %859 = load i8** %laststart, align 8
  %860 = load i8** %b, align 8
  %861 = getelementptr inbounds i8* %860, i64 3
  %862 = load i8** %laststart, align 8
  %863 = ptrtoint i8* %861 to i64
  %864 = ptrtoint i8* %862 to i64
  %865 = sub i64 %863, %864
  %866 = sub nsw i64 %865, 3
  %867 = load i8** %b, align 8
  call void (...)* bitcast (void (i32, i8*, i32, i8*)* @insert_op1 to void (...)*)(i32 %858, i8* %859, i64 %866, i8* %867)
  store i8* null, i8** %pending_exact, align 8
  %868 = load i8** %b, align 8
  %869 = getelementptr inbounds i8* %868, i64 3
  store i8* %869, i8** %b, align 8
  %870 = load i8* %zero_times_ok, align 1
  %871 = icmp ne i8 %870, 0
  br i1 %871, label %1001, label %872

; <label>:872                                     ; preds = %854
  br label %873

; <label>:873                                     ; preds = %988, %872
  %874 = load i8** %b, align 8
  %875 = load %struct.re_pattern_buffer** %5, align 8
  %876 = getelementptr inbounds %struct.re_pattern_buffer* %875, i32 0, i32 0
  %877 = load i8** %876, align 8
  %878 = ptrtoint i8* %874 to i64
  %879 = ptrtoint i8* %877 to i64
  %880 = sub i64 %878, %879
  %881 = add nsw i64 %880, 3
  %882 = load %struct.re_pattern_buffer** %5, align 8
  %883 = getelementptr inbounds %struct.re_pattern_buffer* %882, i32 0, i32 1
  %884 = load i64* %883, align 8
  %885 = icmp ugt i64 %881, %884
  br i1 %885, label %886, label %989

; <label>:886                                     ; preds = %873
  br label %887

; <label>:887                                     ; preds = %886
  %888 = load %struct.re_pattern_buffer** %5, align 8
  %889 = getelementptr inbounds %struct.re_pattern_buffer* %888, i32 0, i32 0
  %890 = load i8** %889, align 8
  store i8* %890, i8** %old_buffer4, align 8
  %891 = load %struct.re_pattern_buffer** %5, align 8
  %892 = getelementptr inbounds %struct.re_pattern_buffer* %891, i32 0, i32 1
  %893 = load i64* %892, align 8
  %894 = icmp eq i64 %893, 65536
  br i1 %894, label %895, label %896

; <label>:895                                     ; preds = %887
  store i32 15, i32* %1
  br label %5348

; <label>:896                                     ; preds = %887
  %897 = load %struct.re_pattern_buffer** %5, align 8
  %898 = getelementptr inbounds %struct.re_pattern_buffer* %897, i32 0, i32 1
  %899 = load i64* %898, align 8
  %900 = shl i64 %899, 1
  store i64 %900, i64* %898, align 8
  %901 = load %struct.re_pattern_buffer** %5, align 8
  %902 = getelementptr inbounds %struct.re_pattern_buffer* %901, i32 0, i32 1
  %903 = load i64* %902, align 8
  %904 = icmp ugt i64 %903, 65536
  br i1 %904, label %905, label %908

; <label>:905                                     ; preds = %896
  %906 = load %struct.re_pattern_buffer** %5, align 8
  %907 = getelementptr inbounds %struct.re_pattern_buffer* %906, i32 0, i32 1
  store i64 65536, i64* %907, align 8
  br label %908

; <label>:908                                     ; preds = %905, %896
  %909 = load %struct.re_pattern_buffer** %5, align 8
  %910 = getelementptr inbounds %struct.re_pattern_buffer* %909, i32 0, i32 0
  %911 = load i8** %910, align 8
  %912 = load %struct.re_pattern_buffer** %5, align 8
  %913 = getelementptr inbounds %struct.re_pattern_buffer* %912, i32 0, i32 1
  %914 = load i64* %913, align 8
  %915 = call noalias i8* @realloc(i8* %911, i64 %914) nounwind
  %916 = load %struct.re_pattern_buffer** %5, align 8
  %917 = getelementptr inbounds %struct.re_pattern_buffer* %916, i32 0, i32 0
  store i8* %915, i8** %917, align 8
  %918 = load %struct.re_pattern_buffer** %5, align 8
  %919 = getelementptr inbounds %struct.re_pattern_buffer* %918, i32 0, i32 0
  %920 = load i8** %919, align 8
  %921 = icmp eq i8* %920, null
  br i1 %921, label %922, label %923

; <label>:922                                     ; preds = %908
  store i32 12, i32* %1
  br label %5348

; <label>:923                                     ; preds = %908
  %924 = load i8** %old_buffer4, align 8
  %925 = load %struct.re_pattern_buffer** %5, align 8
  %926 = getelementptr inbounds %struct.re_pattern_buffer* %925, i32 0, i32 0
  %927 = load i8** %926, align 8
  %928 = icmp ne i8* %924, %927
  br i1 %928, label %929, label %987

; <label>:929                                     ; preds = %923
  %930 = load i8** %b, align 8
  %931 = load i8** %old_buffer4, align 8
  %932 = ptrtoint i8* %930 to i64
  %933 = ptrtoint i8* %931 to i64
  %934 = sub i64 %932, %933
  %935 = load %struct.re_pattern_buffer** %5, align 8
  %936 = getelementptr inbounds %struct.re_pattern_buffer* %935, i32 0, i32 0
  %937 = load i8** %936, align 8
  %938 = getelementptr inbounds i8* %937, i64 %934
  store i8* %938, i8** %b, align 8
  %939 = load i8** %begalt, align 8
  %940 = load i8** %old_buffer4, align 8
  %941 = ptrtoint i8* %939 to i64
  %942 = ptrtoint i8* %940 to i64
  %943 = sub i64 %941, %942
  %944 = load %struct.re_pattern_buffer** %5, align 8
  %945 = getelementptr inbounds %struct.re_pattern_buffer* %944, i32 0, i32 0
  %946 = load i8** %945, align 8
  %947 = getelementptr inbounds i8* %946, i64 %943
  store i8* %947, i8** %begalt, align 8
  %948 = load i8** %fixup_alt_jump, align 8
  %949 = icmp ne i8* %948, null
  br i1 %949, label %950, label %960

; <label>:950                                     ; preds = %929
  %951 = load i8** %fixup_alt_jump, align 8
  %952 = load i8** %old_buffer4, align 8
  %953 = ptrtoint i8* %951 to i64
  %954 = ptrtoint i8* %952 to i64
  %955 = sub i64 %953, %954
  %956 = load %struct.re_pattern_buffer** %5, align 8
  %957 = getelementptr inbounds %struct.re_pattern_buffer* %956, i32 0, i32 0
  %958 = load i8** %957, align 8
  %959 = getelementptr inbounds i8* %958, i64 %955
  store i8* %959, i8** %fixup_alt_jump, align 8
  br label %960

; <label>:960                                     ; preds = %950, %929
  %961 = load i8** %laststart, align 8
  %962 = icmp ne i8* %961, null
  br i1 %962, label %963, label %973

; <label>:963                                     ; preds = %960
  %964 = load i8** %laststart, align 8
  %965 = load i8** %old_buffer4, align 8
  %966 = ptrtoint i8* %964 to i64
  %967 = ptrtoint i8* %965 to i64
  %968 = sub i64 %966, %967
  %969 = load %struct.re_pattern_buffer** %5, align 8
  %970 = getelementptr inbounds %struct.re_pattern_buffer* %969, i32 0, i32 0
  %971 = load i8** %970, align 8
  %972 = getelementptr inbounds i8* %971, i64 %968
  store i8* %972, i8** %laststart, align 8
  br label %973

; <label>:973                                     ; preds = %963, %960
  %974 = load i8** %pending_exact, align 8
  %975 = icmp ne i8* %974, null
  br i1 %975, label %976, label %986

; <label>:976                                     ; preds = %973
  %977 = load i8** %pending_exact, align 8
  %978 = load i8** %old_buffer4, align 8
  %979 = ptrtoint i8* %977 to i64
  %980 = ptrtoint i8* %978 to i64
  %981 = sub i64 %979, %980
  %982 = load %struct.re_pattern_buffer** %5, align 8
  %983 = getelementptr inbounds %struct.re_pattern_buffer* %982, i32 0, i32 0
  %984 = load i8** %983, align 8
  %985 = getelementptr inbounds i8* %984, i64 %981
  store i8* %985, i8** %pending_exact, align 8
  br label %986

; <label>:986                                     ; preds = %976, %973
  br label %987

; <label>:987                                     ; preds = %986, %923
  br label %988

; <label>:988                                     ; preds = %987
  br label %873

; <label>:989                                     ; preds = %873
  %990 = load i8** %laststart, align 8
  %991 = load i8** %laststart, align 8
  %992 = getelementptr inbounds i8* %991, i64 6
  %993 = load i8** %laststart, align 8
  %994 = ptrtoint i8* %992 to i64
  %995 = ptrtoint i8* %993 to i64
  %996 = sub i64 %994, %995
  %997 = sub nsw i64 %996, 3
  %998 = load i8** %b, align 8
  call void (...)* bitcast (void (i32, i8*, i32, i8*)* @insert_op1 to void (...)*)(i32 18, i8* %990, i64 %997, i8* %998)
  %999 = load i8** %b, align 8
  %1000 = getelementptr inbounds i8* %999, i64 3
  store i8* %1000, i8** %b, align 8
  br label %1001

; <label>:1001                                    ; preds = %989, %854
  br label %5318

; <label>:1002                                    ; preds = %105
  %1003 = load i8** %b, align 8
  store i8* %1003, i8** %laststart, align 8
  br label %1004

; <label>:1004                                    ; preds = %1002
  br label %1005

; <label>:1005                                    ; preds = %1120, %1004
  %1006 = load i8** %b, align 8
  %1007 = load %struct.re_pattern_buffer** %5, align 8
  %1008 = getelementptr inbounds %struct.re_pattern_buffer* %1007, i32 0, i32 0
  %1009 = load i8** %1008, align 8
  %1010 = ptrtoint i8* %1006 to i64
  %1011 = ptrtoint i8* %1009 to i64
  %1012 = sub i64 %1010, %1011
  %1013 = add nsw i64 %1012, 1
  %1014 = load %struct.re_pattern_buffer** %5, align 8
  %1015 = getelementptr inbounds %struct.re_pattern_buffer* %1014, i32 0, i32 1
  %1016 = load i64* %1015, align 8
  %1017 = icmp ugt i64 %1013, %1016
  br i1 %1017, label %1018, label %1121

; <label>:1018                                    ; preds = %1005
  br label %1019

; <label>:1019                                    ; preds = %1018
  %1020 = load %struct.re_pattern_buffer** %5, align 8
  %1021 = getelementptr inbounds %struct.re_pattern_buffer* %1020, i32 0, i32 0
  %1022 = load i8** %1021, align 8
  store i8* %1022, i8** %old_buffer5, align 8
  %1023 = load %struct.re_pattern_buffer** %5, align 8
  %1024 = getelementptr inbounds %struct.re_pattern_buffer* %1023, i32 0, i32 1
  %1025 = load i64* %1024, align 8
  %1026 = icmp eq i64 %1025, 65536
  br i1 %1026, label %1027, label %1028

; <label>:1027                                    ; preds = %1019
  store i32 15, i32* %1
  br label %5348

; <label>:1028                                    ; preds = %1019
  %1029 = load %struct.re_pattern_buffer** %5, align 8
  %1030 = getelementptr inbounds %struct.re_pattern_buffer* %1029, i32 0, i32 1
  %1031 = load i64* %1030, align 8
  %1032 = shl i64 %1031, 1
  store i64 %1032, i64* %1030, align 8
  %1033 = load %struct.re_pattern_buffer** %5, align 8
  %1034 = getelementptr inbounds %struct.re_pattern_buffer* %1033, i32 0, i32 1
  %1035 = load i64* %1034, align 8
  %1036 = icmp ugt i64 %1035, 65536
  br i1 %1036, label %1037, label %1040

; <label>:1037                                    ; preds = %1028
  %1038 = load %struct.re_pattern_buffer** %5, align 8
  %1039 = getelementptr inbounds %struct.re_pattern_buffer* %1038, i32 0, i32 1
  store i64 65536, i64* %1039, align 8
  br label %1040

; <label>:1040                                    ; preds = %1037, %1028
  %1041 = load %struct.re_pattern_buffer** %5, align 8
  %1042 = getelementptr inbounds %struct.re_pattern_buffer* %1041, i32 0, i32 0
  %1043 = load i8** %1042, align 8
  %1044 = load %struct.re_pattern_buffer** %5, align 8
  %1045 = getelementptr inbounds %struct.re_pattern_buffer* %1044, i32 0, i32 1
  %1046 = load i64* %1045, align 8
  %1047 = call noalias i8* @realloc(i8* %1043, i64 %1046) nounwind
  %1048 = load %struct.re_pattern_buffer** %5, align 8
  %1049 = getelementptr inbounds %struct.re_pattern_buffer* %1048, i32 0, i32 0
  store i8* %1047, i8** %1049, align 8
  %1050 = load %struct.re_pattern_buffer** %5, align 8
  %1051 = getelementptr inbounds %struct.re_pattern_buffer* %1050, i32 0, i32 0
  %1052 = load i8** %1051, align 8
  %1053 = icmp eq i8* %1052, null
  br i1 %1053, label %1054, label %1055

; <label>:1054                                    ; preds = %1040
  store i32 12, i32* %1
  br label %5348

; <label>:1055                                    ; preds = %1040
  %1056 = load i8** %old_buffer5, align 8
  %1057 = load %struct.re_pattern_buffer** %5, align 8
  %1058 = getelementptr inbounds %struct.re_pattern_buffer* %1057, i32 0, i32 0
  %1059 = load i8** %1058, align 8
  %1060 = icmp ne i8* %1056, %1059
  br i1 %1060, label %1061, label %1119

; <label>:1061                                    ; preds = %1055
  %1062 = load i8** %b, align 8
  %1063 = load i8** %old_buffer5, align 8
  %1064 = ptrtoint i8* %1062 to i64
  %1065 = ptrtoint i8* %1063 to i64
  %1066 = sub i64 %1064, %1065
  %1067 = load %struct.re_pattern_buffer** %5, align 8
  %1068 = getelementptr inbounds %struct.re_pattern_buffer* %1067, i32 0, i32 0
  %1069 = load i8** %1068, align 8
  %1070 = getelementptr inbounds i8* %1069, i64 %1066
  store i8* %1070, i8** %b, align 8
  %1071 = load i8** %begalt, align 8
  %1072 = load i8** %old_buffer5, align 8
  %1073 = ptrtoint i8* %1071 to i64
  %1074 = ptrtoint i8* %1072 to i64
  %1075 = sub i64 %1073, %1074
  %1076 = load %struct.re_pattern_buffer** %5, align 8
  %1077 = getelementptr inbounds %struct.re_pattern_buffer* %1076, i32 0, i32 0
  %1078 = load i8** %1077, align 8
  %1079 = getelementptr inbounds i8* %1078, i64 %1075
  store i8* %1079, i8** %begalt, align 8
  %1080 = load i8** %fixup_alt_jump, align 8
  %1081 = icmp ne i8* %1080, null
  br i1 %1081, label %1082, label %1092

; <label>:1082                                    ; preds = %1061
  %1083 = load i8** %fixup_alt_jump, align 8
  %1084 = load i8** %old_buffer5, align 8
  %1085 = ptrtoint i8* %1083 to i64
  %1086 = ptrtoint i8* %1084 to i64
  %1087 = sub i64 %1085, %1086
  %1088 = load %struct.re_pattern_buffer** %5, align 8
  %1089 = getelementptr inbounds %struct.re_pattern_buffer* %1088, i32 0, i32 0
  %1090 = load i8** %1089, align 8
  %1091 = getelementptr inbounds i8* %1090, i64 %1087
  store i8* %1091, i8** %fixup_alt_jump, align 8
  br label %1092

; <label>:1092                                    ; preds = %1082, %1061
  %1093 = load i8** %laststart, align 8
  %1094 = icmp ne i8* %1093, null
  br i1 %1094, label %1095, label %1105

; <label>:1095                                    ; preds = %1092
  %1096 = load i8** %laststart, align 8
  %1097 = load i8** %old_buffer5, align 8
  %1098 = ptrtoint i8* %1096 to i64
  %1099 = ptrtoint i8* %1097 to i64
  %1100 = sub i64 %1098, %1099
  %1101 = load %struct.re_pattern_buffer** %5, align 8
  %1102 = getelementptr inbounds %struct.re_pattern_buffer* %1101, i32 0, i32 0
  %1103 = load i8** %1102, align 8
  %1104 = getelementptr inbounds i8* %1103, i64 %1100
  store i8* %1104, i8** %laststart, align 8
  br label %1105

; <label>:1105                                    ; preds = %1095, %1092
  %1106 = load i8** %pending_exact, align 8
  %1107 = icmp ne i8* %1106, null
  br i1 %1107, label %1108, label %1118

; <label>:1108                                    ; preds = %1105
  %1109 = load i8** %pending_exact, align 8
  %1110 = load i8** %old_buffer5, align 8
  %1111 = ptrtoint i8* %1109 to i64
  %1112 = ptrtoint i8* %1110 to i64
  %1113 = sub i64 %1111, %1112
  %1114 = load %struct.re_pattern_buffer** %5, align 8
  %1115 = getelementptr inbounds %struct.re_pattern_buffer* %1114, i32 0, i32 0
  %1116 = load i8** %1115, align 8
  %1117 = getelementptr inbounds i8* %1116, i64 %1113
  store i8* %1117, i8** %pending_exact, align 8
  br label %1118

; <label>:1118                                    ; preds = %1108, %1105
  br label %1119

; <label>:1119                                    ; preds = %1118, %1055
  br label %1120

; <label>:1120                                    ; preds = %1119
  br label %1005

; <label>:1121                                    ; preds = %1005
  %1122 = load i8** %b, align 8
  %1123 = getelementptr inbounds i8* %1122, i32 1
  store i8* %1123, i8** %b, align 8
  store i8 2, i8* %1122, align 1
  br label %1124

; <label>:1124                                    ; preds = %1121
  br label %5318

; <label>:1125                                    ; preds = %105
  store i8 0, i8* %had_char_class, align 1
  %1126 = load i8** %p, align 8
  %1127 = load i8** %pend, align 8
  %1128 = icmp eq i8* %1126, %1127
  br i1 %1128, label %1129, label %1130

; <label>:1129                                    ; preds = %1125
  store i32 7, i32* %1
  br label %5348

; <label>:1130                                    ; preds = %1125
  br label %1131

; <label>:1131                                    ; preds = %1246, %1130
  %1132 = load i8** %b, align 8
  %1133 = load %struct.re_pattern_buffer** %5, align 8
  %1134 = getelementptr inbounds %struct.re_pattern_buffer* %1133, i32 0, i32 0
  %1135 = load i8** %1134, align 8
  %1136 = ptrtoint i8* %1132 to i64
  %1137 = ptrtoint i8* %1135 to i64
  %1138 = sub i64 %1136, %1137
  %1139 = add nsw i64 %1138, 34
  %1140 = load %struct.re_pattern_buffer** %5, align 8
  %1141 = getelementptr inbounds %struct.re_pattern_buffer* %1140, i32 0, i32 1
  %1142 = load i64* %1141, align 8
  %1143 = icmp ugt i64 %1139, %1142
  br i1 %1143, label %1144, label %1247

; <label>:1144                                    ; preds = %1131
  br label %1145

; <label>:1145                                    ; preds = %1144
  %1146 = load %struct.re_pattern_buffer** %5, align 8
  %1147 = getelementptr inbounds %struct.re_pattern_buffer* %1146, i32 0, i32 0
  %1148 = load i8** %1147, align 8
  store i8* %1148, i8** %old_buffer6, align 8
  %1149 = load %struct.re_pattern_buffer** %5, align 8
  %1150 = getelementptr inbounds %struct.re_pattern_buffer* %1149, i32 0, i32 1
  %1151 = load i64* %1150, align 8
  %1152 = icmp eq i64 %1151, 65536
  br i1 %1152, label %1153, label %1154

; <label>:1153                                    ; preds = %1145
  store i32 15, i32* %1
  br label %5348

; <label>:1154                                    ; preds = %1145
  %1155 = load %struct.re_pattern_buffer** %5, align 8
  %1156 = getelementptr inbounds %struct.re_pattern_buffer* %1155, i32 0, i32 1
  %1157 = load i64* %1156, align 8
  %1158 = shl i64 %1157, 1
  store i64 %1158, i64* %1156, align 8
  %1159 = load %struct.re_pattern_buffer** %5, align 8
  %1160 = getelementptr inbounds %struct.re_pattern_buffer* %1159, i32 0, i32 1
  %1161 = load i64* %1160, align 8
  %1162 = icmp ugt i64 %1161, 65536
  br i1 %1162, label %1163, label %1166

; <label>:1163                                    ; preds = %1154
  %1164 = load %struct.re_pattern_buffer** %5, align 8
  %1165 = getelementptr inbounds %struct.re_pattern_buffer* %1164, i32 0, i32 1
  store i64 65536, i64* %1165, align 8
  br label %1166

; <label>:1166                                    ; preds = %1163, %1154
  %1167 = load %struct.re_pattern_buffer** %5, align 8
  %1168 = getelementptr inbounds %struct.re_pattern_buffer* %1167, i32 0, i32 0
  %1169 = load i8** %1168, align 8
  %1170 = load %struct.re_pattern_buffer** %5, align 8
  %1171 = getelementptr inbounds %struct.re_pattern_buffer* %1170, i32 0, i32 1
  %1172 = load i64* %1171, align 8
  %1173 = call noalias i8* @realloc(i8* %1169, i64 %1172) nounwind
  %1174 = load %struct.re_pattern_buffer** %5, align 8
  %1175 = getelementptr inbounds %struct.re_pattern_buffer* %1174, i32 0, i32 0
  store i8* %1173, i8** %1175, align 8
  %1176 = load %struct.re_pattern_buffer** %5, align 8
  %1177 = getelementptr inbounds %struct.re_pattern_buffer* %1176, i32 0, i32 0
  %1178 = load i8** %1177, align 8
  %1179 = icmp eq i8* %1178, null
  br i1 %1179, label %1180, label %1181

; <label>:1180                                    ; preds = %1166
  store i32 12, i32* %1
  br label %5348

; <label>:1181                                    ; preds = %1166
  %1182 = load i8** %old_buffer6, align 8
  %1183 = load %struct.re_pattern_buffer** %5, align 8
  %1184 = getelementptr inbounds %struct.re_pattern_buffer* %1183, i32 0, i32 0
  %1185 = load i8** %1184, align 8
  %1186 = icmp ne i8* %1182, %1185
  br i1 %1186, label %1187, label %1245

; <label>:1187                                    ; preds = %1181
  %1188 = load i8** %b, align 8
  %1189 = load i8** %old_buffer6, align 8
  %1190 = ptrtoint i8* %1188 to i64
  %1191 = ptrtoint i8* %1189 to i64
  %1192 = sub i64 %1190, %1191
  %1193 = load %struct.re_pattern_buffer** %5, align 8
  %1194 = getelementptr inbounds %struct.re_pattern_buffer* %1193, i32 0, i32 0
  %1195 = load i8** %1194, align 8
  %1196 = getelementptr inbounds i8* %1195, i64 %1192
  store i8* %1196, i8** %b, align 8
  %1197 = load i8** %begalt, align 8
  %1198 = load i8** %old_buffer6, align 8
  %1199 = ptrtoint i8* %1197 to i64
  %1200 = ptrtoint i8* %1198 to i64
  %1201 = sub i64 %1199, %1200
  %1202 = load %struct.re_pattern_buffer** %5, align 8
  %1203 = getelementptr inbounds %struct.re_pattern_buffer* %1202, i32 0, i32 0
  %1204 = load i8** %1203, align 8
  %1205 = getelementptr inbounds i8* %1204, i64 %1201
  store i8* %1205, i8** %begalt, align 8
  %1206 = load i8** %fixup_alt_jump, align 8
  %1207 = icmp ne i8* %1206, null
  br i1 %1207, label %1208, label %1218

; <label>:1208                                    ; preds = %1187
  %1209 = load i8** %fixup_alt_jump, align 8
  %1210 = load i8** %old_buffer6, align 8
  %1211 = ptrtoint i8* %1209 to i64
  %1212 = ptrtoint i8* %1210 to i64
  %1213 = sub i64 %1211, %1212
  %1214 = load %struct.re_pattern_buffer** %5, align 8
  %1215 = getelementptr inbounds %struct.re_pattern_buffer* %1214, i32 0, i32 0
  %1216 = load i8** %1215, align 8
  %1217 = getelementptr inbounds i8* %1216, i64 %1213
  store i8* %1217, i8** %fixup_alt_jump, align 8
  br label %1218

; <label>:1218                                    ; preds = %1208, %1187
  %1219 = load i8** %laststart, align 8
  %1220 = icmp ne i8* %1219, null
  br i1 %1220, label %1221, label %1231

; <label>:1221                                    ; preds = %1218
  %1222 = load i8** %laststart, align 8
  %1223 = load i8** %old_buffer6, align 8
  %1224 = ptrtoint i8* %1222 to i64
  %1225 = ptrtoint i8* %1223 to i64
  %1226 = sub i64 %1224, %1225
  %1227 = load %struct.re_pattern_buffer** %5, align 8
  %1228 = getelementptr inbounds %struct.re_pattern_buffer* %1227, i32 0, i32 0
  %1229 = load i8** %1228, align 8
  %1230 = getelementptr inbounds i8* %1229, i64 %1226
  store i8* %1230, i8** %laststart, align 8
  br label %1231

; <label>:1231                                    ; preds = %1221, %1218
  %1232 = load i8** %pending_exact, align 8
  %1233 = icmp ne i8* %1232, null
  br i1 %1233, label %1234, label %1244

; <label>:1234                                    ; preds = %1231
  %1235 = load i8** %pending_exact, align 8
  %1236 = load i8** %old_buffer6, align 8
  %1237 = ptrtoint i8* %1235 to i64
  %1238 = ptrtoint i8* %1236 to i64
  %1239 = sub i64 %1237, %1238
  %1240 = load %struct.re_pattern_buffer** %5, align 8
  %1241 = getelementptr inbounds %struct.re_pattern_buffer* %1240, i32 0, i32 0
  %1242 = load i8** %1241, align 8
  %1243 = getelementptr inbounds i8* %1242, i64 %1239
  store i8* %1243, i8** %pending_exact, align 8
  br label %1244

; <label>:1244                                    ; preds = %1234, %1231
  br label %1245

; <label>:1245                                    ; preds = %1244, %1181
  br label %1246

; <label>:1246                                    ; preds = %1245
  br label %1131

; <label>:1247                                    ; preds = %1131
  %1248 = load i8** %b, align 8
  store i8* %1248, i8** %laststart, align 8
  br label %1249

; <label>:1249                                    ; preds = %1247
  br label %1250

; <label>:1250                                    ; preds = %1365, %1249
  %1251 = load i8** %b, align 8
  %1252 = load %struct.re_pattern_buffer** %5, align 8
  %1253 = getelementptr inbounds %struct.re_pattern_buffer* %1252, i32 0, i32 0
  %1254 = load i8** %1253, align 8
  %1255 = ptrtoint i8* %1251 to i64
  %1256 = ptrtoint i8* %1254 to i64
  %1257 = sub i64 %1255, %1256
  %1258 = add nsw i64 %1257, 1
  %1259 = load %struct.re_pattern_buffer** %5, align 8
  %1260 = getelementptr inbounds %struct.re_pattern_buffer* %1259, i32 0, i32 1
  %1261 = load i64* %1260, align 8
  %1262 = icmp ugt i64 %1258, %1261
  br i1 %1262, label %1263, label %1366

; <label>:1263                                    ; preds = %1250
  br label %1264

; <label>:1264                                    ; preds = %1263
  %1265 = load %struct.re_pattern_buffer** %5, align 8
  %1266 = getelementptr inbounds %struct.re_pattern_buffer* %1265, i32 0, i32 0
  %1267 = load i8** %1266, align 8
  store i8* %1267, i8** %old_buffer7, align 8
  %1268 = load %struct.re_pattern_buffer** %5, align 8
  %1269 = getelementptr inbounds %struct.re_pattern_buffer* %1268, i32 0, i32 1
  %1270 = load i64* %1269, align 8
  %1271 = icmp eq i64 %1270, 65536
  br i1 %1271, label %1272, label %1273

; <label>:1272                                    ; preds = %1264
  store i32 15, i32* %1
  br label %5348

; <label>:1273                                    ; preds = %1264
  %1274 = load %struct.re_pattern_buffer** %5, align 8
  %1275 = getelementptr inbounds %struct.re_pattern_buffer* %1274, i32 0, i32 1
  %1276 = load i64* %1275, align 8
  %1277 = shl i64 %1276, 1
  store i64 %1277, i64* %1275, align 8
  %1278 = load %struct.re_pattern_buffer** %5, align 8
  %1279 = getelementptr inbounds %struct.re_pattern_buffer* %1278, i32 0, i32 1
  %1280 = load i64* %1279, align 8
  %1281 = icmp ugt i64 %1280, 65536
  br i1 %1281, label %1282, label %1285

; <label>:1282                                    ; preds = %1273
  %1283 = load %struct.re_pattern_buffer** %5, align 8
  %1284 = getelementptr inbounds %struct.re_pattern_buffer* %1283, i32 0, i32 1
  store i64 65536, i64* %1284, align 8
  br label %1285

; <label>:1285                                    ; preds = %1282, %1273
  %1286 = load %struct.re_pattern_buffer** %5, align 8
  %1287 = getelementptr inbounds %struct.re_pattern_buffer* %1286, i32 0, i32 0
  %1288 = load i8** %1287, align 8
  %1289 = load %struct.re_pattern_buffer** %5, align 8
  %1290 = getelementptr inbounds %struct.re_pattern_buffer* %1289, i32 0, i32 1
  %1291 = load i64* %1290, align 8
  %1292 = call noalias i8* @realloc(i8* %1288, i64 %1291) nounwind
  %1293 = load %struct.re_pattern_buffer** %5, align 8
  %1294 = getelementptr inbounds %struct.re_pattern_buffer* %1293, i32 0, i32 0
  store i8* %1292, i8** %1294, align 8
  %1295 = load %struct.re_pattern_buffer** %5, align 8
  %1296 = getelementptr inbounds %struct.re_pattern_buffer* %1295, i32 0, i32 0
  %1297 = load i8** %1296, align 8
  %1298 = icmp eq i8* %1297, null
  br i1 %1298, label %1299, label %1300

; <label>:1299                                    ; preds = %1285
  store i32 12, i32* %1
  br label %5348

; <label>:1300                                    ; preds = %1285
  %1301 = load i8** %old_buffer7, align 8
  %1302 = load %struct.re_pattern_buffer** %5, align 8
  %1303 = getelementptr inbounds %struct.re_pattern_buffer* %1302, i32 0, i32 0
  %1304 = load i8** %1303, align 8
  %1305 = icmp ne i8* %1301, %1304
  br i1 %1305, label %1306, label %1364

; <label>:1306                                    ; preds = %1300
  %1307 = load i8** %b, align 8
  %1308 = load i8** %old_buffer7, align 8
  %1309 = ptrtoint i8* %1307 to i64
  %1310 = ptrtoint i8* %1308 to i64
  %1311 = sub i64 %1309, %1310
  %1312 = load %struct.re_pattern_buffer** %5, align 8
  %1313 = getelementptr inbounds %struct.re_pattern_buffer* %1312, i32 0, i32 0
  %1314 = load i8** %1313, align 8
  %1315 = getelementptr inbounds i8* %1314, i64 %1311
  store i8* %1315, i8** %b, align 8
  %1316 = load i8** %begalt, align 8
  %1317 = load i8** %old_buffer7, align 8
  %1318 = ptrtoint i8* %1316 to i64
  %1319 = ptrtoint i8* %1317 to i64
  %1320 = sub i64 %1318, %1319
  %1321 = load %struct.re_pattern_buffer** %5, align 8
  %1322 = getelementptr inbounds %struct.re_pattern_buffer* %1321, i32 0, i32 0
  %1323 = load i8** %1322, align 8
  %1324 = getelementptr inbounds i8* %1323, i64 %1320
  store i8* %1324, i8** %begalt, align 8
  %1325 = load i8** %fixup_alt_jump, align 8
  %1326 = icmp ne i8* %1325, null
  br i1 %1326, label %1327, label %1337

; <label>:1327                                    ; preds = %1306
  %1328 = load i8** %fixup_alt_jump, align 8
  %1329 = load i8** %old_buffer7, align 8
  %1330 = ptrtoint i8* %1328 to i64
  %1331 = ptrtoint i8* %1329 to i64
  %1332 = sub i64 %1330, %1331
  %1333 = load %struct.re_pattern_buffer** %5, align 8
  %1334 = getelementptr inbounds %struct.re_pattern_buffer* %1333, i32 0, i32 0
  %1335 = load i8** %1334, align 8
  %1336 = getelementptr inbounds i8* %1335, i64 %1332
  store i8* %1336, i8** %fixup_alt_jump, align 8
  br label %1337

; <label>:1337                                    ; preds = %1327, %1306
  %1338 = load i8** %laststart, align 8
  %1339 = icmp ne i8* %1338, null
  br i1 %1339, label %1340, label %1350

; <label>:1340                                    ; preds = %1337
  %1341 = load i8** %laststart, align 8
  %1342 = load i8** %old_buffer7, align 8
  %1343 = ptrtoint i8* %1341 to i64
  %1344 = ptrtoint i8* %1342 to i64
  %1345 = sub i64 %1343, %1344
  %1346 = load %struct.re_pattern_buffer** %5, align 8
  %1347 = getelementptr inbounds %struct.re_pattern_buffer* %1346, i32 0, i32 0
  %1348 = load i8** %1347, align 8
  %1349 = getelementptr inbounds i8* %1348, i64 %1345
  store i8* %1349, i8** %laststart, align 8
  br label %1350

; <label>:1350                                    ; preds = %1340, %1337
  %1351 = load i8** %pending_exact, align 8
  %1352 = icmp ne i8* %1351, null
  br i1 %1352, label %1353, label %1363

; <label>:1353                                    ; preds = %1350
  %1354 = load i8** %pending_exact, align 8
  %1355 = load i8** %old_buffer7, align 8
  %1356 = ptrtoint i8* %1354 to i64
  %1357 = ptrtoint i8* %1355 to i64
  %1358 = sub i64 %1356, %1357
  %1359 = load %struct.re_pattern_buffer** %5, align 8
  %1360 = getelementptr inbounds %struct.re_pattern_buffer* %1359, i32 0, i32 0
  %1361 = load i8** %1360, align 8
  %1362 = getelementptr inbounds i8* %1361, i64 %1358
  store i8* %1362, i8** %pending_exact, align 8
  br label %1363

; <label>:1363                                    ; preds = %1353, %1350
  br label %1364

; <label>:1364                                    ; preds = %1363, %1300
  br label %1365

; <label>:1365                                    ; preds = %1364
  br label %1250

; <label>:1366                                    ; preds = %1250
  %1367 = load i8** %p, align 8
  %1368 = load i8* %1367, align 1
  %1369 = sext i8 %1368 to i32
  %1370 = icmp eq i32 %1369, 94
  %1371 = select i1 %1370, i32 4, i32 3
  %1372 = trunc i32 %1371 to i8
  %1373 = load i8** %b, align 8
  %1374 = getelementptr inbounds i8* %1373, i32 1
  store i8* %1374, i8** %b, align 8
  store i8 %1372, i8* %1373, align 1
  br label %1375

; <label>:1375                                    ; preds = %1366
  %1376 = load i8** %p, align 8
  %1377 = load i8* %1376, align 1
  %1378 = sext i8 %1377 to i32
  %1379 = icmp eq i32 %1378, 94
  br i1 %1379, label %1380, label %1383

; <label>:1380                                    ; preds = %1375
  %1381 = load i8** %p, align 8
  %1382 = getelementptr inbounds i8* %1381, i32 1
  store i8* %1382, i8** %p, align 8
  br label %1383

; <label>:1383                                    ; preds = %1380, %1375
  %1384 = load i8** %p, align 8
  store i8* %1384, i8** %p1, align 8
  br label %1385

; <label>:1385                                    ; preds = %1383
  br label %1386

; <label>:1386                                    ; preds = %1501, %1385
  %1387 = load i8** %b, align 8
  %1388 = load %struct.re_pattern_buffer** %5, align 8
  %1389 = getelementptr inbounds %struct.re_pattern_buffer* %1388, i32 0, i32 0
  %1390 = load i8** %1389, align 8
  %1391 = ptrtoint i8* %1387 to i64
  %1392 = ptrtoint i8* %1390 to i64
  %1393 = sub i64 %1391, %1392
  %1394 = add nsw i64 %1393, 1
  %1395 = load %struct.re_pattern_buffer** %5, align 8
  %1396 = getelementptr inbounds %struct.re_pattern_buffer* %1395, i32 0, i32 1
  %1397 = load i64* %1396, align 8
  %1398 = icmp ugt i64 %1394, %1397
  br i1 %1398, label %1399, label %1502

; <label>:1399                                    ; preds = %1386
  br label %1400

; <label>:1400                                    ; preds = %1399
  %1401 = load %struct.re_pattern_buffer** %5, align 8
  %1402 = getelementptr inbounds %struct.re_pattern_buffer* %1401, i32 0, i32 0
  %1403 = load i8** %1402, align 8
  store i8* %1403, i8** %old_buffer8, align 8
  %1404 = load %struct.re_pattern_buffer** %5, align 8
  %1405 = getelementptr inbounds %struct.re_pattern_buffer* %1404, i32 0, i32 1
  %1406 = load i64* %1405, align 8
  %1407 = icmp eq i64 %1406, 65536
  br i1 %1407, label %1408, label %1409

; <label>:1408                                    ; preds = %1400
  store i32 15, i32* %1
  br label %5348

; <label>:1409                                    ; preds = %1400
  %1410 = load %struct.re_pattern_buffer** %5, align 8
  %1411 = getelementptr inbounds %struct.re_pattern_buffer* %1410, i32 0, i32 1
  %1412 = load i64* %1411, align 8
  %1413 = shl i64 %1412, 1
  store i64 %1413, i64* %1411, align 8
  %1414 = load %struct.re_pattern_buffer** %5, align 8
  %1415 = getelementptr inbounds %struct.re_pattern_buffer* %1414, i32 0, i32 1
  %1416 = load i64* %1415, align 8
  %1417 = icmp ugt i64 %1416, 65536
  br i1 %1417, label %1418, label %1421

; <label>:1418                                    ; preds = %1409
  %1419 = load %struct.re_pattern_buffer** %5, align 8
  %1420 = getelementptr inbounds %struct.re_pattern_buffer* %1419, i32 0, i32 1
  store i64 65536, i64* %1420, align 8
  br label %1421

; <label>:1421                                    ; preds = %1418, %1409
  %1422 = load %struct.re_pattern_buffer** %5, align 8
  %1423 = getelementptr inbounds %struct.re_pattern_buffer* %1422, i32 0, i32 0
  %1424 = load i8** %1423, align 8
  %1425 = load %struct.re_pattern_buffer** %5, align 8
  %1426 = getelementptr inbounds %struct.re_pattern_buffer* %1425, i32 0, i32 1
  %1427 = load i64* %1426, align 8
  %1428 = call noalias i8* @realloc(i8* %1424, i64 %1427) nounwind
  %1429 = load %struct.re_pattern_buffer** %5, align 8
  %1430 = getelementptr inbounds %struct.re_pattern_buffer* %1429, i32 0, i32 0
  store i8* %1428, i8** %1430, align 8
  %1431 = load %struct.re_pattern_buffer** %5, align 8
  %1432 = getelementptr inbounds %struct.re_pattern_buffer* %1431, i32 0, i32 0
  %1433 = load i8** %1432, align 8
  %1434 = icmp eq i8* %1433, null
  br i1 %1434, label %1435, label %1436

; <label>:1435                                    ; preds = %1421
  store i32 12, i32* %1
  br label %5348

; <label>:1436                                    ; preds = %1421
  %1437 = load i8** %old_buffer8, align 8
  %1438 = load %struct.re_pattern_buffer** %5, align 8
  %1439 = getelementptr inbounds %struct.re_pattern_buffer* %1438, i32 0, i32 0
  %1440 = load i8** %1439, align 8
  %1441 = icmp ne i8* %1437, %1440
  br i1 %1441, label %1442, label %1500

; <label>:1442                                    ; preds = %1436
  %1443 = load i8** %b, align 8
  %1444 = load i8** %old_buffer8, align 8
  %1445 = ptrtoint i8* %1443 to i64
  %1446 = ptrtoint i8* %1444 to i64
  %1447 = sub i64 %1445, %1446
  %1448 = load %struct.re_pattern_buffer** %5, align 8
  %1449 = getelementptr inbounds %struct.re_pattern_buffer* %1448, i32 0, i32 0
  %1450 = load i8** %1449, align 8
  %1451 = getelementptr inbounds i8* %1450, i64 %1447
  store i8* %1451, i8** %b, align 8
  %1452 = load i8** %begalt, align 8
  %1453 = load i8** %old_buffer8, align 8
  %1454 = ptrtoint i8* %1452 to i64
  %1455 = ptrtoint i8* %1453 to i64
  %1456 = sub i64 %1454, %1455
  %1457 = load %struct.re_pattern_buffer** %5, align 8
  %1458 = getelementptr inbounds %struct.re_pattern_buffer* %1457, i32 0, i32 0
  %1459 = load i8** %1458, align 8
  %1460 = getelementptr inbounds i8* %1459, i64 %1456
  store i8* %1460, i8** %begalt, align 8
  %1461 = load i8** %fixup_alt_jump, align 8
  %1462 = icmp ne i8* %1461, null
  br i1 %1462, label %1463, label %1473

; <label>:1463                                    ; preds = %1442
  %1464 = load i8** %fixup_alt_jump, align 8
  %1465 = load i8** %old_buffer8, align 8
  %1466 = ptrtoint i8* %1464 to i64
  %1467 = ptrtoint i8* %1465 to i64
  %1468 = sub i64 %1466, %1467
  %1469 = load %struct.re_pattern_buffer** %5, align 8
  %1470 = getelementptr inbounds %struct.re_pattern_buffer* %1469, i32 0, i32 0
  %1471 = load i8** %1470, align 8
  %1472 = getelementptr inbounds i8* %1471, i64 %1468
  store i8* %1472, i8** %fixup_alt_jump, align 8
  br label %1473

; <label>:1473                                    ; preds = %1463, %1442
  %1474 = load i8** %laststart, align 8
  %1475 = icmp ne i8* %1474, null
  br i1 %1475, label %1476, label %1486

; <label>:1476                                    ; preds = %1473
  %1477 = load i8** %laststart, align 8
  %1478 = load i8** %old_buffer8, align 8
  %1479 = ptrtoint i8* %1477 to i64
  %1480 = ptrtoint i8* %1478 to i64
  %1481 = sub i64 %1479, %1480
  %1482 = load %struct.re_pattern_buffer** %5, align 8
  %1483 = getelementptr inbounds %struct.re_pattern_buffer* %1482, i32 0, i32 0
  %1484 = load i8** %1483, align 8
  %1485 = getelementptr inbounds i8* %1484, i64 %1481
  store i8* %1485, i8** %laststart, align 8
  br label %1486

; <label>:1486                                    ; preds = %1476, %1473
  %1487 = load i8** %pending_exact, align 8
  %1488 = icmp ne i8* %1487, null
  br i1 %1488, label %1489, label %1499

; <label>:1489                                    ; preds = %1486
  %1490 = load i8** %pending_exact, align 8
  %1491 = load i8** %old_buffer8, align 8
  %1492 = ptrtoint i8* %1490 to i64
  %1493 = ptrtoint i8* %1491 to i64
  %1494 = sub i64 %1492, %1493
  %1495 = load %struct.re_pattern_buffer** %5, align 8
  %1496 = getelementptr inbounds %struct.re_pattern_buffer* %1495, i32 0, i32 0
  %1497 = load i8** %1496, align 8
  %1498 = getelementptr inbounds i8* %1497, i64 %1494
  store i8* %1498, i8** %pending_exact, align 8
  br label %1499

; <label>:1499                                    ; preds = %1489, %1486
  br label %1500

; <label>:1500                                    ; preds = %1499, %1436
  br label %1501

; <label>:1501                                    ; preds = %1500
  br label %1386

; <label>:1502                                    ; preds = %1386
  %1503 = load i8** %b, align 8
  %1504 = getelementptr inbounds i8* %1503, i32 1
  store i8* %1504, i8** %b, align 8
  store i8 32, i8* %1503, align 1
  br label %1505

; <label>:1505                                    ; preds = %1502
  %1506 = load i8** %b, align 8
  call void @llvm.memset.p0i8.i64(i8* %1506, i8 0, i64 32, i32 1, i1 false)
  %1507 = load i8** %b, align 8
  %1508 = getelementptr inbounds i8* %1507, i64 -2
  %1509 = load i8* %1508, align 1
  %1510 = zext i8 %1509 to i32
  %1511 = icmp eq i32 %1510, 4
  br i1 %1511, label %1512, label %1523

; <label>:1512                                    ; preds = %1505
  %1513 = load i32* %4, align 4
  %1514 = and i32 %1513, 256
  %1515 = icmp ne i32 %1514, 0
  br i1 %1515, label %1516, label %1523

; <label>:1516                                    ; preds = %1512
  %1517 = load i8** %b, align 8
  %1518 = getelementptr inbounds i8* %1517, i64 1
  %1519 = load i8* %1518, align 1
  %1520 = zext i8 %1519 to i32
  %1521 = or i32 %1520, 4
  %1522 = trunc i32 %1521 to i8
  store i8 %1522, i8* %1518, align 1
  br label %1523

; <label>:1523                                    ; preds = %1516, %1512, %1505
  br label %1524

; <label>:1524                                    ; preds = %2217, %1580, %1523
  %1525 = load i8** %p, align 8
  %1526 = load i8** %pend, align 8
  %1527 = icmp eq i8* %1525, %1526
  br i1 %1527, label %1528, label %1529

; <label>:1528                                    ; preds = %1524
  store i32 7, i32* %1
  br label %5348

; <label>:1529                                    ; preds = %1524
  br label %1530

; <label>:1530                                    ; preds = %1529
  %1531 = load i8** %p, align 8
  %1532 = load i8** %pend, align 8
  %1533 = icmp eq i8* %1531, %1532
  br i1 %1533, label %1534, label %1535

; <label>:1534                                    ; preds = %1530
  store i32 14, i32* %1
  br label %5348

; <label>:1535                                    ; preds = %1530
  %1536 = load i8** %p, align 8
  %1537 = getelementptr inbounds i8* %1536, i32 1
  store i8* %1537, i8** %p, align 8
  %1538 = load i8* %1536, align 1
  store i8 %1538, i8* %c, align 1
  %1539 = load i8** %translate, align 8
  %1540 = icmp ne i8* %1539, null
  br i1 %1540, label %1541, label %1547

; <label>:1541                                    ; preds = %1535
  %1542 = load i8* %c, align 1
  %1543 = zext i8 %1542 to i64
  %1544 = load i8** %translate, align 8
  %1545 = getelementptr inbounds i8* %1544, i64 %1543
  %1546 = load i8* %1545, align 1
  store i8 %1546, i8* %c, align 1
  br label %1547

; <label>:1547                                    ; preds = %1541, %1535
  br label %1548

; <label>:1548                                    ; preds = %1547
  %1549 = load i32* %4, align 4
  %1550 = and i32 %1549, 1
  %1551 = icmp ne i32 %1550, 0
  br i1 %1551, label %1552, label %1595

; <label>:1552                                    ; preds = %1548
  %1553 = load i8* %c, align 1
  %1554 = zext i8 %1553 to i32
  %1555 = icmp eq i32 %1554, 92
  br i1 %1555, label %1556, label %1595

; <label>:1556                                    ; preds = %1552
  %1557 = load i8** %p, align 8
  %1558 = load i8** %pend, align 8
  %1559 = icmp eq i8* %1557, %1558
  br i1 %1559, label %1560, label %1561

; <label>:1560                                    ; preds = %1556
  store i32 5, i32* %1
  br label %5348

; <label>:1561                                    ; preds = %1556
  br label %1562

; <label>:1562                                    ; preds = %1561
  %1563 = load i8** %p, align 8
  %1564 = load i8** %pend, align 8
  %1565 = icmp eq i8* %1563, %1564
  br i1 %1565, label %1566, label %1567

; <label>:1566                                    ; preds = %1562
  store i32 14, i32* %1
  br label %5348

; <label>:1567                                    ; preds = %1562
  %1568 = load i8** %p, align 8
  %1569 = getelementptr inbounds i8* %1568, i32 1
  store i8* %1569, i8** %p, align 8
  %1570 = load i8* %1568, align 1
  store i8 %1570, i8* %c1, align 1
  %1571 = load i8** %translate, align 8
  %1572 = icmp ne i8* %1571, null
  br i1 %1572, label %1573, label %1579

; <label>:1573                                    ; preds = %1567
  %1574 = load i8* %c1, align 1
  %1575 = zext i8 %1574 to i64
  %1576 = load i8** %translate, align 8
  %1577 = getelementptr inbounds i8* %1576, i64 %1575
  %1578 = load i8* %1577, align 1
  store i8 %1578, i8* %c1, align 1
  br label %1579

; <label>:1579                                    ; preds = %1573, %1567
  br label %1580

; <label>:1580                                    ; preds = %1579
  %1581 = load i8* %c1, align 1
  %1582 = zext i8 %1581 to i32
  %1583 = srem i32 %1582, 8
  %1584 = shl i32 1, %1583
  %1585 = load i8* %c1, align 1
  %1586 = zext i8 %1585 to i32
  %1587 = sdiv i32 %1586, 8
  %1588 = sext i32 %1587 to i64
  %1589 = load i8** %b, align 8
  %1590 = getelementptr inbounds i8* %1589, i64 %1588
  %1591 = load i8* %1590, align 1
  %1592 = zext i8 %1591 to i32
  %1593 = or i32 %1592, %1584
  %1594 = trunc i32 %1593 to i8
  store i8 %1594, i8* %1590, align 1
  br label %1524

; <label>:1595                                    ; preds = %1552, %1548
  %1596 = load i8* %c, align 1
  %1597 = zext i8 %1596 to i32
  %1598 = icmp eq i32 %1597, 93
  br i1 %1598, label %1599, label %1605

; <label>:1599                                    ; preds = %1595
  %1600 = load i8** %p, align 8
  %1601 = load i8** %p1, align 8
  %1602 = getelementptr inbounds i8* %1601, i64 1
  %1603 = icmp ne i8* %1600, %1602
  br i1 %1603, label %1604, label %1605

; <label>:1604                                    ; preds = %1599
  br label %2218

; <label>:1605                                    ; preds = %1599, %1595
  %1606 = load i8* %had_char_class, align 1
  %1607 = sext i8 %1606 to i32
  %1608 = icmp ne i32 %1607, 0
  br i1 %1608, label %1609, label %1619

; <label>:1609                                    ; preds = %1605
  %1610 = load i8* %c, align 1
  %1611 = zext i8 %1610 to i32
  %1612 = icmp eq i32 %1611, 45
  br i1 %1612, label %1613, label %1619

; <label>:1613                                    ; preds = %1609
  %1614 = load i8** %p, align 8
  %1615 = load i8* %1614, align 1
  %1616 = sext i8 %1615 to i32
  %1617 = icmp ne i32 %1616, 93
  br i1 %1617, label %1618, label %1619

; <label>:1618                                    ; preds = %1613
  store i32 11, i32* %1
  br label %5348

; <label>:1619                                    ; preds = %1613, %1609, %1605
  %1620 = load i8* %c, align 1
  %1621 = zext i8 %1620 to i32
  %1622 = icmp eq i32 %1621, 45
  br i1 %1622, label %1623, label %1667

; <label>:1623                                    ; preds = %1619
  %1624 = load i8** %p, align 8
  %1625 = getelementptr inbounds i8* %1624, i64 -2
  %1626 = load i8** %2, align 8
  %1627 = icmp uge i8* %1625, %1626
  br i1 %1627, label %1628, label %1634

; <label>:1628                                    ; preds = %1623
  %1629 = load i8** %p, align 8
  %1630 = getelementptr inbounds i8* %1629, i64 -2
  %1631 = load i8* %1630, align 1
  %1632 = sext i8 %1631 to i32
  %1633 = icmp eq i32 %1632, 91
  br i1 %1633, label %1667, label %1634

; <label>:1634                                    ; preds = %1628, %1623
  %1635 = load i8** %p, align 8
  %1636 = getelementptr inbounds i8* %1635, i64 -3
  %1637 = load i8** %2, align 8
  %1638 = icmp uge i8* %1636, %1637
  br i1 %1638, label %1639, label %1651

; <label>:1639                                    ; preds = %1634
  %1640 = load i8** %p, align 8
  %1641 = getelementptr inbounds i8* %1640, i64 -3
  %1642 = load i8* %1641, align 1
  %1643 = sext i8 %1642 to i32
  %1644 = icmp eq i32 %1643, 91
  br i1 %1644, label %1645, label %1651

; <label>:1645                                    ; preds = %1639
  %1646 = load i8** %p, align 8
  %1647 = getelementptr inbounds i8* %1646, i64 -2
  %1648 = load i8* %1647, align 1
  %1649 = sext i8 %1648 to i32
  %1650 = icmp eq i32 %1649, 94
  br i1 %1650, label %1667, label %1651

; <label>:1651                                    ; preds = %1645, %1639, %1634
  %1652 = load i8** %p, align 8
  %1653 = load i8* %1652, align 1
  %1654 = sext i8 %1653 to i32
  %1655 = icmp ne i32 %1654, 93
  br i1 %1655, label %1656, label %1667

; <label>:1656                                    ; preds = %1651
  %1657 = load i8** %pend, align 8
  %1658 = load i8** %translate, align 8
  %1659 = load i32* %4, align 4
  %1660 = load i8** %b, align 8
  %1661 = call i32 (...)* bitcast (i32 (i8**, i8*, i8*, i32, i8*)* @compile_range to i32 (...)*)(i8** %p, i8* %1657, i8* %1658, i32 %1659, i8* %1660)
  store i32 %1661, i32* %ret, align 4
  %1662 = load i32* %ret, align 4
  %1663 = icmp ne i32 %1662, 0
  br i1 %1663, label %1664, label %1666

; <label>:1664                                    ; preds = %1656
  %1665 = load i32* %ret, align 4
  store i32 %1665, i32* %1
  br label %5348

; <label>:1666                                    ; preds = %1656
  br label %2217

; <label>:1667                                    ; preds = %1651, %1645, %1628, %1619
  %1668 = load i8** %p, align 8
  %1669 = getelementptr inbounds i8* %1668, i64 0
  %1670 = load i8* %1669, align 1
  %1671 = sext i8 %1670 to i32
  %1672 = icmp eq i32 %1671, 45
  br i1 %1672, label %1673, label %1709

; <label>:1673                                    ; preds = %1667
  %1674 = load i8** %p, align 8
  %1675 = getelementptr inbounds i8* %1674, i64 1
  %1676 = load i8* %1675, align 1
  %1677 = sext i8 %1676 to i32
  %1678 = icmp ne i32 %1677, 93
  br i1 %1678, label %1679, label %1709

; <label>:1679                                    ; preds = %1673
  br label %1680

; <label>:1680                                    ; preds = %1679
  %1681 = load i8** %p, align 8
  %1682 = load i8** %pend, align 8
  %1683 = icmp eq i8* %1681, %1682
  br i1 %1683, label %1684, label %1685

; <label>:1684                                    ; preds = %1680
  store i32 14, i32* %1
  br label %5348

; <label>:1685                                    ; preds = %1680
  %1686 = load i8** %p, align 8
  %1687 = getelementptr inbounds i8* %1686, i32 1
  store i8* %1687, i8** %p, align 8
  %1688 = load i8* %1686, align 1
  store i8 %1688, i8* %c1, align 1
  %1689 = load i8** %translate, align 8
  %1690 = icmp ne i8* %1689, null
  br i1 %1690, label %1691, label %1697

; <label>:1691                                    ; preds = %1685
  %1692 = load i8* %c1, align 1
  %1693 = zext i8 %1692 to i64
  %1694 = load i8** %translate, align 8
  %1695 = getelementptr inbounds i8* %1694, i64 %1693
  %1696 = load i8* %1695, align 1
  store i8 %1696, i8* %c1, align 1
  br label %1697

; <label>:1697                                    ; preds = %1691, %1685
  br label %1698

; <label>:1698                                    ; preds = %1697
  %1699 = load i8** %pend, align 8
  %1700 = load i8** %translate, align 8
  %1701 = load i32* %4, align 4
  %1702 = load i8** %b, align 8
  %1703 = call i32 (...)* bitcast (i32 (i8**, i8*, i8*, i32, i8*)* @compile_range to i32 (...)*)(i8** %p, i8* %1699, i8* %1700, i32 %1701, i8* %1702)
  store i32 %1703, i32* %ret9, align 4
  %1704 = load i32* %ret9, align 4
  %1705 = icmp ne i32 %1704, 0
  br i1 %1705, label %1706, label %1708

; <label>:1706                                    ; preds = %1698
  %1707 = load i32* %ret9, align 4
  store i32 %1707, i32* %1
  br label %5348

; <label>:1708                                    ; preds = %1698
  br label %2216

; <label>:1709                                    ; preds = %1673, %1667
  %1710 = load i32* %4, align 4
  %1711 = and i32 %1710, 4
  %1712 = icmp ne i32 %1711, 0
  br i1 %1712, label %1713, label %2200

; <label>:1713                                    ; preds = %1709
  %1714 = load i8* %c, align 1
  %1715 = zext i8 %1714 to i32
  %1716 = icmp eq i32 %1715, 91
  br i1 %1716, label %1717, label %2200

; <label>:1717                                    ; preds = %1713
  %1718 = load i8** %p, align 8
  %1719 = load i8* %1718, align 1
  %1720 = sext i8 %1719 to i32
  %1721 = icmp eq i32 %1720, 58
  br i1 %1721, label %1722, label %2200

; <label>:1722                                    ; preds = %1717
  br label %1723

; <label>:1723                                    ; preds = %1722
  %1724 = load i8** %p, align 8
  %1725 = load i8** %pend, align 8
  %1726 = icmp eq i8* %1724, %1725
  br i1 %1726, label %1727, label %1728

; <label>:1727                                    ; preds = %1723
  store i32 14, i32* %1
  br label %5348

; <label>:1728                                    ; preds = %1723
  %1729 = load i8** %p, align 8
  %1730 = getelementptr inbounds i8* %1729, i32 1
  store i8* %1730, i8** %p, align 8
  %1731 = load i8* %1729, align 1
  store i8 %1731, i8* %c, align 1
  %1732 = load i8** %translate, align 8
  %1733 = icmp ne i8* %1732, null
  br i1 %1733, label %1734, label %1740

; <label>:1734                                    ; preds = %1728
  %1735 = load i8* %c, align 1
  %1736 = zext i8 %1735 to i64
  %1737 = load i8** %translate, align 8
  %1738 = getelementptr inbounds i8* %1737, i64 %1736
  %1739 = load i8* %1738, align 1
  store i8 %1739, i8* %c, align 1
  br label %1740

; <label>:1740                                    ; preds = %1734, %1728
  br label %1741

; <label>:1741                                    ; preds = %1740
  store i8 0, i8* %c1, align 1
  %1742 = load i8** %p, align 8
  %1743 = load i8** %pend, align 8
  %1744 = icmp eq i8* %1742, %1743
  br i1 %1744, label %1745, label %1746

; <label>:1745                                    ; preds = %1741
  store i32 7, i32* %1
  br label %5348

; <label>:1746                                    ; preds = %1741
  br label %1747

; <label>:1747                                    ; preds = %1783, %1746
  br label %1748

; <label>:1748                                    ; preds = %1747
  %1749 = load i8** %p, align 8
  %1750 = load i8** %pend, align 8
  %1751 = icmp eq i8* %1749, %1750
  br i1 %1751, label %1752, label %1753

; <label>:1752                                    ; preds = %1748
  store i32 14, i32* %1
  br label %5348

; <label>:1753                                    ; preds = %1748
  %1754 = load i8** %p, align 8
  %1755 = getelementptr inbounds i8* %1754, i32 1
  store i8* %1755, i8** %p, align 8
  %1756 = load i8* %1754, align 1
  store i8 %1756, i8* %c, align 1
  %1757 = load i8** %translate, align 8
  %1758 = icmp ne i8* %1757, null
  br i1 %1758, label %1759, label %1765

; <label>:1759                                    ; preds = %1753
  %1760 = load i8* %c, align 1
  %1761 = zext i8 %1760 to i64
  %1762 = load i8** %translate, align 8
  %1763 = getelementptr inbounds i8* %1762, i64 %1761
  %1764 = load i8* %1763, align 1
  store i8 %1764, i8* %c, align 1
  br label %1765

; <label>:1765                                    ; preds = %1759, %1753
  br label %1766

; <label>:1766                                    ; preds = %1765
  %1767 = load i8* %c, align 1
  %1768 = zext i8 %1767 to i32
  %1769 = icmp eq i32 %1768, 58
  br i1 %1769, label %1782, label %1770

; <label>:1770                                    ; preds = %1766
  %1771 = load i8* %c, align 1
  %1772 = zext i8 %1771 to i32
  %1773 = icmp eq i32 %1772, 93
  br i1 %1773, label %1782, label %1774

; <label>:1774                                    ; preds = %1770
  %1775 = load i8** %p, align 8
  %1776 = load i8** %pend, align 8
  %1777 = icmp eq i8* %1775, %1776
  br i1 %1777, label %1782, label %1778

; <label>:1778                                    ; preds = %1774
  %1779 = load i8* %c1, align 1
  %1780 = zext i8 %1779 to i32
  %1781 = icmp eq i32 %1780, 6
  br i1 %1781, label %1782, label %1783

; <label>:1782                                    ; preds = %1778, %1774, %1770, %1766
  br label %1789

; <label>:1783                                    ; preds = %1778
  %1784 = load i8* %c, align 1
  %1785 = load i8* %c1, align 1
  %1786 = add i8 %1785, 1
  store i8 %1786, i8* %c1, align 1
  %1787 = zext i8 %1785 to i64
  %1788 = getelementptr inbounds [7 x i8]* %str, i32 0, i64 %1787
  store i8 %1784, i8* %1788, align 1
  br label %1747

; <label>:1789                                    ; preds = %1782
  %1790 = load i8* %c1, align 1
  %1791 = zext i8 %1790 to i64
  %1792 = getelementptr inbounds [7 x i8]* %str, i32 0, i64 %1791
  store i8 0, i8* %1792, align 1
  %1793 = load i8* %c, align 1
  %1794 = zext i8 %1793 to i32
  %1795 = icmp eq i32 %1794, 58
  br i1 %1795, label %1796, label %2176

; <label>:1796                                    ; preds = %1789
  %1797 = load i8** %p, align 8
  %1798 = load i8* %1797, align 1
  %1799 = sext i8 %1798 to i32
  %1800 = icmp eq i32 %1799, 93
  br i1 %1800, label %1801, label %2176

; <label>:1801                                    ; preds = %1796
  %1802 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1803 = call i32 @strcmp(i8* %1802, i8* getelementptr inbounds ([6 x i8]* @.str67, i32 0, i32 0)) nounwind readonly
  %1804 = icmp eq i32 %1803, 0
  %1805 = zext i1 %1804 to i32
  %1806 = trunc i32 %1805 to i8
  store i8 %1806, i8* %is_alnum, align 1
  %1807 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1808 = call i32 @strcmp(i8* %1807, i8* getelementptr inbounds ([6 x i8]* @.str68, i32 0, i32 0)) nounwind readonly
  %1809 = icmp eq i32 %1808, 0
  %1810 = zext i1 %1809 to i32
  %1811 = trunc i32 %1810 to i8
  store i8 %1811, i8* %is_alpha, align 1
  %1812 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1813 = call i32 @strcmp(i8* %1812, i8* getelementptr inbounds ([6 x i8]* @.str69, i32 0, i32 0)) nounwind readonly
  %1814 = icmp eq i32 %1813, 0
  %1815 = zext i1 %1814 to i32
  %1816 = trunc i32 %1815 to i8
  store i8 %1816, i8* %is_blank, align 1
  %1817 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1818 = call i32 @strcmp(i8* %1817, i8* getelementptr inbounds ([6 x i8]* @.str70, i32 0, i32 0)) nounwind readonly
  %1819 = icmp eq i32 %1818, 0
  %1820 = zext i1 %1819 to i32
  %1821 = trunc i32 %1820 to i8
  store i8 %1821, i8* %is_cntrl, align 1
  %1822 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1823 = call i32 @strcmp(i8* %1822, i8* getelementptr inbounds ([6 x i8]* @.str71, i32 0, i32 0)) nounwind readonly
  %1824 = icmp eq i32 %1823, 0
  %1825 = zext i1 %1824 to i32
  %1826 = trunc i32 %1825 to i8
  store i8 %1826, i8* %is_digit, align 1
  %1827 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1828 = call i32 @strcmp(i8* %1827, i8* getelementptr inbounds ([6 x i8]* @.str72, i32 0, i32 0)) nounwind readonly
  %1829 = icmp eq i32 %1828, 0
  %1830 = zext i1 %1829 to i32
  %1831 = trunc i32 %1830 to i8
  store i8 %1831, i8* %is_graph, align 1
  %1832 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1833 = call i32 @strcmp(i8* %1832, i8* getelementptr inbounds ([6 x i8]* @.str73, i32 0, i32 0)) nounwind readonly
  %1834 = icmp eq i32 %1833, 0
  %1835 = zext i1 %1834 to i32
  %1836 = trunc i32 %1835 to i8
  store i8 %1836, i8* %is_lower, align 1
  %1837 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1838 = call i32 @strcmp(i8* %1837, i8* getelementptr inbounds ([6 x i8]* @.str74, i32 0, i32 0)) nounwind readonly
  %1839 = icmp eq i32 %1838, 0
  %1840 = zext i1 %1839 to i32
  %1841 = trunc i32 %1840 to i8
  store i8 %1841, i8* %is_print, align 1
  %1842 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1843 = call i32 @strcmp(i8* %1842, i8* getelementptr inbounds ([6 x i8]* @.str75, i32 0, i32 0)) nounwind readonly
  %1844 = icmp eq i32 %1843, 0
  %1845 = zext i1 %1844 to i32
  %1846 = trunc i32 %1845 to i8
  store i8 %1846, i8* %is_punct, align 1
  %1847 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1848 = call i32 @strcmp(i8* %1847, i8* getelementptr inbounds ([6 x i8]* @.str76, i32 0, i32 0)) nounwind readonly
  %1849 = icmp eq i32 %1848, 0
  %1850 = zext i1 %1849 to i32
  %1851 = trunc i32 %1850 to i8
  store i8 %1851, i8* %is_space, align 1
  %1852 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1853 = call i32 @strcmp(i8* %1852, i8* getelementptr inbounds ([6 x i8]* @.str77, i32 0, i32 0)) nounwind readonly
  %1854 = icmp eq i32 %1853, 0
  %1855 = zext i1 %1854 to i32
  %1856 = trunc i32 %1855 to i8
  store i8 %1856, i8* %is_upper, align 1
  %1857 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1858 = call i32 @strcmp(i8* %1857, i8* getelementptr inbounds ([7 x i8]* @.str78, i32 0, i32 0)) nounwind readonly
  %1859 = icmp eq i32 %1858, 0
  %1860 = zext i1 %1859 to i32
  %1861 = trunc i32 %1860 to i8
  store i8 %1861, i8* %is_xdigit, align 1
  %1862 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1863 = call i32 @strcmp(i8* %1862, i8* getelementptr inbounds ([6 x i8]* @.str68, i32 0, i32 0)) nounwind readonly
  %1864 = icmp eq i32 %1863, 0
  br i1 %1864, label %1910, label %1865

; <label>:1865                                    ; preds = %1801
  %1866 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1867 = call i32 @strcmp(i8* %1866, i8* getelementptr inbounds ([6 x i8]* @.str77, i32 0, i32 0)) nounwind readonly
  %1868 = icmp eq i32 %1867, 0
  br i1 %1868, label %1910, label %1869

; <label>:1869                                    ; preds = %1865
  %1870 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1871 = call i32 @strcmp(i8* %1870, i8* getelementptr inbounds ([6 x i8]* @.str73, i32 0, i32 0)) nounwind readonly
  %1872 = icmp eq i32 %1871, 0
  br i1 %1872, label %1910, label %1873

; <label>:1873                                    ; preds = %1869
  %1874 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1875 = call i32 @strcmp(i8* %1874, i8* getelementptr inbounds ([6 x i8]* @.str71, i32 0, i32 0)) nounwind readonly
  %1876 = icmp eq i32 %1875, 0
  br i1 %1876, label %1910, label %1877

; <label>:1877                                    ; preds = %1873
  %1878 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1879 = call i32 @strcmp(i8* %1878, i8* getelementptr inbounds ([6 x i8]* @.str67, i32 0, i32 0)) nounwind readonly
  %1880 = icmp eq i32 %1879, 0
  br i1 %1880, label %1910, label %1881

; <label>:1881                                    ; preds = %1877
  %1882 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1883 = call i32 @strcmp(i8* %1882, i8* getelementptr inbounds ([7 x i8]* @.str78, i32 0, i32 0)) nounwind readonly
  %1884 = icmp eq i32 %1883, 0
  br i1 %1884, label %1910, label %1885

; <label>:1885                                    ; preds = %1881
  %1886 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1887 = call i32 @strcmp(i8* %1886, i8* getelementptr inbounds ([6 x i8]* @.str76, i32 0, i32 0)) nounwind readonly
  %1888 = icmp eq i32 %1887, 0
  br i1 %1888, label %1910, label %1889

; <label>:1889                                    ; preds = %1885
  %1890 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1891 = call i32 @strcmp(i8* %1890, i8* getelementptr inbounds ([6 x i8]* @.str74, i32 0, i32 0)) nounwind readonly
  %1892 = icmp eq i32 %1891, 0
  br i1 %1892, label %1910, label %1893

; <label>:1893                                    ; preds = %1889
  %1894 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1895 = call i32 @strcmp(i8* %1894, i8* getelementptr inbounds ([6 x i8]* @.str75, i32 0, i32 0)) nounwind readonly
  %1896 = icmp eq i32 %1895, 0
  br i1 %1896, label %1910, label %1897

; <label>:1897                                    ; preds = %1893
  %1898 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1899 = call i32 @strcmp(i8* %1898, i8* getelementptr inbounds ([6 x i8]* @.str72, i32 0, i32 0)) nounwind readonly
  %1900 = icmp eq i32 %1899, 0
  br i1 %1900, label %1910, label %1901

; <label>:1901                                    ; preds = %1897
  %1902 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1903 = call i32 @strcmp(i8* %1902, i8* getelementptr inbounds ([6 x i8]* @.str70, i32 0, i32 0)) nounwind readonly
  %1904 = icmp eq i32 %1903, 0
  br i1 %1904, label %1910, label %1905

; <label>:1905                                    ; preds = %1901
  %1906 = getelementptr inbounds [7 x i8]* %str, i32 0, i32 0
  %1907 = call i32 @strcmp(i8* %1906, i8* getelementptr inbounds ([6 x i8]* @.str69, i32 0, i32 0)) nounwind readonly
  %1908 = icmp eq i32 %1907, 0
  br i1 %1908, label %1910, label %1909

; <label>:1909                                    ; preds = %1905
  store i32 4, i32* %1
  br label %5348

; <label>:1910                                    ; preds = %1905, %1901, %1897, %1893, %1889, %1885, %1881, %1877, %1873, %1869, %1865, %1801
  br label %1911

; <label>:1911                                    ; preds = %1910
  %1912 = load i8** %p, align 8
  %1913 = load i8** %pend, align 8
  %1914 = icmp eq i8* %1912, %1913
  br i1 %1914, label %1915, label %1916

; <label>:1915                                    ; preds = %1911
  store i32 14, i32* %1
  br label %5348

; <label>:1916                                    ; preds = %1911
  %1917 = load i8** %p, align 8
  %1918 = getelementptr inbounds i8* %1917, i32 1
  store i8* %1918, i8** %p, align 8
  %1919 = load i8* %1917, align 1
  store i8 %1919, i8* %c, align 1
  %1920 = load i8** %translate, align 8
  %1921 = icmp ne i8* %1920, null
  br i1 %1921, label %1922, label %1928

; <label>:1922                                    ; preds = %1916
  %1923 = load i8* %c, align 1
  %1924 = zext i8 %1923 to i64
  %1925 = load i8** %translate, align 8
  %1926 = getelementptr inbounds i8* %1925, i64 %1924
  %1927 = load i8* %1926, align 1
  store i8 %1927, i8* %c, align 1
  br label %1928

; <label>:1928                                    ; preds = %1922, %1916
  br label %1929

; <label>:1929                                    ; preds = %1928
  %1930 = load i8** %p, align 8
  %1931 = load i8** %pend, align 8
  %1932 = icmp eq i8* %1930, %1931
  br i1 %1932, label %1933, label %1934

; <label>:1933                                    ; preds = %1929
  store i32 7, i32* %1
  br label %5348

; <label>:1934                                    ; preds = %1929
  store i32 0, i32* %ch, align 4
  br label %1935

; <label>:1935                                    ; preds = %2172, %1934
  %1936 = load i32* %ch, align 4
  %1937 = icmp slt i32 %1936, 256
  br i1 %1937, label %1938, label %2175

; <label>:1938                                    ; preds = %1935
  %1939 = load i8* %is_alnum, align 1
  %1940 = sext i8 %1939 to i32
  %1941 = icmp ne i32 %1940, 0
  br i1 %1941, label %1942, label %1956

; <label>:1942                                    ; preds = %1938
  %1943 = load i32* %ch, align 4
  %1944 = and i32 %1943, -128
  %1945 = icmp eq i32 %1944, 0
  br i1 %1945, label %1946, label %1956

; <label>:1946                                    ; preds = %1942
  %1947 = load i32* %ch, align 4
  %1948 = sext i32 %1947 to i64
  %1949 = call i16** @__ctype_b_loc() nounwind readnone
  %1950 = load i16** %1949, align 8
  %1951 = getelementptr inbounds i16* %1950, i64 %1948
  %1952 = load i16* %1951, align 2
  %1953 = zext i16 %1952 to i32
  %1954 = and i32 %1953, 8
  %1955 = icmp ne i32 %1954, 0
  br i1 %1955, label %2154, label %1956

; <label>:1956                                    ; preds = %1946, %1942, %1938
  %1957 = load i8* %is_alpha, align 1
  %1958 = sext i8 %1957 to i32
  %1959 = icmp ne i32 %1958, 0
  br i1 %1959, label %1960, label %1974

; <label>:1960                                    ; preds = %1956
  %1961 = load i32* %ch, align 4
  %1962 = and i32 %1961, -128
  %1963 = icmp eq i32 %1962, 0
  br i1 %1963, label %1964, label %1974

; <label>:1964                                    ; preds = %1960
  %1965 = load i32* %ch, align 4
  %1966 = sext i32 %1965 to i64
  %1967 = call i16** @__ctype_b_loc() nounwind readnone
  %1968 = load i16** %1967, align 8
  %1969 = getelementptr inbounds i16* %1968, i64 %1966
  %1970 = load i16* %1969, align 2
  %1971 = zext i16 %1970 to i32
  %1972 = and i32 %1971, 1024
  %1973 = icmp ne i32 %1972, 0
  br i1 %1973, label %2154, label %1974

; <label>:1974                                    ; preds = %1964, %1960, %1956
  %1975 = load i8* %is_blank, align 1
  %1976 = sext i8 %1975 to i32
  %1977 = icmp ne i32 %1976, 0
  br i1 %1977, label %1978, label %1992

; <label>:1978                                    ; preds = %1974
  %1979 = load i32* %ch, align 4
  %1980 = and i32 %1979, -128
  %1981 = icmp eq i32 %1980, 0
  br i1 %1981, label %1982, label %1992

; <label>:1982                                    ; preds = %1978
  %1983 = load i32* %ch, align 4
  %1984 = sext i32 %1983 to i64
  %1985 = call i16** @__ctype_b_loc() nounwind readnone
  %1986 = load i16** %1985, align 8
  %1987 = getelementptr inbounds i16* %1986, i64 %1984
  %1988 = load i16* %1987, align 2
  %1989 = zext i16 %1988 to i32
  %1990 = and i32 %1989, 1
  %1991 = icmp ne i32 %1990, 0
  br i1 %1991, label %2154, label %1992

; <label>:1992                                    ; preds = %1982, %1978, %1974
  %1993 = load i8* %is_cntrl, align 1
  %1994 = sext i8 %1993 to i32
  %1995 = icmp ne i32 %1994, 0
  br i1 %1995, label %1996, label %2010

; <label>:1996                                    ; preds = %1992
  %1997 = load i32* %ch, align 4
  %1998 = and i32 %1997, -128
  %1999 = icmp eq i32 %1998, 0
  br i1 %1999, label %2000, label %2010

; <label>:2000                                    ; preds = %1996
  %2001 = load i32* %ch, align 4
  %2002 = sext i32 %2001 to i64
  %2003 = call i16** @__ctype_b_loc() nounwind readnone
  %2004 = load i16** %2003, align 8
  %2005 = getelementptr inbounds i16* %2004, i64 %2002
  %2006 = load i16* %2005, align 2
  %2007 = zext i16 %2006 to i32
  %2008 = and i32 %2007, 2
  %2009 = icmp ne i32 %2008, 0
  br i1 %2009, label %2154, label %2010

; <label>:2010                                    ; preds = %2000, %1996, %1992
  %2011 = load i8* %is_digit, align 1
  %2012 = sext i8 %2011 to i32
  %2013 = icmp ne i32 %2012, 0
  br i1 %2013, label %2014, label %2028

; <label>:2014                                    ; preds = %2010
  %2015 = load i32* %ch, align 4
  %2016 = and i32 %2015, -128
  %2017 = icmp eq i32 %2016, 0
  br i1 %2017, label %2018, label %2028

; <label>:2018                                    ; preds = %2014
  %2019 = load i32* %ch, align 4
  %2020 = sext i32 %2019 to i64
  %2021 = call i16** @__ctype_b_loc() nounwind readnone
  %2022 = load i16** %2021, align 8
  %2023 = getelementptr inbounds i16* %2022, i64 %2020
  %2024 = load i16* %2023, align 2
  %2025 = zext i16 %2024 to i32
  %2026 = and i32 %2025, 2048
  %2027 = icmp ne i32 %2026, 0
  br i1 %2027, label %2154, label %2028

; <label>:2028                                    ; preds = %2018, %2014, %2010
  %2029 = load i8* %is_graph, align 1
  %2030 = sext i8 %2029 to i32
  %2031 = icmp ne i32 %2030, 0
  br i1 %2031, label %2032, label %2046

; <label>:2032                                    ; preds = %2028
  %2033 = load i32* %ch, align 4
  %2034 = and i32 %2033, -128
  %2035 = icmp eq i32 %2034, 0
  br i1 %2035, label %2036, label %2046

; <label>:2036                                    ; preds = %2032
  %2037 = load i32* %ch, align 4
  %2038 = sext i32 %2037 to i64
  %2039 = call i16** @__ctype_b_loc() nounwind readnone
  %2040 = load i16** %2039, align 8
  %2041 = getelementptr inbounds i16* %2040, i64 %2038
  %2042 = load i16* %2041, align 2
  %2043 = zext i16 %2042 to i32
  %2044 = and i32 %2043, 32768
  %2045 = icmp ne i32 %2044, 0
  br i1 %2045, label %2154, label %2046

; <label>:2046                                    ; preds = %2036, %2032, %2028
  %2047 = load i8* %is_lower, align 1
  %2048 = sext i8 %2047 to i32
  %2049 = icmp ne i32 %2048, 0
  br i1 %2049, label %2050, label %2064

; <label>:2050                                    ; preds = %2046
  %2051 = load i32* %ch, align 4
  %2052 = and i32 %2051, -128
  %2053 = icmp eq i32 %2052, 0
  br i1 %2053, label %2054, label %2064

; <label>:2054                                    ; preds = %2050
  %2055 = load i32* %ch, align 4
  %2056 = sext i32 %2055 to i64
  %2057 = call i16** @__ctype_b_loc() nounwind readnone
  %2058 = load i16** %2057, align 8
  %2059 = getelementptr inbounds i16* %2058, i64 %2056
  %2060 = load i16* %2059, align 2
  %2061 = zext i16 %2060 to i32
  %2062 = and i32 %2061, 512
  %2063 = icmp ne i32 %2062, 0
  br i1 %2063, label %2154, label %2064

; <label>:2064                                    ; preds = %2054, %2050, %2046
  %2065 = load i8* %is_print, align 1
  %2066 = sext i8 %2065 to i32
  %2067 = icmp ne i32 %2066, 0
  br i1 %2067, label %2068, label %2082

; <label>:2068                                    ; preds = %2064
  %2069 = load i32* %ch, align 4
  %2070 = and i32 %2069, -128
  %2071 = icmp eq i32 %2070, 0
  br i1 %2071, label %2072, label %2082

; <label>:2072                                    ; preds = %2068
  %2073 = load i32* %ch, align 4
  %2074 = sext i32 %2073 to i64
  %2075 = call i16** @__ctype_b_loc() nounwind readnone
  %2076 = load i16** %2075, align 8
  %2077 = getelementptr inbounds i16* %2076, i64 %2074
  %2078 = load i16* %2077, align 2
  %2079 = zext i16 %2078 to i32
  %2080 = and i32 %2079, 16384
  %2081 = icmp ne i32 %2080, 0
  br i1 %2081, label %2154, label %2082

; <label>:2082                                    ; preds = %2072, %2068, %2064
  %2083 = load i8* %is_punct, align 1
  %2084 = sext i8 %2083 to i32
  %2085 = icmp ne i32 %2084, 0
  br i1 %2085, label %2086, label %2100

; <label>:2086                                    ; preds = %2082
  %2087 = load i32* %ch, align 4
  %2088 = and i32 %2087, -128
  %2089 = icmp eq i32 %2088, 0
  br i1 %2089, label %2090, label %2100

; <label>:2090                                    ; preds = %2086
  %2091 = load i32* %ch, align 4
  %2092 = sext i32 %2091 to i64
  %2093 = call i16** @__ctype_b_loc() nounwind readnone
  %2094 = load i16** %2093, align 8
  %2095 = getelementptr inbounds i16* %2094, i64 %2092
  %2096 = load i16* %2095, align 2
  %2097 = zext i16 %2096 to i32
  %2098 = and i32 %2097, 4
  %2099 = icmp ne i32 %2098, 0
  br i1 %2099, label %2154, label %2100

; <label>:2100                                    ; preds = %2090, %2086, %2082
  %2101 = load i8* %is_space, align 1
  %2102 = sext i8 %2101 to i32
  %2103 = icmp ne i32 %2102, 0
  br i1 %2103, label %2104, label %2118

; <label>:2104                                    ; preds = %2100
  %2105 = load i32* %ch, align 4
  %2106 = and i32 %2105, -128
  %2107 = icmp eq i32 %2106, 0
  br i1 %2107, label %2108, label %2118

; <label>:2108                                    ; preds = %2104
  %2109 = load i32* %ch, align 4
  %2110 = sext i32 %2109 to i64
  %2111 = call i16** @__ctype_b_loc() nounwind readnone
  %2112 = load i16** %2111, align 8
  %2113 = getelementptr inbounds i16* %2112, i64 %2110
  %2114 = load i16* %2113, align 2
  %2115 = zext i16 %2114 to i32
  %2116 = and i32 %2115, 8192
  %2117 = icmp ne i32 %2116, 0
  br i1 %2117, label %2154, label %2118

; <label>:2118                                    ; preds = %2108, %2104, %2100
  %2119 = load i8* %is_upper, align 1
  %2120 = sext i8 %2119 to i32
  %2121 = icmp ne i32 %2120, 0
  br i1 %2121, label %2122, label %2136

; <label>:2122                                    ; preds = %2118
  %2123 = load i32* %ch, align 4
  %2124 = and i32 %2123, -128
  %2125 = icmp eq i32 %2124, 0
  br i1 %2125, label %2126, label %2136

; <label>:2126                                    ; preds = %2122
  %2127 = load i32* %ch, align 4
  %2128 = sext i32 %2127 to i64
  %2129 = call i16** @__ctype_b_loc() nounwind readnone
  %2130 = load i16** %2129, align 8
  %2131 = getelementptr inbounds i16* %2130, i64 %2128
  %2132 = load i16* %2131, align 2
  %2133 = zext i16 %2132 to i32
  %2134 = and i32 %2133, 256
  %2135 = icmp ne i32 %2134, 0
  br i1 %2135, label %2154, label %2136

; <label>:2136                                    ; preds = %2126, %2122, %2118
  %2137 = load i8* %is_xdigit, align 1
  %2138 = sext i8 %2137 to i32
  %2139 = icmp ne i32 %2138, 0
  br i1 %2139, label %2140, label %2171

; <label>:2140                                    ; preds = %2136
  %2141 = load i32* %ch, align 4
  %2142 = and i32 %2141, -128
  %2143 = icmp eq i32 %2142, 0
  br i1 %2143, label %2144, label %2171

; <label>:2144                                    ; preds = %2140
  %2145 = load i32* %ch, align 4
  %2146 = sext i32 %2145 to i64
  %2147 = call i16** @__ctype_b_loc() nounwind readnone
  %2148 = load i16** %2147, align 8
  %2149 = getelementptr inbounds i16* %2148, i64 %2146
  %2150 = load i16* %2149, align 2
  %2151 = zext i16 %2150 to i32
  %2152 = and i32 %2151, 4096
  %2153 = icmp ne i32 %2152, 0
  br i1 %2153, label %2154, label %2171

; <label>:2154                                    ; preds = %2144, %2126, %2108, %2090, %2072, %2054, %2036, %2018, %2000, %1982, %1964, %1946
  %2155 = load i32* %ch, align 4
  %2156 = trunc i32 %2155 to i8
  %2157 = zext i8 %2156 to i32
  %2158 = srem i32 %2157, 8
  %2159 = shl i32 1, %2158
  %2160 = load i32* %ch, align 4
  %2161 = trunc i32 %2160 to i8
  %2162 = zext i8 %2161 to i32
  %2163 = sdiv i32 %2162, 8
  %2164 = sext i32 %2163 to i64
  %2165 = load i8** %b, align 8
  %2166 = getelementptr inbounds i8* %2165, i64 %2164
  %2167 = load i8* %2166, align 1
  %2168 = zext i8 %2167 to i32
  %2169 = or i32 %2168, %2159
  %2170 = trunc i32 %2169 to i8
  store i8 %2170, i8* %2166, align 1
  br label %2171

; <label>:2171                                    ; preds = %2154, %2144, %2140, %2136
  br label %2172

; <label>:2172                                    ; preds = %2171
  %2173 = load i32* %ch, align 4
  %2174 = add nsw i32 %2173, 1
  store i32 %2174, i32* %ch, align 4
  br label %1935

; <label>:2175                                    ; preds = %1935
  store i8 1, i8* %had_char_class, align 1
  br label %2199

; <label>:2176                                    ; preds = %1796, %1789
  %2177 = load i8* %c1, align 1
  %2178 = add i8 %2177, 1
  store i8 %2178, i8* %c1, align 1
  br label %2179

; <label>:2179                                    ; preds = %2183, %2176
  %2180 = load i8* %c1, align 1
  %2181 = add i8 %2180, -1
  store i8 %2181, i8* %c1, align 1
  %2182 = icmp ne i8 %2180, 0
  br i1 %2182, label %2183, label %2186

; <label>:2183                                    ; preds = %2179
  %2184 = load i8** %p, align 8
  %2185 = getelementptr inbounds i8* %2184, i32 -1
  store i8* %2185, i8** %p, align 8
  br label %2179

; <label>:2186                                    ; preds = %2179
  %2187 = load i8** %b, align 8
  %2188 = getelementptr inbounds i8* %2187, i64 11
  %2189 = load i8* %2188, align 1
  %2190 = zext i8 %2189 to i32
  %2191 = or i32 %2190, 8
  %2192 = trunc i32 %2191 to i8
  store i8 %2192, i8* %2188, align 1
  %2193 = load i8** %b, align 8
  %2194 = getelementptr inbounds i8* %2193, i64 7
  %2195 = load i8* %2194, align 1
  %2196 = zext i8 %2195 to i32
  %2197 = or i32 %2196, 4
  %2198 = trunc i32 %2197 to i8
  store i8 %2198, i8* %2194, align 1
  store i8 0, i8* %had_char_class, align 1
  br label %2199

; <label>:2199                                    ; preds = %2186, %2175
  br label %2215

; <label>:2200                                    ; preds = %1717, %1713, %1709
  store i8 0, i8* %had_char_class, align 1
  %2201 = load i8* %c, align 1
  %2202 = zext i8 %2201 to i32
  %2203 = srem i32 %2202, 8
  %2204 = shl i32 1, %2203
  %2205 = load i8* %c, align 1
  %2206 = zext i8 %2205 to i32
  %2207 = sdiv i32 %2206, 8
  %2208 = sext i32 %2207 to i64
  %2209 = load i8** %b, align 8
  %2210 = getelementptr inbounds i8* %2209, i64 %2208
  %2211 = load i8* %2210, align 1
  %2212 = zext i8 %2211 to i32
  %2213 = or i32 %2212, %2204
  %2214 = trunc i32 %2213 to i8
  store i8 %2214, i8* %2210, align 1
  br label %2215

; <label>:2215                                    ; preds = %2200, %2199
  br label %2216

; <label>:2216                                    ; preds = %2215, %1708
  br label %2217

; <label>:2217                                    ; preds = %2216, %1666
  br label %1524

; <label>:2218                                    ; preds = %1604
  br label %2219

; <label>:2219                                    ; preds = %2239, %2218
  %2220 = load i8** %b, align 8
  %2221 = getelementptr inbounds i8* %2220, i64 -1
  %2222 = load i8* %2221, align 1
  %2223 = zext i8 %2222 to i32
  %2224 = icmp sgt i32 %2223, 0
  br i1 %2224, label %2225, label %2237

; <label>:2225                                    ; preds = %2219
  %2226 = load i8** %b, align 8
  %2227 = getelementptr inbounds i8* %2226, i64 -1
  %2228 = load i8* %2227, align 1
  %2229 = zext i8 %2228 to i32
  %2230 = sub nsw i32 %2229, 1
  %2231 = sext i32 %2230 to i64
  %2232 = load i8** %b, align 8
  %2233 = getelementptr inbounds i8* %2232, i64 %2231
  %2234 = load i8* %2233, align 1
  %2235 = zext i8 %2234 to i32
  %2236 = icmp eq i32 %2235, 0
  br label %2237

; <label>:2237                                    ; preds = %2225, %2219
  %2238 = phi i1 [ false, %2219 ], [ %2236, %2225 ]
  br i1 %2238, label %2239, label %2244

; <label>:2239                                    ; preds = %2237
  %2240 = load i8** %b, align 8
  %2241 = getelementptr inbounds i8* %2240, i64 -1
  %2242 = load i8* %2241, align 1
  %2243 = add i8 %2242, -1
  store i8 %2243, i8* %2241, align 1
  br label %2219

; <label>:2244                                    ; preds = %2237
  %2245 = load i8** %b, align 8
  %2246 = getelementptr inbounds i8* %2245, i64 -1
  %2247 = load i8* %2246, align 1
  %2248 = zext i8 %2247 to i32
  %2249 = load i8** %b, align 8
  %2250 = sext i32 %2248 to i64
  %2251 = getelementptr inbounds i8* %2249, i64 %2250
  store i8* %2251, i8** %b, align 8
  br label %5318

; <label>:2252                                    ; preds = %105
  %2253 = load i32* %4, align 4
  %2254 = and i32 %2253, 8192
  %2255 = icmp ne i32 %2254, 0
  br i1 %2255, label %2256, label %2257

; <label>:2256                                    ; preds = %2252
  br label %2310

; <label>:2257                                    ; preds = %2252
  br label %4981

; <label>:2258                                    ; preds = %105
  %2259 = load i32* %4, align 4
  %2260 = and i32 %2259, 8192
  %2261 = icmp ne i32 %2260, 0
  br i1 %2261, label %2262, label %2263

; <label>:2262                                    ; preds = %2258
  br label %2570

; <label>:2263                                    ; preds = %2258
  br label %4981

; <label>:2264                                    ; preds = %105
  %2265 = load i32* %4, align 4
  %2266 = and i32 %2265, 2048
  %2267 = icmp ne i32 %2266, 0
  br i1 %2267, label %2268, label %2269

; <label>:2268                                    ; preds = %2264
  br label %2941

; <label>:2269                                    ; preds = %2264
  br label %4981

; <label>:2270                                    ; preds = %105
  %2271 = load i32* %4, align 4
  %2272 = and i32 %2271, 32768
  %2273 = icmp ne i32 %2272, 0
  br i1 %2273, label %2274, label %2275

; <label>:2274                                    ; preds = %2270
  br label %2941

; <label>:2275                                    ; preds = %2270
  br label %4981

; <label>:2276                                    ; preds = %105
  %2277 = load i32* %4, align 4
  %2278 = and i32 %2277, 512
  %2279 = icmp ne i32 %2278, 0
  br i1 %2279, label %2280, label %2285

; <label>:2280                                    ; preds = %2276
  %2281 = load i32* %4, align 4
  %2282 = and i32 %2281, 4096
  %2283 = icmp ne i32 %2282, 0
  br i1 %2283, label %2284, label %2285

; <label>:2284                                    ; preds = %2280
  br label %3230

; <label>:2285                                    ; preds = %2280, %2276
  br label %4981

; <label>:2286                                    ; preds = %105
  %2287 = load i8** %p, align 8
  %2288 = load i8** %pend, align 8
  %2289 = icmp eq i8* %2287, %2288
  br i1 %2289, label %2290, label %2291

; <label>:2290                                    ; preds = %2286
  store i32 5, i32* %1
  br label %5348

; <label>:2291                                    ; preds = %2286
  br label %2292

; <label>:2292                                    ; preds = %2291
  %2293 = load i8** %p, align 8
  %2294 = load i8** %pend, align 8
  %2295 = icmp eq i8* %2293, %2294
  br i1 %2295, label %2296, label %2297

; <label>:2296                                    ; preds = %2292
  store i32 14, i32* %1
  br label %5348

; <label>:2297                                    ; preds = %2292
  %2298 = load i8** %p, align 8
  %2299 = getelementptr inbounds i8* %2298, i32 1
  store i8* %2299, i8** %p, align 8
  %2300 = load i8* %2298, align 1
  store i8 %2300, i8* %c, align 1
  br label %2301

; <label>:2301                                    ; preds = %2297
  %2302 = load i8* %c, align 1
  %2303 = zext i8 %2302 to i32
  switch i32 %2303, label %4962 [
    i32 40, label %2304
    i32 41, label %2554
    i32 124, label %2931
    i32 123, label %3207
    i32 119, label %3826
    i32 87, label %3949
    i32 60, label %4072
    i32 62, label %4194
    i32 98, label %4316
    i32 66, label %4438
    i32 96, label %4560
    i32 39, label %4682
    i32 49, label %4804
    i32 50, label %4804
    i32 51, label %4804
    i32 52, label %4804
    i32 53, label %4804
    i32 54, label %4804
    i32 55, label %4804
    i32 56, label %4804
    i32 57, label %4804
    i32 43, label %4956
    i32 63, label %4956
  ]

; <label>:2304                                    ; preds = %2301
  %2305 = load i32* %4, align 4
  %2306 = and i32 %2305, 8192
  %2307 = icmp ne i32 %2306, 0
  br i1 %2307, label %2308, label %2309

; <label>:2308                                    ; preds = %2304
  br label %4963

; <label>:2309                                    ; preds = %2304
  br label %2310

; <label>:2310                                    ; preds = %2309, %2256
  %2311 = load %struct.re_pattern_buffer** %5, align 8
  %2312 = getelementptr inbounds %struct.re_pattern_buffer* %2311, i32 0, i32 6
  %2313 = load i64* %2312, align 8
  %2314 = add i64 %2313, 1
  store i64 %2314, i64* %2312, align 8
  %2315 = load i32* %regnum, align 4
  %2316 = add i32 %2315, 1
  store i32 %2316, i32* %regnum, align 4
  %2317 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2318 = load i32* %2317, align 4
  %2319 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 1
  %2320 = load i32* %2319, align 4
  %2321 = icmp eq i32 %2318, %2320
  br i1 %2321, label %2322, label %2342

; <label>:2322                                    ; preds = %2310
  %2323 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2324 = load %struct.compile_stack_elt_t** %2323, align 8
  %2325 = bitcast %struct.compile_stack_elt_t* %2324 to i8*
  %2326 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 1
  %2327 = load i32* %2326, align 4
  %2328 = shl i32 %2327, 1
  %2329 = zext i32 %2328 to i64
  %2330 = mul i64 %2329, 20
  %2331 = call noalias i8* @realloc(i8* %2325, i64 %2330) nounwind
  %2332 = bitcast i8* %2331 to %struct.compile_stack_elt_t*
  %2333 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  store %struct.compile_stack_elt_t* %2332, %struct.compile_stack_elt_t** %2333, align 8
  %2334 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2335 = load %struct.compile_stack_elt_t** %2334, align 8
  %2336 = icmp eq %struct.compile_stack_elt_t* %2335, null
  br i1 %2336, label %2337, label %2338

; <label>:2337                                    ; preds = %2322
  store i32 12, i32* %1
  br label %5348

; <label>:2338                                    ; preds = %2322
  %2339 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 1
  %2340 = load i32* %2339, align 4
  %2341 = shl i32 %2340, 1
  store i32 %2341, i32* %2339, align 4
  br label %2342

; <label>:2342                                    ; preds = %2338, %2310
  %2343 = load i8** %begalt, align 8
  %2344 = load %struct.re_pattern_buffer** %5, align 8
  %2345 = getelementptr inbounds %struct.re_pattern_buffer* %2344, i32 0, i32 0
  %2346 = load i8** %2345, align 8
  %2347 = ptrtoint i8* %2343 to i64
  %2348 = ptrtoint i8* %2346 to i64
  %2349 = sub i64 %2347, %2348
  %2350 = trunc i64 %2349 to i32
  %2351 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2352 = load i32* %2351, align 4
  %2353 = zext i32 %2352 to i64
  %2354 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2355 = load %struct.compile_stack_elt_t** %2354, align 8
  %2356 = getelementptr inbounds %struct.compile_stack_elt_t* %2355, i64 %2353
  %2357 = getelementptr inbounds %struct.compile_stack_elt_t* %2356, i32 0, i32 0
  store i32 %2350, i32* %2357, align 4
  %2358 = load i8** %fixup_alt_jump, align 8
  %2359 = icmp ne i8* %2358, null
  br i1 %2359, label %2360, label %2369

; <label>:2360                                    ; preds = %2342
  %2361 = load i8** %fixup_alt_jump, align 8
  %2362 = load %struct.re_pattern_buffer** %5, align 8
  %2363 = getelementptr inbounds %struct.re_pattern_buffer* %2362, i32 0, i32 0
  %2364 = load i8** %2363, align 8
  %2365 = ptrtoint i8* %2361 to i64
  %2366 = ptrtoint i8* %2364 to i64
  %2367 = sub i64 %2365, %2366
  %2368 = add nsw i64 %2367, 1
  br label %2370

; <label>:2369                                    ; preds = %2342
  br label %2370

; <label>:2370                                    ; preds = %2369, %2360
  %2371 = phi i64 [ %2368, %2360 ], [ 0, %2369 ]
  %2372 = trunc i64 %2371 to i32
  %2373 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2374 = load i32* %2373, align 4
  %2375 = zext i32 %2374 to i64
  %2376 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2377 = load %struct.compile_stack_elt_t** %2376, align 8
  %2378 = getelementptr inbounds %struct.compile_stack_elt_t* %2377, i64 %2375
  %2379 = getelementptr inbounds %struct.compile_stack_elt_t* %2378, i32 0, i32 1
  store i32 %2372, i32* %2379, align 4
  %2380 = load i8** %b, align 8
  %2381 = load %struct.re_pattern_buffer** %5, align 8
  %2382 = getelementptr inbounds %struct.re_pattern_buffer* %2381, i32 0, i32 0
  %2383 = load i8** %2382, align 8
  %2384 = ptrtoint i8* %2380 to i64
  %2385 = ptrtoint i8* %2383 to i64
  %2386 = sub i64 %2384, %2385
  %2387 = trunc i64 %2386 to i32
  %2388 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2389 = load i32* %2388, align 4
  %2390 = zext i32 %2389 to i64
  %2391 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2392 = load %struct.compile_stack_elt_t** %2391, align 8
  %2393 = getelementptr inbounds %struct.compile_stack_elt_t* %2392, i64 %2390
  %2394 = getelementptr inbounds %struct.compile_stack_elt_t* %2393, i32 0, i32 3
  store i32 %2387, i32* %2394, align 4
  %2395 = load i32* %regnum, align 4
  %2396 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2397 = load i32* %2396, align 4
  %2398 = zext i32 %2397 to i64
  %2399 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2400 = load %struct.compile_stack_elt_t** %2399, align 8
  %2401 = getelementptr inbounds %struct.compile_stack_elt_t* %2400, i64 %2398
  %2402 = getelementptr inbounds %struct.compile_stack_elt_t* %2401, i32 0, i32 4
  store i32 %2395, i32* %2402, align 4
  %2403 = load i32* %regnum, align 4
  %2404 = icmp ule i32 %2403, 255
  br i1 %2404, label %2405, label %2549

; <label>:2405                                    ; preds = %2370
  %2406 = load i8** %b, align 8
  %2407 = load %struct.re_pattern_buffer** %5, align 8
  %2408 = getelementptr inbounds %struct.re_pattern_buffer* %2407, i32 0, i32 0
  %2409 = load i8** %2408, align 8
  %2410 = ptrtoint i8* %2406 to i64
  %2411 = ptrtoint i8* %2409 to i64
  %2412 = sub i64 %2410, %2411
  %2413 = add nsw i64 %2412, 2
  %2414 = trunc i64 %2413 to i32
  %2415 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2416 = load i32* %2415, align 4
  %2417 = zext i32 %2416 to i64
  %2418 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2419 = load %struct.compile_stack_elt_t** %2418, align 8
  %2420 = getelementptr inbounds %struct.compile_stack_elt_t* %2419, i64 %2417
  %2421 = getelementptr inbounds %struct.compile_stack_elt_t* %2420, i32 0, i32 2
  store i32 %2414, i32* %2421, align 4
  br label %2422

; <label>:2422                                    ; preds = %2405
  br label %2423

; <label>:2423                                    ; preds = %2538, %2422
  %2424 = load i8** %b, align 8
  %2425 = load %struct.re_pattern_buffer** %5, align 8
  %2426 = getelementptr inbounds %struct.re_pattern_buffer* %2425, i32 0, i32 0
  %2427 = load i8** %2426, align 8
  %2428 = ptrtoint i8* %2424 to i64
  %2429 = ptrtoint i8* %2427 to i64
  %2430 = sub i64 %2428, %2429
  %2431 = add nsw i64 %2430, 3
  %2432 = load %struct.re_pattern_buffer** %5, align 8
  %2433 = getelementptr inbounds %struct.re_pattern_buffer* %2432, i32 0, i32 1
  %2434 = load i64* %2433, align 8
  %2435 = icmp ugt i64 %2431, %2434
  br i1 %2435, label %2436, label %2539

; <label>:2436                                    ; preds = %2423
  br label %2437

; <label>:2437                                    ; preds = %2436
  %2438 = load %struct.re_pattern_buffer** %5, align 8
  %2439 = getelementptr inbounds %struct.re_pattern_buffer* %2438, i32 0, i32 0
  %2440 = load i8** %2439, align 8
  store i8* %2440, i8** %old_buffer10, align 8
  %2441 = load %struct.re_pattern_buffer** %5, align 8
  %2442 = getelementptr inbounds %struct.re_pattern_buffer* %2441, i32 0, i32 1
  %2443 = load i64* %2442, align 8
  %2444 = icmp eq i64 %2443, 65536
  br i1 %2444, label %2445, label %2446

; <label>:2445                                    ; preds = %2437
  store i32 15, i32* %1
  br label %5348

; <label>:2446                                    ; preds = %2437
  %2447 = load %struct.re_pattern_buffer** %5, align 8
  %2448 = getelementptr inbounds %struct.re_pattern_buffer* %2447, i32 0, i32 1
  %2449 = load i64* %2448, align 8
  %2450 = shl i64 %2449, 1
  store i64 %2450, i64* %2448, align 8
  %2451 = load %struct.re_pattern_buffer** %5, align 8
  %2452 = getelementptr inbounds %struct.re_pattern_buffer* %2451, i32 0, i32 1
  %2453 = load i64* %2452, align 8
  %2454 = icmp ugt i64 %2453, 65536
  br i1 %2454, label %2455, label %2458

; <label>:2455                                    ; preds = %2446
  %2456 = load %struct.re_pattern_buffer** %5, align 8
  %2457 = getelementptr inbounds %struct.re_pattern_buffer* %2456, i32 0, i32 1
  store i64 65536, i64* %2457, align 8
  br label %2458

; <label>:2458                                    ; preds = %2455, %2446
  %2459 = load %struct.re_pattern_buffer** %5, align 8
  %2460 = getelementptr inbounds %struct.re_pattern_buffer* %2459, i32 0, i32 0
  %2461 = load i8** %2460, align 8
  %2462 = load %struct.re_pattern_buffer** %5, align 8
  %2463 = getelementptr inbounds %struct.re_pattern_buffer* %2462, i32 0, i32 1
  %2464 = load i64* %2463, align 8
  %2465 = call noalias i8* @realloc(i8* %2461, i64 %2464) nounwind
  %2466 = load %struct.re_pattern_buffer** %5, align 8
  %2467 = getelementptr inbounds %struct.re_pattern_buffer* %2466, i32 0, i32 0
  store i8* %2465, i8** %2467, align 8
  %2468 = load %struct.re_pattern_buffer** %5, align 8
  %2469 = getelementptr inbounds %struct.re_pattern_buffer* %2468, i32 0, i32 0
  %2470 = load i8** %2469, align 8
  %2471 = icmp eq i8* %2470, null
  br i1 %2471, label %2472, label %2473

; <label>:2472                                    ; preds = %2458
  store i32 12, i32* %1
  br label %5348

; <label>:2473                                    ; preds = %2458
  %2474 = load i8** %old_buffer10, align 8
  %2475 = load %struct.re_pattern_buffer** %5, align 8
  %2476 = getelementptr inbounds %struct.re_pattern_buffer* %2475, i32 0, i32 0
  %2477 = load i8** %2476, align 8
  %2478 = icmp ne i8* %2474, %2477
  br i1 %2478, label %2479, label %2537

; <label>:2479                                    ; preds = %2473
  %2480 = load i8** %b, align 8
  %2481 = load i8** %old_buffer10, align 8
  %2482 = ptrtoint i8* %2480 to i64
  %2483 = ptrtoint i8* %2481 to i64
  %2484 = sub i64 %2482, %2483
  %2485 = load %struct.re_pattern_buffer** %5, align 8
  %2486 = getelementptr inbounds %struct.re_pattern_buffer* %2485, i32 0, i32 0
  %2487 = load i8** %2486, align 8
  %2488 = getelementptr inbounds i8* %2487, i64 %2484
  store i8* %2488, i8** %b, align 8
  %2489 = load i8** %begalt, align 8
  %2490 = load i8** %old_buffer10, align 8
  %2491 = ptrtoint i8* %2489 to i64
  %2492 = ptrtoint i8* %2490 to i64
  %2493 = sub i64 %2491, %2492
  %2494 = load %struct.re_pattern_buffer** %5, align 8
  %2495 = getelementptr inbounds %struct.re_pattern_buffer* %2494, i32 0, i32 0
  %2496 = load i8** %2495, align 8
  %2497 = getelementptr inbounds i8* %2496, i64 %2493
  store i8* %2497, i8** %begalt, align 8
  %2498 = load i8** %fixup_alt_jump, align 8
  %2499 = icmp ne i8* %2498, null
  br i1 %2499, label %2500, label %2510

; <label>:2500                                    ; preds = %2479
  %2501 = load i8** %fixup_alt_jump, align 8
  %2502 = load i8** %old_buffer10, align 8
  %2503 = ptrtoint i8* %2501 to i64
  %2504 = ptrtoint i8* %2502 to i64
  %2505 = sub i64 %2503, %2504
  %2506 = load %struct.re_pattern_buffer** %5, align 8
  %2507 = getelementptr inbounds %struct.re_pattern_buffer* %2506, i32 0, i32 0
  %2508 = load i8** %2507, align 8
  %2509 = getelementptr inbounds i8* %2508, i64 %2505
  store i8* %2509, i8** %fixup_alt_jump, align 8
  br label %2510

; <label>:2510                                    ; preds = %2500, %2479
  %2511 = load i8** %laststart, align 8
  %2512 = icmp ne i8* %2511, null
  br i1 %2512, label %2513, label %2523

; <label>:2513                                    ; preds = %2510
  %2514 = load i8** %laststart, align 8
  %2515 = load i8** %old_buffer10, align 8
  %2516 = ptrtoint i8* %2514 to i64
  %2517 = ptrtoint i8* %2515 to i64
  %2518 = sub i64 %2516, %2517
  %2519 = load %struct.re_pattern_buffer** %5, align 8
  %2520 = getelementptr inbounds %struct.re_pattern_buffer* %2519, i32 0, i32 0
  %2521 = load i8** %2520, align 8
  %2522 = getelementptr inbounds i8* %2521, i64 %2518
  store i8* %2522, i8** %laststart, align 8
  br label %2523

; <label>:2523                                    ; preds = %2513, %2510
  %2524 = load i8** %pending_exact, align 8
  %2525 = icmp ne i8* %2524, null
  br i1 %2525, label %2526, label %2536

; <label>:2526                                    ; preds = %2523
  %2527 = load i8** %pending_exact, align 8
  %2528 = load i8** %old_buffer10, align 8
  %2529 = ptrtoint i8* %2527 to i64
  %2530 = ptrtoint i8* %2528 to i64
  %2531 = sub i64 %2529, %2530
  %2532 = load %struct.re_pattern_buffer** %5, align 8
  %2533 = getelementptr inbounds %struct.re_pattern_buffer* %2532, i32 0, i32 0
  %2534 = load i8** %2533, align 8
  %2535 = getelementptr inbounds i8* %2534, i64 %2531
  store i8* %2535, i8** %pending_exact, align 8
  br label %2536

; <label>:2536                                    ; preds = %2526, %2523
  br label %2537

; <label>:2537                                    ; preds = %2536, %2473
  br label %2538

; <label>:2538                                    ; preds = %2537
  br label %2423

; <label>:2539                                    ; preds = %2423
  %2540 = load i8** %b, align 8
  %2541 = getelementptr inbounds i8* %2540, i32 1
  store i8* %2541, i8** %b, align 8
  store i8 5, i8* %2540, align 1
  %2542 = load i32* %regnum, align 4
  %2543 = trunc i32 %2542 to i8
  %2544 = load i8** %b, align 8
  %2545 = getelementptr inbounds i8* %2544, i32 1
  store i8* %2545, i8** %b, align 8
  store i8 %2543, i8* %2544, align 1
  %2546 = load i8** %b, align 8
  %2547 = getelementptr inbounds i8* %2546, i32 1
  store i8* %2547, i8** %b, align 8
  store i8 0, i8* %2546, align 1
  br label %2548

; <label>:2548                                    ; preds = %2539
  br label %2549

; <label>:2549                                    ; preds = %2548, %2370
  %2550 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2551 = load i32* %2550, align 4
  %2552 = add i32 %2551, 1
  store i32 %2552, i32* %2550, align 4
  store i8* null, i8** %fixup_alt_jump, align 8
  store i8* null, i8** %laststart, align 8
  %2553 = load i8** %b, align 8
  store i8* %2553, i8** %begalt, align 8
  store i8* null, i8** %pending_exact, align 8
  br label %4979

; <label>:2554                                    ; preds = %2301
  %2555 = load i32* %4, align 4
  %2556 = and i32 %2555, 8192
  %2557 = icmp ne i32 %2556, 0
  br i1 %2557, label %2558, label %2559

; <label>:2558                                    ; preds = %2554
  br label %4963

; <label>:2559                                    ; preds = %2554
  %2560 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2561 = load i32* %2560, align 4
  %2562 = icmp eq i32 %2561, 0
  br i1 %2562, label %2563, label %2569

; <label>:2563                                    ; preds = %2559
  %2564 = load i32* %4, align 4
  %2565 = and i32 %2564, 131072
  %2566 = icmp ne i32 %2565, 0
  br i1 %2566, label %2567, label %2568

; <label>:2567                                    ; preds = %2563
  br label %4963

; <label>:2568                                    ; preds = %2563
  store i32 16, i32* %1
  br label %5348

; <label>:2569                                    ; preds = %2559
  br label %2570

; <label>:2570                                    ; preds = %2569, %2262
  %2571 = load i8** %fixup_alt_jump, align 8
  %2572 = icmp ne i8* %2571, null
  br i1 %2572, label %2573, label %2703

; <label>:2573                                    ; preds = %2570
  br label %2574

; <label>:2574                                    ; preds = %2573
  br label %2575

; <label>:2575                                    ; preds = %2690, %2574
  %2576 = load i8** %b, align 8
  %2577 = load %struct.re_pattern_buffer** %5, align 8
  %2578 = getelementptr inbounds %struct.re_pattern_buffer* %2577, i32 0, i32 0
  %2579 = load i8** %2578, align 8
  %2580 = ptrtoint i8* %2576 to i64
  %2581 = ptrtoint i8* %2579 to i64
  %2582 = sub i64 %2580, %2581
  %2583 = add nsw i64 %2582, 1
  %2584 = load %struct.re_pattern_buffer** %5, align 8
  %2585 = getelementptr inbounds %struct.re_pattern_buffer* %2584, i32 0, i32 1
  %2586 = load i64* %2585, align 8
  %2587 = icmp ugt i64 %2583, %2586
  br i1 %2587, label %2588, label %2691

; <label>:2588                                    ; preds = %2575
  br label %2589

; <label>:2589                                    ; preds = %2588
  %2590 = load %struct.re_pattern_buffer** %5, align 8
  %2591 = getelementptr inbounds %struct.re_pattern_buffer* %2590, i32 0, i32 0
  %2592 = load i8** %2591, align 8
  store i8* %2592, i8** %old_buffer11, align 8
  %2593 = load %struct.re_pattern_buffer** %5, align 8
  %2594 = getelementptr inbounds %struct.re_pattern_buffer* %2593, i32 0, i32 1
  %2595 = load i64* %2594, align 8
  %2596 = icmp eq i64 %2595, 65536
  br i1 %2596, label %2597, label %2598

; <label>:2597                                    ; preds = %2589
  store i32 15, i32* %1
  br label %5348

; <label>:2598                                    ; preds = %2589
  %2599 = load %struct.re_pattern_buffer** %5, align 8
  %2600 = getelementptr inbounds %struct.re_pattern_buffer* %2599, i32 0, i32 1
  %2601 = load i64* %2600, align 8
  %2602 = shl i64 %2601, 1
  store i64 %2602, i64* %2600, align 8
  %2603 = load %struct.re_pattern_buffer** %5, align 8
  %2604 = getelementptr inbounds %struct.re_pattern_buffer* %2603, i32 0, i32 1
  %2605 = load i64* %2604, align 8
  %2606 = icmp ugt i64 %2605, 65536
  br i1 %2606, label %2607, label %2610

; <label>:2607                                    ; preds = %2598
  %2608 = load %struct.re_pattern_buffer** %5, align 8
  %2609 = getelementptr inbounds %struct.re_pattern_buffer* %2608, i32 0, i32 1
  store i64 65536, i64* %2609, align 8
  br label %2610

; <label>:2610                                    ; preds = %2607, %2598
  %2611 = load %struct.re_pattern_buffer** %5, align 8
  %2612 = getelementptr inbounds %struct.re_pattern_buffer* %2611, i32 0, i32 0
  %2613 = load i8** %2612, align 8
  %2614 = load %struct.re_pattern_buffer** %5, align 8
  %2615 = getelementptr inbounds %struct.re_pattern_buffer* %2614, i32 0, i32 1
  %2616 = load i64* %2615, align 8
  %2617 = call noalias i8* @realloc(i8* %2613, i64 %2616) nounwind
  %2618 = load %struct.re_pattern_buffer** %5, align 8
  %2619 = getelementptr inbounds %struct.re_pattern_buffer* %2618, i32 0, i32 0
  store i8* %2617, i8** %2619, align 8
  %2620 = load %struct.re_pattern_buffer** %5, align 8
  %2621 = getelementptr inbounds %struct.re_pattern_buffer* %2620, i32 0, i32 0
  %2622 = load i8** %2621, align 8
  %2623 = icmp eq i8* %2622, null
  br i1 %2623, label %2624, label %2625

; <label>:2624                                    ; preds = %2610
  store i32 12, i32* %1
  br label %5348

; <label>:2625                                    ; preds = %2610
  %2626 = load i8** %old_buffer11, align 8
  %2627 = load %struct.re_pattern_buffer** %5, align 8
  %2628 = getelementptr inbounds %struct.re_pattern_buffer* %2627, i32 0, i32 0
  %2629 = load i8** %2628, align 8
  %2630 = icmp ne i8* %2626, %2629
  br i1 %2630, label %2631, label %2689

; <label>:2631                                    ; preds = %2625
  %2632 = load i8** %b, align 8
  %2633 = load i8** %old_buffer11, align 8
  %2634 = ptrtoint i8* %2632 to i64
  %2635 = ptrtoint i8* %2633 to i64
  %2636 = sub i64 %2634, %2635
  %2637 = load %struct.re_pattern_buffer** %5, align 8
  %2638 = getelementptr inbounds %struct.re_pattern_buffer* %2637, i32 0, i32 0
  %2639 = load i8** %2638, align 8
  %2640 = getelementptr inbounds i8* %2639, i64 %2636
  store i8* %2640, i8** %b, align 8
  %2641 = load i8** %begalt, align 8
  %2642 = load i8** %old_buffer11, align 8
  %2643 = ptrtoint i8* %2641 to i64
  %2644 = ptrtoint i8* %2642 to i64
  %2645 = sub i64 %2643, %2644
  %2646 = load %struct.re_pattern_buffer** %5, align 8
  %2647 = getelementptr inbounds %struct.re_pattern_buffer* %2646, i32 0, i32 0
  %2648 = load i8** %2647, align 8
  %2649 = getelementptr inbounds i8* %2648, i64 %2645
  store i8* %2649, i8** %begalt, align 8
  %2650 = load i8** %fixup_alt_jump, align 8
  %2651 = icmp ne i8* %2650, null
  br i1 %2651, label %2652, label %2662

; <label>:2652                                    ; preds = %2631
  %2653 = load i8** %fixup_alt_jump, align 8
  %2654 = load i8** %old_buffer11, align 8
  %2655 = ptrtoint i8* %2653 to i64
  %2656 = ptrtoint i8* %2654 to i64
  %2657 = sub i64 %2655, %2656
  %2658 = load %struct.re_pattern_buffer** %5, align 8
  %2659 = getelementptr inbounds %struct.re_pattern_buffer* %2658, i32 0, i32 0
  %2660 = load i8** %2659, align 8
  %2661 = getelementptr inbounds i8* %2660, i64 %2657
  store i8* %2661, i8** %fixup_alt_jump, align 8
  br label %2662

; <label>:2662                                    ; preds = %2652, %2631
  %2663 = load i8** %laststart, align 8
  %2664 = icmp ne i8* %2663, null
  br i1 %2664, label %2665, label %2675

; <label>:2665                                    ; preds = %2662
  %2666 = load i8** %laststart, align 8
  %2667 = load i8** %old_buffer11, align 8
  %2668 = ptrtoint i8* %2666 to i64
  %2669 = ptrtoint i8* %2667 to i64
  %2670 = sub i64 %2668, %2669
  %2671 = load %struct.re_pattern_buffer** %5, align 8
  %2672 = getelementptr inbounds %struct.re_pattern_buffer* %2671, i32 0, i32 0
  %2673 = load i8** %2672, align 8
  %2674 = getelementptr inbounds i8* %2673, i64 %2670
  store i8* %2674, i8** %laststart, align 8
  br label %2675

; <label>:2675                                    ; preds = %2665, %2662
  %2676 = load i8** %pending_exact, align 8
  %2677 = icmp ne i8* %2676, null
  br i1 %2677, label %2678, label %2688

; <label>:2678                                    ; preds = %2675
  %2679 = load i8** %pending_exact, align 8
  %2680 = load i8** %old_buffer11, align 8
  %2681 = ptrtoint i8* %2679 to i64
  %2682 = ptrtoint i8* %2680 to i64
  %2683 = sub i64 %2681, %2682
  %2684 = load %struct.re_pattern_buffer** %5, align 8
  %2685 = getelementptr inbounds %struct.re_pattern_buffer* %2684, i32 0, i32 0
  %2686 = load i8** %2685, align 8
  %2687 = getelementptr inbounds i8* %2686, i64 %2683
  store i8* %2687, i8** %pending_exact, align 8
  br label %2688

; <label>:2688                                    ; preds = %2678, %2675
  br label %2689

; <label>:2689                                    ; preds = %2688, %2625
  br label %2690

; <label>:2690                                    ; preds = %2689
  br label %2575

; <label>:2691                                    ; preds = %2575
  %2692 = load i8** %b, align 8
  %2693 = getelementptr inbounds i8* %2692, i32 1
  store i8* %2693, i8** %b, align 8
  store i8 19, i8* %2692, align 1
  br label %2694

; <label>:2694                                    ; preds = %2691
  %2695 = load i8** %fixup_alt_jump, align 8
  %2696 = load i8** %b, align 8
  %2697 = getelementptr inbounds i8* %2696, i64 -1
  %2698 = load i8** %fixup_alt_jump, align 8
  %2699 = ptrtoint i8* %2697 to i64
  %2700 = ptrtoint i8* %2698 to i64
  %2701 = sub i64 %2699, %2700
  %2702 = sub nsw i64 %2701, 3
  call void (...)* bitcast (void (i32, i8*, i32)* @store_op1 to void (...)*)(i32 13, i8* %2695, i64 %2702)
  br label %2703

; <label>:2703                                    ; preds = %2694, %2570
  %2704 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2705 = load i32* %2704, align 4
  %2706 = icmp eq i32 %2705, 0
  br i1 %2706, label %2707, label %2713

; <label>:2707                                    ; preds = %2703
  %2708 = load i32* %4, align 4
  %2709 = and i32 %2708, 131072
  %2710 = icmp ne i32 %2709, 0
  br i1 %2710, label %2711, label %2712

; <label>:2711                                    ; preds = %2707
  br label %4981

; <label>:2712                                    ; preds = %2707
  store i32 16, i32* %1
  br label %5348

; <label>:2713                                    ; preds = %2703
  %2714 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2715 = load i32* %2714, align 4
  %2716 = add i32 %2715, -1
  store i32 %2716, i32* %2714, align 4
  %2717 = load %struct.re_pattern_buffer** %5, align 8
  %2718 = getelementptr inbounds %struct.re_pattern_buffer* %2717, i32 0, i32 0
  %2719 = load i8** %2718, align 8
  %2720 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2721 = load i32* %2720, align 4
  %2722 = zext i32 %2721 to i64
  %2723 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2724 = load %struct.compile_stack_elt_t** %2723, align 8
  %2725 = getelementptr inbounds %struct.compile_stack_elt_t* %2724, i64 %2722
  %2726 = getelementptr inbounds %struct.compile_stack_elt_t* %2725, i32 0, i32 0
  %2727 = load i32* %2726, align 4
  %2728 = sext i32 %2727 to i64
  %2729 = getelementptr inbounds i8* %2719, i64 %2728
  store i8* %2729, i8** %begalt, align 8
  %2730 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2731 = load i32* %2730, align 4
  %2732 = zext i32 %2731 to i64
  %2733 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2734 = load %struct.compile_stack_elt_t** %2733, align 8
  %2735 = getelementptr inbounds %struct.compile_stack_elt_t* %2734, i64 %2732
  %2736 = getelementptr inbounds %struct.compile_stack_elt_t* %2735, i32 0, i32 1
  %2737 = load i32* %2736, align 4
  %2738 = icmp ne i32 %2737, 0
  br i1 %2738, label %2739, label %2754

; <label>:2739                                    ; preds = %2713
  %2740 = load %struct.re_pattern_buffer** %5, align 8
  %2741 = getelementptr inbounds %struct.re_pattern_buffer* %2740, i32 0, i32 0
  %2742 = load i8** %2741, align 8
  %2743 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2744 = load i32* %2743, align 4
  %2745 = zext i32 %2744 to i64
  %2746 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2747 = load %struct.compile_stack_elt_t** %2746, align 8
  %2748 = getelementptr inbounds %struct.compile_stack_elt_t* %2747, i64 %2745
  %2749 = getelementptr inbounds %struct.compile_stack_elt_t* %2748, i32 0, i32 1
  %2750 = load i32* %2749, align 4
  %2751 = sext i32 %2750 to i64
  %2752 = getelementptr inbounds i8* %2742, i64 %2751
  %2753 = getelementptr inbounds i8* %2752, i64 -1
  br label %2755

; <label>:2754                                    ; preds = %2713
  br label %2755

; <label>:2755                                    ; preds = %2754, %2739
  %2756 = phi i8* [ %2753, %2739 ], [ null, %2754 ]
  store i8* %2756, i8** %fixup_alt_jump, align 8
  %2757 = load %struct.re_pattern_buffer** %5, align 8
  %2758 = getelementptr inbounds %struct.re_pattern_buffer* %2757, i32 0, i32 0
  %2759 = load i8** %2758, align 8
  %2760 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2761 = load i32* %2760, align 4
  %2762 = zext i32 %2761 to i64
  %2763 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2764 = load %struct.compile_stack_elt_t** %2763, align 8
  %2765 = getelementptr inbounds %struct.compile_stack_elt_t* %2764, i64 %2762
  %2766 = getelementptr inbounds %struct.compile_stack_elt_t* %2765, i32 0, i32 3
  %2767 = load i32* %2766, align 4
  %2768 = sext i32 %2767 to i64
  %2769 = getelementptr inbounds i8* %2759, i64 %2768
  store i8* %2769, i8** %laststart, align 8
  %2770 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2771 = load i32* %2770, align 4
  %2772 = zext i32 %2771 to i64
  %2773 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2774 = load %struct.compile_stack_elt_t** %2773, align 8
  %2775 = getelementptr inbounds %struct.compile_stack_elt_t* %2774, i64 %2772
  %2776 = getelementptr inbounds %struct.compile_stack_elt_t* %2775, i32 0, i32 4
  %2777 = load i32* %2776, align 4
  store i32 %2777, i32* %this_group_regnum, align 4
  store i8* null, i8** %pending_exact, align 8
  %2778 = load i32* %this_group_regnum, align 4
  %2779 = icmp ule i32 %2778, 255
  br i1 %2779, label %2780, label %2930

; <label>:2780                                    ; preds = %2755
  %2781 = load %struct.re_pattern_buffer** %5, align 8
  %2782 = getelementptr inbounds %struct.re_pattern_buffer* %2781, i32 0, i32 0
  %2783 = load i8** %2782, align 8
  %2784 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %2785 = load i32* %2784, align 4
  %2786 = zext i32 %2785 to i64
  %2787 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %2788 = load %struct.compile_stack_elt_t** %2787, align 8
  %2789 = getelementptr inbounds %struct.compile_stack_elt_t* %2788, i64 %2786
  %2790 = getelementptr inbounds %struct.compile_stack_elt_t* %2789, i32 0, i32 2
  %2791 = load i32* %2790, align 4
  %2792 = sext i32 %2791 to i64
  %2793 = getelementptr inbounds i8* %2783, i64 %2792
  store i8* %2793, i8** %inner_group_loc, align 8
  %2794 = load i32* %regnum, align 4
  %2795 = load i32* %this_group_regnum, align 4
  %2796 = sub i32 %2794, %2795
  %2797 = trunc i32 %2796 to i8
  %2798 = load i8** %inner_group_loc, align 8
  store i8 %2797, i8* %2798, align 1
  br label %2799

; <label>:2799                                    ; preds = %2780
  br label %2800

; <label>:2800                                    ; preds = %2915, %2799
  %2801 = load i8** %b, align 8
  %2802 = load %struct.re_pattern_buffer** %5, align 8
  %2803 = getelementptr inbounds %struct.re_pattern_buffer* %2802, i32 0, i32 0
  %2804 = load i8** %2803, align 8
  %2805 = ptrtoint i8* %2801 to i64
  %2806 = ptrtoint i8* %2804 to i64
  %2807 = sub i64 %2805, %2806
  %2808 = add nsw i64 %2807, 3
  %2809 = load %struct.re_pattern_buffer** %5, align 8
  %2810 = getelementptr inbounds %struct.re_pattern_buffer* %2809, i32 0, i32 1
  %2811 = load i64* %2810, align 8
  %2812 = icmp ugt i64 %2808, %2811
  br i1 %2812, label %2813, label %2916

; <label>:2813                                    ; preds = %2800
  br label %2814

; <label>:2814                                    ; preds = %2813
  %2815 = load %struct.re_pattern_buffer** %5, align 8
  %2816 = getelementptr inbounds %struct.re_pattern_buffer* %2815, i32 0, i32 0
  %2817 = load i8** %2816, align 8
  store i8* %2817, i8** %old_buffer12, align 8
  %2818 = load %struct.re_pattern_buffer** %5, align 8
  %2819 = getelementptr inbounds %struct.re_pattern_buffer* %2818, i32 0, i32 1
  %2820 = load i64* %2819, align 8
  %2821 = icmp eq i64 %2820, 65536
  br i1 %2821, label %2822, label %2823

; <label>:2822                                    ; preds = %2814
  store i32 15, i32* %1
  br label %5348

; <label>:2823                                    ; preds = %2814
  %2824 = load %struct.re_pattern_buffer** %5, align 8
  %2825 = getelementptr inbounds %struct.re_pattern_buffer* %2824, i32 0, i32 1
  %2826 = load i64* %2825, align 8
  %2827 = shl i64 %2826, 1
  store i64 %2827, i64* %2825, align 8
  %2828 = load %struct.re_pattern_buffer** %5, align 8
  %2829 = getelementptr inbounds %struct.re_pattern_buffer* %2828, i32 0, i32 1
  %2830 = load i64* %2829, align 8
  %2831 = icmp ugt i64 %2830, 65536
  br i1 %2831, label %2832, label %2835

; <label>:2832                                    ; preds = %2823
  %2833 = load %struct.re_pattern_buffer** %5, align 8
  %2834 = getelementptr inbounds %struct.re_pattern_buffer* %2833, i32 0, i32 1
  store i64 65536, i64* %2834, align 8
  br label %2835

; <label>:2835                                    ; preds = %2832, %2823
  %2836 = load %struct.re_pattern_buffer** %5, align 8
  %2837 = getelementptr inbounds %struct.re_pattern_buffer* %2836, i32 0, i32 0
  %2838 = load i8** %2837, align 8
  %2839 = load %struct.re_pattern_buffer** %5, align 8
  %2840 = getelementptr inbounds %struct.re_pattern_buffer* %2839, i32 0, i32 1
  %2841 = load i64* %2840, align 8
  %2842 = call noalias i8* @realloc(i8* %2838, i64 %2841) nounwind
  %2843 = load %struct.re_pattern_buffer** %5, align 8
  %2844 = getelementptr inbounds %struct.re_pattern_buffer* %2843, i32 0, i32 0
  store i8* %2842, i8** %2844, align 8
  %2845 = load %struct.re_pattern_buffer** %5, align 8
  %2846 = getelementptr inbounds %struct.re_pattern_buffer* %2845, i32 0, i32 0
  %2847 = load i8** %2846, align 8
  %2848 = icmp eq i8* %2847, null
  br i1 %2848, label %2849, label %2850

; <label>:2849                                    ; preds = %2835
  store i32 12, i32* %1
  br label %5348

; <label>:2850                                    ; preds = %2835
  %2851 = load i8** %old_buffer12, align 8
  %2852 = load %struct.re_pattern_buffer** %5, align 8
  %2853 = getelementptr inbounds %struct.re_pattern_buffer* %2852, i32 0, i32 0
  %2854 = load i8** %2853, align 8
  %2855 = icmp ne i8* %2851, %2854
  br i1 %2855, label %2856, label %2914

; <label>:2856                                    ; preds = %2850
  %2857 = load i8** %b, align 8
  %2858 = load i8** %old_buffer12, align 8
  %2859 = ptrtoint i8* %2857 to i64
  %2860 = ptrtoint i8* %2858 to i64
  %2861 = sub i64 %2859, %2860
  %2862 = load %struct.re_pattern_buffer** %5, align 8
  %2863 = getelementptr inbounds %struct.re_pattern_buffer* %2862, i32 0, i32 0
  %2864 = load i8** %2863, align 8
  %2865 = getelementptr inbounds i8* %2864, i64 %2861
  store i8* %2865, i8** %b, align 8
  %2866 = load i8** %begalt, align 8
  %2867 = load i8** %old_buffer12, align 8
  %2868 = ptrtoint i8* %2866 to i64
  %2869 = ptrtoint i8* %2867 to i64
  %2870 = sub i64 %2868, %2869
  %2871 = load %struct.re_pattern_buffer** %5, align 8
  %2872 = getelementptr inbounds %struct.re_pattern_buffer* %2871, i32 0, i32 0
  %2873 = load i8** %2872, align 8
  %2874 = getelementptr inbounds i8* %2873, i64 %2870
  store i8* %2874, i8** %begalt, align 8
  %2875 = load i8** %fixup_alt_jump, align 8
  %2876 = icmp ne i8* %2875, null
  br i1 %2876, label %2877, label %2887

; <label>:2877                                    ; preds = %2856
  %2878 = load i8** %fixup_alt_jump, align 8
  %2879 = load i8** %old_buffer12, align 8
  %2880 = ptrtoint i8* %2878 to i64
  %2881 = ptrtoint i8* %2879 to i64
  %2882 = sub i64 %2880, %2881
  %2883 = load %struct.re_pattern_buffer** %5, align 8
  %2884 = getelementptr inbounds %struct.re_pattern_buffer* %2883, i32 0, i32 0
  %2885 = load i8** %2884, align 8
  %2886 = getelementptr inbounds i8* %2885, i64 %2882
  store i8* %2886, i8** %fixup_alt_jump, align 8
  br label %2887

; <label>:2887                                    ; preds = %2877, %2856
  %2888 = load i8** %laststart, align 8
  %2889 = icmp ne i8* %2888, null
  br i1 %2889, label %2890, label %2900

; <label>:2890                                    ; preds = %2887
  %2891 = load i8** %laststart, align 8
  %2892 = load i8** %old_buffer12, align 8
  %2893 = ptrtoint i8* %2891 to i64
  %2894 = ptrtoint i8* %2892 to i64
  %2895 = sub i64 %2893, %2894
  %2896 = load %struct.re_pattern_buffer** %5, align 8
  %2897 = getelementptr inbounds %struct.re_pattern_buffer* %2896, i32 0, i32 0
  %2898 = load i8** %2897, align 8
  %2899 = getelementptr inbounds i8* %2898, i64 %2895
  store i8* %2899, i8** %laststart, align 8
  br label %2900

; <label>:2900                                    ; preds = %2890, %2887
  %2901 = load i8** %pending_exact, align 8
  %2902 = icmp ne i8* %2901, null
  br i1 %2902, label %2903, label %2913

; <label>:2903                                    ; preds = %2900
  %2904 = load i8** %pending_exact, align 8
  %2905 = load i8** %old_buffer12, align 8
  %2906 = ptrtoint i8* %2904 to i64
  %2907 = ptrtoint i8* %2905 to i64
  %2908 = sub i64 %2906, %2907
  %2909 = load %struct.re_pattern_buffer** %5, align 8
  %2910 = getelementptr inbounds %struct.re_pattern_buffer* %2909, i32 0, i32 0
  %2911 = load i8** %2910, align 8
  %2912 = getelementptr inbounds i8* %2911, i64 %2908
  store i8* %2912, i8** %pending_exact, align 8
  br label %2913

; <label>:2913                                    ; preds = %2903, %2900
  br label %2914

; <label>:2914                                    ; preds = %2913, %2850
  br label %2915

; <label>:2915                                    ; preds = %2914
  br label %2800

; <label>:2916                                    ; preds = %2800
  %2917 = load i8** %b, align 8
  %2918 = getelementptr inbounds i8* %2917, i32 1
  store i8* %2918, i8** %b, align 8
  store i8 6, i8* %2917, align 1
  %2919 = load i32* %this_group_regnum, align 4
  %2920 = trunc i32 %2919 to i8
  %2921 = load i8** %b, align 8
  %2922 = getelementptr inbounds i8* %2921, i32 1
  store i8* %2922, i8** %b, align 8
  store i8 %2920, i8* %2921, align 1
  %2923 = load i32* %regnum, align 4
  %2924 = load i32* %this_group_regnum, align 4
  %2925 = sub i32 %2923, %2924
  %2926 = trunc i32 %2925 to i8
  %2927 = load i8** %b, align 8
  %2928 = getelementptr inbounds i8* %2927, i32 1
  store i8* %2928, i8** %b, align 8
  store i8 %2926, i8* %2927, align 1
  br label %2929

; <label>:2929                                    ; preds = %2916
  br label %2930

; <label>:2930                                    ; preds = %2929, %2755
  br label %4979

; <label>:2931                                    ; preds = %2301
  %2932 = load i32* %4, align 4
  %2933 = and i32 %2932, 1024
  %2934 = icmp ne i32 %2933, 0
  br i1 %2934, label %2939, label %2935

; <label>:2935                                    ; preds = %2931
  %2936 = load i32* %4, align 4
  %2937 = and i32 %2936, 32768
  %2938 = icmp ne i32 %2937, 0
  br i1 %2938, label %2939, label %2940

; <label>:2939                                    ; preds = %2935, %2931
  br label %4963

; <label>:2940                                    ; preds = %2935
  br label %2941

; <label>:2941                                    ; preds = %2940, %2274, %2268
  %2942 = load i32* %4, align 4
  %2943 = and i32 %2942, 1024
  %2944 = icmp ne i32 %2943, 0
  br i1 %2944, label %2945, label %2946

; <label>:2945                                    ; preds = %2941
  br label %4981

; <label>:2946                                    ; preds = %2941
  br label %2947

; <label>:2947                                    ; preds = %3062, %2946
  %2948 = load i8** %b, align 8
  %2949 = load %struct.re_pattern_buffer** %5, align 8
  %2950 = getelementptr inbounds %struct.re_pattern_buffer* %2949, i32 0, i32 0
  %2951 = load i8** %2950, align 8
  %2952 = ptrtoint i8* %2948 to i64
  %2953 = ptrtoint i8* %2951 to i64
  %2954 = sub i64 %2952, %2953
  %2955 = add nsw i64 %2954, 3
  %2956 = load %struct.re_pattern_buffer** %5, align 8
  %2957 = getelementptr inbounds %struct.re_pattern_buffer* %2956, i32 0, i32 1
  %2958 = load i64* %2957, align 8
  %2959 = icmp ugt i64 %2955, %2958
  br i1 %2959, label %2960, label %3063

; <label>:2960                                    ; preds = %2947
  br label %2961

; <label>:2961                                    ; preds = %2960
  %2962 = load %struct.re_pattern_buffer** %5, align 8
  %2963 = getelementptr inbounds %struct.re_pattern_buffer* %2962, i32 0, i32 0
  %2964 = load i8** %2963, align 8
  store i8* %2964, i8** %old_buffer13, align 8
  %2965 = load %struct.re_pattern_buffer** %5, align 8
  %2966 = getelementptr inbounds %struct.re_pattern_buffer* %2965, i32 0, i32 1
  %2967 = load i64* %2966, align 8
  %2968 = icmp eq i64 %2967, 65536
  br i1 %2968, label %2969, label %2970

; <label>:2969                                    ; preds = %2961
  store i32 15, i32* %1
  br label %5348

; <label>:2970                                    ; preds = %2961
  %2971 = load %struct.re_pattern_buffer** %5, align 8
  %2972 = getelementptr inbounds %struct.re_pattern_buffer* %2971, i32 0, i32 1
  %2973 = load i64* %2972, align 8
  %2974 = shl i64 %2973, 1
  store i64 %2974, i64* %2972, align 8
  %2975 = load %struct.re_pattern_buffer** %5, align 8
  %2976 = getelementptr inbounds %struct.re_pattern_buffer* %2975, i32 0, i32 1
  %2977 = load i64* %2976, align 8
  %2978 = icmp ugt i64 %2977, 65536
  br i1 %2978, label %2979, label %2982

; <label>:2979                                    ; preds = %2970
  %2980 = load %struct.re_pattern_buffer** %5, align 8
  %2981 = getelementptr inbounds %struct.re_pattern_buffer* %2980, i32 0, i32 1
  store i64 65536, i64* %2981, align 8
  br label %2982

; <label>:2982                                    ; preds = %2979, %2970
  %2983 = load %struct.re_pattern_buffer** %5, align 8
  %2984 = getelementptr inbounds %struct.re_pattern_buffer* %2983, i32 0, i32 0
  %2985 = load i8** %2984, align 8
  %2986 = load %struct.re_pattern_buffer** %5, align 8
  %2987 = getelementptr inbounds %struct.re_pattern_buffer* %2986, i32 0, i32 1
  %2988 = load i64* %2987, align 8
  %2989 = call noalias i8* @realloc(i8* %2985, i64 %2988) nounwind
  %2990 = load %struct.re_pattern_buffer** %5, align 8
  %2991 = getelementptr inbounds %struct.re_pattern_buffer* %2990, i32 0, i32 0
  store i8* %2989, i8** %2991, align 8
  %2992 = load %struct.re_pattern_buffer** %5, align 8
  %2993 = getelementptr inbounds %struct.re_pattern_buffer* %2992, i32 0, i32 0
  %2994 = load i8** %2993, align 8
  %2995 = icmp eq i8* %2994, null
  br i1 %2995, label %2996, label %2997

; <label>:2996                                    ; preds = %2982
  store i32 12, i32* %1
  br label %5348

; <label>:2997                                    ; preds = %2982
  %2998 = load i8** %old_buffer13, align 8
  %2999 = load %struct.re_pattern_buffer** %5, align 8
  %3000 = getelementptr inbounds %struct.re_pattern_buffer* %2999, i32 0, i32 0
  %3001 = load i8** %3000, align 8
  %3002 = icmp ne i8* %2998, %3001
  br i1 %3002, label %3003, label %3061

; <label>:3003                                    ; preds = %2997
  %3004 = load i8** %b, align 8
  %3005 = load i8** %old_buffer13, align 8
  %3006 = ptrtoint i8* %3004 to i64
  %3007 = ptrtoint i8* %3005 to i64
  %3008 = sub i64 %3006, %3007
  %3009 = load %struct.re_pattern_buffer** %5, align 8
  %3010 = getelementptr inbounds %struct.re_pattern_buffer* %3009, i32 0, i32 0
  %3011 = load i8** %3010, align 8
  %3012 = getelementptr inbounds i8* %3011, i64 %3008
  store i8* %3012, i8** %b, align 8
  %3013 = load i8** %begalt, align 8
  %3014 = load i8** %old_buffer13, align 8
  %3015 = ptrtoint i8* %3013 to i64
  %3016 = ptrtoint i8* %3014 to i64
  %3017 = sub i64 %3015, %3016
  %3018 = load %struct.re_pattern_buffer** %5, align 8
  %3019 = getelementptr inbounds %struct.re_pattern_buffer* %3018, i32 0, i32 0
  %3020 = load i8** %3019, align 8
  %3021 = getelementptr inbounds i8* %3020, i64 %3017
  store i8* %3021, i8** %begalt, align 8
  %3022 = load i8** %fixup_alt_jump, align 8
  %3023 = icmp ne i8* %3022, null
  br i1 %3023, label %3024, label %3034

; <label>:3024                                    ; preds = %3003
  %3025 = load i8** %fixup_alt_jump, align 8
  %3026 = load i8** %old_buffer13, align 8
  %3027 = ptrtoint i8* %3025 to i64
  %3028 = ptrtoint i8* %3026 to i64
  %3029 = sub i64 %3027, %3028
  %3030 = load %struct.re_pattern_buffer** %5, align 8
  %3031 = getelementptr inbounds %struct.re_pattern_buffer* %3030, i32 0, i32 0
  %3032 = load i8** %3031, align 8
  %3033 = getelementptr inbounds i8* %3032, i64 %3029
  store i8* %3033, i8** %fixup_alt_jump, align 8
  br label %3034

; <label>:3034                                    ; preds = %3024, %3003
  %3035 = load i8** %laststart, align 8
  %3036 = icmp ne i8* %3035, null
  br i1 %3036, label %3037, label %3047

; <label>:3037                                    ; preds = %3034
  %3038 = load i8** %laststart, align 8
  %3039 = load i8** %old_buffer13, align 8
  %3040 = ptrtoint i8* %3038 to i64
  %3041 = ptrtoint i8* %3039 to i64
  %3042 = sub i64 %3040, %3041
  %3043 = load %struct.re_pattern_buffer** %5, align 8
  %3044 = getelementptr inbounds %struct.re_pattern_buffer* %3043, i32 0, i32 0
  %3045 = load i8** %3044, align 8
  %3046 = getelementptr inbounds i8* %3045, i64 %3042
  store i8* %3046, i8** %laststart, align 8
  br label %3047

; <label>:3047                                    ; preds = %3037, %3034
  %3048 = load i8** %pending_exact, align 8
  %3049 = icmp ne i8* %3048, null
  br i1 %3049, label %3050, label %3060

; <label>:3050                                    ; preds = %3047
  %3051 = load i8** %pending_exact, align 8
  %3052 = load i8** %old_buffer13, align 8
  %3053 = ptrtoint i8* %3051 to i64
  %3054 = ptrtoint i8* %3052 to i64
  %3055 = sub i64 %3053, %3054
  %3056 = load %struct.re_pattern_buffer** %5, align 8
  %3057 = getelementptr inbounds %struct.re_pattern_buffer* %3056, i32 0, i32 0
  %3058 = load i8** %3057, align 8
  %3059 = getelementptr inbounds i8* %3058, i64 %3055
  store i8* %3059, i8** %pending_exact, align 8
  br label %3060

; <label>:3060                                    ; preds = %3050, %3047
  br label %3061

; <label>:3061                                    ; preds = %3060, %2997
  br label %3062

; <label>:3062                                    ; preds = %3061
  br label %2947

; <label>:3063                                    ; preds = %2947
  %3064 = load i8** %begalt, align 8
  %3065 = load i8** %b, align 8
  %3066 = getelementptr inbounds i8* %3065, i64 6
  %3067 = load i8** %begalt, align 8
  %3068 = ptrtoint i8* %3066 to i64
  %3069 = ptrtoint i8* %3067 to i64
  %3070 = sub i64 %3068, %3069
  %3071 = sub nsw i64 %3070, 3
  %3072 = load i8** %b, align 8
  call void (...)* bitcast (void (i32, i8*, i32, i8*)* @insert_op1 to void (...)*)(i32 14, i8* %3064, i64 %3071, i8* %3072)
  store i8* null, i8** %pending_exact, align 8
  %3073 = load i8** %b, align 8
  %3074 = getelementptr inbounds i8* %3073, i64 3
  store i8* %3074, i8** %b, align 8
  %3075 = load i8** %fixup_alt_jump, align 8
  %3076 = icmp ne i8* %3075, null
  br i1 %3076, label %3077, label %3085

; <label>:3077                                    ; preds = %3063
  %3078 = load i8** %fixup_alt_jump, align 8
  %3079 = load i8** %b, align 8
  %3080 = load i8** %fixup_alt_jump, align 8
  %3081 = ptrtoint i8* %3079 to i64
  %3082 = ptrtoint i8* %3080 to i64
  %3083 = sub i64 %3081, %3082
  %3084 = sub nsw i64 %3083, 3
  call void (...)* bitcast (void (i32, i8*, i32)* @store_op1 to void (...)*)(i32 13, i8* %3078, i64 %3084)
  br label %3085

; <label>:3085                                    ; preds = %3077, %3063
  %3086 = load i8** %b, align 8
  store i8* %3086, i8** %fixup_alt_jump, align 8
  br label %3087

; <label>:3087                                    ; preds = %3202, %3085
  %3088 = load i8** %b, align 8
  %3089 = load %struct.re_pattern_buffer** %5, align 8
  %3090 = getelementptr inbounds %struct.re_pattern_buffer* %3089, i32 0, i32 0
  %3091 = load i8** %3090, align 8
  %3092 = ptrtoint i8* %3088 to i64
  %3093 = ptrtoint i8* %3091 to i64
  %3094 = sub i64 %3092, %3093
  %3095 = add nsw i64 %3094, 3
  %3096 = load %struct.re_pattern_buffer** %5, align 8
  %3097 = getelementptr inbounds %struct.re_pattern_buffer* %3096, i32 0, i32 1
  %3098 = load i64* %3097, align 8
  %3099 = icmp ugt i64 %3095, %3098
  br i1 %3099, label %3100, label %3203

; <label>:3100                                    ; preds = %3087
  br label %3101

; <label>:3101                                    ; preds = %3100
  %3102 = load %struct.re_pattern_buffer** %5, align 8
  %3103 = getelementptr inbounds %struct.re_pattern_buffer* %3102, i32 0, i32 0
  %3104 = load i8** %3103, align 8
  store i8* %3104, i8** %old_buffer14, align 8
  %3105 = load %struct.re_pattern_buffer** %5, align 8
  %3106 = getelementptr inbounds %struct.re_pattern_buffer* %3105, i32 0, i32 1
  %3107 = load i64* %3106, align 8
  %3108 = icmp eq i64 %3107, 65536
  br i1 %3108, label %3109, label %3110

; <label>:3109                                    ; preds = %3101
  store i32 15, i32* %1
  br label %5348

; <label>:3110                                    ; preds = %3101
  %3111 = load %struct.re_pattern_buffer** %5, align 8
  %3112 = getelementptr inbounds %struct.re_pattern_buffer* %3111, i32 0, i32 1
  %3113 = load i64* %3112, align 8
  %3114 = shl i64 %3113, 1
  store i64 %3114, i64* %3112, align 8
  %3115 = load %struct.re_pattern_buffer** %5, align 8
  %3116 = getelementptr inbounds %struct.re_pattern_buffer* %3115, i32 0, i32 1
  %3117 = load i64* %3116, align 8
  %3118 = icmp ugt i64 %3117, 65536
  br i1 %3118, label %3119, label %3122

; <label>:3119                                    ; preds = %3110
  %3120 = load %struct.re_pattern_buffer** %5, align 8
  %3121 = getelementptr inbounds %struct.re_pattern_buffer* %3120, i32 0, i32 1
  store i64 65536, i64* %3121, align 8
  br label %3122

; <label>:3122                                    ; preds = %3119, %3110
  %3123 = load %struct.re_pattern_buffer** %5, align 8
  %3124 = getelementptr inbounds %struct.re_pattern_buffer* %3123, i32 0, i32 0
  %3125 = load i8** %3124, align 8
  %3126 = load %struct.re_pattern_buffer** %5, align 8
  %3127 = getelementptr inbounds %struct.re_pattern_buffer* %3126, i32 0, i32 1
  %3128 = load i64* %3127, align 8
  %3129 = call noalias i8* @realloc(i8* %3125, i64 %3128) nounwind
  %3130 = load %struct.re_pattern_buffer** %5, align 8
  %3131 = getelementptr inbounds %struct.re_pattern_buffer* %3130, i32 0, i32 0
  store i8* %3129, i8** %3131, align 8
  %3132 = load %struct.re_pattern_buffer** %5, align 8
  %3133 = getelementptr inbounds %struct.re_pattern_buffer* %3132, i32 0, i32 0
  %3134 = load i8** %3133, align 8
  %3135 = icmp eq i8* %3134, null
  br i1 %3135, label %3136, label %3137

; <label>:3136                                    ; preds = %3122
  store i32 12, i32* %1
  br label %5348

; <label>:3137                                    ; preds = %3122
  %3138 = load i8** %old_buffer14, align 8
  %3139 = load %struct.re_pattern_buffer** %5, align 8
  %3140 = getelementptr inbounds %struct.re_pattern_buffer* %3139, i32 0, i32 0
  %3141 = load i8** %3140, align 8
  %3142 = icmp ne i8* %3138, %3141
  br i1 %3142, label %3143, label %3201

; <label>:3143                                    ; preds = %3137
  %3144 = load i8** %b, align 8
  %3145 = load i8** %old_buffer14, align 8
  %3146 = ptrtoint i8* %3144 to i64
  %3147 = ptrtoint i8* %3145 to i64
  %3148 = sub i64 %3146, %3147
  %3149 = load %struct.re_pattern_buffer** %5, align 8
  %3150 = getelementptr inbounds %struct.re_pattern_buffer* %3149, i32 0, i32 0
  %3151 = load i8** %3150, align 8
  %3152 = getelementptr inbounds i8* %3151, i64 %3148
  store i8* %3152, i8** %b, align 8
  %3153 = load i8** %begalt, align 8
  %3154 = load i8** %old_buffer14, align 8
  %3155 = ptrtoint i8* %3153 to i64
  %3156 = ptrtoint i8* %3154 to i64
  %3157 = sub i64 %3155, %3156
  %3158 = load %struct.re_pattern_buffer** %5, align 8
  %3159 = getelementptr inbounds %struct.re_pattern_buffer* %3158, i32 0, i32 0
  %3160 = load i8** %3159, align 8
  %3161 = getelementptr inbounds i8* %3160, i64 %3157
  store i8* %3161, i8** %begalt, align 8
  %3162 = load i8** %fixup_alt_jump, align 8
  %3163 = icmp ne i8* %3162, null
  br i1 %3163, label %3164, label %3174

; <label>:3164                                    ; preds = %3143
  %3165 = load i8** %fixup_alt_jump, align 8
  %3166 = load i8** %old_buffer14, align 8
  %3167 = ptrtoint i8* %3165 to i64
  %3168 = ptrtoint i8* %3166 to i64
  %3169 = sub i64 %3167, %3168
  %3170 = load %struct.re_pattern_buffer** %5, align 8
  %3171 = getelementptr inbounds %struct.re_pattern_buffer* %3170, i32 0, i32 0
  %3172 = load i8** %3171, align 8
  %3173 = getelementptr inbounds i8* %3172, i64 %3169
  store i8* %3173, i8** %fixup_alt_jump, align 8
  br label %3174

; <label>:3174                                    ; preds = %3164, %3143
  %3175 = load i8** %laststart, align 8
  %3176 = icmp ne i8* %3175, null
  br i1 %3176, label %3177, label %3187

; <label>:3177                                    ; preds = %3174
  %3178 = load i8** %laststart, align 8
  %3179 = load i8** %old_buffer14, align 8
  %3180 = ptrtoint i8* %3178 to i64
  %3181 = ptrtoint i8* %3179 to i64
  %3182 = sub i64 %3180, %3181
  %3183 = load %struct.re_pattern_buffer** %5, align 8
  %3184 = getelementptr inbounds %struct.re_pattern_buffer* %3183, i32 0, i32 0
  %3185 = load i8** %3184, align 8
  %3186 = getelementptr inbounds i8* %3185, i64 %3182
  store i8* %3186, i8** %laststart, align 8
  br label %3187

; <label>:3187                                    ; preds = %3177, %3174
  %3188 = load i8** %pending_exact, align 8
  %3189 = icmp ne i8* %3188, null
  br i1 %3189, label %3190, label %3200

; <label>:3190                                    ; preds = %3187
  %3191 = load i8** %pending_exact, align 8
  %3192 = load i8** %old_buffer14, align 8
  %3193 = ptrtoint i8* %3191 to i64
  %3194 = ptrtoint i8* %3192 to i64
  %3195 = sub i64 %3193, %3194
  %3196 = load %struct.re_pattern_buffer** %5, align 8
  %3197 = getelementptr inbounds %struct.re_pattern_buffer* %3196, i32 0, i32 0
  %3198 = load i8** %3197, align 8
  %3199 = getelementptr inbounds i8* %3198, i64 %3195
  store i8* %3199, i8** %pending_exact, align 8
  br label %3200

; <label>:3200                                    ; preds = %3190, %3187
  br label %3201

; <label>:3201                                    ; preds = %3200, %3137
  br label %3202

; <label>:3202                                    ; preds = %3201
  br label %3087

; <label>:3203                                    ; preds = %3087
  %3204 = load i8** %b, align 8
  %3205 = getelementptr inbounds i8* %3204, i64 3
  store i8* %3205, i8** %b, align 8
  store i8* null, i8** %laststart, align 8
  %3206 = load i8** %b, align 8
  store i8* %3206, i8** %begalt, align 8
  br label %4979

; <label>:3207                                    ; preds = %2301
  %3208 = load i32* %4, align 4
  %3209 = and i32 %3208, 512
  %3210 = icmp ne i32 %3209, 0
  br i1 %3210, label %3211, label %3228

; <label>:3211                                    ; preds = %3207
  %3212 = load i32* %4, align 4
  %3213 = and i32 %3212, 512
  %3214 = icmp ne i32 %3213, 0
  br i1 %3214, label %3215, label %3219

; <label>:3215                                    ; preds = %3211
  %3216 = load i32* %4, align 4
  %3217 = and i32 %3216, 4096
  %3218 = icmp ne i32 %3217, 0
  br i1 %3218, label %3228, label %3219

; <label>:3219                                    ; preds = %3215, %3211
  %3220 = load i8** %p, align 8
  %3221 = getelementptr inbounds i8* %3220, i64 -2
  %3222 = load i8** %2, align 8
  %3223 = icmp eq i8* %3221, %3222
  br i1 %3223, label %3224, label %3229

; <label>:3224                                    ; preds = %3219
  %3225 = load i8** %p, align 8
  %3226 = load i8** %pend, align 8
  %3227 = icmp eq i8* %3225, %3226
  br i1 %3227, label %3228, label %3229

; <label>:3228                                    ; preds = %3224, %3215, %3207
  br label %4963

; <label>:3229                                    ; preds = %3224, %3219
  br label %3230

; <label>:3230                                    ; preds = %3229, %2284
  store i32 -1, i32* %lower_bound, align 4
  store i32 -1, i32* %upper_bound, align 4
  %3231 = load i8** %p, align 8
  %3232 = getelementptr inbounds i8* %3231, i64 -1
  store i8* %3232, i8** %beg_interval, align 8
  %3233 = load i8** %p, align 8
  %3234 = load i8** %pend, align 8
  %3235 = icmp eq i8* %3233, %3234
  br i1 %3235, label %3236, label %3242

; <label>:3236                                    ; preds = %3230
  %3237 = load i32* %4, align 4
  %3238 = and i32 %3237, 4096
  %3239 = icmp ne i32 %3238, 0
  br i1 %3239, label %3240, label %3241

; <label>:3240                                    ; preds = %3236
  br label %3789

; <label>:3241                                    ; preds = %3236
  store i32 9, i32* %1
  br label %5348

; <label>:3242                                    ; preds = %3230
  %3243 = load i8** %p, align 8
  %3244 = load i8** %pend, align 8
  %3245 = icmp ne i8* %3243, %3244
  br i1 %3245, label %3246, label %3320

; <label>:3246                                    ; preds = %3242
  br label %3247

; <label>:3247                                    ; preds = %3246
  %3248 = load i8** %p, align 8
  %3249 = load i8** %pend, align 8
  %3250 = icmp eq i8* %3248, %3249
  br i1 %3250, label %3251, label %3252

; <label>:3251                                    ; preds = %3247
  store i32 14, i32* %1
  br label %5348

; <label>:3252                                    ; preds = %3247
  %3253 = load i8** %p, align 8
  %3254 = getelementptr inbounds i8* %3253, i32 1
  store i8* %3254, i8** %p, align 8
  %3255 = load i8* %3253, align 1
  store i8 %3255, i8* %c, align 1
  %3256 = load i8** %translate, align 8
  %3257 = icmp ne i8* %3256, null
  br i1 %3257, label %3258, label %3264

; <label>:3258                                    ; preds = %3252
  %3259 = load i8* %c, align 1
  %3260 = zext i8 %3259 to i64
  %3261 = load i8** %translate, align 8
  %3262 = getelementptr inbounds i8* %3261, i64 %3260
  %3263 = load i8* %3262, align 1
  store i8 %3263, i8* %c, align 1
  br label %3264

; <label>:3264                                    ; preds = %3258, %3252
  br label %3265

; <label>:3265                                    ; preds = %3264
  br label %3266

; <label>:3266                                    ; preds = %3318, %3265
  %3267 = load i8* %c, align 1
  %3268 = zext i8 %3267 to i32
  %3269 = and i32 %3268, -128
  %3270 = icmp eq i32 %3269, 0
  br i1 %3270, label %3271, label %3282

; <label>:3271                                    ; preds = %3266
  %3272 = load i8* %c, align 1
  %3273 = zext i8 %3272 to i32
  %3274 = sext i32 %3273 to i64
  %3275 = call i16** @__ctype_b_loc() nounwind readnone
  %3276 = load i16** %3275, align 8
  %3277 = getelementptr inbounds i16* %3276, i64 %3274
  %3278 = load i16* %3277, align 2
  %3279 = zext i16 %3278 to i32
  %3280 = and i32 %3279, 2048
  %3281 = icmp ne i32 %3280, 0
  br label %3282

; <label>:3282                                    ; preds = %3271, %3266
  %3283 = phi i1 [ false, %3266 ], [ %3281, %3271 ]
  br i1 %3283, label %3284, label %3319

; <label>:3284                                    ; preds = %3282
  %3285 = load i32* %lower_bound, align 4
  %3286 = icmp slt i32 %3285, 0
  br i1 %3286, label %3287, label %3288

; <label>:3287                                    ; preds = %3284
  store i32 0, i32* %lower_bound, align 4
  br label %3288

; <label>:3288                                    ; preds = %3287, %3284
  %3289 = load i32* %lower_bound, align 4
  %3290 = mul nsw i32 %3289, 10
  %3291 = load i8* %c, align 1
  %3292 = zext i8 %3291 to i32
  %3293 = add nsw i32 %3290, %3292
  %3294 = sub nsw i32 %3293, 48
  store i32 %3294, i32* %lower_bound, align 4
  %3295 = load i8** %p, align 8
  %3296 = load i8** %pend, align 8
  %3297 = icmp eq i8* %3295, %3296
  br i1 %3297, label %3298, label %3299

; <label>:3298                                    ; preds = %3288
  br label %3319

; <label>:3299                                    ; preds = %3288
  br label %3300

; <label>:3300                                    ; preds = %3299
  %3301 = load i8** %p, align 8
  %3302 = load i8** %pend, align 8
  %3303 = icmp eq i8* %3301, %3302
  br i1 %3303, label %3304, label %3305

; <label>:3304                                    ; preds = %3300
  store i32 14, i32* %1
  br label %5348

; <label>:3305                                    ; preds = %3300
  %3306 = load i8** %p, align 8
  %3307 = getelementptr inbounds i8* %3306, i32 1
  store i8* %3307, i8** %p, align 8
  %3308 = load i8* %3306, align 1
  store i8 %3308, i8* %c, align 1
  %3309 = load i8** %translate, align 8
  %3310 = icmp ne i8* %3309, null
  br i1 %3310, label %3311, label %3317

; <label>:3311                                    ; preds = %3305
  %3312 = load i8* %c, align 1
  %3313 = zext i8 %3312 to i64
  %3314 = load i8** %translate, align 8
  %3315 = getelementptr inbounds i8* %3314, i64 %3313
  %3316 = load i8* %3315, align 1
  store i8 %3316, i8* %c, align 1
  br label %3317

; <label>:3317                                    ; preds = %3311, %3305
  br label %3318

; <label>:3318                                    ; preds = %3317
  br label %3266

; <label>:3319                                    ; preds = %3298, %3282
  br label %3320

; <label>:3320                                    ; preds = %3319, %3242
  %3321 = load i8* %c, align 1
  %3322 = zext i8 %3321 to i32
  %3323 = icmp eq i32 %3322, 44
  br i1 %3323, label %3324, label %3407

; <label>:3324                                    ; preds = %3320
  %3325 = load i8** %p, align 8
  %3326 = load i8** %pend, align 8
  %3327 = icmp ne i8* %3325, %3326
  br i1 %3327, label %3328, label %3402

; <label>:3328                                    ; preds = %3324
  br label %3329

; <label>:3329                                    ; preds = %3328
  %3330 = load i8** %p, align 8
  %3331 = load i8** %pend, align 8
  %3332 = icmp eq i8* %3330, %3331
  br i1 %3332, label %3333, label %3334

; <label>:3333                                    ; preds = %3329
  store i32 14, i32* %1
  br label %5348

; <label>:3334                                    ; preds = %3329
  %3335 = load i8** %p, align 8
  %3336 = getelementptr inbounds i8* %3335, i32 1
  store i8* %3336, i8** %p, align 8
  %3337 = load i8* %3335, align 1
  store i8 %3337, i8* %c, align 1
  %3338 = load i8** %translate, align 8
  %3339 = icmp ne i8* %3338, null
  br i1 %3339, label %3340, label %3346

; <label>:3340                                    ; preds = %3334
  %3341 = load i8* %c, align 1
  %3342 = zext i8 %3341 to i64
  %3343 = load i8** %translate, align 8
  %3344 = getelementptr inbounds i8* %3343, i64 %3342
  %3345 = load i8* %3344, align 1
  store i8 %3345, i8* %c, align 1
  br label %3346

; <label>:3346                                    ; preds = %3340, %3334
  br label %3347

; <label>:3347                                    ; preds = %3346
  br label %3348

; <label>:3348                                    ; preds = %3400, %3347
  %3349 = load i8* %c, align 1
  %3350 = zext i8 %3349 to i32
  %3351 = and i32 %3350, -128
  %3352 = icmp eq i32 %3351, 0
  br i1 %3352, label %3353, label %3364

; <label>:3353                                    ; preds = %3348
  %3354 = load i8* %c, align 1
  %3355 = zext i8 %3354 to i32
  %3356 = sext i32 %3355 to i64
  %3357 = call i16** @__ctype_b_loc() nounwind readnone
  %3358 = load i16** %3357, align 8
  %3359 = getelementptr inbounds i16* %3358, i64 %3356
  %3360 = load i16* %3359, align 2
  %3361 = zext i16 %3360 to i32
  %3362 = and i32 %3361, 2048
  %3363 = icmp ne i32 %3362, 0
  br label %3364

; <label>:3364                                    ; preds = %3353, %3348
  %3365 = phi i1 [ false, %3348 ], [ %3363, %3353 ]
  br i1 %3365, label %3366, label %3401

; <label>:3366                                    ; preds = %3364
  %3367 = load i32* %upper_bound, align 4
  %3368 = icmp slt i32 %3367, 0
  br i1 %3368, label %3369, label %3370

; <label>:3369                                    ; preds = %3366
  store i32 0, i32* %upper_bound, align 4
  br label %3370

; <label>:3370                                    ; preds = %3369, %3366
  %3371 = load i32* %upper_bound, align 4
  %3372 = mul nsw i32 %3371, 10
  %3373 = load i8* %c, align 1
  %3374 = zext i8 %3373 to i32
  %3375 = add nsw i32 %3372, %3374
  %3376 = sub nsw i32 %3375, 48
  store i32 %3376, i32* %upper_bound, align 4
  %3377 = load i8** %p, align 8
  %3378 = load i8** %pend, align 8
  %3379 = icmp eq i8* %3377, %3378
  br i1 %3379, label %3380, label %3381

; <label>:3380                                    ; preds = %3370
  br label %3401

; <label>:3381                                    ; preds = %3370
  br label %3382

; <label>:3382                                    ; preds = %3381
  %3383 = load i8** %p, align 8
  %3384 = load i8** %pend, align 8
  %3385 = icmp eq i8* %3383, %3384
  br i1 %3385, label %3386, label %3387

; <label>:3386                                    ; preds = %3382
  store i32 14, i32* %1
  br label %5348

; <label>:3387                                    ; preds = %3382
  %3388 = load i8** %p, align 8
  %3389 = getelementptr inbounds i8* %3388, i32 1
  store i8* %3389, i8** %p, align 8
  %3390 = load i8* %3388, align 1
  store i8 %3390, i8* %c, align 1
  %3391 = load i8** %translate, align 8
  %3392 = icmp ne i8* %3391, null
  br i1 %3392, label %3393, label %3399

; <label>:3393                                    ; preds = %3387
  %3394 = load i8* %c, align 1
  %3395 = zext i8 %3394 to i64
  %3396 = load i8** %translate, align 8
  %3397 = getelementptr inbounds i8* %3396, i64 %3395
  %3398 = load i8* %3397, align 1
  store i8 %3398, i8* %c, align 1
  br label %3399

; <label>:3399                                    ; preds = %3393, %3387
  br label %3400

; <label>:3400                                    ; preds = %3399
  br label %3348

; <label>:3401                                    ; preds = %3380, %3364
  br label %3402

; <label>:3402                                    ; preds = %3401, %3324
  %3403 = load i32* %upper_bound, align 4
  %3404 = icmp slt i32 %3403, 0
  br i1 %3404, label %3405, label %3406

; <label>:3405                                    ; preds = %3402
  store i32 32767, i32* %upper_bound, align 4
  br label %3406

; <label>:3406                                    ; preds = %3405, %3402
  br label %3409

; <label>:3407                                    ; preds = %3320
  %3408 = load i32* %lower_bound, align 4
  store i32 %3408, i32* %upper_bound, align 4
  br label %3409

; <label>:3409                                    ; preds = %3407, %3406
  %3410 = load i32* %lower_bound, align 4
  %3411 = icmp slt i32 %3410, 0
  br i1 %3411, label %3419, label %3412

; <label>:3412                                    ; preds = %3409
  %3413 = load i32* %upper_bound, align 4
  %3414 = icmp sgt i32 %3413, 32767
  br i1 %3414, label %3419, label %3415

; <label>:3415                                    ; preds = %3412
  %3416 = load i32* %lower_bound, align 4
  %3417 = load i32* %upper_bound, align 4
  %3418 = icmp sgt i32 %3416, %3417
  br i1 %3418, label %3419, label %3425

; <label>:3419                                    ; preds = %3415, %3412, %3409
  %3420 = load i32* %4, align 4
  %3421 = and i32 %3420, 4096
  %3422 = icmp ne i32 %3421, 0
  br i1 %3422, label %3423, label %3424

; <label>:3423                                    ; preds = %3419
  br label %3789

; <label>:3424                                    ; preds = %3419
  store i32 10, i32* %1
  br label %5348

; <label>:3425                                    ; preds = %3415
  %3426 = load i32* %4, align 4
  %3427 = and i32 %3426, 4096
  %3428 = icmp ne i32 %3427, 0
  br i1 %3428, label %3454, label %3429

; <label>:3429                                    ; preds = %3425
  %3430 = load i8* %c, align 1
  %3431 = zext i8 %3430 to i32
  %3432 = icmp ne i32 %3431, 92
  br i1 %3432, label %3433, label %3434

; <label>:3433                                    ; preds = %3429
  store i32 9, i32* %1
  br label %5348

; <label>:3434                                    ; preds = %3429
  br label %3435

; <label>:3435                                    ; preds = %3434
  %3436 = load i8** %p, align 8
  %3437 = load i8** %pend, align 8
  %3438 = icmp eq i8* %3436, %3437
  br i1 %3438, label %3439, label %3440

; <label>:3439                                    ; preds = %3435
  store i32 14, i32* %1
  br label %5348

; <label>:3440                                    ; preds = %3435
  %3441 = load i8** %p, align 8
  %3442 = getelementptr inbounds i8* %3441, i32 1
  store i8* %3442, i8** %p, align 8
  %3443 = load i8* %3441, align 1
  store i8 %3443, i8* %c, align 1
  %3444 = load i8** %translate, align 8
  %3445 = icmp ne i8* %3444, null
  br i1 %3445, label %3446, label %3452

; <label>:3446                                    ; preds = %3440
  %3447 = load i8* %c, align 1
  %3448 = zext i8 %3447 to i64
  %3449 = load i8** %translate, align 8
  %3450 = getelementptr inbounds i8* %3449, i64 %3448
  %3451 = load i8* %3450, align 1
  store i8 %3451, i8* %c, align 1
  br label %3452

; <label>:3452                                    ; preds = %3446, %3440
  br label %3453

; <label>:3453                                    ; preds = %3452
  br label %3454

; <label>:3454                                    ; preds = %3453, %3425
  %3455 = load i8* %c, align 1
  %3456 = zext i8 %3455 to i32
  %3457 = icmp ne i32 %3456, 125
  br i1 %3457, label %3458, label %3464

; <label>:3458                                    ; preds = %3454
  %3459 = load i32* %4, align 4
  %3460 = and i32 %3459, 4096
  %3461 = icmp ne i32 %3460, 0
  br i1 %3461, label %3462, label %3463

; <label>:3462                                    ; preds = %3458
  br label %3789

; <label>:3463                                    ; preds = %3458
  store i32 10, i32* %1
  br label %5348

; <label>:3464                                    ; preds = %3454
  %3465 = load i8** %laststart, align 8
  %3466 = icmp ne i8* %3465, null
  br i1 %3466, label %3481, label %3467

; <label>:3467                                    ; preds = %3464
  %3468 = load i32* %4, align 4
  %3469 = and i32 %3468, 32
  %3470 = icmp ne i32 %3469, 0
  br i1 %3470, label %3471, label %3472

; <label>:3471                                    ; preds = %3467
  store i32 13, i32* %1
  br label %5348

; <label>:3472                                    ; preds = %3467
  %3473 = load i32* %4, align 4
  %3474 = and i32 %3473, 16
  %3475 = icmp ne i32 %3474, 0
  br i1 %3475, label %3476, label %3478

; <label>:3476                                    ; preds = %3472
  %3477 = load i8** %b, align 8
  store i8* %3477, i8** %laststart, align 8
  br label %3479

; <label>:3478                                    ; preds = %3472
  br label %3789

; <label>:3479                                    ; preds = %3476
  br label %3480

; <label>:3480                                    ; preds = %3479
  br label %3481

; <label>:3481                                    ; preds = %3480, %3464
  %3482 = load i32* %upper_bound, align 4
  %3483 = icmp eq i32 %3482, 0
  br i1 %3483, label %3484, label %3613

; <label>:3484                                    ; preds = %3481
  br label %3485

; <label>:3485                                    ; preds = %3600, %3484
  %3486 = load i8** %b, align 8
  %3487 = load %struct.re_pattern_buffer** %5, align 8
  %3488 = getelementptr inbounds %struct.re_pattern_buffer* %3487, i32 0, i32 0
  %3489 = load i8** %3488, align 8
  %3490 = ptrtoint i8* %3486 to i64
  %3491 = ptrtoint i8* %3489 to i64
  %3492 = sub i64 %3490, %3491
  %3493 = add nsw i64 %3492, 3
  %3494 = load %struct.re_pattern_buffer** %5, align 8
  %3495 = getelementptr inbounds %struct.re_pattern_buffer* %3494, i32 0, i32 1
  %3496 = load i64* %3495, align 8
  %3497 = icmp ugt i64 %3493, %3496
  br i1 %3497, label %3498, label %3601

; <label>:3498                                    ; preds = %3485
  br label %3499

; <label>:3499                                    ; preds = %3498
  %3500 = load %struct.re_pattern_buffer** %5, align 8
  %3501 = getelementptr inbounds %struct.re_pattern_buffer* %3500, i32 0, i32 0
  %3502 = load i8** %3501, align 8
  store i8* %3502, i8** %old_buffer15, align 8
  %3503 = load %struct.re_pattern_buffer** %5, align 8
  %3504 = getelementptr inbounds %struct.re_pattern_buffer* %3503, i32 0, i32 1
  %3505 = load i64* %3504, align 8
  %3506 = icmp eq i64 %3505, 65536
  br i1 %3506, label %3507, label %3508

; <label>:3507                                    ; preds = %3499
  store i32 15, i32* %1
  br label %5348

; <label>:3508                                    ; preds = %3499
  %3509 = load %struct.re_pattern_buffer** %5, align 8
  %3510 = getelementptr inbounds %struct.re_pattern_buffer* %3509, i32 0, i32 1
  %3511 = load i64* %3510, align 8
  %3512 = shl i64 %3511, 1
  store i64 %3512, i64* %3510, align 8
  %3513 = load %struct.re_pattern_buffer** %5, align 8
  %3514 = getelementptr inbounds %struct.re_pattern_buffer* %3513, i32 0, i32 1
  %3515 = load i64* %3514, align 8
  %3516 = icmp ugt i64 %3515, 65536
  br i1 %3516, label %3517, label %3520

; <label>:3517                                    ; preds = %3508
  %3518 = load %struct.re_pattern_buffer** %5, align 8
  %3519 = getelementptr inbounds %struct.re_pattern_buffer* %3518, i32 0, i32 1
  store i64 65536, i64* %3519, align 8
  br label %3520

; <label>:3520                                    ; preds = %3517, %3508
  %3521 = load %struct.re_pattern_buffer** %5, align 8
  %3522 = getelementptr inbounds %struct.re_pattern_buffer* %3521, i32 0, i32 0
  %3523 = load i8** %3522, align 8
  %3524 = load %struct.re_pattern_buffer** %5, align 8
  %3525 = getelementptr inbounds %struct.re_pattern_buffer* %3524, i32 0, i32 1
  %3526 = load i64* %3525, align 8
  %3527 = call noalias i8* @realloc(i8* %3523, i64 %3526) nounwind
  %3528 = load %struct.re_pattern_buffer** %5, align 8
  %3529 = getelementptr inbounds %struct.re_pattern_buffer* %3528, i32 0, i32 0
  store i8* %3527, i8** %3529, align 8
  %3530 = load %struct.re_pattern_buffer** %5, align 8
  %3531 = getelementptr inbounds %struct.re_pattern_buffer* %3530, i32 0, i32 0
  %3532 = load i8** %3531, align 8
  %3533 = icmp eq i8* %3532, null
  br i1 %3533, label %3534, label %3535

; <label>:3534                                    ; preds = %3520
  store i32 12, i32* %1
  br label %5348

; <label>:3535                                    ; preds = %3520
  %3536 = load i8** %old_buffer15, align 8
  %3537 = load %struct.re_pattern_buffer** %5, align 8
  %3538 = getelementptr inbounds %struct.re_pattern_buffer* %3537, i32 0, i32 0
  %3539 = load i8** %3538, align 8
  %3540 = icmp ne i8* %3536, %3539
  br i1 %3540, label %3541, label %3599

; <label>:3541                                    ; preds = %3535
  %3542 = load i8** %b, align 8
  %3543 = load i8** %old_buffer15, align 8
  %3544 = ptrtoint i8* %3542 to i64
  %3545 = ptrtoint i8* %3543 to i64
  %3546 = sub i64 %3544, %3545
  %3547 = load %struct.re_pattern_buffer** %5, align 8
  %3548 = getelementptr inbounds %struct.re_pattern_buffer* %3547, i32 0, i32 0
  %3549 = load i8** %3548, align 8
  %3550 = getelementptr inbounds i8* %3549, i64 %3546
  store i8* %3550, i8** %b, align 8
  %3551 = load i8** %begalt, align 8
  %3552 = load i8** %old_buffer15, align 8
  %3553 = ptrtoint i8* %3551 to i64
  %3554 = ptrtoint i8* %3552 to i64
  %3555 = sub i64 %3553, %3554
  %3556 = load %struct.re_pattern_buffer** %5, align 8
  %3557 = getelementptr inbounds %struct.re_pattern_buffer* %3556, i32 0, i32 0
  %3558 = load i8** %3557, align 8
  %3559 = getelementptr inbounds i8* %3558, i64 %3555
  store i8* %3559, i8** %begalt, align 8
  %3560 = load i8** %fixup_alt_jump, align 8
  %3561 = icmp ne i8* %3560, null
  br i1 %3561, label %3562, label %3572

; <label>:3562                                    ; preds = %3541
  %3563 = load i8** %fixup_alt_jump, align 8
  %3564 = load i8** %old_buffer15, align 8
  %3565 = ptrtoint i8* %3563 to i64
  %3566 = ptrtoint i8* %3564 to i64
  %3567 = sub i64 %3565, %3566
  %3568 = load %struct.re_pattern_buffer** %5, align 8
  %3569 = getelementptr inbounds %struct.re_pattern_buffer* %3568, i32 0, i32 0
  %3570 = load i8** %3569, align 8
  %3571 = getelementptr inbounds i8* %3570, i64 %3567
  store i8* %3571, i8** %fixup_alt_jump, align 8
  br label %3572

; <label>:3572                                    ; preds = %3562, %3541
  %3573 = load i8** %laststart, align 8
  %3574 = icmp ne i8* %3573, null
  br i1 %3574, label %3575, label %3585

; <label>:3575                                    ; preds = %3572
  %3576 = load i8** %laststart, align 8
  %3577 = load i8** %old_buffer15, align 8
  %3578 = ptrtoint i8* %3576 to i64
  %3579 = ptrtoint i8* %3577 to i64
  %3580 = sub i64 %3578, %3579
  %3581 = load %struct.re_pattern_buffer** %5, align 8
  %3582 = getelementptr inbounds %struct.re_pattern_buffer* %3581, i32 0, i32 0
  %3583 = load i8** %3582, align 8
  %3584 = getelementptr inbounds i8* %3583, i64 %3580
  store i8* %3584, i8** %laststart, align 8
  br label %3585

; <label>:3585                                    ; preds = %3575, %3572
  %3586 = load i8** %pending_exact, align 8
  %3587 = icmp ne i8* %3586, null
  br i1 %3587, label %3588, label %3598

; <label>:3588                                    ; preds = %3585
  %3589 = load i8** %pending_exact, align 8
  %3590 = load i8** %old_buffer15, align 8
  %3591 = ptrtoint i8* %3589 to i64
  %3592 = ptrtoint i8* %3590 to i64
  %3593 = sub i64 %3591, %3592
  %3594 = load %struct.re_pattern_buffer** %5, align 8
  %3595 = getelementptr inbounds %struct.re_pattern_buffer* %3594, i32 0, i32 0
  %3596 = load i8** %3595, align 8
  %3597 = getelementptr inbounds i8* %3596, i64 %3593
  store i8* %3597, i8** %pending_exact, align 8
  br label %3598

; <label>:3598                                    ; preds = %3588, %3585
  br label %3599

; <label>:3599                                    ; preds = %3598, %3535
  br label %3600

; <label>:3600                                    ; preds = %3599
  br label %3485

; <label>:3601                                    ; preds = %3485
  %3602 = load i8** %laststart, align 8
  %3603 = load i8** %b, align 8
  %3604 = getelementptr inbounds i8* %3603, i64 3
  %3605 = load i8** %laststart, align 8
  %3606 = ptrtoint i8* %3604 to i64
  %3607 = ptrtoint i8* %3605 to i64
  %3608 = sub i64 %3606, %3607
  %3609 = sub nsw i64 %3608, 3
  %3610 = load i8** %b, align 8
  call void (...)* bitcast (void (i32, i8*, i32, i8*)* @insert_op1 to void (...)*)(i32 12, i8* %3602, i64 %3609, i8* %3610)
  %3611 = load i8** %b, align 8
  %3612 = getelementptr inbounds i8* %3611, i64 3
  store i8* %3612, i8** %b, align 8
  br label %3788

; <label>:3613                                    ; preds = %3481
  %3614 = load i32* %upper_bound, align 4
  %3615 = icmp sgt i32 %3614, 1
  %3616 = zext i1 %3615 to i32
  %3617 = mul nsw i32 %3616, 10
  %3618 = add nsw i32 10, %3617
  store i32 %3618, i32* %nbytes, align 4
  br label %3619

; <label>:3619                                    ; preds = %3736, %3613
  %3620 = load i8** %b, align 8
  %3621 = load %struct.re_pattern_buffer** %5, align 8
  %3622 = getelementptr inbounds %struct.re_pattern_buffer* %3621, i32 0, i32 0
  %3623 = load i8** %3622, align 8
  %3624 = ptrtoint i8* %3620 to i64
  %3625 = ptrtoint i8* %3623 to i64
  %3626 = sub i64 %3624, %3625
  %3627 = load i32* %nbytes, align 4
  %3628 = zext i32 %3627 to i64
  %3629 = add nsw i64 %3626, %3628
  %3630 = load %struct.re_pattern_buffer** %5, align 8
  %3631 = getelementptr inbounds %struct.re_pattern_buffer* %3630, i32 0, i32 1
  %3632 = load i64* %3631, align 8
  %3633 = icmp ugt i64 %3629, %3632
  br i1 %3633, label %3634, label %3737

; <label>:3634                                    ; preds = %3619
  br label %3635

; <label>:3635                                    ; preds = %3634
  %3636 = load %struct.re_pattern_buffer** %5, align 8
  %3637 = getelementptr inbounds %struct.re_pattern_buffer* %3636, i32 0, i32 0
  %3638 = load i8** %3637, align 8
  store i8* %3638, i8** %old_buffer16, align 8
  %3639 = load %struct.re_pattern_buffer** %5, align 8
  %3640 = getelementptr inbounds %struct.re_pattern_buffer* %3639, i32 0, i32 1
  %3641 = load i64* %3640, align 8
  %3642 = icmp eq i64 %3641, 65536
  br i1 %3642, label %3643, label %3644

; <label>:3643                                    ; preds = %3635
  store i32 15, i32* %1
  br label %5348

; <label>:3644                                    ; preds = %3635
  %3645 = load %struct.re_pattern_buffer** %5, align 8
  %3646 = getelementptr inbounds %struct.re_pattern_buffer* %3645, i32 0, i32 1
  %3647 = load i64* %3646, align 8
  %3648 = shl i64 %3647, 1
  store i64 %3648, i64* %3646, align 8
  %3649 = load %struct.re_pattern_buffer** %5, align 8
  %3650 = getelementptr inbounds %struct.re_pattern_buffer* %3649, i32 0, i32 1
  %3651 = load i64* %3650, align 8
  %3652 = icmp ugt i64 %3651, 65536
  br i1 %3652, label %3653, label %3656

; <label>:3653                                    ; preds = %3644
  %3654 = load %struct.re_pattern_buffer** %5, align 8
  %3655 = getelementptr inbounds %struct.re_pattern_buffer* %3654, i32 0, i32 1
  store i64 65536, i64* %3655, align 8
  br label %3656

; <label>:3656                                    ; preds = %3653, %3644
  %3657 = load %struct.re_pattern_buffer** %5, align 8
  %3658 = getelementptr inbounds %struct.re_pattern_buffer* %3657, i32 0, i32 0
  %3659 = load i8** %3658, align 8
  %3660 = load %struct.re_pattern_buffer** %5, align 8
  %3661 = getelementptr inbounds %struct.re_pattern_buffer* %3660, i32 0, i32 1
  %3662 = load i64* %3661, align 8
  %3663 = call noalias i8* @realloc(i8* %3659, i64 %3662) nounwind
  %3664 = load %struct.re_pattern_buffer** %5, align 8
  %3665 = getelementptr inbounds %struct.re_pattern_buffer* %3664, i32 0, i32 0
  store i8* %3663, i8** %3665, align 8
  %3666 = load %struct.re_pattern_buffer** %5, align 8
  %3667 = getelementptr inbounds %struct.re_pattern_buffer* %3666, i32 0, i32 0
  %3668 = load i8** %3667, align 8
  %3669 = icmp eq i8* %3668, null
  br i1 %3669, label %3670, label %3671

; <label>:3670                                    ; preds = %3656
  store i32 12, i32* %1
  br label %5348

; <label>:3671                                    ; preds = %3656
  %3672 = load i8** %old_buffer16, align 8
  %3673 = load %struct.re_pattern_buffer** %5, align 8
  %3674 = getelementptr inbounds %struct.re_pattern_buffer* %3673, i32 0, i32 0
  %3675 = load i8** %3674, align 8
  %3676 = icmp ne i8* %3672, %3675
  br i1 %3676, label %3677, label %3735

; <label>:3677                                    ; preds = %3671
  %3678 = load i8** %b, align 8
  %3679 = load i8** %old_buffer16, align 8
  %3680 = ptrtoint i8* %3678 to i64
  %3681 = ptrtoint i8* %3679 to i64
  %3682 = sub i64 %3680, %3681
  %3683 = load %struct.re_pattern_buffer** %5, align 8
  %3684 = getelementptr inbounds %struct.re_pattern_buffer* %3683, i32 0, i32 0
  %3685 = load i8** %3684, align 8
  %3686 = getelementptr inbounds i8* %3685, i64 %3682
  store i8* %3686, i8** %b, align 8
  %3687 = load i8** %begalt, align 8
  %3688 = load i8** %old_buffer16, align 8
  %3689 = ptrtoint i8* %3687 to i64
  %3690 = ptrtoint i8* %3688 to i64
  %3691 = sub i64 %3689, %3690
  %3692 = load %struct.re_pattern_buffer** %5, align 8
  %3693 = getelementptr inbounds %struct.re_pattern_buffer* %3692, i32 0, i32 0
  %3694 = load i8** %3693, align 8
  %3695 = getelementptr inbounds i8* %3694, i64 %3691
  store i8* %3695, i8** %begalt, align 8
  %3696 = load i8** %fixup_alt_jump, align 8
  %3697 = icmp ne i8* %3696, null
  br i1 %3697, label %3698, label %3708

; <label>:3698                                    ; preds = %3677
  %3699 = load i8** %fixup_alt_jump, align 8
  %3700 = load i8** %old_buffer16, align 8
  %3701 = ptrtoint i8* %3699 to i64
  %3702 = ptrtoint i8* %3700 to i64
  %3703 = sub i64 %3701, %3702
  %3704 = load %struct.re_pattern_buffer** %5, align 8
  %3705 = getelementptr inbounds %struct.re_pattern_buffer* %3704, i32 0, i32 0
  %3706 = load i8** %3705, align 8
  %3707 = getelementptr inbounds i8* %3706, i64 %3703
  store i8* %3707, i8** %fixup_alt_jump, align 8
  br label %3708

; <label>:3708                                    ; preds = %3698, %3677
  %3709 = load i8** %laststart, align 8
  %3710 = icmp ne i8* %3709, null
  br i1 %3710, label %3711, label %3721

; <label>:3711                                    ; preds = %3708
  %3712 = load i8** %laststart, align 8
  %3713 = load i8** %old_buffer16, align 8
  %3714 = ptrtoint i8* %3712 to i64
  %3715 = ptrtoint i8* %3713 to i64
  %3716 = sub i64 %3714, %3715
  %3717 = load %struct.re_pattern_buffer** %5, align 8
  %3718 = getelementptr inbounds %struct.re_pattern_buffer* %3717, i32 0, i32 0
  %3719 = load i8** %3718, align 8
  %3720 = getelementptr inbounds i8* %3719, i64 %3716
  store i8* %3720, i8** %laststart, align 8
  br label %3721

; <label>:3721                                    ; preds = %3711, %3708
  %3722 = load i8** %pending_exact, align 8
  %3723 = icmp ne i8* %3722, null
  br i1 %3723, label %3724, label %3734

; <label>:3724                                    ; preds = %3721
  %3725 = load i8** %pending_exact, align 8
  %3726 = load i8** %old_buffer16, align 8
  %3727 = ptrtoint i8* %3725 to i64
  %3728 = ptrtoint i8* %3726 to i64
  %3729 = sub i64 %3727, %3728
  %3730 = load %struct.re_pattern_buffer** %5, align 8
  %3731 = getelementptr inbounds %struct.re_pattern_buffer* %3730, i32 0, i32 0
  %3732 = load i8** %3731, align 8
  %3733 = getelementptr inbounds i8* %3732, i64 %3729
  store i8* %3733, i8** %pending_exact, align 8
  br label %3734

; <label>:3734                                    ; preds = %3724, %3721
  br label %3735

; <label>:3735                                    ; preds = %3734, %3671
  br label %3736

; <label>:3736                                    ; preds = %3735
  br label %3619

; <label>:3737                                    ; preds = %3619
  %3738 = load i8** %laststart, align 8
  %3739 = load i8** %b, align 8
  %3740 = getelementptr inbounds i8* %3739, i64 5
  %3741 = load i32* %upper_bound, align 4
  %3742 = icmp sgt i32 %3741, 1
  %3743 = zext i1 %3742 to i32
  %3744 = mul nsw i32 %3743, 5
  %3745 = sext i32 %3744 to i64
  %3746 = getelementptr inbounds i8* %3740, i64 %3745
  %3747 = load i8** %laststart, align 8
  %3748 = ptrtoint i8* %3746 to i64
  %3749 = ptrtoint i8* %3747 to i64
  %3750 = sub i64 %3748, %3749
  %3751 = sub nsw i64 %3750, 3
  %3752 = load i32* %lower_bound, align 4
  %3753 = load i8** %b, align 8
  call void (...)* bitcast (void (i32, i8*, i32, i32, i8*)* @insert_op2 to void (...)*)(i32 20, i8* %3738, i64 %3751, i32 %3752, i8* %3753)
  %3754 = load i8** %b, align 8
  %3755 = getelementptr inbounds i8* %3754, i64 5
  store i8* %3755, i8** %b, align 8
  %3756 = load i8** %laststart, align 8
  %3757 = load i32* %lower_bound, align 4
  %3758 = load i8** %b, align 8
  call void (...)* bitcast (void (i32, i8*, i32, i32, i8*)* @insert_op2 to void (...)*)(i32 22, i8* %3756, i32 5, i32 %3757, i8* %3758)
  %3759 = load i8** %b, align 8
  %3760 = getelementptr inbounds i8* %3759, i64 5
  store i8* %3760, i8** %b, align 8
  %3761 = load i32* %upper_bound, align 4
  %3762 = icmp sgt i32 %3761, 1
  br i1 %3762, label %3763, label %3787

; <label>:3763                                    ; preds = %3737
  %3764 = load i8** %b, align 8
  %3765 = load i8** %laststart, align 8
  %3766 = getelementptr inbounds i8* %3765, i64 5
  %3767 = load i8** %b, align 8
  %3768 = ptrtoint i8* %3766 to i64
  %3769 = ptrtoint i8* %3767 to i64
  %3770 = sub i64 %3768, %3769
  %3771 = sub nsw i64 %3770, 3
  %3772 = load i32* %upper_bound, align 4
  %3773 = sub nsw i32 %3772, 1
  call void (...)* bitcast (void (i32, i8*, i32, i32)* @store_op2 to void (...)*)(i32 21, i8* %3764, i64 %3771, i32 %3773)
  %3774 = load i8** %b, align 8
  %3775 = getelementptr inbounds i8* %3774, i64 5
  store i8* %3775, i8** %b, align 8
  %3776 = load i8** %laststart, align 8
  %3777 = load i8** %b, align 8
  %3778 = load i8** %laststart, align 8
  %3779 = ptrtoint i8* %3777 to i64
  %3780 = ptrtoint i8* %3778 to i64
  %3781 = sub i64 %3779, %3780
  %3782 = load i32* %upper_bound, align 4
  %3783 = sub nsw i32 %3782, 1
  %3784 = load i8** %b, align 8
  call void (...)* bitcast (void (i32, i8*, i32, i32, i8*)* @insert_op2 to void (...)*)(i32 22, i8* %3776, i64 %3781, i32 %3783, i8* %3784)
  %3785 = load i8** %b, align 8
  %3786 = getelementptr inbounds i8* %3785, i64 5
  store i8* %3786, i8** %b, align 8
  br label %3787

; <label>:3787                                    ; preds = %3763, %3737
  br label %3788

; <label>:3788                                    ; preds = %3787, %3601
  store i8* null, i8** %pending_exact, align 8
  store i8* null, i8** %beg_interval, align 8
  br label %4979

; <label>:3789                                    ; preds = %3478, %3462, %3423, %3240
  %3790 = load i8** %beg_interval, align 8
  store i8* %3790, i8** %p, align 8
  store i8* null, i8** %beg_interval, align 8
  br label %3791

; <label>:3791                                    ; preds = %3789
  %3792 = load i8** %p, align 8
  %3793 = load i8** %pend, align 8
  %3794 = icmp eq i8* %3792, %3793
  br i1 %3794, label %3795, label %3796

; <label>:3795                                    ; preds = %3791
  store i32 14, i32* %1
  br label %5348

; <label>:3796                                    ; preds = %3791
  %3797 = load i8** %p, align 8
  %3798 = getelementptr inbounds i8* %3797, i32 1
  store i8* %3798, i8** %p, align 8
  %3799 = load i8* %3797, align 1
  store i8 %3799, i8* %c, align 1
  %3800 = load i8** %translate, align 8
  %3801 = icmp ne i8* %3800, null
  br i1 %3801, label %3802, label %3808

; <label>:3802                                    ; preds = %3796
  %3803 = load i8* %c, align 1
  %3804 = zext i8 %3803 to i64
  %3805 = load i8** %translate, align 8
  %3806 = getelementptr inbounds i8* %3805, i64 %3804
  %3807 = load i8* %3806, align 1
  store i8 %3807, i8* %c, align 1
  br label %3808

; <label>:3808                                    ; preds = %3802, %3796
  br label %3809

; <label>:3809                                    ; preds = %3808
  %3810 = load i32* %4, align 4
  %3811 = and i32 %3810, 4096
  %3812 = icmp ne i32 %3811, 0
  br i1 %3812, label %3825, label %3813

; <label>:3813                                    ; preds = %3809
  %3814 = load i8** %p, align 8
  %3815 = load i8** %2, align 8
  %3816 = icmp ugt i8* %3814, %3815
  br i1 %3816, label %3817, label %3824

; <label>:3817                                    ; preds = %3813
  %3818 = load i8** %p, align 8
  %3819 = getelementptr inbounds i8* %3818, i64 -1
  %3820 = load i8* %3819, align 1
  %3821 = sext i8 %3820 to i32
  %3822 = icmp eq i32 %3821, 92
  br i1 %3822, label %3823, label %3824

; <label>:3823                                    ; preds = %3817
  br label %4963

; <label>:3824                                    ; preds = %3817, %3813
  br label %3825

; <label>:3825                                    ; preds = %3824, %3809
  br label %4981

; <label>:3826                                    ; preds = %2301
  %3827 = load i8** %b, align 8
  store i8* %3827, i8** %laststart, align 8
  br label %3828

; <label>:3828                                    ; preds = %3826
  br label %3829

; <label>:3829                                    ; preds = %3944, %3828
  %3830 = load i8** %b, align 8
  %3831 = load %struct.re_pattern_buffer** %5, align 8
  %3832 = getelementptr inbounds %struct.re_pattern_buffer* %3831, i32 0, i32 0
  %3833 = load i8** %3832, align 8
  %3834 = ptrtoint i8* %3830 to i64
  %3835 = ptrtoint i8* %3833 to i64
  %3836 = sub i64 %3834, %3835
  %3837 = add nsw i64 %3836, 1
  %3838 = load %struct.re_pattern_buffer** %5, align 8
  %3839 = getelementptr inbounds %struct.re_pattern_buffer* %3838, i32 0, i32 1
  %3840 = load i64* %3839, align 8
  %3841 = icmp ugt i64 %3837, %3840
  br i1 %3841, label %3842, label %3945

; <label>:3842                                    ; preds = %3829
  br label %3843

; <label>:3843                                    ; preds = %3842
  %3844 = load %struct.re_pattern_buffer** %5, align 8
  %3845 = getelementptr inbounds %struct.re_pattern_buffer* %3844, i32 0, i32 0
  %3846 = load i8** %3845, align 8
  store i8* %3846, i8** %old_buffer17, align 8
  %3847 = load %struct.re_pattern_buffer** %5, align 8
  %3848 = getelementptr inbounds %struct.re_pattern_buffer* %3847, i32 0, i32 1
  %3849 = load i64* %3848, align 8
  %3850 = icmp eq i64 %3849, 65536
  br i1 %3850, label %3851, label %3852

; <label>:3851                                    ; preds = %3843
  store i32 15, i32* %1
  br label %5348

; <label>:3852                                    ; preds = %3843
  %3853 = load %struct.re_pattern_buffer** %5, align 8
  %3854 = getelementptr inbounds %struct.re_pattern_buffer* %3853, i32 0, i32 1
  %3855 = load i64* %3854, align 8
  %3856 = shl i64 %3855, 1
  store i64 %3856, i64* %3854, align 8
  %3857 = load %struct.re_pattern_buffer** %5, align 8
  %3858 = getelementptr inbounds %struct.re_pattern_buffer* %3857, i32 0, i32 1
  %3859 = load i64* %3858, align 8
  %3860 = icmp ugt i64 %3859, 65536
  br i1 %3860, label %3861, label %3864

; <label>:3861                                    ; preds = %3852
  %3862 = load %struct.re_pattern_buffer** %5, align 8
  %3863 = getelementptr inbounds %struct.re_pattern_buffer* %3862, i32 0, i32 1
  store i64 65536, i64* %3863, align 8
  br label %3864

; <label>:3864                                    ; preds = %3861, %3852
  %3865 = load %struct.re_pattern_buffer** %5, align 8
  %3866 = getelementptr inbounds %struct.re_pattern_buffer* %3865, i32 0, i32 0
  %3867 = load i8** %3866, align 8
  %3868 = load %struct.re_pattern_buffer** %5, align 8
  %3869 = getelementptr inbounds %struct.re_pattern_buffer* %3868, i32 0, i32 1
  %3870 = load i64* %3869, align 8
  %3871 = call noalias i8* @realloc(i8* %3867, i64 %3870) nounwind
  %3872 = load %struct.re_pattern_buffer** %5, align 8
  %3873 = getelementptr inbounds %struct.re_pattern_buffer* %3872, i32 0, i32 0
  store i8* %3871, i8** %3873, align 8
  %3874 = load %struct.re_pattern_buffer** %5, align 8
  %3875 = getelementptr inbounds %struct.re_pattern_buffer* %3874, i32 0, i32 0
  %3876 = load i8** %3875, align 8
  %3877 = icmp eq i8* %3876, null
  br i1 %3877, label %3878, label %3879

; <label>:3878                                    ; preds = %3864
  store i32 12, i32* %1
  br label %5348

; <label>:3879                                    ; preds = %3864
  %3880 = load i8** %old_buffer17, align 8
  %3881 = load %struct.re_pattern_buffer** %5, align 8
  %3882 = getelementptr inbounds %struct.re_pattern_buffer* %3881, i32 0, i32 0
  %3883 = load i8** %3882, align 8
  %3884 = icmp ne i8* %3880, %3883
  br i1 %3884, label %3885, label %3943

; <label>:3885                                    ; preds = %3879
  %3886 = load i8** %b, align 8
  %3887 = load i8** %old_buffer17, align 8
  %3888 = ptrtoint i8* %3886 to i64
  %3889 = ptrtoint i8* %3887 to i64
  %3890 = sub i64 %3888, %3889
  %3891 = load %struct.re_pattern_buffer** %5, align 8
  %3892 = getelementptr inbounds %struct.re_pattern_buffer* %3891, i32 0, i32 0
  %3893 = load i8** %3892, align 8
  %3894 = getelementptr inbounds i8* %3893, i64 %3890
  store i8* %3894, i8** %b, align 8
  %3895 = load i8** %begalt, align 8
  %3896 = load i8** %old_buffer17, align 8
  %3897 = ptrtoint i8* %3895 to i64
  %3898 = ptrtoint i8* %3896 to i64
  %3899 = sub i64 %3897, %3898
  %3900 = load %struct.re_pattern_buffer** %5, align 8
  %3901 = getelementptr inbounds %struct.re_pattern_buffer* %3900, i32 0, i32 0
  %3902 = load i8** %3901, align 8
  %3903 = getelementptr inbounds i8* %3902, i64 %3899
  store i8* %3903, i8** %begalt, align 8
  %3904 = load i8** %fixup_alt_jump, align 8
  %3905 = icmp ne i8* %3904, null
  br i1 %3905, label %3906, label %3916

; <label>:3906                                    ; preds = %3885
  %3907 = load i8** %fixup_alt_jump, align 8
  %3908 = load i8** %old_buffer17, align 8
  %3909 = ptrtoint i8* %3907 to i64
  %3910 = ptrtoint i8* %3908 to i64
  %3911 = sub i64 %3909, %3910
  %3912 = load %struct.re_pattern_buffer** %5, align 8
  %3913 = getelementptr inbounds %struct.re_pattern_buffer* %3912, i32 0, i32 0
  %3914 = load i8** %3913, align 8
  %3915 = getelementptr inbounds i8* %3914, i64 %3911
  store i8* %3915, i8** %fixup_alt_jump, align 8
  br label %3916

; <label>:3916                                    ; preds = %3906, %3885
  %3917 = load i8** %laststart, align 8
  %3918 = icmp ne i8* %3917, null
  br i1 %3918, label %3919, label %3929

; <label>:3919                                    ; preds = %3916
  %3920 = load i8** %laststart, align 8
  %3921 = load i8** %old_buffer17, align 8
  %3922 = ptrtoint i8* %3920 to i64
  %3923 = ptrtoint i8* %3921 to i64
  %3924 = sub i64 %3922, %3923
  %3925 = load %struct.re_pattern_buffer** %5, align 8
  %3926 = getelementptr inbounds %struct.re_pattern_buffer* %3925, i32 0, i32 0
  %3927 = load i8** %3926, align 8
  %3928 = getelementptr inbounds i8* %3927, i64 %3924
  store i8* %3928, i8** %laststart, align 8
  br label %3929

; <label>:3929                                    ; preds = %3919, %3916
  %3930 = load i8** %pending_exact, align 8
  %3931 = icmp ne i8* %3930, null
  br i1 %3931, label %3932, label %3942

; <label>:3932                                    ; preds = %3929
  %3933 = load i8** %pending_exact, align 8
  %3934 = load i8** %old_buffer17, align 8
  %3935 = ptrtoint i8* %3933 to i64
  %3936 = ptrtoint i8* %3934 to i64
  %3937 = sub i64 %3935, %3936
  %3938 = load %struct.re_pattern_buffer** %5, align 8
  %3939 = getelementptr inbounds %struct.re_pattern_buffer* %3938, i32 0, i32 0
  %3940 = load i8** %3939, align 8
  %3941 = getelementptr inbounds i8* %3940, i64 %3937
  store i8* %3941, i8** %pending_exact, align 8
  br label %3942

; <label>:3942                                    ; preds = %3932, %3929
  br label %3943

; <label>:3943                                    ; preds = %3942, %3879
  br label %3944

; <label>:3944                                    ; preds = %3943
  br label %3829

; <label>:3945                                    ; preds = %3829
  %3946 = load i8** %b, align 8
  %3947 = getelementptr inbounds i8* %3946, i32 1
  store i8* %3947, i8** %b, align 8
  store i8 23, i8* %3946, align 1
  br label %3948

; <label>:3948                                    ; preds = %3945
  br label %4979

; <label>:3949                                    ; preds = %2301
  %3950 = load i8** %b, align 8
  store i8* %3950, i8** %laststart, align 8
  br label %3951

; <label>:3951                                    ; preds = %3949
  br label %3952

; <label>:3952                                    ; preds = %4067, %3951
  %3953 = load i8** %b, align 8
  %3954 = load %struct.re_pattern_buffer** %5, align 8
  %3955 = getelementptr inbounds %struct.re_pattern_buffer* %3954, i32 0, i32 0
  %3956 = load i8** %3955, align 8
  %3957 = ptrtoint i8* %3953 to i64
  %3958 = ptrtoint i8* %3956 to i64
  %3959 = sub i64 %3957, %3958
  %3960 = add nsw i64 %3959, 1
  %3961 = load %struct.re_pattern_buffer** %5, align 8
  %3962 = getelementptr inbounds %struct.re_pattern_buffer* %3961, i32 0, i32 1
  %3963 = load i64* %3962, align 8
  %3964 = icmp ugt i64 %3960, %3963
  br i1 %3964, label %3965, label %4068

; <label>:3965                                    ; preds = %3952
  br label %3966

; <label>:3966                                    ; preds = %3965
  %3967 = load %struct.re_pattern_buffer** %5, align 8
  %3968 = getelementptr inbounds %struct.re_pattern_buffer* %3967, i32 0, i32 0
  %3969 = load i8** %3968, align 8
  store i8* %3969, i8** %old_buffer18, align 8
  %3970 = load %struct.re_pattern_buffer** %5, align 8
  %3971 = getelementptr inbounds %struct.re_pattern_buffer* %3970, i32 0, i32 1
  %3972 = load i64* %3971, align 8
  %3973 = icmp eq i64 %3972, 65536
  br i1 %3973, label %3974, label %3975

; <label>:3974                                    ; preds = %3966
  store i32 15, i32* %1
  br label %5348

; <label>:3975                                    ; preds = %3966
  %3976 = load %struct.re_pattern_buffer** %5, align 8
  %3977 = getelementptr inbounds %struct.re_pattern_buffer* %3976, i32 0, i32 1
  %3978 = load i64* %3977, align 8
  %3979 = shl i64 %3978, 1
  store i64 %3979, i64* %3977, align 8
  %3980 = load %struct.re_pattern_buffer** %5, align 8
  %3981 = getelementptr inbounds %struct.re_pattern_buffer* %3980, i32 0, i32 1
  %3982 = load i64* %3981, align 8
  %3983 = icmp ugt i64 %3982, 65536
  br i1 %3983, label %3984, label %3987

; <label>:3984                                    ; preds = %3975
  %3985 = load %struct.re_pattern_buffer** %5, align 8
  %3986 = getelementptr inbounds %struct.re_pattern_buffer* %3985, i32 0, i32 1
  store i64 65536, i64* %3986, align 8
  br label %3987

; <label>:3987                                    ; preds = %3984, %3975
  %3988 = load %struct.re_pattern_buffer** %5, align 8
  %3989 = getelementptr inbounds %struct.re_pattern_buffer* %3988, i32 0, i32 0
  %3990 = load i8** %3989, align 8
  %3991 = load %struct.re_pattern_buffer** %5, align 8
  %3992 = getelementptr inbounds %struct.re_pattern_buffer* %3991, i32 0, i32 1
  %3993 = load i64* %3992, align 8
  %3994 = call noalias i8* @realloc(i8* %3990, i64 %3993) nounwind
  %3995 = load %struct.re_pattern_buffer** %5, align 8
  %3996 = getelementptr inbounds %struct.re_pattern_buffer* %3995, i32 0, i32 0
  store i8* %3994, i8** %3996, align 8
  %3997 = load %struct.re_pattern_buffer** %5, align 8
  %3998 = getelementptr inbounds %struct.re_pattern_buffer* %3997, i32 0, i32 0
  %3999 = load i8** %3998, align 8
  %4000 = icmp eq i8* %3999, null
  br i1 %4000, label %4001, label %4002

; <label>:4001                                    ; preds = %3987
  store i32 12, i32* %1
  br label %5348

; <label>:4002                                    ; preds = %3987
  %4003 = load i8** %old_buffer18, align 8
  %4004 = load %struct.re_pattern_buffer** %5, align 8
  %4005 = getelementptr inbounds %struct.re_pattern_buffer* %4004, i32 0, i32 0
  %4006 = load i8** %4005, align 8
  %4007 = icmp ne i8* %4003, %4006
  br i1 %4007, label %4008, label %4066

; <label>:4008                                    ; preds = %4002
  %4009 = load i8** %b, align 8
  %4010 = load i8** %old_buffer18, align 8
  %4011 = ptrtoint i8* %4009 to i64
  %4012 = ptrtoint i8* %4010 to i64
  %4013 = sub i64 %4011, %4012
  %4014 = load %struct.re_pattern_buffer** %5, align 8
  %4015 = getelementptr inbounds %struct.re_pattern_buffer* %4014, i32 0, i32 0
  %4016 = load i8** %4015, align 8
  %4017 = getelementptr inbounds i8* %4016, i64 %4013
  store i8* %4017, i8** %b, align 8
  %4018 = load i8** %begalt, align 8
  %4019 = load i8** %old_buffer18, align 8
  %4020 = ptrtoint i8* %4018 to i64
  %4021 = ptrtoint i8* %4019 to i64
  %4022 = sub i64 %4020, %4021
  %4023 = load %struct.re_pattern_buffer** %5, align 8
  %4024 = getelementptr inbounds %struct.re_pattern_buffer* %4023, i32 0, i32 0
  %4025 = load i8** %4024, align 8
  %4026 = getelementptr inbounds i8* %4025, i64 %4022
  store i8* %4026, i8** %begalt, align 8
  %4027 = load i8** %fixup_alt_jump, align 8
  %4028 = icmp ne i8* %4027, null
  br i1 %4028, label %4029, label %4039

; <label>:4029                                    ; preds = %4008
  %4030 = load i8** %fixup_alt_jump, align 8
  %4031 = load i8** %old_buffer18, align 8
  %4032 = ptrtoint i8* %4030 to i64
  %4033 = ptrtoint i8* %4031 to i64
  %4034 = sub i64 %4032, %4033
  %4035 = load %struct.re_pattern_buffer** %5, align 8
  %4036 = getelementptr inbounds %struct.re_pattern_buffer* %4035, i32 0, i32 0
  %4037 = load i8** %4036, align 8
  %4038 = getelementptr inbounds i8* %4037, i64 %4034
  store i8* %4038, i8** %fixup_alt_jump, align 8
  br label %4039

; <label>:4039                                    ; preds = %4029, %4008
  %4040 = load i8** %laststart, align 8
  %4041 = icmp ne i8* %4040, null
  br i1 %4041, label %4042, label %4052

; <label>:4042                                    ; preds = %4039
  %4043 = load i8** %laststart, align 8
  %4044 = load i8** %old_buffer18, align 8
  %4045 = ptrtoint i8* %4043 to i64
  %4046 = ptrtoint i8* %4044 to i64
  %4047 = sub i64 %4045, %4046
  %4048 = load %struct.re_pattern_buffer** %5, align 8
  %4049 = getelementptr inbounds %struct.re_pattern_buffer* %4048, i32 0, i32 0
  %4050 = load i8** %4049, align 8
  %4051 = getelementptr inbounds i8* %4050, i64 %4047
  store i8* %4051, i8** %laststart, align 8
  br label %4052

; <label>:4052                                    ; preds = %4042, %4039
  %4053 = load i8** %pending_exact, align 8
  %4054 = icmp ne i8* %4053, null
  br i1 %4054, label %4055, label %4065

; <label>:4055                                    ; preds = %4052
  %4056 = load i8** %pending_exact, align 8
  %4057 = load i8** %old_buffer18, align 8
  %4058 = ptrtoint i8* %4056 to i64
  %4059 = ptrtoint i8* %4057 to i64
  %4060 = sub i64 %4058, %4059
  %4061 = load %struct.re_pattern_buffer** %5, align 8
  %4062 = getelementptr inbounds %struct.re_pattern_buffer* %4061, i32 0, i32 0
  %4063 = load i8** %4062, align 8
  %4064 = getelementptr inbounds i8* %4063, i64 %4060
  store i8* %4064, i8** %pending_exact, align 8
  br label %4065

; <label>:4065                                    ; preds = %4055, %4052
  br label %4066

; <label>:4066                                    ; preds = %4065, %4002
  br label %4067

; <label>:4067                                    ; preds = %4066
  br label %3952

; <label>:4068                                    ; preds = %3952
  %4069 = load i8** %b, align 8
  %4070 = getelementptr inbounds i8* %4069, i32 1
  store i8* %4070, i8** %b, align 8
  store i8 24, i8* %4069, align 1
  br label %4071

; <label>:4071                                    ; preds = %4068
  br label %4979

; <label>:4072                                    ; preds = %2301
  br label %4073

; <label>:4073                                    ; preds = %4072
  br label %4074

; <label>:4074                                    ; preds = %4189, %4073
  %4075 = load i8** %b, align 8
  %4076 = load %struct.re_pattern_buffer** %5, align 8
  %4077 = getelementptr inbounds %struct.re_pattern_buffer* %4076, i32 0, i32 0
  %4078 = load i8** %4077, align 8
  %4079 = ptrtoint i8* %4075 to i64
  %4080 = ptrtoint i8* %4078 to i64
  %4081 = sub i64 %4079, %4080
  %4082 = add nsw i64 %4081, 1
  %4083 = load %struct.re_pattern_buffer** %5, align 8
  %4084 = getelementptr inbounds %struct.re_pattern_buffer* %4083, i32 0, i32 1
  %4085 = load i64* %4084, align 8
  %4086 = icmp ugt i64 %4082, %4085
  br i1 %4086, label %4087, label %4190

; <label>:4087                                    ; preds = %4074
  br label %4088

; <label>:4088                                    ; preds = %4087
  %4089 = load %struct.re_pattern_buffer** %5, align 8
  %4090 = getelementptr inbounds %struct.re_pattern_buffer* %4089, i32 0, i32 0
  %4091 = load i8** %4090, align 8
  store i8* %4091, i8** %old_buffer19, align 8
  %4092 = load %struct.re_pattern_buffer** %5, align 8
  %4093 = getelementptr inbounds %struct.re_pattern_buffer* %4092, i32 0, i32 1
  %4094 = load i64* %4093, align 8
  %4095 = icmp eq i64 %4094, 65536
  br i1 %4095, label %4096, label %4097

; <label>:4096                                    ; preds = %4088
  store i32 15, i32* %1
  br label %5348

; <label>:4097                                    ; preds = %4088
  %4098 = load %struct.re_pattern_buffer** %5, align 8
  %4099 = getelementptr inbounds %struct.re_pattern_buffer* %4098, i32 0, i32 1
  %4100 = load i64* %4099, align 8
  %4101 = shl i64 %4100, 1
  store i64 %4101, i64* %4099, align 8
  %4102 = load %struct.re_pattern_buffer** %5, align 8
  %4103 = getelementptr inbounds %struct.re_pattern_buffer* %4102, i32 0, i32 1
  %4104 = load i64* %4103, align 8
  %4105 = icmp ugt i64 %4104, 65536
  br i1 %4105, label %4106, label %4109

; <label>:4106                                    ; preds = %4097
  %4107 = load %struct.re_pattern_buffer** %5, align 8
  %4108 = getelementptr inbounds %struct.re_pattern_buffer* %4107, i32 0, i32 1
  store i64 65536, i64* %4108, align 8
  br label %4109

; <label>:4109                                    ; preds = %4106, %4097
  %4110 = load %struct.re_pattern_buffer** %5, align 8
  %4111 = getelementptr inbounds %struct.re_pattern_buffer* %4110, i32 0, i32 0
  %4112 = load i8** %4111, align 8
  %4113 = load %struct.re_pattern_buffer** %5, align 8
  %4114 = getelementptr inbounds %struct.re_pattern_buffer* %4113, i32 0, i32 1
  %4115 = load i64* %4114, align 8
  %4116 = call noalias i8* @realloc(i8* %4112, i64 %4115) nounwind
  %4117 = load %struct.re_pattern_buffer** %5, align 8
  %4118 = getelementptr inbounds %struct.re_pattern_buffer* %4117, i32 0, i32 0
  store i8* %4116, i8** %4118, align 8
  %4119 = load %struct.re_pattern_buffer** %5, align 8
  %4120 = getelementptr inbounds %struct.re_pattern_buffer* %4119, i32 0, i32 0
  %4121 = load i8** %4120, align 8
  %4122 = icmp eq i8* %4121, null
  br i1 %4122, label %4123, label %4124

; <label>:4123                                    ; preds = %4109
  store i32 12, i32* %1
  br label %5348

; <label>:4124                                    ; preds = %4109
  %4125 = load i8** %old_buffer19, align 8
  %4126 = load %struct.re_pattern_buffer** %5, align 8
  %4127 = getelementptr inbounds %struct.re_pattern_buffer* %4126, i32 0, i32 0
  %4128 = load i8** %4127, align 8
  %4129 = icmp ne i8* %4125, %4128
  br i1 %4129, label %4130, label %4188

; <label>:4130                                    ; preds = %4124
  %4131 = load i8** %b, align 8
  %4132 = load i8** %old_buffer19, align 8
  %4133 = ptrtoint i8* %4131 to i64
  %4134 = ptrtoint i8* %4132 to i64
  %4135 = sub i64 %4133, %4134
  %4136 = load %struct.re_pattern_buffer** %5, align 8
  %4137 = getelementptr inbounds %struct.re_pattern_buffer* %4136, i32 0, i32 0
  %4138 = load i8** %4137, align 8
  %4139 = getelementptr inbounds i8* %4138, i64 %4135
  store i8* %4139, i8** %b, align 8
  %4140 = load i8** %begalt, align 8
  %4141 = load i8** %old_buffer19, align 8
  %4142 = ptrtoint i8* %4140 to i64
  %4143 = ptrtoint i8* %4141 to i64
  %4144 = sub i64 %4142, %4143
  %4145 = load %struct.re_pattern_buffer** %5, align 8
  %4146 = getelementptr inbounds %struct.re_pattern_buffer* %4145, i32 0, i32 0
  %4147 = load i8** %4146, align 8
  %4148 = getelementptr inbounds i8* %4147, i64 %4144
  store i8* %4148, i8** %begalt, align 8
  %4149 = load i8** %fixup_alt_jump, align 8
  %4150 = icmp ne i8* %4149, null
  br i1 %4150, label %4151, label %4161

; <label>:4151                                    ; preds = %4130
  %4152 = load i8** %fixup_alt_jump, align 8
  %4153 = load i8** %old_buffer19, align 8
  %4154 = ptrtoint i8* %4152 to i64
  %4155 = ptrtoint i8* %4153 to i64
  %4156 = sub i64 %4154, %4155
  %4157 = load %struct.re_pattern_buffer** %5, align 8
  %4158 = getelementptr inbounds %struct.re_pattern_buffer* %4157, i32 0, i32 0
  %4159 = load i8** %4158, align 8
  %4160 = getelementptr inbounds i8* %4159, i64 %4156
  store i8* %4160, i8** %fixup_alt_jump, align 8
  br label %4161

; <label>:4161                                    ; preds = %4151, %4130
  %4162 = load i8** %laststart, align 8
  %4163 = icmp ne i8* %4162, null
  br i1 %4163, label %4164, label %4174

; <label>:4164                                    ; preds = %4161
  %4165 = load i8** %laststart, align 8
  %4166 = load i8** %old_buffer19, align 8
  %4167 = ptrtoint i8* %4165 to i64
  %4168 = ptrtoint i8* %4166 to i64
  %4169 = sub i64 %4167, %4168
  %4170 = load %struct.re_pattern_buffer** %5, align 8
  %4171 = getelementptr inbounds %struct.re_pattern_buffer* %4170, i32 0, i32 0
  %4172 = load i8** %4171, align 8
  %4173 = getelementptr inbounds i8* %4172, i64 %4169
  store i8* %4173, i8** %laststart, align 8
  br label %4174

; <label>:4174                                    ; preds = %4164, %4161
  %4175 = load i8** %pending_exact, align 8
  %4176 = icmp ne i8* %4175, null
  br i1 %4176, label %4177, label %4187

; <label>:4177                                    ; preds = %4174
  %4178 = load i8** %pending_exact, align 8
  %4179 = load i8** %old_buffer19, align 8
  %4180 = ptrtoint i8* %4178 to i64
  %4181 = ptrtoint i8* %4179 to i64
  %4182 = sub i64 %4180, %4181
  %4183 = load %struct.re_pattern_buffer** %5, align 8
  %4184 = getelementptr inbounds %struct.re_pattern_buffer* %4183, i32 0, i32 0
  %4185 = load i8** %4184, align 8
  %4186 = getelementptr inbounds i8* %4185, i64 %4182
  store i8* %4186, i8** %pending_exact, align 8
  br label %4187

; <label>:4187                                    ; preds = %4177, %4174
  br label %4188

; <label>:4188                                    ; preds = %4187, %4124
  br label %4189

; <label>:4189                                    ; preds = %4188
  br label %4074

; <label>:4190                                    ; preds = %4074
  %4191 = load i8** %b, align 8
  %4192 = getelementptr inbounds i8* %4191, i32 1
  store i8* %4192, i8** %b, align 8
  store i8 25, i8* %4191, align 1
  br label %4193

; <label>:4193                                    ; preds = %4190
  br label %4979

; <label>:4194                                    ; preds = %2301
  br label %4195

; <label>:4195                                    ; preds = %4194
  br label %4196

; <label>:4196                                    ; preds = %4311, %4195
  %4197 = load i8** %b, align 8
  %4198 = load %struct.re_pattern_buffer** %5, align 8
  %4199 = getelementptr inbounds %struct.re_pattern_buffer* %4198, i32 0, i32 0
  %4200 = load i8** %4199, align 8
  %4201 = ptrtoint i8* %4197 to i64
  %4202 = ptrtoint i8* %4200 to i64
  %4203 = sub i64 %4201, %4202
  %4204 = add nsw i64 %4203, 1
  %4205 = load %struct.re_pattern_buffer** %5, align 8
  %4206 = getelementptr inbounds %struct.re_pattern_buffer* %4205, i32 0, i32 1
  %4207 = load i64* %4206, align 8
  %4208 = icmp ugt i64 %4204, %4207
  br i1 %4208, label %4209, label %4312

; <label>:4209                                    ; preds = %4196
  br label %4210

; <label>:4210                                    ; preds = %4209
  %4211 = load %struct.re_pattern_buffer** %5, align 8
  %4212 = getelementptr inbounds %struct.re_pattern_buffer* %4211, i32 0, i32 0
  %4213 = load i8** %4212, align 8
  store i8* %4213, i8** %old_buffer20, align 8
  %4214 = load %struct.re_pattern_buffer** %5, align 8
  %4215 = getelementptr inbounds %struct.re_pattern_buffer* %4214, i32 0, i32 1
  %4216 = load i64* %4215, align 8
  %4217 = icmp eq i64 %4216, 65536
  br i1 %4217, label %4218, label %4219

; <label>:4218                                    ; preds = %4210
  store i32 15, i32* %1
  br label %5348

; <label>:4219                                    ; preds = %4210
  %4220 = load %struct.re_pattern_buffer** %5, align 8
  %4221 = getelementptr inbounds %struct.re_pattern_buffer* %4220, i32 0, i32 1
  %4222 = load i64* %4221, align 8
  %4223 = shl i64 %4222, 1
  store i64 %4223, i64* %4221, align 8
  %4224 = load %struct.re_pattern_buffer** %5, align 8
  %4225 = getelementptr inbounds %struct.re_pattern_buffer* %4224, i32 0, i32 1
  %4226 = load i64* %4225, align 8
  %4227 = icmp ugt i64 %4226, 65536
  br i1 %4227, label %4228, label %4231

; <label>:4228                                    ; preds = %4219
  %4229 = load %struct.re_pattern_buffer** %5, align 8
  %4230 = getelementptr inbounds %struct.re_pattern_buffer* %4229, i32 0, i32 1
  store i64 65536, i64* %4230, align 8
  br label %4231

; <label>:4231                                    ; preds = %4228, %4219
  %4232 = load %struct.re_pattern_buffer** %5, align 8
  %4233 = getelementptr inbounds %struct.re_pattern_buffer* %4232, i32 0, i32 0
  %4234 = load i8** %4233, align 8
  %4235 = load %struct.re_pattern_buffer** %5, align 8
  %4236 = getelementptr inbounds %struct.re_pattern_buffer* %4235, i32 0, i32 1
  %4237 = load i64* %4236, align 8
  %4238 = call noalias i8* @realloc(i8* %4234, i64 %4237) nounwind
  %4239 = load %struct.re_pattern_buffer** %5, align 8
  %4240 = getelementptr inbounds %struct.re_pattern_buffer* %4239, i32 0, i32 0
  store i8* %4238, i8** %4240, align 8
  %4241 = load %struct.re_pattern_buffer** %5, align 8
  %4242 = getelementptr inbounds %struct.re_pattern_buffer* %4241, i32 0, i32 0
  %4243 = load i8** %4242, align 8
  %4244 = icmp eq i8* %4243, null
  br i1 %4244, label %4245, label %4246

; <label>:4245                                    ; preds = %4231
  store i32 12, i32* %1
  br label %5348

; <label>:4246                                    ; preds = %4231
  %4247 = load i8** %old_buffer20, align 8
  %4248 = load %struct.re_pattern_buffer** %5, align 8
  %4249 = getelementptr inbounds %struct.re_pattern_buffer* %4248, i32 0, i32 0
  %4250 = load i8** %4249, align 8
  %4251 = icmp ne i8* %4247, %4250
  br i1 %4251, label %4252, label %4310

; <label>:4252                                    ; preds = %4246
  %4253 = load i8** %b, align 8
  %4254 = load i8** %old_buffer20, align 8
  %4255 = ptrtoint i8* %4253 to i64
  %4256 = ptrtoint i8* %4254 to i64
  %4257 = sub i64 %4255, %4256
  %4258 = load %struct.re_pattern_buffer** %5, align 8
  %4259 = getelementptr inbounds %struct.re_pattern_buffer* %4258, i32 0, i32 0
  %4260 = load i8** %4259, align 8
  %4261 = getelementptr inbounds i8* %4260, i64 %4257
  store i8* %4261, i8** %b, align 8
  %4262 = load i8** %begalt, align 8
  %4263 = load i8** %old_buffer20, align 8
  %4264 = ptrtoint i8* %4262 to i64
  %4265 = ptrtoint i8* %4263 to i64
  %4266 = sub i64 %4264, %4265
  %4267 = load %struct.re_pattern_buffer** %5, align 8
  %4268 = getelementptr inbounds %struct.re_pattern_buffer* %4267, i32 0, i32 0
  %4269 = load i8** %4268, align 8
  %4270 = getelementptr inbounds i8* %4269, i64 %4266
  store i8* %4270, i8** %begalt, align 8
  %4271 = load i8** %fixup_alt_jump, align 8
  %4272 = icmp ne i8* %4271, null
  br i1 %4272, label %4273, label %4283

; <label>:4273                                    ; preds = %4252
  %4274 = load i8** %fixup_alt_jump, align 8
  %4275 = load i8** %old_buffer20, align 8
  %4276 = ptrtoint i8* %4274 to i64
  %4277 = ptrtoint i8* %4275 to i64
  %4278 = sub i64 %4276, %4277
  %4279 = load %struct.re_pattern_buffer** %5, align 8
  %4280 = getelementptr inbounds %struct.re_pattern_buffer* %4279, i32 0, i32 0
  %4281 = load i8** %4280, align 8
  %4282 = getelementptr inbounds i8* %4281, i64 %4278
  store i8* %4282, i8** %fixup_alt_jump, align 8
  br label %4283

; <label>:4283                                    ; preds = %4273, %4252
  %4284 = load i8** %laststart, align 8
  %4285 = icmp ne i8* %4284, null
  br i1 %4285, label %4286, label %4296

; <label>:4286                                    ; preds = %4283
  %4287 = load i8** %laststart, align 8
  %4288 = load i8** %old_buffer20, align 8
  %4289 = ptrtoint i8* %4287 to i64
  %4290 = ptrtoint i8* %4288 to i64
  %4291 = sub i64 %4289, %4290
  %4292 = load %struct.re_pattern_buffer** %5, align 8
  %4293 = getelementptr inbounds %struct.re_pattern_buffer* %4292, i32 0, i32 0
  %4294 = load i8** %4293, align 8
  %4295 = getelementptr inbounds i8* %4294, i64 %4291
  store i8* %4295, i8** %laststart, align 8
  br label %4296

; <label>:4296                                    ; preds = %4286, %4283
  %4297 = load i8** %pending_exact, align 8
  %4298 = icmp ne i8* %4297, null
  br i1 %4298, label %4299, label %4309

; <label>:4299                                    ; preds = %4296
  %4300 = load i8** %pending_exact, align 8
  %4301 = load i8** %old_buffer20, align 8
  %4302 = ptrtoint i8* %4300 to i64
  %4303 = ptrtoint i8* %4301 to i64
  %4304 = sub i64 %4302, %4303
  %4305 = load %struct.re_pattern_buffer** %5, align 8
  %4306 = getelementptr inbounds %struct.re_pattern_buffer* %4305, i32 0, i32 0
  %4307 = load i8** %4306, align 8
  %4308 = getelementptr inbounds i8* %4307, i64 %4304
  store i8* %4308, i8** %pending_exact, align 8
  br label %4309

; <label>:4309                                    ; preds = %4299, %4296
  br label %4310

; <label>:4310                                    ; preds = %4309, %4246
  br label %4311

; <label>:4311                                    ; preds = %4310
  br label %4196

; <label>:4312                                    ; preds = %4196
  %4313 = load i8** %b, align 8
  %4314 = getelementptr inbounds i8* %4313, i32 1
  store i8* %4314, i8** %b, align 8
  store i8 26, i8* %4313, align 1
  br label %4315

; <label>:4315                                    ; preds = %4312
  br label %4979

; <label>:4316                                    ; preds = %2301
  br label %4317

; <label>:4317                                    ; preds = %4316
  br label %4318

; <label>:4318                                    ; preds = %4433, %4317
  %4319 = load i8** %b, align 8
  %4320 = load %struct.re_pattern_buffer** %5, align 8
  %4321 = getelementptr inbounds %struct.re_pattern_buffer* %4320, i32 0, i32 0
  %4322 = load i8** %4321, align 8
  %4323 = ptrtoint i8* %4319 to i64
  %4324 = ptrtoint i8* %4322 to i64
  %4325 = sub i64 %4323, %4324
  %4326 = add nsw i64 %4325, 1
  %4327 = load %struct.re_pattern_buffer** %5, align 8
  %4328 = getelementptr inbounds %struct.re_pattern_buffer* %4327, i32 0, i32 1
  %4329 = load i64* %4328, align 8
  %4330 = icmp ugt i64 %4326, %4329
  br i1 %4330, label %4331, label %4434

; <label>:4331                                    ; preds = %4318
  br label %4332

; <label>:4332                                    ; preds = %4331
  %4333 = load %struct.re_pattern_buffer** %5, align 8
  %4334 = getelementptr inbounds %struct.re_pattern_buffer* %4333, i32 0, i32 0
  %4335 = load i8** %4334, align 8
  store i8* %4335, i8** %old_buffer21, align 8
  %4336 = load %struct.re_pattern_buffer** %5, align 8
  %4337 = getelementptr inbounds %struct.re_pattern_buffer* %4336, i32 0, i32 1
  %4338 = load i64* %4337, align 8
  %4339 = icmp eq i64 %4338, 65536
  br i1 %4339, label %4340, label %4341

; <label>:4340                                    ; preds = %4332
  store i32 15, i32* %1
  br label %5348

; <label>:4341                                    ; preds = %4332
  %4342 = load %struct.re_pattern_buffer** %5, align 8
  %4343 = getelementptr inbounds %struct.re_pattern_buffer* %4342, i32 0, i32 1
  %4344 = load i64* %4343, align 8
  %4345 = shl i64 %4344, 1
  store i64 %4345, i64* %4343, align 8
  %4346 = load %struct.re_pattern_buffer** %5, align 8
  %4347 = getelementptr inbounds %struct.re_pattern_buffer* %4346, i32 0, i32 1
  %4348 = load i64* %4347, align 8
  %4349 = icmp ugt i64 %4348, 65536
  br i1 %4349, label %4350, label %4353

; <label>:4350                                    ; preds = %4341
  %4351 = load %struct.re_pattern_buffer** %5, align 8
  %4352 = getelementptr inbounds %struct.re_pattern_buffer* %4351, i32 0, i32 1
  store i64 65536, i64* %4352, align 8
  br label %4353

; <label>:4353                                    ; preds = %4350, %4341
  %4354 = load %struct.re_pattern_buffer** %5, align 8
  %4355 = getelementptr inbounds %struct.re_pattern_buffer* %4354, i32 0, i32 0
  %4356 = load i8** %4355, align 8
  %4357 = load %struct.re_pattern_buffer** %5, align 8
  %4358 = getelementptr inbounds %struct.re_pattern_buffer* %4357, i32 0, i32 1
  %4359 = load i64* %4358, align 8
  %4360 = call noalias i8* @realloc(i8* %4356, i64 %4359) nounwind
  %4361 = load %struct.re_pattern_buffer** %5, align 8
  %4362 = getelementptr inbounds %struct.re_pattern_buffer* %4361, i32 0, i32 0
  store i8* %4360, i8** %4362, align 8
  %4363 = load %struct.re_pattern_buffer** %5, align 8
  %4364 = getelementptr inbounds %struct.re_pattern_buffer* %4363, i32 0, i32 0
  %4365 = load i8** %4364, align 8
  %4366 = icmp eq i8* %4365, null
  br i1 %4366, label %4367, label %4368

; <label>:4367                                    ; preds = %4353
  store i32 12, i32* %1
  br label %5348

; <label>:4368                                    ; preds = %4353
  %4369 = load i8** %old_buffer21, align 8
  %4370 = load %struct.re_pattern_buffer** %5, align 8
  %4371 = getelementptr inbounds %struct.re_pattern_buffer* %4370, i32 0, i32 0
  %4372 = load i8** %4371, align 8
  %4373 = icmp ne i8* %4369, %4372
  br i1 %4373, label %4374, label %4432

; <label>:4374                                    ; preds = %4368
  %4375 = load i8** %b, align 8
  %4376 = load i8** %old_buffer21, align 8
  %4377 = ptrtoint i8* %4375 to i64
  %4378 = ptrtoint i8* %4376 to i64
  %4379 = sub i64 %4377, %4378
  %4380 = load %struct.re_pattern_buffer** %5, align 8
  %4381 = getelementptr inbounds %struct.re_pattern_buffer* %4380, i32 0, i32 0
  %4382 = load i8** %4381, align 8
  %4383 = getelementptr inbounds i8* %4382, i64 %4379
  store i8* %4383, i8** %b, align 8
  %4384 = load i8** %begalt, align 8
  %4385 = load i8** %old_buffer21, align 8
  %4386 = ptrtoint i8* %4384 to i64
  %4387 = ptrtoint i8* %4385 to i64
  %4388 = sub i64 %4386, %4387
  %4389 = load %struct.re_pattern_buffer** %5, align 8
  %4390 = getelementptr inbounds %struct.re_pattern_buffer* %4389, i32 0, i32 0
  %4391 = load i8** %4390, align 8
  %4392 = getelementptr inbounds i8* %4391, i64 %4388
  store i8* %4392, i8** %begalt, align 8
  %4393 = load i8** %fixup_alt_jump, align 8
  %4394 = icmp ne i8* %4393, null
  br i1 %4394, label %4395, label %4405

; <label>:4395                                    ; preds = %4374
  %4396 = load i8** %fixup_alt_jump, align 8
  %4397 = load i8** %old_buffer21, align 8
  %4398 = ptrtoint i8* %4396 to i64
  %4399 = ptrtoint i8* %4397 to i64
  %4400 = sub i64 %4398, %4399
  %4401 = load %struct.re_pattern_buffer** %5, align 8
  %4402 = getelementptr inbounds %struct.re_pattern_buffer* %4401, i32 0, i32 0
  %4403 = load i8** %4402, align 8
  %4404 = getelementptr inbounds i8* %4403, i64 %4400
  store i8* %4404, i8** %fixup_alt_jump, align 8
  br label %4405

; <label>:4405                                    ; preds = %4395, %4374
  %4406 = load i8** %laststart, align 8
  %4407 = icmp ne i8* %4406, null
  br i1 %4407, label %4408, label %4418

; <label>:4408                                    ; preds = %4405
  %4409 = load i8** %laststart, align 8
  %4410 = load i8** %old_buffer21, align 8
  %4411 = ptrtoint i8* %4409 to i64
  %4412 = ptrtoint i8* %4410 to i64
  %4413 = sub i64 %4411, %4412
  %4414 = load %struct.re_pattern_buffer** %5, align 8
  %4415 = getelementptr inbounds %struct.re_pattern_buffer* %4414, i32 0, i32 0
  %4416 = load i8** %4415, align 8
  %4417 = getelementptr inbounds i8* %4416, i64 %4413
  store i8* %4417, i8** %laststart, align 8
  br label %4418

; <label>:4418                                    ; preds = %4408, %4405
  %4419 = load i8** %pending_exact, align 8
  %4420 = icmp ne i8* %4419, null
  br i1 %4420, label %4421, label %4431

; <label>:4421                                    ; preds = %4418
  %4422 = load i8** %pending_exact, align 8
  %4423 = load i8** %old_buffer21, align 8
  %4424 = ptrtoint i8* %4422 to i64
  %4425 = ptrtoint i8* %4423 to i64
  %4426 = sub i64 %4424, %4425
  %4427 = load %struct.re_pattern_buffer** %5, align 8
  %4428 = getelementptr inbounds %struct.re_pattern_buffer* %4427, i32 0, i32 0
  %4429 = load i8** %4428, align 8
  %4430 = getelementptr inbounds i8* %4429, i64 %4426
  store i8* %4430, i8** %pending_exact, align 8
  br label %4431

; <label>:4431                                    ; preds = %4421, %4418
  br label %4432

; <label>:4432                                    ; preds = %4431, %4368
  br label %4433

; <label>:4433                                    ; preds = %4432
  br label %4318

; <label>:4434                                    ; preds = %4318
  %4435 = load i8** %b, align 8
  %4436 = getelementptr inbounds i8* %4435, i32 1
  store i8* %4436, i8** %b, align 8
  store i8 27, i8* %4435, align 1
  br label %4437

; <label>:4437                                    ; preds = %4434
  br label %4979

; <label>:4438                                    ; preds = %2301
  br label %4439

; <label>:4439                                    ; preds = %4438
  br label %4440

; <label>:4440                                    ; preds = %4555, %4439
  %4441 = load i8** %b, align 8
  %4442 = load %struct.re_pattern_buffer** %5, align 8
  %4443 = getelementptr inbounds %struct.re_pattern_buffer* %4442, i32 0, i32 0
  %4444 = load i8** %4443, align 8
  %4445 = ptrtoint i8* %4441 to i64
  %4446 = ptrtoint i8* %4444 to i64
  %4447 = sub i64 %4445, %4446
  %4448 = add nsw i64 %4447, 1
  %4449 = load %struct.re_pattern_buffer** %5, align 8
  %4450 = getelementptr inbounds %struct.re_pattern_buffer* %4449, i32 0, i32 1
  %4451 = load i64* %4450, align 8
  %4452 = icmp ugt i64 %4448, %4451
  br i1 %4452, label %4453, label %4556

; <label>:4453                                    ; preds = %4440
  br label %4454

; <label>:4454                                    ; preds = %4453
  %4455 = load %struct.re_pattern_buffer** %5, align 8
  %4456 = getelementptr inbounds %struct.re_pattern_buffer* %4455, i32 0, i32 0
  %4457 = load i8** %4456, align 8
  store i8* %4457, i8** %old_buffer22, align 8
  %4458 = load %struct.re_pattern_buffer** %5, align 8
  %4459 = getelementptr inbounds %struct.re_pattern_buffer* %4458, i32 0, i32 1
  %4460 = load i64* %4459, align 8
  %4461 = icmp eq i64 %4460, 65536
  br i1 %4461, label %4462, label %4463

; <label>:4462                                    ; preds = %4454
  store i32 15, i32* %1
  br label %5348

; <label>:4463                                    ; preds = %4454
  %4464 = load %struct.re_pattern_buffer** %5, align 8
  %4465 = getelementptr inbounds %struct.re_pattern_buffer* %4464, i32 0, i32 1
  %4466 = load i64* %4465, align 8
  %4467 = shl i64 %4466, 1
  store i64 %4467, i64* %4465, align 8
  %4468 = load %struct.re_pattern_buffer** %5, align 8
  %4469 = getelementptr inbounds %struct.re_pattern_buffer* %4468, i32 0, i32 1
  %4470 = load i64* %4469, align 8
  %4471 = icmp ugt i64 %4470, 65536
  br i1 %4471, label %4472, label %4475

; <label>:4472                                    ; preds = %4463
  %4473 = load %struct.re_pattern_buffer** %5, align 8
  %4474 = getelementptr inbounds %struct.re_pattern_buffer* %4473, i32 0, i32 1
  store i64 65536, i64* %4474, align 8
  br label %4475

; <label>:4475                                    ; preds = %4472, %4463
  %4476 = load %struct.re_pattern_buffer** %5, align 8
  %4477 = getelementptr inbounds %struct.re_pattern_buffer* %4476, i32 0, i32 0
  %4478 = load i8** %4477, align 8
  %4479 = load %struct.re_pattern_buffer** %5, align 8
  %4480 = getelementptr inbounds %struct.re_pattern_buffer* %4479, i32 0, i32 1
  %4481 = load i64* %4480, align 8
  %4482 = call noalias i8* @realloc(i8* %4478, i64 %4481) nounwind
  %4483 = load %struct.re_pattern_buffer** %5, align 8
  %4484 = getelementptr inbounds %struct.re_pattern_buffer* %4483, i32 0, i32 0
  store i8* %4482, i8** %4484, align 8
  %4485 = load %struct.re_pattern_buffer** %5, align 8
  %4486 = getelementptr inbounds %struct.re_pattern_buffer* %4485, i32 0, i32 0
  %4487 = load i8** %4486, align 8
  %4488 = icmp eq i8* %4487, null
  br i1 %4488, label %4489, label %4490

; <label>:4489                                    ; preds = %4475
  store i32 12, i32* %1
  br label %5348

; <label>:4490                                    ; preds = %4475
  %4491 = load i8** %old_buffer22, align 8
  %4492 = load %struct.re_pattern_buffer** %5, align 8
  %4493 = getelementptr inbounds %struct.re_pattern_buffer* %4492, i32 0, i32 0
  %4494 = load i8** %4493, align 8
  %4495 = icmp ne i8* %4491, %4494
  br i1 %4495, label %4496, label %4554

; <label>:4496                                    ; preds = %4490
  %4497 = load i8** %b, align 8
  %4498 = load i8** %old_buffer22, align 8
  %4499 = ptrtoint i8* %4497 to i64
  %4500 = ptrtoint i8* %4498 to i64
  %4501 = sub i64 %4499, %4500
  %4502 = load %struct.re_pattern_buffer** %5, align 8
  %4503 = getelementptr inbounds %struct.re_pattern_buffer* %4502, i32 0, i32 0
  %4504 = load i8** %4503, align 8
  %4505 = getelementptr inbounds i8* %4504, i64 %4501
  store i8* %4505, i8** %b, align 8
  %4506 = load i8** %begalt, align 8
  %4507 = load i8** %old_buffer22, align 8
  %4508 = ptrtoint i8* %4506 to i64
  %4509 = ptrtoint i8* %4507 to i64
  %4510 = sub i64 %4508, %4509
  %4511 = load %struct.re_pattern_buffer** %5, align 8
  %4512 = getelementptr inbounds %struct.re_pattern_buffer* %4511, i32 0, i32 0
  %4513 = load i8** %4512, align 8
  %4514 = getelementptr inbounds i8* %4513, i64 %4510
  store i8* %4514, i8** %begalt, align 8
  %4515 = load i8** %fixup_alt_jump, align 8
  %4516 = icmp ne i8* %4515, null
  br i1 %4516, label %4517, label %4527

; <label>:4517                                    ; preds = %4496
  %4518 = load i8** %fixup_alt_jump, align 8
  %4519 = load i8** %old_buffer22, align 8
  %4520 = ptrtoint i8* %4518 to i64
  %4521 = ptrtoint i8* %4519 to i64
  %4522 = sub i64 %4520, %4521
  %4523 = load %struct.re_pattern_buffer** %5, align 8
  %4524 = getelementptr inbounds %struct.re_pattern_buffer* %4523, i32 0, i32 0
  %4525 = load i8** %4524, align 8
  %4526 = getelementptr inbounds i8* %4525, i64 %4522
  store i8* %4526, i8** %fixup_alt_jump, align 8
  br label %4527

; <label>:4527                                    ; preds = %4517, %4496
  %4528 = load i8** %laststart, align 8
  %4529 = icmp ne i8* %4528, null
  br i1 %4529, label %4530, label %4540

; <label>:4530                                    ; preds = %4527
  %4531 = load i8** %laststart, align 8
  %4532 = load i8** %old_buffer22, align 8
  %4533 = ptrtoint i8* %4531 to i64
  %4534 = ptrtoint i8* %4532 to i64
  %4535 = sub i64 %4533, %4534
  %4536 = load %struct.re_pattern_buffer** %5, align 8
  %4537 = getelementptr inbounds %struct.re_pattern_buffer* %4536, i32 0, i32 0
  %4538 = load i8** %4537, align 8
  %4539 = getelementptr inbounds i8* %4538, i64 %4535
  store i8* %4539, i8** %laststart, align 8
  br label %4540

; <label>:4540                                    ; preds = %4530, %4527
  %4541 = load i8** %pending_exact, align 8
  %4542 = icmp ne i8* %4541, null
  br i1 %4542, label %4543, label %4553

; <label>:4543                                    ; preds = %4540
  %4544 = load i8** %pending_exact, align 8
  %4545 = load i8** %old_buffer22, align 8
  %4546 = ptrtoint i8* %4544 to i64
  %4547 = ptrtoint i8* %4545 to i64
  %4548 = sub i64 %4546, %4547
  %4549 = load %struct.re_pattern_buffer** %5, align 8
  %4550 = getelementptr inbounds %struct.re_pattern_buffer* %4549, i32 0, i32 0
  %4551 = load i8** %4550, align 8
  %4552 = getelementptr inbounds i8* %4551, i64 %4548
  store i8* %4552, i8** %pending_exact, align 8
  br label %4553

; <label>:4553                                    ; preds = %4543, %4540
  br label %4554

; <label>:4554                                    ; preds = %4553, %4490
  br label %4555

; <label>:4555                                    ; preds = %4554
  br label %4440

; <label>:4556                                    ; preds = %4440
  %4557 = load i8** %b, align 8
  %4558 = getelementptr inbounds i8* %4557, i32 1
  store i8* %4558, i8** %b, align 8
  store i8 28, i8* %4557, align 1
  br label %4559

; <label>:4559                                    ; preds = %4556
  br label %4979

; <label>:4560                                    ; preds = %2301
  br label %4561

; <label>:4561                                    ; preds = %4560
  br label %4562

; <label>:4562                                    ; preds = %4677, %4561
  %4563 = load i8** %b, align 8
  %4564 = load %struct.re_pattern_buffer** %5, align 8
  %4565 = getelementptr inbounds %struct.re_pattern_buffer* %4564, i32 0, i32 0
  %4566 = load i8** %4565, align 8
  %4567 = ptrtoint i8* %4563 to i64
  %4568 = ptrtoint i8* %4566 to i64
  %4569 = sub i64 %4567, %4568
  %4570 = add nsw i64 %4569, 1
  %4571 = load %struct.re_pattern_buffer** %5, align 8
  %4572 = getelementptr inbounds %struct.re_pattern_buffer* %4571, i32 0, i32 1
  %4573 = load i64* %4572, align 8
  %4574 = icmp ugt i64 %4570, %4573
  br i1 %4574, label %4575, label %4678

; <label>:4575                                    ; preds = %4562
  br label %4576

; <label>:4576                                    ; preds = %4575
  %4577 = load %struct.re_pattern_buffer** %5, align 8
  %4578 = getelementptr inbounds %struct.re_pattern_buffer* %4577, i32 0, i32 0
  %4579 = load i8** %4578, align 8
  store i8* %4579, i8** %old_buffer23, align 8
  %4580 = load %struct.re_pattern_buffer** %5, align 8
  %4581 = getelementptr inbounds %struct.re_pattern_buffer* %4580, i32 0, i32 1
  %4582 = load i64* %4581, align 8
  %4583 = icmp eq i64 %4582, 65536
  br i1 %4583, label %4584, label %4585

; <label>:4584                                    ; preds = %4576
  store i32 15, i32* %1
  br label %5348

; <label>:4585                                    ; preds = %4576
  %4586 = load %struct.re_pattern_buffer** %5, align 8
  %4587 = getelementptr inbounds %struct.re_pattern_buffer* %4586, i32 0, i32 1
  %4588 = load i64* %4587, align 8
  %4589 = shl i64 %4588, 1
  store i64 %4589, i64* %4587, align 8
  %4590 = load %struct.re_pattern_buffer** %5, align 8
  %4591 = getelementptr inbounds %struct.re_pattern_buffer* %4590, i32 0, i32 1
  %4592 = load i64* %4591, align 8
  %4593 = icmp ugt i64 %4592, 65536
  br i1 %4593, label %4594, label %4597

; <label>:4594                                    ; preds = %4585
  %4595 = load %struct.re_pattern_buffer** %5, align 8
  %4596 = getelementptr inbounds %struct.re_pattern_buffer* %4595, i32 0, i32 1
  store i64 65536, i64* %4596, align 8
  br label %4597

; <label>:4597                                    ; preds = %4594, %4585
  %4598 = load %struct.re_pattern_buffer** %5, align 8
  %4599 = getelementptr inbounds %struct.re_pattern_buffer* %4598, i32 0, i32 0
  %4600 = load i8** %4599, align 8
  %4601 = load %struct.re_pattern_buffer** %5, align 8
  %4602 = getelementptr inbounds %struct.re_pattern_buffer* %4601, i32 0, i32 1
  %4603 = load i64* %4602, align 8
  %4604 = call noalias i8* @realloc(i8* %4600, i64 %4603) nounwind
  %4605 = load %struct.re_pattern_buffer** %5, align 8
  %4606 = getelementptr inbounds %struct.re_pattern_buffer* %4605, i32 0, i32 0
  store i8* %4604, i8** %4606, align 8
  %4607 = load %struct.re_pattern_buffer** %5, align 8
  %4608 = getelementptr inbounds %struct.re_pattern_buffer* %4607, i32 0, i32 0
  %4609 = load i8** %4608, align 8
  %4610 = icmp eq i8* %4609, null
  br i1 %4610, label %4611, label %4612

; <label>:4611                                    ; preds = %4597
  store i32 12, i32* %1
  br label %5348

; <label>:4612                                    ; preds = %4597
  %4613 = load i8** %old_buffer23, align 8
  %4614 = load %struct.re_pattern_buffer** %5, align 8
  %4615 = getelementptr inbounds %struct.re_pattern_buffer* %4614, i32 0, i32 0
  %4616 = load i8** %4615, align 8
  %4617 = icmp ne i8* %4613, %4616
  br i1 %4617, label %4618, label %4676

; <label>:4618                                    ; preds = %4612
  %4619 = load i8** %b, align 8
  %4620 = load i8** %old_buffer23, align 8
  %4621 = ptrtoint i8* %4619 to i64
  %4622 = ptrtoint i8* %4620 to i64
  %4623 = sub i64 %4621, %4622
  %4624 = load %struct.re_pattern_buffer** %5, align 8
  %4625 = getelementptr inbounds %struct.re_pattern_buffer* %4624, i32 0, i32 0
  %4626 = load i8** %4625, align 8
  %4627 = getelementptr inbounds i8* %4626, i64 %4623
  store i8* %4627, i8** %b, align 8
  %4628 = load i8** %begalt, align 8
  %4629 = load i8** %old_buffer23, align 8
  %4630 = ptrtoint i8* %4628 to i64
  %4631 = ptrtoint i8* %4629 to i64
  %4632 = sub i64 %4630, %4631
  %4633 = load %struct.re_pattern_buffer** %5, align 8
  %4634 = getelementptr inbounds %struct.re_pattern_buffer* %4633, i32 0, i32 0
  %4635 = load i8** %4634, align 8
  %4636 = getelementptr inbounds i8* %4635, i64 %4632
  store i8* %4636, i8** %begalt, align 8
  %4637 = load i8** %fixup_alt_jump, align 8
  %4638 = icmp ne i8* %4637, null
  br i1 %4638, label %4639, label %4649

; <label>:4639                                    ; preds = %4618
  %4640 = load i8** %fixup_alt_jump, align 8
  %4641 = load i8** %old_buffer23, align 8
  %4642 = ptrtoint i8* %4640 to i64
  %4643 = ptrtoint i8* %4641 to i64
  %4644 = sub i64 %4642, %4643
  %4645 = load %struct.re_pattern_buffer** %5, align 8
  %4646 = getelementptr inbounds %struct.re_pattern_buffer* %4645, i32 0, i32 0
  %4647 = load i8** %4646, align 8
  %4648 = getelementptr inbounds i8* %4647, i64 %4644
  store i8* %4648, i8** %fixup_alt_jump, align 8
  br label %4649

; <label>:4649                                    ; preds = %4639, %4618
  %4650 = load i8** %laststart, align 8
  %4651 = icmp ne i8* %4650, null
  br i1 %4651, label %4652, label %4662

; <label>:4652                                    ; preds = %4649
  %4653 = load i8** %laststart, align 8
  %4654 = load i8** %old_buffer23, align 8
  %4655 = ptrtoint i8* %4653 to i64
  %4656 = ptrtoint i8* %4654 to i64
  %4657 = sub i64 %4655, %4656
  %4658 = load %struct.re_pattern_buffer** %5, align 8
  %4659 = getelementptr inbounds %struct.re_pattern_buffer* %4658, i32 0, i32 0
  %4660 = load i8** %4659, align 8
  %4661 = getelementptr inbounds i8* %4660, i64 %4657
  store i8* %4661, i8** %laststart, align 8
  br label %4662

; <label>:4662                                    ; preds = %4652, %4649
  %4663 = load i8** %pending_exact, align 8
  %4664 = icmp ne i8* %4663, null
  br i1 %4664, label %4665, label %4675

; <label>:4665                                    ; preds = %4662
  %4666 = load i8** %pending_exact, align 8
  %4667 = load i8** %old_buffer23, align 8
  %4668 = ptrtoint i8* %4666 to i64
  %4669 = ptrtoint i8* %4667 to i64
  %4670 = sub i64 %4668, %4669
  %4671 = load %struct.re_pattern_buffer** %5, align 8
  %4672 = getelementptr inbounds %struct.re_pattern_buffer* %4671, i32 0, i32 0
  %4673 = load i8** %4672, align 8
  %4674 = getelementptr inbounds i8* %4673, i64 %4670
  store i8* %4674, i8** %pending_exact, align 8
  br label %4675

; <label>:4675                                    ; preds = %4665, %4662
  br label %4676

; <label>:4676                                    ; preds = %4675, %4612
  br label %4677

; <label>:4677                                    ; preds = %4676
  br label %4562

; <label>:4678                                    ; preds = %4562
  %4679 = load i8** %b, align 8
  %4680 = getelementptr inbounds i8* %4679, i32 1
  store i8* %4680, i8** %b, align 8
  store i8 10, i8* %4679, align 1
  br label %4681

; <label>:4681                                    ; preds = %4678
  br label %4979

; <label>:4682                                    ; preds = %2301
  br label %4683

; <label>:4683                                    ; preds = %4682
  br label %4684

; <label>:4684                                    ; preds = %4799, %4683
  %4685 = load i8** %b, align 8
  %4686 = load %struct.re_pattern_buffer** %5, align 8
  %4687 = getelementptr inbounds %struct.re_pattern_buffer* %4686, i32 0, i32 0
  %4688 = load i8** %4687, align 8
  %4689 = ptrtoint i8* %4685 to i64
  %4690 = ptrtoint i8* %4688 to i64
  %4691 = sub i64 %4689, %4690
  %4692 = add nsw i64 %4691, 1
  %4693 = load %struct.re_pattern_buffer** %5, align 8
  %4694 = getelementptr inbounds %struct.re_pattern_buffer* %4693, i32 0, i32 1
  %4695 = load i64* %4694, align 8
  %4696 = icmp ugt i64 %4692, %4695
  br i1 %4696, label %4697, label %4800

; <label>:4697                                    ; preds = %4684
  br label %4698

; <label>:4698                                    ; preds = %4697
  %4699 = load %struct.re_pattern_buffer** %5, align 8
  %4700 = getelementptr inbounds %struct.re_pattern_buffer* %4699, i32 0, i32 0
  %4701 = load i8** %4700, align 8
  store i8* %4701, i8** %old_buffer24, align 8
  %4702 = load %struct.re_pattern_buffer** %5, align 8
  %4703 = getelementptr inbounds %struct.re_pattern_buffer* %4702, i32 0, i32 1
  %4704 = load i64* %4703, align 8
  %4705 = icmp eq i64 %4704, 65536
  br i1 %4705, label %4706, label %4707

; <label>:4706                                    ; preds = %4698
  store i32 15, i32* %1
  br label %5348

; <label>:4707                                    ; preds = %4698
  %4708 = load %struct.re_pattern_buffer** %5, align 8
  %4709 = getelementptr inbounds %struct.re_pattern_buffer* %4708, i32 0, i32 1
  %4710 = load i64* %4709, align 8
  %4711 = shl i64 %4710, 1
  store i64 %4711, i64* %4709, align 8
  %4712 = load %struct.re_pattern_buffer** %5, align 8
  %4713 = getelementptr inbounds %struct.re_pattern_buffer* %4712, i32 0, i32 1
  %4714 = load i64* %4713, align 8
  %4715 = icmp ugt i64 %4714, 65536
  br i1 %4715, label %4716, label %4719

; <label>:4716                                    ; preds = %4707
  %4717 = load %struct.re_pattern_buffer** %5, align 8
  %4718 = getelementptr inbounds %struct.re_pattern_buffer* %4717, i32 0, i32 1
  store i64 65536, i64* %4718, align 8
  br label %4719

; <label>:4719                                    ; preds = %4716, %4707
  %4720 = load %struct.re_pattern_buffer** %5, align 8
  %4721 = getelementptr inbounds %struct.re_pattern_buffer* %4720, i32 0, i32 0
  %4722 = load i8** %4721, align 8
  %4723 = load %struct.re_pattern_buffer** %5, align 8
  %4724 = getelementptr inbounds %struct.re_pattern_buffer* %4723, i32 0, i32 1
  %4725 = load i64* %4724, align 8
  %4726 = call noalias i8* @realloc(i8* %4722, i64 %4725) nounwind
  %4727 = load %struct.re_pattern_buffer** %5, align 8
  %4728 = getelementptr inbounds %struct.re_pattern_buffer* %4727, i32 0, i32 0
  store i8* %4726, i8** %4728, align 8
  %4729 = load %struct.re_pattern_buffer** %5, align 8
  %4730 = getelementptr inbounds %struct.re_pattern_buffer* %4729, i32 0, i32 0
  %4731 = load i8** %4730, align 8
  %4732 = icmp eq i8* %4731, null
  br i1 %4732, label %4733, label %4734

; <label>:4733                                    ; preds = %4719
  store i32 12, i32* %1
  br label %5348

; <label>:4734                                    ; preds = %4719
  %4735 = load i8** %old_buffer24, align 8
  %4736 = load %struct.re_pattern_buffer** %5, align 8
  %4737 = getelementptr inbounds %struct.re_pattern_buffer* %4736, i32 0, i32 0
  %4738 = load i8** %4737, align 8
  %4739 = icmp ne i8* %4735, %4738
  br i1 %4739, label %4740, label %4798

; <label>:4740                                    ; preds = %4734
  %4741 = load i8** %b, align 8
  %4742 = load i8** %old_buffer24, align 8
  %4743 = ptrtoint i8* %4741 to i64
  %4744 = ptrtoint i8* %4742 to i64
  %4745 = sub i64 %4743, %4744
  %4746 = load %struct.re_pattern_buffer** %5, align 8
  %4747 = getelementptr inbounds %struct.re_pattern_buffer* %4746, i32 0, i32 0
  %4748 = load i8** %4747, align 8
  %4749 = getelementptr inbounds i8* %4748, i64 %4745
  store i8* %4749, i8** %b, align 8
  %4750 = load i8** %begalt, align 8
  %4751 = load i8** %old_buffer24, align 8
  %4752 = ptrtoint i8* %4750 to i64
  %4753 = ptrtoint i8* %4751 to i64
  %4754 = sub i64 %4752, %4753
  %4755 = load %struct.re_pattern_buffer** %5, align 8
  %4756 = getelementptr inbounds %struct.re_pattern_buffer* %4755, i32 0, i32 0
  %4757 = load i8** %4756, align 8
  %4758 = getelementptr inbounds i8* %4757, i64 %4754
  store i8* %4758, i8** %begalt, align 8
  %4759 = load i8** %fixup_alt_jump, align 8
  %4760 = icmp ne i8* %4759, null
  br i1 %4760, label %4761, label %4771

; <label>:4761                                    ; preds = %4740
  %4762 = load i8** %fixup_alt_jump, align 8
  %4763 = load i8** %old_buffer24, align 8
  %4764 = ptrtoint i8* %4762 to i64
  %4765 = ptrtoint i8* %4763 to i64
  %4766 = sub i64 %4764, %4765
  %4767 = load %struct.re_pattern_buffer** %5, align 8
  %4768 = getelementptr inbounds %struct.re_pattern_buffer* %4767, i32 0, i32 0
  %4769 = load i8** %4768, align 8
  %4770 = getelementptr inbounds i8* %4769, i64 %4766
  store i8* %4770, i8** %fixup_alt_jump, align 8
  br label %4771

; <label>:4771                                    ; preds = %4761, %4740
  %4772 = load i8** %laststart, align 8
  %4773 = icmp ne i8* %4772, null
  br i1 %4773, label %4774, label %4784

; <label>:4774                                    ; preds = %4771
  %4775 = load i8** %laststart, align 8
  %4776 = load i8** %old_buffer24, align 8
  %4777 = ptrtoint i8* %4775 to i64
  %4778 = ptrtoint i8* %4776 to i64
  %4779 = sub i64 %4777, %4778
  %4780 = load %struct.re_pattern_buffer** %5, align 8
  %4781 = getelementptr inbounds %struct.re_pattern_buffer* %4780, i32 0, i32 0
  %4782 = load i8** %4781, align 8
  %4783 = getelementptr inbounds i8* %4782, i64 %4779
  store i8* %4783, i8** %laststart, align 8
  br label %4784

; <label>:4784                                    ; preds = %4774, %4771
  %4785 = load i8** %pending_exact, align 8
  %4786 = icmp ne i8* %4785, null
  br i1 %4786, label %4787, label %4797

; <label>:4787                                    ; preds = %4784
  %4788 = load i8** %pending_exact, align 8
  %4789 = load i8** %old_buffer24, align 8
  %4790 = ptrtoint i8* %4788 to i64
  %4791 = ptrtoint i8* %4789 to i64
  %4792 = sub i64 %4790, %4791
  %4793 = load %struct.re_pattern_buffer** %5, align 8
  %4794 = getelementptr inbounds %struct.re_pattern_buffer* %4793, i32 0, i32 0
  %4795 = load i8** %4794, align 8
  %4796 = getelementptr inbounds i8* %4795, i64 %4792
  store i8* %4796, i8** %pending_exact, align 8
  br label %4797

; <label>:4797                                    ; preds = %4787, %4784
  br label %4798

; <label>:4798                                    ; preds = %4797, %4734
  br label %4799

; <label>:4799                                    ; preds = %4798
  br label %4684

; <label>:4800                                    ; preds = %4684
  %4801 = load i8** %b, align 8
  %4802 = getelementptr inbounds i8* %4801, i32 1
  store i8* %4802, i8** %b, align 8
  store i8 11, i8* %4801, align 1
  br label %4803

; <label>:4803                                    ; preds = %4800
  br label %4979

; <label>:4804                                    ; preds = %2301, %2301, %2301, %2301, %2301, %2301, %2301, %2301, %2301
  %4805 = load i32* %4, align 4
  %4806 = and i32 %4805, 16384
  %4807 = icmp ne i32 %4806, 0
  br i1 %4807, label %4808, label %4809

; <label>:4808                                    ; preds = %4804
  br label %4981

; <label>:4809                                    ; preds = %4804
  %4810 = load i8* %c, align 1
  %4811 = zext i8 %4810 to i32
  %4812 = sub nsw i32 %4811, 48
  %4813 = trunc i32 %4812 to i8
  store i8 %4813, i8* %c1, align 1
  %4814 = load i8* %c1, align 1
  %4815 = zext i8 %4814 to i32
  %4816 = load i32* %regnum, align 4
  %4817 = icmp ugt i32 %4815, %4816
  br i1 %4817, label %4818, label %4819

; <label>:4818                                    ; preds = %4809
  store i32 6, i32* %1
  br label %5348

; <label>:4819                                    ; preds = %4809
  %4820 = load i8* %c1, align 1
  %4821 = zext i8 %4820 to i32
  %4822 = bitcast %struct.compile_stack_type* %compile_stack to { %struct.compile_stack_elt_t*, i64 }*
  %4823 = getelementptr { %struct.compile_stack_elt_t*, i64 }* %4822, i32 0, i32 0
  %4824 = load %struct.compile_stack_elt_t** %4823, align 1
  %4825 = getelementptr { %struct.compile_stack_elt_t*, i64 }* %4822, i32 0, i32 1
  %4826 = load i64* %4825, align 1
  %4827 = call signext i8 (...)* bitcast (i8 (%struct.compile_stack_elt_t*, i64, i32)* @group_in_compile_stack to i8 (...)*)(%struct.compile_stack_elt_t* %4824, i64 %4826, i32 %4821)
  %4828 = icmp ne i8 %4827, 0
  br i1 %4828, label %4829, label %4830

; <label>:4829                                    ; preds = %4819
  br label %4981

; <label>:4830                                    ; preds = %4819
  %4831 = load i8** %b, align 8
  store i8* %4831, i8** %laststart, align 8
  br label %4832

; <label>:4832                                    ; preds = %4830
  br label %4833

; <label>:4833                                    ; preds = %4948, %4832
  %4834 = load i8** %b, align 8
  %4835 = load %struct.re_pattern_buffer** %5, align 8
  %4836 = getelementptr inbounds %struct.re_pattern_buffer* %4835, i32 0, i32 0
  %4837 = load i8** %4836, align 8
  %4838 = ptrtoint i8* %4834 to i64
  %4839 = ptrtoint i8* %4837 to i64
  %4840 = sub i64 %4838, %4839
  %4841 = add nsw i64 %4840, 2
  %4842 = load %struct.re_pattern_buffer** %5, align 8
  %4843 = getelementptr inbounds %struct.re_pattern_buffer* %4842, i32 0, i32 1
  %4844 = load i64* %4843, align 8
  %4845 = icmp ugt i64 %4841, %4844
  br i1 %4845, label %4846, label %4949

; <label>:4846                                    ; preds = %4833
  br label %4847

; <label>:4847                                    ; preds = %4846
  %4848 = load %struct.re_pattern_buffer** %5, align 8
  %4849 = getelementptr inbounds %struct.re_pattern_buffer* %4848, i32 0, i32 0
  %4850 = load i8** %4849, align 8
  store i8* %4850, i8** %old_buffer25, align 8
  %4851 = load %struct.re_pattern_buffer** %5, align 8
  %4852 = getelementptr inbounds %struct.re_pattern_buffer* %4851, i32 0, i32 1
  %4853 = load i64* %4852, align 8
  %4854 = icmp eq i64 %4853, 65536
  br i1 %4854, label %4855, label %4856

; <label>:4855                                    ; preds = %4847
  store i32 15, i32* %1
  br label %5348

; <label>:4856                                    ; preds = %4847
  %4857 = load %struct.re_pattern_buffer** %5, align 8
  %4858 = getelementptr inbounds %struct.re_pattern_buffer* %4857, i32 0, i32 1
  %4859 = load i64* %4858, align 8
  %4860 = shl i64 %4859, 1
  store i64 %4860, i64* %4858, align 8
  %4861 = load %struct.re_pattern_buffer** %5, align 8
  %4862 = getelementptr inbounds %struct.re_pattern_buffer* %4861, i32 0, i32 1
  %4863 = load i64* %4862, align 8
  %4864 = icmp ugt i64 %4863, 65536
  br i1 %4864, label %4865, label %4868

; <label>:4865                                    ; preds = %4856
  %4866 = load %struct.re_pattern_buffer** %5, align 8
  %4867 = getelementptr inbounds %struct.re_pattern_buffer* %4866, i32 0, i32 1
  store i64 65536, i64* %4867, align 8
  br label %4868

; <label>:4868                                    ; preds = %4865, %4856
  %4869 = load %struct.re_pattern_buffer** %5, align 8
  %4870 = getelementptr inbounds %struct.re_pattern_buffer* %4869, i32 0, i32 0
  %4871 = load i8** %4870, align 8
  %4872 = load %struct.re_pattern_buffer** %5, align 8
  %4873 = getelementptr inbounds %struct.re_pattern_buffer* %4872, i32 0, i32 1
  %4874 = load i64* %4873, align 8
  %4875 = call noalias i8* @realloc(i8* %4871, i64 %4874) nounwind
  %4876 = load %struct.re_pattern_buffer** %5, align 8
  %4877 = getelementptr inbounds %struct.re_pattern_buffer* %4876, i32 0, i32 0
  store i8* %4875, i8** %4877, align 8
  %4878 = load %struct.re_pattern_buffer** %5, align 8
  %4879 = getelementptr inbounds %struct.re_pattern_buffer* %4878, i32 0, i32 0
  %4880 = load i8** %4879, align 8
  %4881 = icmp eq i8* %4880, null
  br i1 %4881, label %4882, label %4883

; <label>:4882                                    ; preds = %4868
  store i32 12, i32* %1
  br label %5348

; <label>:4883                                    ; preds = %4868
  %4884 = load i8** %old_buffer25, align 8
  %4885 = load %struct.re_pattern_buffer** %5, align 8
  %4886 = getelementptr inbounds %struct.re_pattern_buffer* %4885, i32 0, i32 0
  %4887 = load i8** %4886, align 8
  %4888 = icmp ne i8* %4884, %4887
  br i1 %4888, label %4889, label %4947

; <label>:4889                                    ; preds = %4883
  %4890 = load i8** %b, align 8
  %4891 = load i8** %old_buffer25, align 8
  %4892 = ptrtoint i8* %4890 to i64
  %4893 = ptrtoint i8* %4891 to i64
  %4894 = sub i64 %4892, %4893
  %4895 = load %struct.re_pattern_buffer** %5, align 8
  %4896 = getelementptr inbounds %struct.re_pattern_buffer* %4895, i32 0, i32 0
  %4897 = load i8** %4896, align 8
  %4898 = getelementptr inbounds i8* %4897, i64 %4894
  store i8* %4898, i8** %b, align 8
  %4899 = load i8** %begalt, align 8
  %4900 = load i8** %old_buffer25, align 8
  %4901 = ptrtoint i8* %4899 to i64
  %4902 = ptrtoint i8* %4900 to i64
  %4903 = sub i64 %4901, %4902
  %4904 = load %struct.re_pattern_buffer** %5, align 8
  %4905 = getelementptr inbounds %struct.re_pattern_buffer* %4904, i32 0, i32 0
  %4906 = load i8** %4905, align 8
  %4907 = getelementptr inbounds i8* %4906, i64 %4903
  store i8* %4907, i8** %begalt, align 8
  %4908 = load i8** %fixup_alt_jump, align 8
  %4909 = icmp ne i8* %4908, null
  br i1 %4909, label %4910, label %4920

; <label>:4910                                    ; preds = %4889
  %4911 = load i8** %fixup_alt_jump, align 8
  %4912 = load i8** %old_buffer25, align 8
  %4913 = ptrtoint i8* %4911 to i64
  %4914 = ptrtoint i8* %4912 to i64
  %4915 = sub i64 %4913, %4914
  %4916 = load %struct.re_pattern_buffer** %5, align 8
  %4917 = getelementptr inbounds %struct.re_pattern_buffer* %4916, i32 0, i32 0
  %4918 = load i8** %4917, align 8
  %4919 = getelementptr inbounds i8* %4918, i64 %4915
  store i8* %4919, i8** %fixup_alt_jump, align 8
  br label %4920

; <label>:4920                                    ; preds = %4910, %4889
  %4921 = load i8** %laststart, align 8
  %4922 = icmp ne i8* %4921, null
  br i1 %4922, label %4923, label %4933

; <label>:4923                                    ; preds = %4920
  %4924 = load i8** %laststart, align 8
  %4925 = load i8** %old_buffer25, align 8
  %4926 = ptrtoint i8* %4924 to i64
  %4927 = ptrtoint i8* %4925 to i64
  %4928 = sub i64 %4926, %4927
  %4929 = load %struct.re_pattern_buffer** %5, align 8
  %4930 = getelementptr inbounds %struct.re_pattern_buffer* %4929, i32 0, i32 0
  %4931 = load i8** %4930, align 8
  %4932 = getelementptr inbounds i8* %4931, i64 %4928
  store i8* %4932, i8** %laststart, align 8
  br label %4933

; <label>:4933                                    ; preds = %4923, %4920
  %4934 = load i8** %pending_exact, align 8
  %4935 = icmp ne i8* %4934, null
  br i1 %4935, label %4936, label %4946

; <label>:4936                                    ; preds = %4933
  %4937 = load i8** %pending_exact, align 8
  %4938 = load i8** %old_buffer25, align 8
  %4939 = ptrtoint i8* %4937 to i64
  %4940 = ptrtoint i8* %4938 to i64
  %4941 = sub i64 %4939, %4940
  %4942 = load %struct.re_pattern_buffer** %5, align 8
  %4943 = getelementptr inbounds %struct.re_pattern_buffer* %4942, i32 0, i32 0
  %4944 = load i8** %4943, align 8
  %4945 = getelementptr inbounds i8* %4944, i64 %4941
  store i8* %4945, i8** %pending_exact, align 8
  br label %4946

; <label>:4946                                    ; preds = %4936, %4933
  br label %4947

; <label>:4947                                    ; preds = %4946, %4883
  br label %4948

; <label>:4948                                    ; preds = %4947
  br label %4833

; <label>:4949                                    ; preds = %4833
  %4950 = load i8** %b, align 8
  %4951 = getelementptr inbounds i8* %4950, i32 1
  store i8* %4951, i8** %b, align 8
  store i8 7, i8* %4950, align 1
  %4952 = load i8* %c1, align 1
  %4953 = load i8** %b, align 8
  %4954 = getelementptr inbounds i8* %4953, i32 1
  store i8* %4954, i8** %b, align 8
  store i8 %4952, i8* %4953, align 1
  br label %4955

; <label>:4955                                    ; preds = %4949
  br label %4979

; <label>:4956                                    ; preds = %2301, %2301
  %4957 = load i32* %4, align 4
  %4958 = and i32 %4957, 2
  %4959 = icmp ne i32 %4958, 0
  br i1 %4959, label %4960, label %4961

; <label>:4960                                    ; preds = %4956
  br label %397

; <label>:4961                                    ; preds = %4956
  br label %4963

; <label>:4962                                    ; preds = %2301
  br label %4963

; <label>:4963                                    ; preds = %4962, %4961, %3823, %3228, %2939, %2567, %2558, %2308
  %4964 = load i8** %translate, align 8
  %4965 = icmp ne i8* %4964, null
  br i1 %4965, label %4966, label %4973

; <label>:4966                                    ; preds = %4963
  %4967 = load i8* %c, align 1
  %4968 = zext i8 %4967 to i64
  %4969 = load i8** %translate, align 8
  %4970 = getelementptr inbounds i8* %4969, i64 %4968
  %4971 = load i8* %4970, align 1
  %4972 = sext i8 %4971 to i32
  br label %4976

; <label>:4973                                    ; preds = %4963
  %4974 = load i8* %c, align 1
  %4975 = zext i8 %4974 to i32
  br label %4976

; <label>:4976                                    ; preds = %4973, %4966
  %4977 = phi i32 [ %4972, %4966 ], [ %4975, %4973 ]
  %4978 = trunc i32 %4977 to i8
  store i8 %4978, i8* %c, align 1
  br label %4981

; <label>:4979                                    ; preds = %4955, %4803, %4681, %4559, %4437, %4315, %4193, %4071, %3948, %3788, %3203, %2930, %2549
  br label %5318

; <label>:4980                                    ; preds = %105
  br label %4981

; <label>:4981                                    ; preds = %4980, %4976, %4829, %4808, %3825, %2945, %2711, %2285, %2275, %2269, %2263, %2257, %410, %395, %385, %246
  %4982 = load i8** %pending_exact, align 8
  %4983 = icmp ne i8* %4982, null
  br i1 %4983, label %4984, label %5065

; <label>:4984                                    ; preds = %4981
  %4985 = load i8** %pending_exact, align 8
  %4986 = load i8** %pending_exact, align 8
  %4987 = load i8* %4986, align 1
  %4988 = zext i8 %4987 to i32
  %4989 = sext i32 %4988 to i64
  %4990 = getelementptr inbounds i8* %4985, i64 %4989
  %4991 = getelementptr inbounds i8* %4990, i64 1
  %4992 = load i8** %b, align 8
  %4993 = icmp ne i8* %4991, %4992
  br i1 %4993, label %5065, label %4994

; <label>:4994                                    ; preds = %4984
  %4995 = load i8** %pending_exact, align 8
  %4996 = load i8* %4995, align 1
  %4997 = zext i8 %4996 to i32
  %4998 = icmp eq i32 %4997, 255
  br i1 %4998, label %5065, label %4999

; <label>:4999                                    ; preds = %4994
  %5000 = load i8** %p, align 8
  %5001 = load i8* %5000, align 1
  %5002 = sext i8 %5001 to i32
  %5003 = icmp eq i32 %5002, 42
  br i1 %5003, label %5065, label %5004

; <label>:5004                                    ; preds = %4999
  %5005 = load i8** %p, align 8
  %5006 = load i8* %5005, align 1
  %5007 = sext i8 %5006 to i32
  %5008 = icmp eq i32 %5007, 94
  br i1 %5008, label %5065, label %5009

; <label>:5009                                    ; preds = %5004
  %5010 = load i32* %4, align 4
  %5011 = and i32 %5010, 2
  %5012 = icmp ne i32 %5011, 0
  br i1 %5012, label %5013, label %5030

; <label>:5013                                    ; preds = %5009
  %5014 = load i8** %p, align 8
  %5015 = load i8* %5014, align 1
  %5016 = sext i8 %5015 to i32
  %5017 = icmp eq i32 %5016, 92
  br i1 %5017, label %5018, label %5040

; <label>:5018                                    ; preds = %5013
  %5019 = load i8** %p, align 8
  %5020 = getelementptr inbounds i8* %5019, i64 1
  %5021 = load i8* %5020, align 1
  %5022 = sext i8 %5021 to i32
  %5023 = icmp eq i32 %5022, 43
  br i1 %5023, label %5065, label %5024

; <label>:5024                                    ; preds = %5018
  %5025 = load i8** %p, align 8
  %5026 = getelementptr inbounds i8* %5025, i64 1
  %5027 = load i8* %5026, align 1
  %5028 = sext i8 %5027 to i32
  %5029 = icmp eq i32 %5028, 63
  br i1 %5029, label %5065, label %5040

; <label>:5030                                    ; preds = %5009
  %5031 = load i8** %p, align 8
  %5032 = load i8* %5031, align 1
  %5033 = sext i8 %5032 to i32
  %5034 = icmp eq i32 %5033, 43
  br i1 %5034, label %5065, label %5035

; <label>:5035                                    ; preds = %5030
  %5036 = load i8** %p, align 8
  %5037 = load i8* %5036, align 1
  %5038 = sext i8 %5037 to i32
  %5039 = icmp eq i32 %5038, 63
  br i1 %5039, label %5065, label %5040

; <label>:5040                                    ; preds = %5035, %5024, %5013
  %5041 = load i32* %4, align 4
  %5042 = and i32 %5041, 512
  %5043 = icmp ne i32 %5042, 0
  br i1 %5043, label %5044, label %5192

; <label>:5044                                    ; preds = %5040
  %5045 = load i32* %4, align 4
  %5046 = and i32 %5045, 4096
  %5047 = icmp ne i32 %5046, 0
  br i1 %5047, label %5048, label %5053

; <label>:5048                                    ; preds = %5044
  %5049 = load i8** %p, align 8
  %5050 = load i8* %5049, align 1
  %5051 = sext i8 %5050 to i32
  %5052 = icmp eq i32 %5051, 123
  br i1 %5052, label %5065, label %5192

; <label>:5053                                    ; preds = %5044
  %5054 = load i8** %p, align 8
  %5055 = getelementptr inbounds i8* %5054, i64 0
  %5056 = load i8* %5055, align 1
  %5057 = sext i8 %5056 to i32
  %5058 = icmp eq i32 %5057, 92
  br i1 %5058, label %5059, label %5192

; <label>:5059                                    ; preds = %5053
  %5060 = load i8** %p, align 8
  %5061 = getelementptr inbounds i8* %5060, i64 1
  %5062 = load i8* %5061, align 1
  %5063 = sext i8 %5062 to i32
  %5064 = icmp eq i32 %5063, 123
  br i1 %5064, label %5065, label %5192

; <label>:5065                                    ; preds = %5059, %5048, %5035, %5030, %5024, %5018, %5004, %4999, %4994, %4984, %4981
  %5066 = load i8** %b, align 8
  store i8* %5066, i8** %laststart, align 8
  br label %5067

; <label>:5067                                    ; preds = %5065
  br label %5068

; <label>:5068                                    ; preds = %5183, %5067
  %5069 = load i8** %b, align 8
  %5070 = load %struct.re_pattern_buffer** %5, align 8
  %5071 = getelementptr inbounds %struct.re_pattern_buffer* %5070, i32 0, i32 0
  %5072 = load i8** %5071, align 8
  %5073 = ptrtoint i8* %5069 to i64
  %5074 = ptrtoint i8* %5072 to i64
  %5075 = sub i64 %5073, %5074
  %5076 = add nsw i64 %5075, 2
  %5077 = load %struct.re_pattern_buffer** %5, align 8
  %5078 = getelementptr inbounds %struct.re_pattern_buffer* %5077, i32 0, i32 1
  %5079 = load i64* %5078, align 8
  %5080 = icmp ugt i64 %5076, %5079
  br i1 %5080, label %5081, label %5184

; <label>:5081                                    ; preds = %5068
  br label %5082

; <label>:5082                                    ; preds = %5081
  %5083 = load %struct.re_pattern_buffer** %5, align 8
  %5084 = getelementptr inbounds %struct.re_pattern_buffer* %5083, i32 0, i32 0
  %5085 = load i8** %5084, align 8
  store i8* %5085, i8** %old_buffer26, align 8
  %5086 = load %struct.re_pattern_buffer** %5, align 8
  %5087 = getelementptr inbounds %struct.re_pattern_buffer* %5086, i32 0, i32 1
  %5088 = load i64* %5087, align 8
  %5089 = icmp eq i64 %5088, 65536
  br i1 %5089, label %5090, label %5091

; <label>:5090                                    ; preds = %5082
  store i32 15, i32* %1
  br label %5348

; <label>:5091                                    ; preds = %5082
  %5092 = load %struct.re_pattern_buffer** %5, align 8
  %5093 = getelementptr inbounds %struct.re_pattern_buffer* %5092, i32 0, i32 1
  %5094 = load i64* %5093, align 8
  %5095 = shl i64 %5094, 1
  store i64 %5095, i64* %5093, align 8
  %5096 = load %struct.re_pattern_buffer** %5, align 8
  %5097 = getelementptr inbounds %struct.re_pattern_buffer* %5096, i32 0, i32 1
  %5098 = load i64* %5097, align 8
  %5099 = icmp ugt i64 %5098, 65536
  br i1 %5099, label %5100, label %5103

; <label>:5100                                    ; preds = %5091
  %5101 = load %struct.re_pattern_buffer** %5, align 8
  %5102 = getelementptr inbounds %struct.re_pattern_buffer* %5101, i32 0, i32 1
  store i64 65536, i64* %5102, align 8
  br label %5103

; <label>:5103                                    ; preds = %5100, %5091
  %5104 = load %struct.re_pattern_buffer** %5, align 8
  %5105 = getelementptr inbounds %struct.re_pattern_buffer* %5104, i32 0, i32 0
  %5106 = load i8** %5105, align 8
  %5107 = load %struct.re_pattern_buffer** %5, align 8
  %5108 = getelementptr inbounds %struct.re_pattern_buffer* %5107, i32 0, i32 1
  %5109 = load i64* %5108, align 8
  %5110 = call noalias i8* @realloc(i8* %5106, i64 %5109) nounwind
  %5111 = load %struct.re_pattern_buffer** %5, align 8
  %5112 = getelementptr inbounds %struct.re_pattern_buffer* %5111, i32 0, i32 0
  store i8* %5110, i8** %5112, align 8
  %5113 = load %struct.re_pattern_buffer** %5, align 8
  %5114 = getelementptr inbounds %struct.re_pattern_buffer* %5113, i32 0, i32 0
  %5115 = load i8** %5114, align 8
  %5116 = icmp eq i8* %5115, null
  br i1 %5116, label %5117, label %5118

; <label>:5117                                    ; preds = %5103
  store i32 12, i32* %1
  br label %5348

; <label>:5118                                    ; preds = %5103
  %5119 = load i8** %old_buffer26, align 8
  %5120 = load %struct.re_pattern_buffer** %5, align 8
  %5121 = getelementptr inbounds %struct.re_pattern_buffer* %5120, i32 0, i32 0
  %5122 = load i8** %5121, align 8
  %5123 = icmp ne i8* %5119, %5122
  br i1 %5123, label %5124, label %5182

; <label>:5124                                    ; preds = %5118
  %5125 = load i8** %b, align 8
  %5126 = load i8** %old_buffer26, align 8
  %5127 = ptrtoint i8* %5125 to i64
  %5128 = ptrtoint i8* %5126 to i64
  %5129 = sub i64 %5127, %5128
  %5130 = load %struct.re_pattern_buffer** %5, align 8
  %5131 = getelementptr inbounds %struct.re_pattern_buffer* %5130, i32 0, i32 0
  %5132 = load i8** %5131, align 8
  %5133 = getelementptr inbounds i8* %5132, i64 %5129
  store i8* %5133, i8** %b, align 8
  %5134 = load i8** %begalt, align 8
  %5135 = load i8** %old_buffer26, align 8
  %5136 = ptrtoint i8* %5134 to i64
  %5137 = ptrtoint i8* %5135 to i64
  %5138 = sub i64 %5136, %5137
  %5139 = load %struct.re_pattern_buffer** %5, align 8
  %5140 = getelementptr inbounds %struct.re_pattern_buffer* %5139, i32 0, i32 0
  %5141 = load i8** %5140, align 8
  %5142 = getelementptr inbounds i8* %5141, i64 %5138
  store i8* %5142, i8** %begalt, align 8
  %5143 = load i8** %fixup_alt_jump, align 8
  %5144 = icmp ne i8* %5143, null
  br i1 %5144, label %5145, label %5155

; <label>:5145                                    ; preds = %5124
  %5146 = load i8** %fixup_alt_jump, align 8
  %5147 = load i8** %old_buffer26, align 8
  %5148 = ptrtoint i8* %5146 to i64
  %5149 = ptrtoint i8* %5147 to i64
  %5150 = sub i64 %5148, %5149
  %5151 = load %struct.re_pattern_buffer** %5, align 8
  %5152 = getelementptr inbounds %struct.re_pattern_buffer* %5151, i32 0, i32 0
  %5153 = load i8** %5152, align 8
  %5154 = getelementptr inbounds i8* %5153, i64 %5150
  store i8* %5154, i8** %fixup_alt_jump, align 8
  br label %5155

; <label>:5155                                    ; preds = %5145, %5124
  %5156 = load i8** %laststart, align 8
  %5157 = icmp ne i8* %5156, null
  br i1 %5157, label %5158, label %5168

; <label>:5158                                    ; preds = %5155
  %5159 = load i8** %laststart, align 8
  %5160 = load i8** %old_buffer26, align 8
  %5161 = ptrtoint i8* %5159 to i64
  %5162 = ptrtoint i8* %5160 to i64
  %5163 = sub i64 %5161, %5162
  %5164 = load %struct.re_pattern_buffer** %5, align 8
  %5165 = getelementptr inbounds %struct.re_pattern_buffer* %5164, i32 0, i32 0
  %5166 = load i8** %5165, align 8
  %5167 = getelementptr inbounds i8* %5166, i64 %5163
  store i8* %5167, i8** %laststart, align 8
  br label %5168

; <label>:5168                                    ; preds = %5158, %5155
  %5169 = load i8** %pending_exact, align 8
  %5170 = icmp ne i8* %5169, null
  br i1 %5170, label %5171, label %5181

; <label>:5171                                    ; preds = %5168
  %5172 = load i8** %pending_exact, align 8
  %5173 = load i8** %old_buffer26, align 8
  %5174 = ptrtoint i8* %5172 to i64
  %5175 = ptrtoint i8* %5173 to i64
  %5176 = sub i64 %5174, %5175
  %5177 = load %struct.re_pattern_buffer** %5, align 8
  %5178 = getelementptr inbounds %struct.re_pattern_buffer* %5177, i32 0, i32 0
  %5179 = load i8** %5178, align 8
  %5180 = getelementptr inbounds i8* %5179, i64 %5176
  store i8* %5180, i8** %pending_exact, align 8
  br label %5181

; <label>:5181                                    ; preds = %5171, %5168
  br label %5182

; <label>:5182                                    ; preds = %5181, %5118
  br label %5183

; <label>:5183                                    ; preds = %5182
  br label %5068

; <label>:5184                                    ; preds = %5068
  %5185 = load i8** %b, align 8
  %5186 = getelementptr inbounds i8* %5185, i32 1
  store i8* %5186, i8** %b, align 8
  store i8 1, i8* %5185, align 1
  %5187 = load i8** %b, align 8
  %5188 = getelementptr inbounds i8* %5187, i32 1
  store i8* %5188, i8** %b, align 8
  store i8 0, i8* %5187, align 1
  br label %5189

; <label>:5189                                    ; preds = %5184
  %5190 = load i8** %b, align 8
  %5191 = getelementptr inbounds i8* %5190, i64 -1
  store i8* %5191, i8** %pending_exact, align 8
  br label %5192

; <label>:5192                                    ; preds = %5189, %5059, %5053, %5048, %5040
  br label %5193

; <label>:5193                                    ; preds = %5192
  br label %5194

; <label>:5194                                    ; preds = %5309, %5193
  %5195 = load i8** %b, align 8
  %5196 = load %struct.re_pattern_buffer** %5, align 8
  %5197 = getelementptr inbounds %struct.re_pattern_buffer* %5196, i32 0, i32 0
  %5198 = load i8** %5197, align 8
  %5199 = ptrtoint i8* %5195 to i64
  %5200 = ptrtoint i8* %5198 to i64
  %5201 = sub i64 %5199, %5200
  %5202 = add nsw i64 %5201, 1
  %5203 = load %struct.re_pattern_buffer** %5, align 8
  %5204 = getelementptr inbounds %struct.re_pattern_buffer* %5203, i32 0, i32 1
  %5205 = load i64* %5204, align 8
  %5206 = icmp ugt i64 %5202, %5205
  br i1 %5206, label %5207, label %5310

; <label>:5207                                    ; preds = %5194
  br label %5208

; <label>:5208                                    ; preds = %5207
  %5209 = load %struct.re_pattern_buffer** %5, align 8
  %5210 = getelementptr inbounds %struct.re_pattern_buffer* %5209, i32 0, i32 0
  %5211 = load i8** %5210, align 8
  store i8* %5211, i8** %old_buffer27, align 8
  %5212 = load %struct.re_pattern_buffer** %5, align 8
  %5213 = getelementptr inbounds %struct.re_pattern_buffer* %5212, i32 0, i32 1
  %5214 = load i64* %5213, align 8
  %5215 = icmp eq i64 %5214, 65536
  br i1 %5215, label %5216, label %5217

; <label>:5216                                    ; preds = %5208
  store i32 15, i32* %1
  br label %5348

; <label>:5217                                    ; preds = %5208
  %5218 = load %struct.re_pattern_buffer** %5, align 8
  %5219 = getelementptr inbounds %struct.re_pattern_buffer* %5218, i32 0, i32 1
  %5220 = load i64* %5219, align 8
  %5221 = shl i64 %5220, 1
  store i64 %5221, i64* %5219, align 8
  %5222 = load %struct.re_pattern_buffer** %5, align 8
  %5223 = getelementptr inbounds %struct.re_pattern_buffer* %5222, i32 0, i32 1
  %5224 = load i64* %5223, align 8
  %5225 = icmp ugt i64 %5224, 65536
  br i1 %5225, label %5226, label %5229

; <label>:5226                                    ; preds = %5217
  %5227 = load %struct.re_pattern_buffer** %5, align 8
  %5228 = getelementptr inbounds %struct.re_pattern_buffer* %5227, i32 0, i32 1
  store i64 65536, i64* %5228, align 8
  br label %5229

; <label>:5229                                    ; preds = %5226, %5217
  %5230 = load %struct.re_pattern_buffer** %5, align 8
  %5231 = getelementptr inbounds %struct.re_pattern_buffer* %5230, i32 0, i32 0
  %5232 = load i8** %5231, align 8
  %5233 = load %struct.re_pattern_buffer** %5, align 8
  %5234 = getelementptr inbounds %struct.re_pattern_buffer* %5233, i32 0, i32 1
  %5235 = load i64* %5234, align 8
  %5236 = call noalias i8* @realloc(i8* %5232, i64 %5235) nounwind
  %5237 = load %struct.re_pattern_buffer** %5, align 8
  %5238 = getelementptr inbounds %struct.re_pattern_buffer* %5237, i32 0, i32 0
  store i8* %5236, i8** %5238, align 8
  %5239 = load %struct.re_pattern_buffer** %5, align 8
  %5240 = getelementptr inbounds %struct.re_pattern_buffer* %5239, i32 0, i32 0
  %5241 = load i8** %5240, align 8
  %5242 = icmp eq i8* %5241, null
  br i1 %5242, label %5243, label %5244

; <label>:5243                                    ; preds = %5229
  store i32 12, i32* %1
  br label %5348

; <label>:5244                                    ; preds = %5229
  %5245 = load i8** %old_buffer27, align 8
  %5246 = load %struct.re_pattern_buffer** %5, align 8
  %5247 = getelementptr inbounds %struct.re_pattern_buffer* %5246, i32 0, i32 0
  %5248 = load i8** %5247, align 8
  %5249 = icmp ne i8* %5245, %5248
  br i1 %5249, label %5250, label %5308

; <label>:5250                                    ; preds = %5244
  %5251 = load i8** %b, align 8
  %5252 = load i8** %old_buffer27, align 8
  %5253 = ptrtoint i8* %5251 to i64
  %5254 = ptrtoint i8* %5252 to i64
  %5255 = sub i64 %5253, %5254
  %5256 = load %struct.re_pattern_buffer** %5, align 8
  %5257 = getelementptr inbounds %struct.re_pattern_buffer* %5256, i32 0, i32 0
  %5258 = load i8** %5257, align 8
  %5259 = getelementptr inbounds i8* %5258, i64 %5255
  store i8* %5259, i8** %b, align 8
  %5260 = load i8** %begalt, align 8
  %5261 = load i8** %old_buffer27, align 8
  %5262 = ptrtoint i8* %5260 to i64
  %5263 = ptrtoint i8* %5261 to i64
  %5264 = sub i64 %5262, %5263
  %5265 = load %struct.re_pattern_buffer** %5, align 8
  %5266 = getelementptr inbounds %struct.re_pattern_buffer* %5265, i32 0, i32 0
  %5267 = load i8** %5266, align 8
  %5268 = getelementptr inbounds i8* %5267, i64 %5264
  store i8* %5268, i8** %begalt, align 8
  %5269 = load i8** %fixup_alt_jump, align 8
  %5270 = icmp ne i8* %5269, null
  br i1 %5270, label %5271, label %5281

; <label>:5271                                    ; preds = %5250
  %5272 = load i8** %fixup_alt_jump, align 8
  %5273 = load i8** %old_buffer27, align 8
  %5274 = ptrtoint i8* %5272 to i64
  %5275 = ptrtoint i8* %5273 to i64
  %5276 = sub i64 %5274, %5275
  %5277 = load %struct.re_pattern_buffer** %5, align 8
  %5278 = getelementptr inbounds %struct.re_pattern_buffer* %5277, i32 0, i32 0
  %5279 = load i8** %5278, align 8
  %5280 = getelementptr inbounds i8* %5279, i64 %5276
  store i8* %5280, i8** %fixup_alt_jump, align 8
  br label %5281

; <label>:5281                                    ; preds = %5271, %5250
  %5282 = load i8** %laststart, align 8
  %5283 = icmp ne i8* %5282, null
  br i1 %5283, label %5284, label %5294

; <label>:5284                                    ; preds = %5281
  %5285 = load i8** %laststart, align 8
  %5286 = load i8** %old_buffer27, align 8
  %5287 = ptrtoint i8* %5285 to i64
  %5288 = ptrtoint i8* %5286 to i64
  %5289 = sub i64 %5287, %5288
  %5290 = load %struct.re_pattern_buffer** %5, align 8
  %5291 = getelementptr inbounds %struct.re_pattern_buffer* %5290, i32 0, i32 0
  %5292 = load i8** %5291, align 8
  %5293 = getelementptr inbounds i8* %5292, i64 %5289
  store i8* %5293, i8** %laststart, align 8
  br label %5294

; <label>:5294                                    ; preds = %5284, %5281
  %5295 = load i8** %pending_exact, align 8
  %5296 = icmp ne i8* %5295, null
  br i1 %5296, label %5297, label %5307

; <label>:5297                                    ; preds = %5294
  %5298 = load i8** %pending_exact, align 8
  %5299 = load i8** %old_buffer27, align 8
  %5300 = ptrtoint i8* %5298 to i64
  %5301 = ptrtoint i8* %5299 to i64
  %5302 = sub i64 %5300, %5301
  %5303 = load %struct.re_pattern_buffer** %5, align 8
  %5304 = getelementptr inbounds %struct.re_pattern_buffer* %5303, i32 0, i32 0
  %5305 = load i8** %5304, align 8
  %5306 = getelementptr inbounds i8* %5305, i64 %5302
  store i8* %5306, i8** %pending_exact, align 8
  br label %5307

; <label>:5307                                    ; preds = %5297, %5294
  br label %5308

; <label>:5308                                    ; preds = %5307, %5244
  br label %5309

; <label>:5309                                    ; preds = %5308
  br label %5194

; <label>:5310                                    ; preds = %5194
  %5311 = load i8* %c, align 1
  %5312 = load i8** %b, align 8
  %5313 = getelementptr inbounds i8* %5312, i32 1
  store i8* %5313, i8** %b, align 8
  store i8 %5311, i8* %5312, align 1
  br label %5314

; <label>:5314                                    ; preds = %5310
  %5315 = load i8** %pending_exact, align 8
  %5316 = load i8* %5315, align 1
  %5317 = add i8 %5316, 1
  store i8 %5317, i8* %5315, align 1
  br label %5318

; <label>:5318                                    ; preds = %5314, %4979, %2244, %1124, %1001, %526, %386, %247
  br label %82

; <label>:5319                                    ; preds = %82
  %5320 = load i8** %fixup_alt_jump, align 8
  %5321 = icmp ne i8* %5320, null
  br i1 %5321, label %5322, label %5330

; <label>:5322                                    ; preds = %5319
  %5323 = load i8** %fixup_alt_jump, align 8
  %5324 = load i8** %b, align 8
  %5325 = load i8** %fixup_alt_jump, align 8
  %5326 = ptrtoint i8* %5324 to i64
  %5327 = ptrtoint i8* %5325 to i64
  %5328 = sub i64 %5326, %5327
  %5329 = sub nsw i64 %5328, 3
  call void (...)* bitcast (void (i32, i8*, i32)* @store_op1 to void (...)*)(i32 13, i8* %5323, i64 %5329)
  br label %5330

; <label>:5330                                    ; preds = %5322, %5319
  %5331 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %5332 = load i32* %5331, align 4
  %5333 = icmp eq i32 %5332, 0
  br i1 %5333, label %5335, label %5334

; <label>:5334                                    ; preds = %5330
  store i32 8, i32* %1
  br label %5348

; <label>:5335                                    ; preds = %5330
  %5336 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %5337 = load %struct.compile_stack_elt_t** %5336, align 8
  %5338 = bitcast %struct.compile_stack_elt_t* %5337 to i8*
  call void @free(i8* %5338) nounwind
  %5339 = load i8** %b, align 8
  %5340 = load %struct.re_pattern_buffer** %5, align 8
  %5341 = getelementptr inbounds %struct.re_pattern_buffer* %5340, i32 0, i32 0
  %5342 = load i8** %5341, align 8
  %5343 = ptrtoint i8* %5339 to i64
  %5344 = ptrtoint i8* %5342 to i64
  %5345 = sub i64 %5343, %5344
  %5346 = load %struct.re_pattern_buffer** %5, align 8
  %5347 = getelementptr inbounds %struct.re_pattern_buffer* %5346, i32 0, i32 2
  store i64 %5345, i64* %5347, align 8
  store i32 0, i32* %1
  br label %5348

; <label>:5348                                    ; preds = %5335, %5334, %5243, %5216, %5117, %5090, %4882, %4855, %4818, %4733, %4706, %4611, %4584, %4489, %4462, %4367, %4340, %4245, %4218, %4123, %4096, %4001, %3974, %3878, %3851, %3795, %3670, %3643, %3534, %3507, %3471, %3463, %3439, %3433, %3424, %3386, %3333, %3304, %3251, %3241, %3136, %3109, %2996, %2969, %2849, %2822, %2712, %2624, %2597, %2568, %2472, %2445, %2337, %2296, %2290, %1933, %1915, %1909, %1752, %1745, %1727, %1706, %1684, %1664, %1618, %1566, %1560, %1534, %1528, %1435, %1408, %1299, %1272, %1180, %1153, %1129, %1054, %1027, %922, %895, %787, %760, %580, %553, %489, %483, %440, %405, %314, %287, %175, %148, %91, %74, %20
  %5349 = load i32* %1
  ret i32 %5349
}

define i32 @regcomp(%struct.re_pattern_buffer* %preg, i8* %pattern, i32 %cflags) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca %struct.re_pattern_buffer*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %ret = alloca i32, align 4
  %syntax = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.re_pattern_buffer* %preg, %struct.re_pattern_buffer** %2, align 8
  store i8* %pattern, i8** %3, align 8
  store i32 %cflags, i32* %4, align 4
  %5 = load i32* %4, align 4
  %6 = and i32 %5, 1
  %7 = icmp ne i32 %6, 0
  %8 = select i1 %7, i32 242396, i32 66246
  store i32 %8, i32* %syntax, align 4
  %9 = load %struct.re_pattern_buffer** %2, align 8
  %10 = getelementptr inbounds %struct.re_pattern_buffer* %9, i32 0, i32 0
  store i8* null, i8** %10, align 8
  %11 = load %struct.re_pattern_buffer** %2, align 8
  %12 = getelementptr inbounds %struct.re_pattern_buffer* %11, i32 0, i32 1
  store i64 0, i64* %12, align 8
  %13 = load %struct.re_pattern_buffer** %2, align 8
  %14 = getelementptr inbounds %struct.re_pattern_buffer* %13, i32 0, i32 4
  store i8* null, i8** %14, align 8
  %15 = load i32* %4, align 4
  %16 = and i32 %15, 2
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %63

; <label>:18                                      ; preds = %0
  %19 = call noalias i8* @malloc(i64 256) nounwind
  %20 = load %struct.re_pattern_buffer** %2, align 8
  %21 = getelementptr inbounds %struct.re_pattern_buffer* %20, i32 0, i32 5
  store i8* %19, i8** %21, align 8
  %22 = load %struct.re_pattern_buffer** %2, align 8
  %23 = getelementptr inbounds %struct.re_pattern_buffer* %22, i32 0, i32 5
  %24 = load i8** %23, align 8
  %25 = icmp eq i8* %24, null
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %18
  store i32 12, i32* %1
  br label %118

; <label>:27                                      ; preds = %18
  store i32 0, i32* %i, align 4
  br label %28

; <label>:28                                      ; preds = %59, %27
  %29 = load i32* %i, align 4
  %30 = icmp ult i32 %29, 256
  br i1 %30, label %31, label %62

; <label>:31                                      ; preds = %28
  %32 = load i32* %i, align 4
  %33 = and i32 %32, -128
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %48

; <label>:35                                      ; preds = %31
  %36 = load i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = call i16** @__ctype_b_loc() nounwind readnone
  %39 = load i16** %38, align 8
  %40 = getelementptr inbounds i16* %39, i64 %37
  %41 = load i16* %40, align 2
  %42 = zext i16 %41 to i32
  %43 = and i32 %42, 256
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %48

; <label>:45                                      ; preds = %35
  %46 = load i32* %i, align 4
  %47 = call i32 @tolower(i32 %46) nounwind
  br label %50

; <label>:48                                      ; preds = %35, %31
  %49 = load i32* %i, align 4
  br label %50

; <label>:50                                      ; preds = %48, %45
  %51 = phi i32 [ %47, %45 ], [ %49, %48 ]
  %52 = trunc i32 %51 to i8
  %53 = load i32* %i, align 4
  %54 = zext i32 %53 to i64
  %55 = load %struct.re_pattern_buffer** %2, align 8
  %56 = getelementptr inbounds %struct.re_pattern_buffer* %55, i32 0, i32 5
  %57 = load i8** %56, align 8
  %58 = getelementptr inbounds i8* %57, i64 %54
  store i8 %52, i8* %58, align 1
  br label %59

; <label>:59                                      ; preds = %50
  %60 = load i32* %i, align 4
  %61 = add i32 %60, 1
  store i32 %61, i32* %i, align 4
  br label %28

; <label>:62                                      ; preds = %28
  br label %66

; <label>:63                                      ; preds = %0
  %64 = load %struct.re_pattern_buffer** %2, align 8
  %65 = getelementptr inbounds %struct.re_pattern_buffer* %64, i32 0, i32 5
  store i8* null, i8** %65, align 8
  br label %66

; <label>:66                                      ; preds = %63, %62
  %67 = load i32* %4, align 4
  %68 = and i32 %67, 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %82

; <label>:70                                      ; preds = %66
  %71 = load i32* %syntax, align 4
  %72 = and i32 %71, -65
  store i32 %72, i32* %syntax, align 4
  %73 = load i32* %syntax, align 4
  %74 = or i32 %73, 256
  store i32 %74, i32* %syntax, align 4
  %75 = load %struct.re_pattern_buffer** %2, align 8
  %76 = bitcast %struct.re_pattern_buffer* %75 to i8*
  %77 = getelementptr i8* %76, i32 56
  %78 = bitcast i8* %77 to i32*
  %79 = load i32* %78, align 8
  %80 = and i32 %79, -129
  %81 = or i32 %80, 128
  store i32 %81, i32* %78, align 8
  br label %89

; <label>:82                                      ; preds = %66
  %83 = load %struct.re_pattern_buffer** %2, align 8
  %84 = bitcast %struct.re_pattern_buffer* %83 to i8*
  %85 = getelementptr i8* %84, i32 56
  %86 = bitcast i8* %85 to i32*
  %87 = load i32* %86, align 8
  %88 = and i32 %87, -129
  store i32 %88, i32* %86, align 8
  br label %89

; <label>:89                                      ; preds = %82, %70
  %90 = load i32* %4, align 4
  %91 = and i32 %90, 8
  %92 = icmp ne i32 %91, 0
  %93 = xor i1 %92, true
  %94 = xor i1 %93, true
  %95 = zext i1 %94 to i32
  %96 = load %struct.re_pattern_buffer** %2, align 8
  %97 = and i32 %95, 1
  %98 = bitcast %struct.re_pattern_buffer* %96 to i8*
  %99 = getelementptr i8* %98, i32 56
  %100 = bitcast i8* %99 to i32*
  %101 = and i32 %97, 1
  %102 = shl i32 %101, 4
  %103 = load i32* %100, align 8
  %104 = and i32 %103, -17
  %105 = or i32 %104, %102
  store i32 %105, i32* %100, align 8
  %106 = load i8** %3, align 8
  %107 = load i8** %3, align 8
  %108 = call i64 @strlen(i8* %107) nounwind readonly
  %109 = trunc i64 %108 to i32
  %110 = load i32* %syntax, align 4
  %111 = load %struct.re_pattern_buffer** %2, align 8
  %112 = call i32 (...)* bitcast (i32 (i8*, i32, i32, %struct.re_pattern_buffer*)* @regex_compile to i32 (...)*)(i8* %106, i32 %109, i32 %110, %struct.re_pattern_buffer* %111)
  store i32 %112, i32* %ret, align 4
  %113 = load i32* %ret, align 4
  %114 = icmp eq i32 %113, 16
  br i1 %114, label %115, label %116

; <label>:115                                     ; preds = %89
  store i32 8, i32* %ret, align 4
  br label %116

; <label>:116                                     ; preds = %115, %89
  %117 = load i32* %ret, align 4
  store i32 %117, i32* %1
  br label %118

; <label>:118                                     ; preds = %116, %26
  %119 = load i32* %1
  ret i32 %119
}

declare i32 @tolower(i32) nounwind

define i32 @regexec(%struct.re_pattern_buffer* %preg, i8* %string, i64 %nmatch, %struct.regmatch_t* %pmatch, i32 %eflags) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca %struct.re_pattern_buffer*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.regmatch_t*, align 8
  %6 = alloca i32, align 4
  %ret = alloca i32, align 4
  %regs = alloca %struct.re_registers, align 8
  %private_preg = alloca %struct.re_pattern_buffer, align 8
  %len = alloca i32, align 4
  %want_reg_info = alloca i8, align 1
  %r = alloca i32, align 4
  store %struct.re_pattern_buffer* %preg, %struct.re_pattern_buffer** %2, align 8
  store i8* %string, i8** %3, align 8
  store i64 %nmatch, i64* %4, align 8
  store %struct.regmatch_t* %pmatch, %struct.regmatch_t** %5, align 8
  store i32 %eflags, i32* %6, align 4
  %7 = load i8** %3, align 8
  %8 = call i64 @strlen(i8* %7) nounwind readonly
  %9 = trunc i64 %8 to i32
  store i32 %9, i32* %len, align 4
  %10 = load %struct.re_pattern_buffer** %2, align 8
  %11 = bitcast %struct.re_pattern_buffer* %10 to i8*
  %12 = getelementptr i8* %11, i32 56
  %13 = bitcast i8* %12 to i32*
  %14 = load i32* %13, align 8
  %15 = lshr i32 %14, 4
  %16 = and i32 %15, 1
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %21, label %18

; <label>:18                                      ; preds = %0
  %19 = load i64* %4, align 8
  %20 = icmp ugt i64 %19, 0
  br label %21

; <label>:21                                      ; preds = %18, %0
  %22 = phi i1 [ false, %0 ], [ %20, %18 ]
  %23 = zext i1 %22 to i32
  %24 = trunc i32 %23 to i8
  store i8 %24, i8* %want_reg_info, align 1
  %25 = load %struct.re_pattern_buffer** %2, align 8
  %26 = bitcast %struct.re_pattern_buffer* %private_preg to i8*
  %27 = bitcast %struct.re_pattern_buffer* %25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 64, i32 8, i1 false)
  %28 = load i32* %6, align 4
  %29 = and i32 %28, 1
  %30 = icmp ne i32 %29, 0
  %31 = xor i1 %30, true
  %32 = xor i1 %31, true
  %33 = zext i1 %32 to i32
  %34 = and i32 %33, 1
  %35 = bitcast %struct.re_pattern_buffer* %private_preg to i8*
  %36 = getelementptr i8* %35, i32 56
  %37 = bitcast i8* %36 to i32*
  %38 = and i32 %34, 1
  %39 = shl i32 %38, 5
  %40 = load i32* %37, align 8
  %41 = and i32 %40, -33
  %42 = or i32 %41, %39
  store i32 %42, i32* %37, align 8
  %43 = load i32* %6, align 4
  %44 = and i32 %43, 2
  %45 = icmp ne i32 %44, 0
  %46 = xor i1 %45, true
  %47 = xor i1 %46, true
  %48 = zext i1 %47 to i32
  %49 = and i32 %48, 1
  %50 = bitcast %struct.re_pattern_buffer* %private_preg to i8*
  %51 = getelementptr i8* %50, i32 56
  %52 = bitcast i8* %51 to i32*
  %53 = and i32 %49, 1
  %54 = shl i32 %53, 6
  %55 = load i32* %52, align 8
  %56 = and i32 %55, -65
  %57 = or i32 %56, %54
  store i32 %57, i32* %52, align 8
  %58 = bitcast %struct.re_pattern_buffer* %private_preg to i8*
  %59 = getelementptr i8* %58, i32 56
  %60 = bitcast i8* %59 to i32*
  %61 = load i32* %60, align 8
  %62 = and i32 %61, -7
  %63 = or i32 %62, 4
  store i32 %63, i32* %60, align 8
  %64 = load i8* %want_reg_info, align 1
  %65 = icmp ne i8 %64, 0
  br i1 %65, label %66, label %89

; <label>:66                                      ; preds = %21
  %67 = load i64* %4, align 8
  %68 = trunc i64 %67 to i32
  %69 = getelementptr inbounds %struct.re_registers* %regs, i32 0, i32 0
  store i32 %68, i32* %69, align 4
  %70 = load i64* %4, align 8
  %71 = mul i64 %70, 4
  %72 = call noalias i8* @malloc(i64 %71) nounwind
  %73 = bitcast i8* %72 to i32*
  %74 = getelementptr inbounds %struct.re_registers* %regs, i32 0, i32 1
  store i32* %73, i32** %74, align 8
  %75 = load i64* %4, align 8
  %76 = mul i64 %75, 4
  %77 = call noalias i8* @malloc(i64 %76) nounwind
  %78 = bitcast i8* %77 to i32*
  %79 = getelementptr inbounds %struct.re_registers* %regs, i32 0, i32 2
  store i32* %78, i32** %79, align 8
  %80 = getelementptr inbounds %struct.re_registers* %regs, i32 0, i32 1
  %81 = load i32** %80, align 8
  %82 = icmp eq i32* %81, null
  br i1 %82, label %87, label %83

; <label>:83                                      ; preds = %66
  %84 = getelementptr inbounds %struct.re_registers* %regs, i32 0, i32 2
  %85 = load i32** %84, align 8
  %86 = icmp eq i32* %85, null
  br i1 %86, label %87, label %88

; <label>:87                                      ; preds = %83, %66
  store i32 1, i32* %1
  br label %150

; <label>:88                                      ; preds = %83
  br label %89

; <label>:89                                      ; preds = %88, %21
  %90 = load i8** %3, align 8
  %91 = load i32* %len, align 4
  %92 = load i32* %len, align 4
  %93 = load i8* %want_reg_info, align 1
  %94 = sext i8 %93 to i32
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %96, label %97

; <label>:96                                      ; preds = %89
  br label %98

; <label>:97                                      ; preds = %89
  br label %98

; <label>:98                                      ; preds = %97, %96
  %99 = phi %struct.re_registers* [ %regs, %96 ], [ null, %97 ]
  %100 = call i32 (...)* bitcast (i32 (%struct.re_pattern_buffer*, i8*, i32, i32, i32, %struct.re_registers*)* @re_search to i32 (...)*)(%struct.re_pattern_buffer* %private_preg, i8* %90, i32 %91, i32 0, i32 %92, %struct.re_registers* %99)
  store i32 %100, i32* %ret, align 4
  %101 = load i8* %want_reg_info, align 1
  %102 = icmp ne i8 %101, 0
  br i1 %102, label %103, label %146

; <label>:103                                     ; preds = %98
  %104 = load i32* %ret, align 4
  %105 = icmp sge i32 %104, 0
  br i1 %105, label %106, label %139

; <label>:106                                     ; preds = %103
  store i32 0, i32* %r, align 4
  br label %107

; <label>:107                                     ; preds = %135, %106
  %108 = load i32* %r, align 4
  %109 = zext i32 %108 to i64
  %110 = load i64* %4, align 8
  %111 = icmp ult i64 %109, %110
  br i1 %111, label %112, label %138

; <label>:112                                     ; preds = %107
  %113 = load i32* %r, align 4
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds %struct.re_registers* %regs, i32 0, i32 1
  %116 = load i32** %115, align 8
  %117 = getelementptr inbounds i32* %116, i64 %114
  %118 = load i32* %117, align 4
  %119 = load i32* %r, align 4
  %120 = zext i32 %119 to i64
  %121 = load %struct.regmatch_t** %5, align 8
  %122 = getelementptr inbounds %struct.regmatch_t* %121, i64 %120
  %123 = getelementptr inbounds %struct.regmatch_t* %122, i32 0, i32 0
  store i32 %118, i32* %123, align 4
  %124 = load i32* %r, align 4
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds %struct.re_registers* %regs, i32 0, i32 2
  %127 = load i32** %126, align 8
  %128 = getelementptr inbounds i32* %127, i64 %125
  %129 = load i32* %128, align 4
  %130 = load i32* %r, align 4
  %131 = zext i32 %130 to i64
  %132 = load %struct.regmatch_t** %5, align 8
  %133 = getelementptr inbounds %struct.regmatch_t* %132, i64 %131
  %134 = getelementptr inbounds %struct.regmatch_t* %133, i32 0, i32 1
  store i32 %129, i32* %134, align 4
  br label %135

; <label>:135                                     ; preds = %112
  %136 = load i32* %r, align 4
  %137 = add i32 %136, 1
  store i32 %137, i32* %r, align 4
  br label %107

; <label>:138                                     ; preds = %107
  br label %139

; <label>:139                                     ; preds = %138, %103
  %140 = getelementptr inbounds %struct.re_registers* %regs, i32 0, i32 1
  %141 = load i32** %140, align 8
  %142 = bitcast i32* %141 to i8*
  call void @free(i8* %142) nounwind
  %143 = getelementptr inbounds %struct.re_registers* %regs, i32 0, i32 2
  %144 = load i32** %143, align 8
  %145 = bitcast i32* %144 to i8*
  call void @free(i8* %145) nounwind
  br label %146

; <label>:146                                     ; preds = %139, %98
  %147 = load i32* %ret, align 4
  %148 = icmp sge i32 %147, 0
  %149 = select i1 %148, i32 0, i32 1
  store i32 %149, i32* %1
  br label %150

; <label>:150                                     ; preds = %146, %87
  %151 = load i32* %1
  ret i32 %151
}

define i64 @regerror(i32 %errcode, %struct.re_pattern_buffer* %preg, i8* %errbuf, i64 %errbuf_size) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca %struct.re_pattern_buffer*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %msg = alloca i8*, align 8
  %msg_size = alloca i64, align 8
  store i32 %errcode, i32* %1, align 4
  store %struct.re_pattern_buffer* %preg, %struct.re_pattern_buffer** %2, align 8
  store i8* %errbuf, i8** %3, align 8
  store i64 %errbuf_size, i64* %4, align 8
  %5 = load i32* %1, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %11, label %7

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  %9 = sext i32 %8 to i64
  %10 = icmp uge i64 %9, 17
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %7, %0
  call void @abort() noreturn nounwind
  unreachable

; <label>:12                                      ; preds = %7
  %13 = load i32* %1, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [17 x i8*]* @re_error_msg, i32 0, i64 %14
  %16 = load i8** %15, align 8
  store i8* %16, i8** %msg, align 8
  %17 = load i8** %msg, align 8
  %18 = icmp ne i8* %17, null
  br i1 %18, label %20, label %19

; <label>:19                                      ; preds = %12
  store i8* getelementptr inbounds ([8 x i8]* @.str50, i32 0, i32 0), i8** %msg, align 8
  br label %20

; <label>:20                                      ; preds = %19, %12
  %21 = load i8** %msg, align 8
  %22 = call i64 @strlen(i8* %21) nounwind readonly
  %23 = add i64 %22, 1
  store i64 %23, i64* %msg_size, align 8
  %24 = load i64* %4, align 8
  %25 = icmp ne i64 %24, 0
  br i1 %25, label %26, label %45

; <label>:26                                      ; preds = %20
  %27 = load i64* %msg_size, align 8
  %28 = load i64* %4, align 8
  %29 = icmp ugt i64 %27, %28
  br i1 %29, label %30, label %40

; <label>:30                                      ; preds = %26
  %31 = load i8** %3, align 8
  %32 = load i8** %msg, align 8
  %33 = load i64* %4, align 8
  %34 = sub i64 %33, 1
  %35 = call i8* @strncpy(i8* %31, i8* %32, i64 %34) nounwind
  %36 = load i64* %4, align 8
  %37 = sub i64 %36, 1
  %38 = load i8** %3, align 8
  %39 = getelementptr inbounds i8* %38, i64 %37
  store i8 0, i8* %39, align 1
  br label %44

; <label>:40                                      ; preds = %26
  %41 = load i8** %3, align 8
  %42 = load i8** %msg, align 8
  %43 = call i8* @strcpy(i8* %41, i8* %42) nounwind
  br label %44

; <label>:44                                      ; preds = %40, %30
  br label %45

; <label>:45                                      ; preds = %44, %20
  %46 = load i64* %msg_size, align 8
  ret i64 %46
}

declare i8* @strncpy(i8*, i8*, i64) nounwind

define void @regfree(%struct.re_pattern_buffer* %preg) nounwind uwtable {
  %1 = alloca %struct.re_pattern_buffer*, align 8
  store %struct.re_pattern_buffer* %preg, %struct.re_pattern_buffer** %1, align 8
  %2 = load %struct.re_pattern_buffer** %1, align 8
  %3 = getelementptr inbounds %struct.re_pattern_buffer* %2, i32 0, i32 0
  %4 = load i8** %3, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %6, label %10

; <label>:6                                       ; preds = %0
  %7 = load %struct.re_pattern_buffer** %1, align 8
  %8 = getelementptr inbounds %struct.re_pattern_buffer* %7, i32 0, i32 0
  %9 = load i8** %8, align 8
  call void @free(i8* %9) nounwind
  br label %10

; <label>:10                                      ; preds = %6, %0
  %11 = load %struct.re_pattern_buffer** %1, align 8
  %12 = getelementptr inbounds %struct.re_pattern_buffer* %11, i32 0, i32 0
  store i8* null, i8** %12, align 8
  %13 = load %struct.re_pattern_buffer** %1, align 8
  %14 = getelementptr inbounds %struct.re_pattern_buffer* %13, i32 0, i32 1
  store i64 0, i64* %14, align 8
  %15 = load %struct.re_pattern_buffer** %1, align 8
  %16 = getelementptr inbounds %struct.re_pattern_buffer* %15, i32 0, i32 2
  store i64 0, i64* %16, align 8
  %17 = load %struct.re_pattern_buffer** %1, align 8
  %18 = getelementptr inbounds %struct.re_pattern_buffer* %17, i32 0, i32 4
  %19 = load i8** %18, align 8
  %20 = icmp ne i8* %19, null
  br i1 %20, label %21, label %25

; <label>:21                                      ; preds = %10
  %22 = load %struct.re_pattern_buffer** %1, align 8
  %23 = getelementptr inbounds %struct.re_pattern_buffer* %22, i32 0, i32 4
  %24 = load i8** %23, align 8
  call void @free(i8* %24) nounwind
  br label %25

; <label>:25                                      ; preds = %21, %10
  %26 = load %struct.re_pattern_buffer** %1, align 8
  %27 = getelementptr inbounds %struct.re_pattern_buffer* %26, i32 0, i32 4
  store i8* null, i8** %27, align 8
  %28 = load %struct.re_pattern_buffer** %1, align 8
  %29 = bitcast %struct.re_pattern_buffer* %28 to i8*
  %30 = getelementptr i8* %29, i32 56
  %31 = bitcast i8* %30 to i32*
  %32 = load i32* %31, align 8
  %33 = and i32 %32, -9
  store i32 %33, i32* %31, align 8
  %34 = load %struct.re_pattern_buffer** %1, align 8
  %35 = getelementptr inbounds %struct.re_pattern_buffer* %34, i32 0, i32 5
  %36 = load i8** %35, align 8
  %37 = icmp ne i8* %36, null
  br i1 %37, label %38, label %42

; <label>:38                                      ; preds = %25
  %39 = load %struct.re_pattern_buffer** %1, align 8
  %40 = getelementptr inbounds %struct.re_pattern_buffer* %39, i32 0, i32 5
  %41 = load i8** %40, align 8
  call void @free(i8* %41) nounwind
  br label %42

; <label>:42                                      ; preds = %38, %25
  %43 = load %struct.re_pattern_buffer** %1, align 8
  %44 = getelementptr inbounds %struct.re_pattern_buffer* %43, i32 0, i32 5
  store i8* null, i8** %44, align 8
  ret void
}

define internal signext i8 @group_in_compile_stack(%struct.compile_stack_elt_t* %compile_stack.coerce0, i64 %compile_stack.coerce1, i32 %regnum) nounwind uwtable {
  %1 = alloca i8, align 1
  %compile_stack = alloca %struct.compile_stack_type, align 8
  %2 = alloca i32, align 4
  %this_element = alloca i32, align 4
  %3 = bitcast %struct.compile_stack_type* %compile_stack to { %struct.compile_stack_elt_t*, i64 }*
  %4 = getelementptr { %struct.compile_stack_elt_t*, i64 }* %3, i32 0, i32 0
  store %struct.compile_stack_elt_t* %compile_stack.coerce0, %struct.compile_stack_elt_t** %4
  %5 = getelementptr { %struct.compile_stack_elt_t*, i64 }* %3, i32 0, i32 1
  store i64 %compile_stack.coerce1, i64* %5
  store i32 %regnum, i32* %2, align 4
  %6 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 2
  %7 = load i32* %6, align 4
  %8 = sub i32 %7, 1
  store i32 %8, i32* %this_element, align 4
  br label %9

; <label>:9                                       ; preds = %24, %0
  %10 = load i32* %this_element, align 4
  %11 = icmp sge i32 %10, 0
  br i1 %11, label %12, label %27

; <label>:12                                      ; preds = %9
  %13 = load i32* %this_element, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.compile_stack_type* %compile_stack, i32 0, i32 0
  %16 = load %struct.compile_stack_elt_t** %15, align 8
  %17 = getelementptr inbounds %struct.compile_stack_elt_t* %16, i64 %14
  %18 = getelementptr inbounds %struct.compile_stack_elt_t* %17, i32 0, i32 4
  %19 = load i32* %18, align 4
  %20 = load i32* %2, align 4
  %21 = icmp eq i32 %19, %20
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %12
  store i8 1, i8* %1
  br label %28

; <label>:23                                      ; preds = %12
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i32* %this_element, align 4
  %26 = add nsw i32 %25, -1
  store i32 %26, i32* %this_element, align 4
  br label %9

; <label>:27                                      ; preds = %9
  store i8 0, i8* %1
  br label %28

; <label>:28                                      ; preds = %27, %22
  %29 = load i8* %1
  ret i8 %29
}

define internal void @store_op2(i32 %op, i8* %loc, i32 %arg1, i32 %arg2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %op, i32* %1, align 4
  store i8* %loc, i8** %2, align 8
  store i32 %arg1, i32* %3, align 4
  store i32 %arg2, i32* %4, align 4
  %5 = load i32* %1, align 4
  %6 = trunc i32 %5 to i8
  %7 = load i8** %2, align 8
  store i8 %6, i8* %7, align 1
  br label %8

; <label>:8                                       ; preds = %0
  %9 = load i32* %3, align 4
  %10 = and i32 %9, 255
  %11 = trunc i32 %10 to i8
  %12 = load i8** %2, align 8
  %13 = getelementptr inbounds i8* %12, i64 1
  %14 = getelementptr inbounds i8* %13, i64 0
  store i8 %11, i8* %14, align 1
  %15 = load i32* %3, align 4
  %16 = ashr i32 %15, 8
  %17 = trunc i32 %16 to i8
  %18 = load i8** %2, align 8
  %19 = getelementptr inbounds i8* %18, i64 1
  %20 = getelementptr inbounds i8* %19, i64 1
  store i8 %17, i8* %20, align 1
  br label %21

; <label>:21                                      ; preds = %8
  br label %22

; <label>:22                                      ; preds = %21
  %23 = load i32* %4, align 4
  %24 = and i32 %23, 255
  %25 = trunc i32 %24 to i8
  %26 = load i8** %2, align 8
  %27 = getelementptr inbounds i8* %26, i64 3
  %28 = getelementptr inbounds i8* %27, i64 0
  store i8 %25, i8* %28, align 1
  %29 = load i32* %4, align 4
  %30 = ashr i32 %29, 8
  %31 = trunc i32 %30 to i8
  %32 = load i8** %2, align 8
  %33 = getelementptr inbounds i8* %32, i64 3
  %34 = getelementptr inbounds i8* %33, i64 1
  store i8 %31, i8* %34, align 1
  br label %35

; <label>:35                                      ; preds = %22
  ret void
}

define internal void @insert_op2(i32 %op, i8* %loc, i32 %arg1, i32 %arg2, i8* %end) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %pfrom = alloca i8*, align 8
  %pto = alloca i8*, align 8
  store i32 %op, i32* %1, align 4
  store i8* %loc, i8** %2, align 8
  store i32 %arg1, i32* %3, align 4
  store i32 %arg2, i32* %4, align 4
  store i8* %end, i8** %5, align 8
  %6 = load i8** %5, align 8
  store i8* %6, i8** %pfrom, align 8
  %7 = load i8** %5, align 8
  %8 = getelementptr inbounds i8* %7, i64 5
  store i8* %8, i8** %pto, align 8
  br label %9

; <label>:9                                       ; preds = %13, %0
  %10 = load i8** %pfrom, align 8
  %11 = load i8** %2, align 8
  %12 = icmp ne i8* %10, %11
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %9
  %14 = load i8** %pfrom, align 8
  %15 = getelementptr inbounds i8* %14, i32 -1
  store i8* %15, i8** %pfrom, align 8
  %16 = load i8* %15, align 1
  %17 = load i8** %pto, align 8
  %18 = getelementptr inbounds i8* %17, i32 -1
  store i8* %18, i8** %pto, align 8
  store i8 %16, i8* %18, align 1
  br label %9

; <label>:19                                      ; preds = %9
  %20 = load i32* %1, align 4
  %21 = load i8** %2, align 8
  %22 = load i32* %3, align 4
  %23 = load i32* %4, align 4
  call void (...)* bitcast (void (i32, i8*, i32, i32)* @store_op2 to void (...)*)(i32 %20, i8* %21, i32 %22, i32 %23)
  ret void
}

define internal i32 @compile_range(i8** %p_ptr, i8* %pend, i8* %translate, i32 %syntax, i8* %b) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %this_char = alloca i32, align 4
  %p = alloca i8*, align 8
  %range_start = alloca i32, align 4
  %range_end = alloca i32, align 4
  store i8** %p_ptr, i8*** %2, align 8
  store i8* %pend, i8** %3, align 8
  store i8* %translate, i8** %4, align 8
  store i32 %syntax, i32* %5, align 4
  store i8* %b, i8** %6, align 8
  %7 = load i8*** %2, align 8
  %8 = load i8** %7, align 8
  store i8* %8, i8** %p, align 8
  %9 = load i8** %p, align 8
  %10 = load i8** %3, align 8
  %11 = icmp eq i8* %9, %10
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  store i32 11, i32* %1
  br label %86

; <label>:13                                      ; preds = %0
  %14 = load i8** %p, align 8
  %15 = getelementptr inbounds i8* %14, i64 -2
  %16 = load i8* %15, align 1
  %17 = zext i8 %16 to i32
  store i32 %17, i32* %range_start, align 4
  %18 = load i8** %p, align 8
  %19 = getelementptr inbounds i8* %18, i64 0
  %20 = load i8* %19, align 1
  %21 = zext i8 %20 to i32
  store i32 %21, i32* %range_end, align 4
  %22 = load i8*** %2, align 8
  %23 = load i8** %22, align 8
  %24 = getelementptr inbounds i8* %23, i32 1
  store i8* %24, i8** %22, align 8
  %25 = load i32* %range_start, align 4
  %26 = load i32* %range_end, align 4
  %27 = icmp sgt i32 %25, %26
  br i1 %27, label %28, label %33

; <label>:28                                      ; preds = %13
  %29 = load i32* %5, align 4
  %30 = and i32 %29, 65536
  %31 = icmp ne i32 %30, 0
  %32 = select i1 %31, i32 11, i32 0
  store i32 %32, i32* %1
  br label %86

; <label>:33                                      ; preds = %13
  %34 = load i32* %range_start, align 4
  store i32 %34, i32* %this_char, align 4
  br label %35

; <label>:35                                      ; preds = %82, %33
  %36 = load i32* %this_char, align 4
  %37 = load i32* %range_end, align 4
  %38 = icmp ule i32 %36, %37
  br i1 %38, label %39, label %85

; <label>:39                                      ; preds = %35
  %40 = load i8** %4, align 8
  %41 = icmp ne i8* %40, null
  br i1 %41, label %42, label %50

; <label>:42                                      ; preds = %39
  %43 = load i32* %this_char, align 4
  %44 = trunc i32 %43 to i8
  %45 = zext i8 %44 to i64
  %46 = load i8** %4, align 8
  %47 = getelementptr inbounds i8* %46, i64 %45
  %48 = load i8* %47, align 1
  %49 = sext i8 %48 to i32
  br label %52

; <label>:50                                      ; preds = %39
  %51 = load i32* %this_char, align 4
  br label %52

; <label>:52                                      ; preds = %50, %42
  %53 = phi i32 [ %49, %42 ], [ %51, %50 ]
  %54 = trunc i32 %53 to i8
  %55 = zext i8 %54 to i32
  %56 = srem i32 %55, 8
  %57 = shl i32 1, %56
  %58 = load i8** %4, align 8
  %59 = icmp ne i8* %58, null
  br i1 %59, label %60, label %68

; <label>:60                                      ; preds = %52
  %61 = load i32* %this_char, align 4
  %62 = trunc i32 %61 to i8
  %63 = zext i8 %62 to i64
  %64 = load i8** %4, align 8
  %65 = getelementptr inbounds i8* %64, i64 %63
  %66 = load i8* %65, align 1
  %67 = sext i8 %66 to i32
  br label %70

; <label>:68                                      ; preds = %52
  %69 = load i32* %this_char, align 4
  br label %70

; <label>:70                                      ; preds = %68, %60
  %71 = phi i32 [ %67, %60 ], [ %69, %68 ]
  %72 = trunc i32 %71 to i8
  %73 = zext i8 %72 to i32
  %74 = sdiv i32 %73, 8
  %75 = sext i32 %74 to i64
  %76 = load i8** %6, align 8
  %77 = getelementptr inbounds i8* %76, i64 %75
  %78 = load i8* %77, align 1
  %79 = zext i8 %78 to i32
  %80 = or i32 %79, %57
  %81 = trunc i32 %80 to i8
  store i8 %81, i8* %77, align 1
  br label %82

; <label>:82                                      ; preds = %70
  %83 = load i32* %this_char, align 4
  %84 = add i32 %83, 1
  store i32 %84, i32* %this_char, align 4
  br label %35

; <label>:85                                      ; preds = %35
  store i32 0, i32* %1
  br label %86

; <label>:86                                      ; preds = %85, %28, %12
  %87 = load i32* %1
  ret i32 %87
}

define internal void @insert_op1(i32 %op, i8* %loc, i32 %arg, i8* %end) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %pfrom = alloca i8*, align 8
  %pto = alloca i8*, align 8
  store i32 %op, i32* %1, align 4
  store i8* %loc, i8** %2, align 8
  store i32 %arg, i32* %3, align 4
  store i8* %end, i8** %4, align 8
  %5 = load i8** %4, align 8
  store i8* %5, i8** %pfrom, align 8
  %6 = load i8** %4, align 8
  %7 = getelementptr inbounds i8* %6, i64 3
  store i8* %7, i8** %pto, align 8
  br label %8

; <label>:8                                       ; preds = %12, %0
  %9 = load i8** %pfrom, align 8
  %10 = load i8** %2, align 8
  %11 = icmp ne i8* %9, %10
  br i1 %11, label %12, label %18

; <label>:12                                      ; preds = %8
  %13 = load i8** %pfrom, align 8
  %14 = getelementptr inbounds i8* %13, i32 -1
  store i8* %14, i8** %pfrom, align 8
  %15 = load i8* %14, align 1
  %16 = load i8** %pto, align 8
  %17 = getelementptr inbounds i8* %16, i32 -1
  store i8* %17, i8** %pto, align 8
  store i8 %15, i8* %17, align 1
  br label %8

; <label>:18                                      ; preds = %8
  %19 = load i32* %1, align 4
  %20 = load i8** %2, align 8
  %21 = load i32* %3, align 4
  call void (...)* bitcast (void (i32, i8*, i32)* @store_op1 to void (...)*)(i32 %19, i8* %20, i32 %21)
  ret void
}

define internal void @store_op1(i32 %op, i8* %loc, i32 %arg) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i32 %op, i32* %1, align 4
  store i8* %loc, i8** %2, align 8
  store i32 %arg, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = trunc i32 %4 to i8
  %6 = load i8** %2, align 8
  store i8 %5, i8* %6, align 1
  br label %7

; <label>:7                                       ; preds = %0
  %8 = load i32* %3, align 4
  %9 = and i32 %8, 255
  %10 = trunc i32 %9 to i8
  %11 = load i8** %2, align 8
  %12 = getelementptr inbounds i8* %11, i64 1
  %13 = getelementptr inbounds i8* %12, i64 0
  store i8 %10, i8* %13, align 1
  %14 = load i32* %3, align 4
  %15 = ashr i32 %14, 8
  %16 = trunc i32 %15 to i8
  %17 = load i8** %2, align 8
  %18 = getelementptr inbounds i8* %17, i64 1
  %19 = getelementptr inbounds i8* %18, i64 1
  store i8 %16, i8* %19, align 1
  br label %20

; <label>:20                                      ; preds = %7
  ret void
}

define internal signext i8 @at_endline_loc_p(i8* %p, i8* %pend, i32 %syntax) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %next = alloca i8*, align 8
  %next_backslash = alloca i8, align 1
  %next_next = alloca i8*, align 8
  store i8* %p, i8** %1, align 8
  store i8* %pend, i8** %2, align 8
  store i32 %syntax, i32* %3, align 4
  %4 = load i8** %1, align 8
  store i8* %4, i8** %next, align 8
  %5 = load i8** %next, align 8
  %6 = load i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp eq i32 %7, 92
  %9 = zext i1 %8 to i32
  %10 = trunc i32 %9 to i8
  store i8 %10, i8* %next_backslash, align 1
  %11 = load i8** %1, align 8
  %12 = getelementptr inbounds i8* %11, i64 1
  %13 = load i8** %2, align 8
  %14 = icmp ult i8* %12, %13
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %0
  %16 = load i8** %1, align 8
  %17 = getelementptr inbounds i8* %16, i64 1
  br label %19

; <label>:18                                      ; preds = %0
  br label %19

; <label>:19                                      ; preds = %18, %15
  %20 = phi i8* [ %17, %15 ], [ null, %18 ]
  store i8* %20, i8** %next_next, align 8
  %21 = load i32* %3, align 4
  %22 = and i32 %21, 8192
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %29

; <label>:24                                      ; preds = %19
  %25 = load i8** %next, align 8
  %26 = load i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp eq i32 %27, 41
  br i1 %28, label %69, label %41

; <label>:29                                      ; preds = %19
  %30 = load i8* %next_backslash, align 1
  %31 = sext i8 %30 to i32
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %41

; <label>:33                                      ; preds = %29
  %34 = load i8** %next_next, align 8
  %35 = icmp ne i8* %34, null
  br i1 %35, label %36, label %41

; <label>:36                                      ; preds = %33
  %37 = load i8** %next_next, align 8
  %38 = load i8* %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp eq i32 %39, 41
  br i1 %40, label %69, label %41

; <label>:41                                      ; preds = %36, %33, %29, %24
  %42 = load i32* %3, align 4
  %43 = and i32 %42, 32768
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %51

; <label>:45                                      ; preds = %41
  %46 = load i8** %next, align 8
  %47 = load i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp eq i32 %48, 124
  %50 = zext i1 %49 to i32
  br label %66

; <label>:51                                      ; preds = %41
  %52 = load i8* %next_backslash, align 1
  %53 = sext i8 %52 to i32
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %63

; <label>:55                                      ; preds = %51
  %56 = load i8** %next_next, align 8
  %57 = icmp ne i8* %56, null
  br i1 %57, label %58, label %63

; <label>:58                                      ; preds = %55
  %59 = load i8** %next_next, align 8
  %60 = load i8* %59, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp eq i32 %61, 124
  br label %63

; <label>:63                                      ; preds = %58, %55, %51
  %64 = phi i1 [ false, %55 ], [ false, %51 ], [ %62, %58 ]
  %65 = zext i1 %64 to i32
  br label %66

; <label>:66                                      ; preds = %63, %45
  %67 = phi i32 [ %50, %45 ], [ %65, %63 ]
  %68 = icmp ne i32 %67, 0
  br label %69

; <label>:69                                      ; preds = %66, %36, %24
  %70 = phi i1 [ true, %36 ], [ true, %24 ], [ %68, %66 ]
  %71 = zext i1 %70 to i32
  %72 = trunc i32 %71 to i8
  ret i8 %72
}

define internal signext i8 @at_begline_loc_p(i8* %pattern, i8* %p, i32 %syntax) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %prev = alloca i8*, align 8
  %prev_prev_backslash = alloca i8, align 1
  store i8* %pattern, i8** %1, align 8
  store i8* %p, i8** %2, align 8
  store i32 %syntax, i32* %3, align 4
  %4 = load i8** %2, align 8
  %5 = getelementptr inbounds i8* %4, i64 -2
  store i8* %5, i8** %prev, align 8
  %6 = load i8** %prev, align 8
  %7 = load i8** %1, align 8
  %8 = icmp ugt i8* %6, %7
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %0
  %10 = load i8** %prev, align 8
  %11 = getelementptr inbounds i8* %10, i64 -1
  %12 = load i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp eq i32 %13, 92
  br label %15

; <label>:15                                      ; preds = %9, %0
  %16 = phi i1 [ false, %0 ], [ %14, %9 ]
  %17 = zext i1 %16 to i32
  %18 = trunc i32 %17 to i8
  store i8 %18, i8* %prev_prev_backslash, align 1
  %19 = load i8** %prev, align 8
  %20 = load i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp eq i32 %21, 40
  br i1 %22, label %23, label %31

; <label>:23                                      ; preds = %15
  %24 = load i32* %3, align 4
  %25 = and i32 %24, 8192
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %48, label %27

; <label>:27                                      ; preds = %23
  %28 = load i8* %prev_prev_backslash, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %48, label %31

; <label>:31                                      ; preds = %27, %15
  %32 = load i8** %prev, align 8
  %33 = load i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp eq i32 %34, 124
  br i1 %35, label %36, label %46

; <label>:36                                      ; preds = %31
  %37 = load i32* %3, align 4
  %38 = and i32 %37, 32768
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %44, label %40

; <label>:40                                      ; preds = %36
  %41 = load i8* %prev_prev_backslash, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp ne i32 %42, 0
  br label %44

; <label>:44                                      ; preds = %40, %36
  %45 = phi i1 [ true, %36 ], [ %43, %40 ]
  br label %46

; <label>:46                                      ; preds = %44, %31
  %47 = phi i1 [ false, %31 ], [ %45, %44 ]
  br label %48

; <label>:48                                      ; preds = %46, %27, %23
  %49 = phi i1 [ true, %27 ], [ true, %23 ], [ %47, %46 ]
  %50 = zext i1 %49 to i32
  %51 = trunc i32 %50 to i8
  ret i8 %51
}

define internal void @init_syntax_once() nounwind uwtable {
  %c = alloca i32, align 4
  %1 = load i32* @init_syntax_once.done, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %38

; <label>:4                                       ; preds = %0
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([256 x i8]* @re_syntax_table, i32 0, i32 0), i8 0, i64 256, i32 1, i1 false)
  store i32 97, i32* %c, align 4
  br label %5

; <label>:5                                       ; preds = %12, %4
  %6 = load i32* %c, align 4
  %7 = icmp sle i32 %6, 122
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %5
  %9 = load i32* %c, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %10
  store i8 1, i8* %11, align 1
  br label %12

; <label>:12                                      ; preds = %8
  %13 = load i32* %c, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %c, align 4
  br label %5

; <label>:15                                      ; preds = %5
  store i32 65, i32* %c, align 4
  br label %16

; <label>:16                                      ; preds = %23, %15
  %17 = load i32* %c, align 4
  %18 = icmp sle i32 %17, 90
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %16
  %20 = load i32* %c, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %21
  store i8 1, i8* %22, align 1
  br label %23

; <label>:23                                      ; preds = %19
  %24 = load i32* %c, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %c, align 4
  br label %16

; <label>:26                                      ; preds = %16
  store i32 48, i32* %c, align 4
  br label %27

; <label>:27                                      ; preds = %34, %26
  %28 = load i32* %c, align 4
  %29 = icmp sle i32 %28, 57
  br i1 %29, label %30, label %37

; <label>:30                                      ; preds = %27
  %31 = load i32* %c, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [256 x i8]* @re_syntax_table, i32 0, i64 %32
  store i8 1, i8* %33, align 1
  br label %34

; <label>:34                                      ; preds = %30
  %35 = load i32* %c, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %c, align 4
  br label %27

; <label>:37                                      ; preds = %27
  store i8 1, i8* getelementptr inbounds ([256 x i8]* @re_syntax_table, i32 0, i64 95), align 1
  store i32 1, i32* @init_syntax_once.done, align 4
  br label %38

; <label>:38                                      ; preds = %37, %3
  ret void
}

define internal i32 @bcmp_translate(i8* %s1, i8* %s2, i32 %len, i8* %translate) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %p1 = alloca i8*, align 8
  %p2 = alloca i8*, align 8
  store i8* %s1, i8** %2, align 8
  store i8* %s2, i8** %3, align 8
  store i32 %len, i32* %4, align 4
  store i8* %translate, i8** %5, align 8
  %6 = load i8** %2, align 8
  store i8* %6, i8** %p1, align 8
  %7 = load i8** %3, align 8
  store i8* %7, i8** %p2, align 8
  br label %8

; <label>:8                                       ; preds = %30, %0
  %9 = load i32* %4, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %33

; <label>:11                                      ; preds = %8
  %12 = load i8** %p1, align 8
  %13 = getelementptr inbounds i8* %12, i32 1
  store i8* %13, i8** %p1, align 8
  %14 = load i8* %12, align 1
  %15 = zext i8 %14 to i64
  %16 = load i8** %5, align 8
  %17 = getelementptr inbounds i8* %16, i64 %15
  %18 = load i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = load i8** %p2, align 8
  %21 = getelementptr inbounds i8* %20, i32 1
  store i8* %21, i8** %p2, align 8
  %22 = load i8* %20, align 1
  %23 = zext i8 %22 to i64
  %24 = load i8** %5, align 8
  %25 = getelementptr inbounds i8* %24, i64 %23
  %26 = load i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp ne i32 %19, %27
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %11
  store i32 1, i32* %1
  br label %34

; <label>:30                                      ; preds = %11
  %31 = load i32* %4, align 4
  %32 = add nsw i32 %31, -1
  store i32 %32, i32* %4, align 4
  br label %8

; <label>:33                                      ; preds = %8
  store i32 0, i32* %1
  br label %34

; <label>:34                                      ; preds = %33, %29
  %35 = load i32* %1
  ret i32 %35
}

define internal signext i8 @group_match_null_string_p(i8** %p, i8* %end, %union.register_info_type* %reg_info) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8**, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %union.register_info_type*, align 8
  %mcnt = alloca i32, align 4
  %p1 = alloca i8*, align 8
  store i8** %p, i8*** %2, align 8
  store i8* %end, i8** %3, align 8
  store %union.register_info_type* %reg_info, %union.register_info_type** %4, align 8
  %5 = load i8*** %2, align 8
  %6 = load i8** %5, align 8
  %7 = getelementptr inbounds i8* %6, i64 2
  store i8* %7, i8** %p1, align 8
  br label %8

; <label>:8                                       ; preds = %143, %0
  %9 = load i8** %p1, align 8
  %10 = load i8** %3, align 8
  %11 = icmp ult i8* %9, %10
  br i1 %11, label %12, label %144

; <label>:12                                      ; preds = %8
  %13 = load i8** %p1, align 8
  %14 = load i8* %13, align 1
  %15 = zext i8 %14 to i32
  switch i32 %15, label %136 [
    i32 14, label %16
    i32 6, label %132
  ]

; <label>:16                                      ; preds = %12
  %17 = load i8** %p1, align 8
  %18 = getelementptr inbounds i8* %17, i32 1
  store i8* %18, i8** %p1, align 8
  br label %19

; <label>:19                                      ; preds = %16
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i8** %p1, align 8
  %22 = load i8* %21, align 1
  %23 = zext i8 %22 to i32
  %24 = and i32 %23, 255
  store i32 %24, i32* %mcnt, align 4
  %25 = load i8** %p1, align 8
  %26 = getelementptr inbounds i8* %25, i64 1
  %27 = load i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = shl i32 %28, 8
  %30 = load i32* %mcnt, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, i32* %mcnt, align 4
  br label %32

; <label>:32                                      ; preds = %20
  %33 = load i8** %p1, align 8
  %34 = getelementptr inbounds i8* %33, i64 2
  store i8* %34, i8** %p1, align 8
  br label %35

; <label>:35                                      ; preds = %32
  %36 = load i32* %mcnt, align 4
  %37 = icmp sge i32 %36, 0
  br i1 %37, label %38, label %131

; <label>:38                                      ; preds = %35
  br label %39

; <label>:39                                      ; preds = %100, %38
  %40 = load i32* %mcnt, align 4
  %41 = sub nsw i32 %40, 3
  %42 = sext i32 %41 to i64
  %43 = load i8** %p1, align 8
  %44 = getelementptr inbounds i8* %43, i64 %42
  %45 = load i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = icmp eq i32 %46, 13
  br i1 %47, label %48, label %101

; <label>:48                                      ; preds = %39
  %49 = load i8** %p1, align 8
  %50 = load i8** %p1, align 8
  %51 = load i32* %mcnt, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8* %50, i64 %52
  %54 = getelementptr inbounds i8* %53, i64 -3
  %55 = load %union.register_info_type** %4, align 8
  %56 = call signext i8 (...)* bitcast (i8 (i8*, i8*, %union.register_info_type*)* @alt_match_null_string_p to i8 (...)*)(i8* %49, i8* %54, %union.register_info_type* %55)
  %57 = icmp ne i8 %56, 0
  br i1 %57, label %59, label %58

; <label>:58                                      ; preds = %48
  store i8 0, i8* %1
  br label %145

; <label>:59                                      ; preds = %48
  %60 = load i32* %mcnt, align 4
  %61 = load i8** %p1, align 8
  %62 = sext i32 %60 to i64
  %63 = getelementptr inbounds i8* %61, i64 %62
  store i8* %63, i8** %p1, align 8
  %64 = load i8** %p1, align 8
  %65 = load i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = icmp ne i32 %66, 14
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %59
  br label %101

; <label>:69                                      ; preds = %59
  %70 = load i8** %p1, align 8
  %71 = getelementptr inbounds i8* %70, i32 1
  store i8* %71, i8** %p1, align 8
  br label %72

; <label>:72                                      ; preds = %69
  br label %73

; <label>:73                                      ; preds = %72
  %74 = load i8** %p1, align 8
  %75 = load i8* %74, align 1
  %76 = zext i8 %75 to i32
  %77 = and i32 %76, 255
  store i32 %77, i32* %mcnt, align 4
  %78 = load i8** %p1, align 8
  %79 = getelementptr inbounds i8* %78, i64 1
  %80 = load i8* %79, align 1
  %81 = sext i8 %80 to i32
  %82 = shl i32 %81, 8
  %83 = load i32* %mcnt, align 4
  %84 = add nsw i32 %83, %82
  store i32 %84, i32* %mcnt, align 4
  br label %85

; <label>:85                                      ; preds = %73
  %86 = load i8** %p1, align 8
  %87 = getelementptr inbounds i8* %86, i64 2
  store i8* %87, i8** %p1, align 8
  br label %88

; <label>:88                                      ; preds = %85
  %89 = load i32* %mcnt, align 4
  %90 = sub nsw i32 %89, 3
  %91 = sext i32 %90 to i64
  %92 = load i8** %p1, align 8
  %93 = getelementptr inbounds i8* %92, i64 %91
  %94 = load i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = icmp ne i32 %95, 13
  br i1 %96, label %97, label %100

; <label>:97                                      ; preds = %88
  %98 = load i8** %p1, align 8
  %99 = getelementptr inbounds i8* %98, i64 -3
  store i8* %99, i8** %p1, align 8
  br label %101

; <label>:100                                     ; preds = %88
  br label %39

; <label>:101                                     ; preds = %97, %68, %39
  br label %102

; <label>:102                                     ; preds = %101
  %103 = load i8** %p1, align 8
  %104 = getelementptr inbounds i8* %103, i64 -2
  %105 = load i8* %104, align 1
  %106 = zext i8 %105 to i32
  %107 = and i32 %106, 255
  store i32 %107, i32* %mcnt, align 4
  %108 = load i8** %p1, align 8
  %109 = getelementptr inbounds i8* %108, i64 -2
  %110 = getelementptr inbounds i8* %109, i64 1
  %111 = load i8* %110, align 1
  %112 = sext i8 %111 to i32
  %113 = shl i32 %112, 8
  %114 = load i32* %mcnt, align 4
  %115 = add nsw i32 %114, %113
  store i32 %115, i32* %mcnt, align 4
  br label %116

; <label>:116                                     ; preds = %102
  %117 = load i8** %p1, align 8
  %118 = load i8** %p1, align 8
  %119 = load i32* %mcnt, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8* %118, i64 %120
  %122 = load %union.register_info_type** %4, align 8
  %123 = call signext i8 (...)* bitcast (i8 (i8*, i8*, %union.register_info_type*)* @alt_match_null_string_p to i8 (...)*)(i8* %117, i8* %121, %union.register_info_type* %122)
  %124 = icmp ne i8 %123, 0
  br i1 %124, label %126, label %125

; <label>:125                                     ; preds = %116
  store i8 0, i8* %1
  br label %145

; <label>:126                                     ; preds = %116
  %127 = load i32* %mcnt, align 4
  %128 = load i8** %p1, align 8
  %129 = sext i32 %127 to i64
  %130 = getelementptr inbounds i8* %128, i64 %129
  store i8* %130, i8** %p1, align 8
  br label %131

; <label>:131                                     ; preds = %126, %35
  br label %143

; <label>:132                                     ; preds = %12
  %133 = load i8** %p1, align 8
  %134 = getelementptr inbounds i8* %133, i64 2
  %135 = load i8*** %2, align 8
  store i8* %134, i8** %135, align 8
  store i8 1, i8* %1
  br label %145

; <label>:136                                     ; preds = %12
  %137 = load i8** %3, align 8
  %138 = load %union.register_info_type** %4, align 8
  %139 = call signext i8 (...)* bitcast (i8 (i8**, i8*, %union.register_info_type*)* @common_op_match_null_string_p to i8 (...)*)(i8** %p1, i8* %137, %union.register_info_type* %138)
  %140 = icmp ne i8 %139, 0
  br i1 %140, label %142, label %141

; <label>:141                                     ; preds = %136
  store i8 0, i8* %1
  br label %145

; <label>:142                                     ; preds = %136
  br label %143

; <label>:143                                     ; preds = %142, %131
  br label %8

; <label>:144                                     ; preds = %8
  store i8 0, i8* %1
  br label %145

; <label>:145                                     ; preds = %144, %141, %132, %125, %58
  %146 = load i8* %1
  ret i8 %146
}

define internal signext i8 @common_op_match_null_string_p(i8** %p, i8* %end, %union.register_info_type* %reg_info) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8**, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %union.register_info_type*, align 8
  %mcnt = alloca i32, align 4
  %ret = alloca i8, align 1
  %reg_no = alloca i32, align 4
  %p1 = alloca i8*, align 8
  store i8** %p, i8*** %2, align 8
  store i8* %end, i8** %3, align 8
  store %union.register_info_type* %reg_info, %union.register_info_type** %4, align 8
  %5 = load i8*** %2, align 8
  %6 = load i8** %5, align 8
  store i8* %6, i8** %p1, align 8
  %7 = load i8** %p1, align 8
  %8 = getelementptr inbounds i8* %7, i32 1
  store i8* %8, i8** %p1, align 8
  %9 = load i8* %7, align 1
  %10 = zext i8 %9 to i32
  switch i32 %10, label %138 [
    i32 0, label %11
    i32 8, label %11
    i32 9, label %11
    i32 10, label %11
    i32 11, label %11
    i32 25, label %11
    i32 26, label %11
    i32 27, label %11
    i32 28, label %11
    i32 5, label %12
    i32 12, label %47
    i32 20, label %74
    i32 7, label %122
    i32 22, label %135
  ]

; <label>:11                                      ; preds = %0, %0, %0, %0, %0, %0, %0, %0, %0
  br label %139

; <label>:12                                      ; preds = %0
  %13 = load i8** %p1, align 8
  %14 = load i8* %13, align 1
  %15 = zext i8 %14 to i32
  store i32 %15, i32* %reg_no, align 4
  %16 = load i8** %3, align 8
  %17 = load %union.register_info_type** %4, align 8
  %18 = call signext i8 (...)* bitcast (i8 (i8**, i8*, %union.register_info_type*)* @group_match_null_string_p to i8 (...)*)(i8** %p1, i8* %16, %union.register_info_type* %17)
  store i8 %18, i8* %ret, align 1
  %19 = load i32* %reg_no, align 4
  %20 = sext i32 %19 to i64
  %21 = load %union.register_info_type** %4, align 8
  %22 = getelementptr inbounds %union.register_info_type* %21, i64 %20
  %23 = bitcast %union.register_info_type* %22 to %struct.anon.2*
  %24 = bitcast %struct.anon.2* %23 to i32*
  %25 = load i32* %24, align 4
  %26 = and i32 %25, 3
  %27 = icmp eq i32 %26, 3
  br i1 %27, label %28, label %42

; <label>:28                                      ; preds = %12
  %29 = load i8* %ret, align 1
  %30 = sext i8 %29 to i32
  %31 = load i32* %reg_no, align 4
  %32 = sext i32 %31 to i64
  %33 = load %union.register_info_type** %4, align 8
  %34 = getelementptr inbounds %union.register_info_type* %33, i64 %32
  %35 = bitcast %union.register_info_type* %34 to %struct.anon.2*
  %36 = and i32 %30, 3
  %37 = bitcast %struct.anon.2* %35 to i32*
  %38 = and i32 %36, 3
  %39 = load i32* %37, align 4
  %40 = and i32 %39, -4
  %41 = or i32 %40, %38
  store i32 %41, i32* %37, align 4
  br label %42

; <label>:42                                      ; preds = %28, %12
  %43 = load i8* %ret, align 1
  %44 = icmp ne i8 %43, 0
  br i1 %44, label %46, label %45

; <label>:45                                      ; preds = %42
  store i8 0, i8* %1
  br label %142

; <label>:46                                      ; preds = %42
  br label %139

; <label>:47                                      ; preds = %0
  br label %48

; <label>:48                                      ; preds = %47
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load i8** %p1, align 8
  %51 = load i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = and i32 %52, 255
  store i32 %53, i32* %mcnt, align 4
  %54 = load i8** %p1, align 8
  %55 = getelementptr inbounds i8* %54, i64 1
  %56 = load i8* %55, align 1
  %57 = sext i8 %56 to i32
  %58 = shl i32 %57, 8
  %59 = load i32* %mcnt, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, i32* %mcnt, align 4
  br label %61

; <label>:61                                      ; preds = %49
  %62 = load i8** %p1, align 8
  %63 = getelementptr inbounds i8* %62, i64 2
  store i8* %63, i8** %p1, align 8
  br label %64

; <label>:64                                      ; preds = %61
  %65 = load i32* %mcnt, align 4
  %66 = icmp sge i32 %65, 0
  br i1 %66, label %67, label %72

; <label>:67                                      ; preds = %64
  %68 = load i32* %mcnt, align 4
  %69 = load i8** %p1, align 8
  %70 = sext i32 %68 to i64
  %71 = getelementptr inbounds i8* %69, i64 %70
  store i8* %71, i8** %p1, align 8
  br label %73

; <label>:72                                      ; preds = %64
  store i8 0, i8* %1
  br label %142

; <label>:73                                      ; preds = %67
  br label %139

; <label>:74                                      ; preds = %0
  %75 = load i8** %p1, align 8
  %76 = getelementptr inbounds i8* %75, i64 2
  store i8* %76, i8** %p1, align 8
  br label %77

; <label>:77                                      ; preds = %74
  br label %78

; <label>:78                                      ; preds = %77
  %79 = load i8** %p1, align 8
  %80 = load i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = and i32 %81, 255
  store i32 %82, i32* %mcnt, align 4
  %83 = load i8** %p1, align 8
  %84 = getelementptr inbounds i8* %83, i64 1
  %85 = load i8* %84, align 1
  %86 = sext i8 %85 to i32
  %87 = shl i32 %86, 8
  %88 = load i32* %mcnt, align 4
  %89 = add nsw i32 %88, %87
  store i32 %89, i32* %mcnt, align 4
  br label %90

; <label>:90                                      ; preds = %78
  %91 = load i8** %p1, align 8
  %92 = getelementptr inbounds i8* %91, i64 2
  store i8* %92, i8** %p1, align 8
  br label %93

; <label>:93                                      ; preds = %90
  %94 = load i32* %mcnt, align 4
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %120

; <label>:96                                      ; preds = %93
  %97 = load i8** %p1, align 8
  %98 = getelementptr inbounds i8* %97, i64 -4
  store i8* %98, i8** %p1, align 8
  br label %99

; <label>:99                                      ; preds = %96
  br label %100

; <label>:100                                     ; preds = %99
  %101 = load i8** %p1, align 8
  %102 = load i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = and i32 %103, 255
  store i32 %104, i32* %mcnt, align 4
  %105 = load i8** %p1, align 8
  %106 = getelementptr inbounds i8* %105, i64 1
  %107 = load i8* %106, align 1
  %108 = sext i8 %107 to i32
  %109 = shl i32 %108, 8
  %110 = load i32* %mcnt, align 4
  %111 = add nsw i32 %110, %109
  store i32 %111, i32* %mcnt, align 4
  br label %112

; <label>:112                                     ; preds = %100
  %113 = load i8** %p1, align 8
  %114 = getelementptr inbounds i8* %113, i64 2
  store i8* %114, i8** %p1, align 8
  br label %115

; <label>:115                                     ; preds = %112
  %116 = load i32* %mcnt, align 4
  %117 = load i8** %p1, align 8
  %118 = sext i32 %116 to i64
  %119 = getelementptr inbounds i8* %117, i64 %118
  store i8* %119, i8** %p1, align 8
  br label %121

; <label>:120                                     ; preds = %93
  store i8 0, i8* %1
  br label %142

; <label>:121                                     ; preds = %115
  br label %139

; <label>:122                                     ; preds = %0
  %123 = load i8** %p1, align 8
  %124 = load i8* %123, align 1
  %125 = zext i8 %124 to i64
  %126 = load %union.register_info_type** %4, align 8
  %127 = getelementptr inbounds %union.register_info_type* %126, i64 %125
  %128 = bitcast %union.register_info_type* %127 to %struct.anon.2*
  %129 = bitcast %struct.anon.2* %128 to i32*
  %130 = load i32* %129, align 4
  %131 = and i32 %130, 3
  %132 = icmp ne i32 %131, 0
  br i1 %132, label %134, label %133

; <label>:133                                     ; preds = %122
  store i8 0, i8* %1
  br label %142

; <label>:134                                     ; preds = %122
  br label %139

; <label>:135                                     ; preds = %0
  %136 = load i8** %p1, align 8
  %137 = getelementptr inbounds i8* %136, i64 4
  store i8* %137, i8** %p1, align 8
  br label %138

; <label>:138                                     ; preds = %135, %0
  store i8 0, i8* %1
  br label %142

; <label>:139                                     ; preds = %134, %121, %73, %46, %11
  %140 = load i8** %p1, align 8
  %141 = load i8*** %2, align 8
  store i8* %140, i8** %141, align 8
  store i8 1, i8* %1
  br label %142

; <label>:142                                     ; preds = %139, %138, %133, %120, %72, %45
  %143 = load i8* %1
  ret i8 %143
}

define internal signext i8 @alt_match_null_string_p(i8* %p, i8* %end, %union.register_info_type* %reg_info) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %union.register_info_type*, align 8
  %mcnt = alloca i32, align 4
  %p1 = alloca i8*, align 8
  store i8* %p, i8** %2, align 8
  store i8* %end, i8** %3, align 8
  store %union.register_info_type* %reg_info, %union.register_info_type** %4, align 8
  %5 = load i8** %2, align 8
  store i8* %5, i8** %p1, align 8
  br label %6

; <label>:6                                       ; preds = %45, %0
  %7 = load i8** %p1, align 8
  %8 = load i8** %3, align 8
  %9 = icmp ult i8* %7, %8
  br i1 %9, label %10, label %46

; <label>:10                                      ; preds = %6
  %11 = load i8** %p1, align 8
  %12 = load i8* %11, align 1
  %13 = zext i8 %12 to i32
  switch i32 %13, label %38 [
    i32 14, label %14
  ]

; <label>:14                                      ; preds = %10
  %15 = load i8** %p1, align 8
  %16 = getelementptr inbounds i8* %15, i32 1
  store i8* %16, i8** %p1, align 8
  br label %17

; <label>:17                                      ; preds = %14
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load i8** %p1, align 8
  %20 = load i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = and i32 %21, 255
  store i32 %22, i32* %mcnt, align 4
  %23 = load i8** %p1, align 8
  %24 = getelementptr inbounds i8* %23, i64 1
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = shl i32 %26, 8
  %28 = load i32* %mcnt, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, i32* %mcnt, align 4
  br label %30

; <label>:30                                      ; preds = %18
  %31 = load i8** %p1, align 8
  %32 = getelementptr inbounds i8* %31, i64 2
  store i8* %32, i8** %p1, align 8
  br label %33

; <label>:33                                      ; preds = %30
  %34 = load i32* %mcnt, align 4
  %35 = load i8** %p1, align 8
  %36 = sext i32 %34 to i64
  %37 = getelementptr inbounds i8* %35, i64 %36
  store i8* %37, i8** %p1, align 8
  br label %45

; <label>:38                                      ; preds = %10
  %39 = load i8** %3, align 8
  %40 = load %union.register_info_type** %4, align 8
  %41 = call signext i8 (...)* bitcast (i8 (i8**, i8*, %union.register_info_type*)* @common_op_match_null_string_p to i8 (...)*)(i8** %p1, i8* %39, %union.register_info_type* %40)
  %42 = icmp ne i8 %41, 0
  br i1 %42, label %44, label %43

; <label>:43                                      ; preds = %38
  store i8 0, i8* %1
  br label %47

; <label>:44                                      ; preds = %38
  br label %45

; <label>:45                                      ; preds = %44, %33
  br label %6

; <label>:46                                      ; preds = %6
  store i8 1, i8* %1
  br label %47

; <label>:47                                      ; preds = %46, %43
  %48 = load i8* %1
  ret i8 %48
}
