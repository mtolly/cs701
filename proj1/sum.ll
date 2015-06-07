; ModuleID = 'sum.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %n = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %n, align 4
  br label %4

; <label>:4                                       ; preds = %13, %0
  %5 = load i32* %n, align 4
  %6 = icmp slt i32 %5, 100
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %4
  %8 = load i32* %sum, align 4
  %9 = load i32* %n, align 4
  %10 = load i32* %n, align 4
  %11 = mul nsw i32 %9, %10
  %12 = add nsw i32 %8, %11
  store i32 %12, i32* %sum, align 4
  br label %13

; <label>:13                                      ; preds = %7
  %14 = load i32* %n, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %n, align 4
  br label %4

; <label>:16                                      ; preds = %4
  %17 = load i32* %sum, align 4
  ret i32 %17
}
