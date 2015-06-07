; ModuleID = 'vars.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 12, i32* %x, align 4
  %1 = load i32* %x, align 4
  %2 = add nsw i32 %1, 22
  store i32 %2, i32* %y, align 4
  %3 = load i32* %y, align 4
  %4 = add nsw i32 %3, 33
  store i32 %4, i32* %z, align 4
  ret i32 0
}
