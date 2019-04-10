; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.posn = type { i32, i32 }
%struct.ms_board = type { i32, i32, i8*, i32, %struct.posn* }

@MAX_MINES = constant i32 99, align 4
@MAX_DIM = constant i32 16, align 4
@MIN_DIM = constant i32 4, align 4
@.str = private unnamed_addr constant [31 x i8] c"Welcome to ASCII minesweeper!\0A\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"width\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"height\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"mine count\00", align 1
@.str.4 = private unnamed_addr constant [68 x i8] c"You may select a game (1-9999) or pick 0 for a (pseudo)random game\0A\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"game number\00", align 1
@.str.6 = private unnamed_addr constant [57 x i8] c"Press 'f' to place/remove a flag or 'r' to reveal a tile\00", align 1
@.str.7 = private unnamed_addr constant [25 x i8] c"Coordinate %c%d (%d,%d)\0A\00", align 1
@.str.8 = private unnamed_addr constant [47 x i8] c"Could not place/remove flag at that position!\0A\00", align 1
@.str.9 = private unnamed_addr constant [32 x i8] c"That tile is already revealed!\0A\00", align 1
@.str.10 = private unnamed_addr constant [29 x i8] c"Congratulations, you won!\0A%s\00", align 1
@face = internal constant [78 x i8] c"  _________\0A /         \5C\0A |  /\5C /\5C  |\0A |    -    |\0A |  \5C___/  |\0A \5C_________/\0A\00", align 16
@.str.11 = private unnamed_addr constant [24 x i8] c"Game over, you lose!\0A%s\00", align 1
@uded = internal constant [101 x i8] c"  _________\0A /         \5C   RIP\0A |  X   X  |   IN\0A |    -    |   PEPPERONI\0A |  _____  |\0A \5C_________/\0A\00", align 16
@.str.12 = private unnamed_addr constant [18 x i8] c"Play again? (y/n)\00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"OK, goodbye then!\0A\00", align 1
@.str.34 = private unnamed_addr constant [45 x i8] c"Enter coordinate (column then row, e.g. A1)\0A\00", align 1
@.str.35 = private unnamed_addr constant [6 x i8] c" %c%d\00", align 1
@.str.36 = private unnamed_addr constant [35 x i8] c"Column must be between 'A' and %c\0A\00", align 1
@.str.37 = private unnamed_addr constant [30 x i8] c"Row must be between 1 and %d\0A\00", align 1
@.str.29 = private unnamed_addr constant [7 x i8] c"a != 0\00", align 1
@.str.15 = private unnamed_addr constant [47 x i8] c"/u1/dtompkins/.seashell/projects/_A7/q4/game.c\00", align 1
@__PRETTY_FUNCTION__.get_char_value = private unnamed_addr constant [54 x i8] c"void get_char_value(char *, const char *, char, char)\00", align 1
@.str.30 = private unnamed_addr constant [7 x i8] c"b != 0\00", align 1
@.str.31 = private unnamed_addr constant [4 x i8] c"msg\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"dest\00", align 1
@.str.32 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.33 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.22 = private unnamed_addr constant [44 x i8] c"\0AOOPS!  Looks like it's EOF time, bye now!\0A\00", align 1
@.str.24 = private unnamed_addr constant [4 x i8] c"__|\00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"_%c_\00", align 1
@.str.26 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.27 = private unnamed_addr constant [5 x i8] c"%2d|\00", align 1
@.str.28 = private unnamed_addr constant [5 x i8] c" %c \00", align 1
@__PRETTY_FUNCTION__.get_int_value = private unnamed_addr constant [50 x i8] c"void get_int_value(int *, const char *, int, int)\00", align 1
@.str.16 = private unnamed_addr constant [5 x i8] c"name\00", align 1
@.str.17 = private unnamed_addr constant [11 x i8] c"min <= max\00", align 1
@.str.18 = private unnamed_addr constant [18 x i8] c"Enter %s (%d-%d)\0A\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.20 = private unnamed_addr constant [34 x i8] c"I'm sorry, that wasn't a number! \00", align 1
@.str.21 = private unnamed_addr constant [42 x i8] c"I'm sorry, %s must be between %d and %d! \00", align 1

; Function Attrs: nounwind
define void @play_minesweeper() #0 {
  %grid = alloca [256 x i8], align 16
  %mines = alloca [99 x %struct.posn], align 16
  %b = alloca %struct.ms_board, align 8
  %seed = alloca i32, align 4
  %command = alloca i8, align 1
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %i = alloca i32, align 4
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %grid, i32 0, i32 0
  %board = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 2
  store i8* %arraydecay, i8** %board, align 8
  %arraydecay1 = getelementptr inbounds [99 x %struct.posn], [99 x %struct.posn]* %mines, i32 0, i32 0
  %mines2 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 4
  store %struct.posn* %arraydecay1, %struct.posn** %mines2, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i32 0, i32 0))
  br label %1

; <label>:1:                                      ; preds = %44, %0
  %width = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 0
  call void @get_int_value(i32* %width, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 4, i32 16)
  %height = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 1
  call void @get_int_value(i32* %height, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i32 4, i32 16)
  %num_mines = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 3
  %width3 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 0
  %2 = load i32, i32* %width3, align 8
  %height4 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 1
  %3 = load i32, i32* %height4, align 4
  %mul = mul nsw i32 %2, %3
  %call5 = call i32 @min(i32 99, i32 %mul)
  call void @get_int_value(i32* %num_mines, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i32 1, i32 %call5)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4:                                      ; preds = %11, %1
  %5 = load i32, i32* %i, align 4
  %width6 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 0
  %6 = load i32, i32* %width6, align 8
  %height7 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 1
  %7 = load i32, i32* %height7, align 4
  %mul8 = mul nsw i32 %6, %7
  %cmp = icmp slt i32 %5, %mul8
  br i1 %cmp, label %8, label %13

; <label>:8:                                      ; preds = %4
  %9 = load i32, i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %board9 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 2
  %10 = load i8*, i8** %board9, align 8
  %arrayidx = getelementptr inbounds i8, i8* %10, i64 %idxprom
  store i8 32, i8* %arrayidx, align 1
  br label %11

; <label>:11:                                     ; preds = %8
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %4

; <label>:13:                                     ; preds = %4
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.4, i32 0, i32 0))
  call void @get_int_value(i32* %seed, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 0, i32 9999)
  %14 = load i32, i32* %seed, align 4
  call void @setup_board(%struct.ms_board* %b, i32 %14)
  call void @print_board(%struct.ms_board* %b)
  br label %15

; <label>:15:                                     ; preds = %36, %13
  call void @get_char_value(i8* %command, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.6, i32 0, i32 0), i8 signext 102, i8 signext 114)
  %width11 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 0
  %16 = load i32, i32* %width11, align 8
  %height12 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %b, i32 0, i32 1
  %17 = load i32, i32* %height12, align 4
  call void @get_coordinates(i32* %x, i32* %y, i32 %16, i32 %17)
  %18 = load i32, i32* %x, align 4
  %add = add nsw i32 65, %18
  %sub = sub nsw i32 %add, 1
  %19 = load i32, i32* %y, align 4
  %20 = load i32, i32* %x, align 4
  %21 = load i32, i32* %y, align 4
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.7, i32 0, i32 0), i32 %sub, i32 %19, i32 %20, i32 %21)
  %22 = load i8, i8* %command, align 1
  %conv = sext i8 %22 to i32
  %cmp14 = icmp eq i32 %conv, 70
  br i1 %cmp14, label %23, label %28

; <label>:23:                                     ; preds = %15
  %24 = load i32, i32* %x, align 4
  %25 = load i32, i32* %y, align 4
  %call16 = call zeroext i1 @flag(%struct.ms_board* %b, i32 %24, i32 %25)
  br i1 %call16, label %27, label %26

; <label>:26:                                     ; preds = %23
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.8, i32 0, i32 0))
  br label %27

; <label>:27:                                     ; preds = %26, %23
  br label %33

; <label>:28:                                     ; preds = %15
  %29 = load i32, i32* %x, align 4
  %30 = load i32, i32* %y, align 4
  %call18 = call zeroext i1 @reveal(%struct.ms_board* %b, i32 %29, i32 %30)
  br i1 %call18, label %32, label %31

; <label>:31:                                     ; preds = %28
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.9, i32 0, i32 0))
  br label %32

; <label>:32:                                     ; preds = %31, %28
  br label %33

; <label>:33:                                     ; preds = %32, %27
  call void @print_board(%struct.ms_board* %b)
  br label %34

; <label>:34:                                     ; preds = %33
  %call20 = call zeroext i1 @game_lost(%struct.ms_board* %b)
  br i1 %call20, label %36, label %35

; <label>:35:                                     ; preds = %34
  %call22 = call zeroext i1 @game_won(%struct.ms_board* %b)
  br label %36

; <label>:36:                                     ; preds = %35, %34
  %37 = phi i1 [ true, %34 ], [ %call22, %35 ]
  %lnot = xor i1 %37, true
  br i1 %lnot, label %15, label %38

; <label>:38:                                     ; preds = %36
  %call24 = call zeroext i1 @game_won(%struct.ms_board* %b)
  br i1 %call24, label %39, label %40

; <label>:39:                                     ; preds = %38
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([78 x i8], [78 x i8]* @face, i32 0, i32 0))
  br label %41

; <label>:40:                                     ; preds = %38
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([101 x i8], [101 x i8]* @uded, i32 0, i32 0))
  br label %41

; <label>:41:                                     ; preds = %40, %39
  call void @get_char_value(i8* %command, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.12, i32 0, i32 0), i8 signext 121, i8 signext 110)
  %42 = load i8, i8* %command, align 1
  %conv27 = sext i8 %42 to i32
  %cmp28 = icmp eq i32 %conv27, 78
  br i1 %cmp28, label %43, label %44

; <label>:43:                                     ; preds = %41
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.13, i32 0, i32 0))
  br label %45

; <label>:44:                                     ; preds = %41
  br label %1

; <label>:45:                                     ; preds = %43
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
define internal void @get_int_value(i32* %dest, i8* %name, i32 %min, i32 %max) #0 {
  %dest.addr = alloca i32*, align 8
  %name.addr = alloca i8*, align 8
  %min.addr = alloca i32, align 4
  %max.addr = alloca i32, align 4
  %rc = alloca i32, align 4
  store i32* %dest, i32** %dest.addr, align 8
  store i8* %name, i8** %name.addr, align 8
  store i32 %min, i32* %min.addr, align 4
  store i32 %max, i32* %max.addr, align 4
  %1 = load i32*, i32** %dest.addr, align 8
  %tobool = icmp ne i32* %1, null
  br i1 %tobool, label %2, label %3

; <label>:2:                                      ; preds = %0
  br label %5

; <label>:3:                                      ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i32 0, i32 0), i32 82, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__PRETTY_FUNCTION__.get_int_value, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %5

; <label>:5:                                      ; preds = %4, %2
  %6 = load i8*, i8** %name.addr, align 8
  %tobool1 = icmp ne i8* %6, null
  br i1 %tobool1, label %7, label %8

; <label>:7:                                      ; preds = %5
  br label %10

; <label>:8:                                      ; preds = %5
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i32 0, i32 0), i32 83, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__PRETTY_FUNCTION__.get_int_value, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %10

; <label>:10:                                     ; preds = %9, %7
  %11 = load i32, i32* %min.addr, align 4
  %12 = load i32, i32* %max.addr, align 4
  %cmp = icmp sle i32 %11, %12
  br i1 %cmp, label %13, label %14

; <label>:13:                                     ; preds = %10
  br label %16

; <label>:14:                                     ; preds = %10
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i32 0, i32 0), i32 84, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__PRETTY_FUNCTION__.get_int_value, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %16

; <label>:16:                                     ; preds = %15, %13
  br label %17

; <label>:17:                                     ; preds = %42, %16
  %18 = load i8*, i8** %name.addr, align 8
  %19 = load i32, i32* %min.addr, align 4
  %20 = load i32, i32* %max.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.18, i32 0, i32 0), i8* %18, i32 %19, i32 %20)
  %21 = load i32*, i32** %dest.addr, align 8
  %call2 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0), i32* %21)
  store i32 %call2, i32* %rc, align 4
  %22 = load i32, i32* %rc, align 4
  %cmp3 = icmp slt i32 %22, 0
  br i1 %cmp3, label %23, label %24

; <label>:23:                                     ; preds = %17
  call void @abrupt_end()
  br label %42

; <label>:24:                                     ; preds = %17
  %25 = load i32, i32* %rc, align 4
  %cmp4 = icmp eq i32 %25, 0
  br i1 %cmp4, label %26, label %27

; <label>:26:                                     ; preds = %24
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.20, i32 0, i32 0))
  call void @chomp_line()
  br label %41

; <label>:27:                                     ; preds = %24
  %28 = load i32*, i32** %dest.addr, align 8
  %29 = load i32, i32* %28, align 4
  %30 = load i32, i32* %min.addr, align 4
  %cmp6 = icmp slt i32 %29, %30
  br i1 %cmp6, label %35, label %31

; <label>:31:                                     ; preds = %27
  %32 = load i32*, i32** %dest.addr, align 8
  %33 = load i32, i32* %32, align 4
  %34 = load i32, i32* %max.addr, align 4
  %cmp7 = icmp sgt i32 %33, %34
  br i1 %cmp7, label %35, label %39

; <label>:35:                                     ; preds = %31, %27
  %36 = load i8*, i8** %name.addr, align 8
  %37 = load i32, i32* %min.addr, align 4
  %38 = load i32, i32* %max.addr, align 4
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.21, i32 0, i32 0), i8* %36, i32 %37, i32 %38)
  br label %40

; <label>:39:                                     ; preds = %31
  br label %43

; <label>:40:                                     ; preds = %35
  br label %41

; <label>:41:                                     ; preds = %40, %26
  br label %42

; <label>:42:                                     ; preds = %41, %23
  br label %17

; <label>:43:                                     ; preds = %39
  ret void
}

; Function Attrs: nounwind
define internal i32 @min(i32 %a, i32 %b) #0 {
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %1 = load i32, i32* %a.addr, align 4
  %2 = load i32, i32* %b.addr, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %3, label %5

; <label>:3:                                      ; preds = %0
  %4 = load i32, i32* %a.addr, align 4
  br label %7

; <label>:5:                                      ; preds = %0
  %6 = load i32, i32* %b.addr, align 4
  br label %7

; <label>:7:                                      ; preds = %5, %3
  %cond = phi i32 [ %4, %3 ], [ %6, %5 ]
  ret i32 %cond
}

; Function Attrs: nounwind
define internal void @setup_board(%struct.ms_board* %b, i32 %seed) #0 {
  %b.addr = alloca %struct.ms_board*, align 8
  %seed.addr = alloca i32, align 4
  %len = alloca i32, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %valid = alloca i8, align 1
  %j = alloca i32, align 4
  store %struct.ms_board* %b, %struct.ms_board** %b.addr, align 8
  store i32 %seed, i32* %seed.addr, align 4
  %1 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %width = getelementptr inbounds %struct.ms_board, %struct.ms_board* %1, i32 0, i32 0
  %2 = load i32, i32* %width, align 8
  %3 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %height = getelementptr inbounds %struct.ms_board, %struct.ms_board* %3, i32 0, i32 1
  %4 = load i32, i32* %height, align 4
  %mul = mul nsw i32 %2, %4
  store i32 %mul, i32* %len, align 4
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5:                                      ; preds = %12, %0
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %len, align 4
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %8, label %14

; <label>:8:                                      ; preds = %5
  %9 = load i32, i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %10 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %board = getelementptr inbounds %struct.ms_board, %struct.ms_board* %10, i32 0, i32 2
  %11 = load i8*, i8** %board, align 8
  %arrayidx = getelementptr inbounds i8, i8* %11, i64 %idxprom
  store i8 32, i8* %arrayidx, align 1
  br label %12

; <label>:12:                                     ; preds = %8
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %5

; <label>:14:                                     ; preds = %5
  %15 = load i32, i32* %seed.addr, align 4
  %tobool = icmp ne i32 %15, 0
  br i1 %tobool, label %16, label %18

; <label>:16:                                     ; preds = %14
  %17 = load i32, i32* %seed.addr, align 4
  call void @srand(i32 %17) #5
  br label %19

; <label>:18:                                     ; preds = %14
  %call = call i64 @time(i64* null) #5
  %conv = trunc i64 %call to i32
  call void @srand(i32 %conv) #5
  br label %19

; <label>:19:                                     ; preds = %18, %16
  store i32 0, i32* %i1, align 4
  br label %20

; <label>:20:                                     ; preds = %61, %19
  %21 = load i32, i32* %i1, align 4
  %22 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %num_mines = getelementptr inbounds %struct.ms_board, %struct.ms_board* %22, i32 0, i32 3
  %23 = load i32, i32* %num_mines, align 8
  %cmp2 = icmp slt i32 %21, %23
  br i1 %cmp2, label %24, label %63

; <label>:24:                                     ; preds = %20
  store i8 1, i8* %valid, align 1
  br label %25

; <label>:25:                                     ; preds = %50, %24
  %call4 = call i32 @rand() #5
  %26 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %width5 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %26, i32 0, i32 0
  %27 = load i32, i32* %width5, align 8
  %rem = srem i32 %call4, %27
  %add = add nsw i32 %rem, 1
  store i32 %add, i32* %x, align 4
  %call6 = call i32 @rand() #5
  %28 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %height7 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %28, i32 0, i32 1
  %29 = load i32, i32* %height7, align 4
  %rem8 = srem i32 %call6, %29
  %add9 = add nsw i32 %rem8, 1
  store i32 %add9, i32* %y, align 4
  store i8 1, i8* %valid, align 1
  store i32 0, i32* %j, align 4
  br label %30

; <label>:30:                                     ; preds = %47, %25
  %31 = load i32, i32* %j, align 4
  %32 = load i32, i32* %i1, align 4
  %cmp10 = icmp slt i32 %31, %32
  br i1 %cmp10, label %33, label %49

; <label>:33:                                     ; preds = %30
  %34 = load i32, i32* %j, align 4
  %idxprom12 = sext i32 %34 to i64
  %35 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %mines = getelementptr inbounds %struct.ms_board, %struct.ms_board* %35, i32 0, i32 4
  %36 = load %struct.posn*, %struct.posn** %mines, align 8
  %arrayidx13 = getelementptr inbounds %struct.posn, %struct.posn* %36, i64 %idxprom12
  %x14 = getelementptr inbounds %struct.posn, %struct.posn* %arrayidx13, i32 0, i32 0
  %37 = load i32, i32* %x14, align 4
  %38 = load i32, i32* %x, align 4
  %cmp15 = icmp eq i32 %37, %38
  br i1 %cmp15, label %39, label %46

; <label>:39:                                     ; preds = %33
  %40 = load i32, i32* %j, align 4
  %idxprom17 = sext i32 %40 to i64
  %41 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %mines18 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %41, i32 0, i32 4
  %42 = load %struct.posn*, %struct.posn** %mines18, align 8
  %arrayidx19 = getelementptr inbounds %struct.posn, %struct.posn* %42, i64 %idxprom17
  %y20 = getelementptr inbounds %struct.posn, %struct.posn* %arrayidx19, i32 0, i32 1
  %43 = load i32, i32* %y20, align 4
  %44 = load i32, i32* %y, align 4
  %cmp21 = icmp eq i32 %43, %44
  br i1 %cmp21, label %45, label %46

; <label>:45:                                     ; preds = %39
  store i8 0, i8* %valid, align 1
  br label %49

; <label>:46:                                     ; preds = %39, %33
  br label %47

; <label>:47:                                     ; preds = %46
  %48 = load i32, i32* %j, align 4
  %inc23 = add nsw i32 %48, 1
  store i32 %inc23, i32* %j, align 4
  br label %30

; <label>:49:                                     ; preds = %45, %30
  br label %50

; <label>:50:                                     ; preds = %49
  %51 = load i8, i8* %valid, align 1
  %tobool24 = trunc i8 %51 to i1
  %lnot = xor i1 %tobool24, true
  br i1 %lnot, label %25, label %52

; <label>:52:                                     ; preds = %50
  %53 = load i32, i32* %x, align 4
  %54 = load i32, i32* %i1, align 4
  %idxprom25 = sext i32 %54 to i64
  %55 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %mines26 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %55, i32 0, i32 4
  %56 = load %struct.posn*, %struct.posn** %mines26, align 8
  %arrayidx27 = getelementptr inbounds %struct.posn, %struct.posn* %56, i64 %idxprom25
  %x28 = getelementptr inbounds %struct.posn, %struct.posn* %arrayidx27, i32 0, i32 0
  store i32 %53, i32* %x28, align 4
  %57 = load i32, i32* %y, align 4
  %58 = load i32, i32* %i1, align 4
  %idxprom29 = sext i32 %58 to i64
  %59 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %mines30 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %59, i32 0, i32 4
  %60 = load %struct.posn*, %struct.posn** %mines30, align 8
  %arrayidx31 = getelementptr inbounds %struct.posn, %struct.posn* %60, i64 %idxprom29
  %y32 = getelementptr inbounds %struct.posn, %struct.posn* %arrayidx31, i32 0, i32 1
  store i32 %57, i32* %y32, align 4
  br label %61

; <label>:61:                                     ; preds = %52
  %62 = load i32, i32* %i1, align 4
  %inc33 = add nsw i32 %62, 1
  store i32 %inc33, i32* %i1, align 4
  br label %20

; <label>:63:                                     ; preds = %20
  ret void
}

; Function Attrs: nounwind
define internal void @print_board(%struct.ms_board* %b) #0 {
  %b.addr = alloca %struct.ms_board*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %x5 = alloca i32, align 4
  store %struct.ms_board* %b, %struct.ms_board** %b.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.24, i32 0, i32 0))
  store i32 1, i32* %x, align 4
  br label %1

; <label>:1:                                      ; preds = %7, %0
  %2 = load i32, i32* %x, align 4
  %3 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %width = getelementptr inbounds %struct.ms_board, %struct.ms_board* %3, i32 0, i32 0
  %4 = load i32, i32* %width, align 8
  %cmp = icmp sle i32 %2, %4
  br i1 %cmp, label %5, label %9

; <label>:5:                                      ; preds = %1
  %6 = load i32, i32* %x, align 4
  %add = add nsw i32 65, %6
  %sub = sub nsw i32 %add, 1
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i32 0, i32 0), i32 %sub)
  br label %7

; <label>:7:                                      ; preds = %5
  %8 = load i32, i32* %x, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %x, align 4
  br label %1

; <label>:9:                                      ; preds = %1
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.26, i32 0, i32 0))
  store i32 1, i32* %y, align 4
  br label %10

; <label>:10:                                     ; preds = %31, %9
  %11 = load i32, i32* %y, align 4
  %12 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %height = getelementptr inbounds %struct.ms_board, %struct.ms_board* %12, i32 0, i32 1
  %13 = load i32, i32* %height, align 4
  %cmp3 = icmp sle i32 %11, %13
  br i1 %cmp3, label %14, label %33

; <label>:14:                                     ; preds = %10
  %15 = load i32, i32* %y, align 4
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.27, i32 0, i32 0), i32 %15)
  store i32 1, i32* %x5, align 4
  br label %16

; <label>:16:                                     ; preds = %28, %14
  %17 = load i32, i32* %x5, align 4
  %18 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %width6 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %18, i32 0, i32 0
  %19 = load i32, i32* %width6, align 8
  %cmp7 = icmp sle i32 %17, %19
  br i1 %cmp7, label %20, label %30

; <label>:20:                                     ; preds = %16
  %21 = load i32, i32* %y, align 4
  %sub8 = sub nsw i32 %21, 1
  %22 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %width9 = getelementptr inbounds %struct.ms_board, %struct.ms_board* %22, i32 0, i32 0
  %23 = load i32, i32* %width9, align 8
  %mul = mul nsw i32 %sub8, %23
  %24 = load i32, i32* %x5, align 4
  %sub10 = sub nsw i32 %24, 1
  %add11 = add nsw i32 %mul, %sub10
  %idxprom = sext i32 %add11 to i64
  %25 = load %struct.ms_board*, %struct.ms_board** %b.addr, align 8
  %board = getelementptr inbounds %struct.ms_board, %struct.ms_board* %25, i32 0, i32 2
  %26 = load i8*, i8** %board, align 8
  %arrayidx = getelementptr inbounds i8, i8* %26, i64 %idxprom
  %27 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %27 to i32
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i32 0, i32 0), i32 %conv)
  br label %28

; <label>:28:                                     ; preds = %20
  %29 = load i32, i32* %x5, align 4
  %inc13 = add nsw i32 %29, 1
  store i32 %inc13, i32* %x5, align 4
  br label %16

; <label>:30:                                     ; preds = %16
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.26, i32 0, i32 0))
  br label %31

; <label>:31:                                     ; preds = %30
  %32 = load i32, i32* %y, align 4
  %inc15 = add nsw i32 %32, 1
  store i32 %inc15, i32* %y, align 4
  br label %10

; <label>:33:                                     ; preds = %10
  ret void
}

; Function Attrs: nounwind
define internal void @get_char_value(i8* %dest, i8* %msg, i8 signext %a, i8 signext %b) #0 {
  %dest.addr = alloca i8*, align 8
  %msg.addr = alloca i8*, align 8
  %a.addr = alloca i8, align 1
  %b.addr = alloca i8, align 1
  %rc = alloca i32, align 4
  store i8* %dest, i8** %dest.addr, align 8
  store i8* %msg, i8** %msg.addr, align 8
  store i8 %a, i8* %a.addr, align 1
  store i8 %b, i8* %b.addr, align 1
  %1 = load i8, i8* %a.addr, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %2, label %3

; <label>:2:                                      ; preds = %0
  br label %5

; <label>:3:                                      ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i32 0, i32 0), i32 113, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.get_char_value, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %5

; <label>:5:                                      ; preds = %4, %2
  %6 = load i8, i8* %b.addr, align 1
  %conv2 = sext i8 %6 to i32
  %cmp3 = icmp ne i32 %conv2, 0
  br i1 %cmp3, label %7, label %8

; <label>:7:                                      ; preds = %5
  br label %10

; <label>:8:                                      ; preds = %5
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i32 0, i32 0), i32 114, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.get_char_value, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %10

; <label>:10:                                     ; preds = %9, %7
  %11 = load i8*, i8** %msg.addr, align 8
  %tobool = icmp ne i8* %11, null
  br i1 %tobool, label %12, label %13

; <label>:12:                                     ; preds = %10
  br label %15

; <label>:13:                                     ; preds = %10
  call void @__assert_fail(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i32 0, i32 0), i32 115, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.get_char_value, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %15

; <label>:15:                                     ; preds = %14, %12
  %16 = load i8*, i8** %dest.addr, align 8
  %tobool5 = icmp ne i8* %16, null
  br i1 %tobool5, label %17, label %18

; <label>:17:                                     ; preds = %15
  br label %20

; <label>:18:                                     ; preds = %15
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i32 0, i32 0), i32 116, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.get_char_value, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %20

; <label>:20:                                     ; preds = %19, %17
  %21 = load i8, i8* %a.addr, align 1
  %call = call signext i8 @to_upper(i8 signext %21)
  store i8 %call, i8* %a.addr, align 1
  %22 = load i8, i8* %b.addr, align 1
  %call6 = call signext i8 @to_upper(i8 signext %22)
  store i8 %call6, i8* %b.addr, align 1
  %23 = load i8*, i8** %dest.addr, align 8
  store i8 0, i8* %23, align 1
  br label %24

; <label>:24:                                     ; preds = %41, %20
  %25 = load i8*, i8** %msg.addr, align 8
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.32, i32 0, i32 0), i8* %25)
  %26 = load i8*, i8** %dest.addr, align 8
  %call8 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.33, i32 0, i32 0), i8* %26)
  store i32 %call8, i32* %rc, align 4
  %27 = load i8*, i8** %dest.addr, align 8
  %28 = load i8, i8* %27, align 1
  %call9 = call signext i8 @to_upper(i8 signext %28)
  %29 = load i8*, i8** %dest.addr, align 8
  store i8 %call9, i8* %29, align 1
  %30 = load i32, i32* %rc, align 4
  %cmp10 = icmp slt i32 %30, 0
  br i1 %cmp10, label %31, label %32

; <label>:31:                                     ; preds = %24
  call void @abrupt_end()
  br label %32

; <label>:32:                                     ; preds = %31, %24
  call void @chomp_line()
  br label %33

; <label>:33:                                     ; preds = %32
  %34 = load i8*, i8** %dest.addr, align 8
  %35 = load i8, i8* %34, align 1
  %conv12 = sext i8 %35 to i32
  %36 = load i8, i8* %a.addr, align 1
  %conv13 = sext i8 %36 to i32
  %cmp14 = icmp ne i32 %conv12, %conv13
  br i1 %cmp14, label %37, label %41

; <label>:37:                                     ; preds = %33
  %38 = load i8*, i8** %dest.addr, align 8
  %39 = load i8, i8* %38, align 1
  %conv16 = sext i8 %39 to i32
  %40 = load i8, i8* %b.addr, align 1
  %conv17 = sext i8 %40 to i32
  %cmp18 = icmp ne i32 %conv16, %conv17
  br label %41

; <label>:41:                                     ; preds = %37, %33
  %42 = phi i1 [ false, %33 ], [ %cmp18, %37 ]
  br i1 %42, label %24, label %43

; <label>:43:                                     ; preds = %41
  ret void
}

; Function Attrs: nounwind
define internal void @get_coordinates(i32* %x, i32* %y, i32 %w, i32 %h) #0 {
  %x.addr = alloca i32*, align 8
  %y.addr = alloca i32*, align 8
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %rc = alloca i32, align 4
  %col = alloca i8, align 1
  %row = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 8
  store i32* %y, i32** %y.addr, align 8
  store i32 %w, i32* %w.addr, align 4
  store i32 %h, i32* %h.addr, align 4
  br label %1

; <label>:1:                                      ; preds = %16, %7, %0
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.34, i32 0, i32 0))
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.35, i32 0, i32 0), i8* %col, i32* %row)
  store i32 %call1, i32* %rc, align 4
  %2 = load i8, i8* %col, align 1
  %call2 = call signext i8 @to_upper(i8 signext %2)
  store i8 %call2, i8* %col, align 1
  %3 = load i8, i8* %col, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp slt i32 %conv, 65
  br i1 %cmp, label %7, label %4

; <label>:4:                                      ; preds = %1
  %5 = load i8, i8* %col, align 1
  %conv4 = sext i8 %5 to i32
  %6 = load i32, i32* %w.addr, align 4
  %add = add nsw i32 65, %6
  %sub = sub nsw i32 %add, 1
  %cmp5 = icmp sgt i32 %conv4, %sub
  br i1 %cmp5, label %7, label %9

; <label>:7:                                      ; preds = %4, %1
  %8 = load i32, i32* %w.addr, align 4
  %add7 = add nsw i32 65, %8
  %sub8 = sub nsw i32 %add7, 1
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.36, i32 0, i32 0), i32 %sub8)
  br label %1

; <label>:9:                                      ; preds = %4
  %10 = load i8, i8* %col, align 1
  %conv10 = sext i8 %10 to i32
  %sub11 = sub nsw i32 %conv10, 65
  %add12 = add nsw i32 %sub11, 1
  %11 = load i32*, i32** %x.addr, align 8
  store i32 %add12, i32* %11, align 4
  %12 = load i32, i32* %row, align 4
  %cmp13 = icmp slt i32 %12, 1
  br i1 %cmp13, label %16, label %13

; <label>:13:                                     ; preds = %9
  %14 = load i32, i32* %row, align 4
  %15 = load i32, i32* %h.addr, align 4
  %cmp15 = icmp sgt i32 %14, %15
  br i1 %cmp15, label %16, label %18

; <label>:16:                                     ; preds = %13, %9
  %17 = load i32, i32* %h.addr, align 4
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.37, i32 0, i32 0), i32 %17)
  br label %1

; <label>:18:                                     ; preds = %13
  %19 = load i32, i32* %row, align 4
  %20 = load i32*, i32** %y.addr, align 8
  store i32 %19, i32* %20, align 4
  ret void
}

declare zeroext i1 @flag(%struct.ms_board*, i32, i32) #1

declare zeroext i1 @reveal(%struct.ms_board*, i32, i32) #1

declare zeroext i1 @game_lost(%struct.ms_board*) #1

declare zeroext i1 @game_won(%struct.ms_board*) #1

declare i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: nounwind
define internal signext i8 @to_upper(i8 signext %c) #0 {
  %c.addr = alloca i8, align 1
  store i8 %c, i8* %c.addr, align 1
  %1 = load i8, i8* %c.addr, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp sge i32 %conv, 97
  br i1 %cmp, label %2, label %6

; <label>:2:                                      ; preds = %0
  %3 = load i8, i8* %c.addr, align 1
  %conv2 = sext i8 %3 to i32
  %cmp3 = icmp sle i32 %conv2, 122
  br i1 %cmp3, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = load i8, i8* %c.addr, align 1
  %conv5 = sext i8 %5 to i32
  %sub = sub nsw i32 %conv5, 97
  %add = add nsw i32 %sub, 65
  %conv6 = trunc i32 %add to i8
  store i8 %conv6, i8* %c.addr, align 1
  br label %6

; <label>:6:                                      ; preds = %4, %2, %0
  %7 = load i8, i8* %c.addr, align 1
  ret i8 %7
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: nounwind
define internal void @abrupt_end() #0 {
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.22, i32 0, i32 0))
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind
define internal void @chomp_line() #0 {
  %c = alloca i8, align 1
  br label %1

; <label>:1:                                      ; preds = %4, %0
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), i8* %c)
  %cmp = icmp slt i32 %call, 1
  br i1 %cmp, label %2, label %3

; <label>:2:                                      ; preds = %1
  call void @abrupt_end()
  br label %3

; <label>:3:                                      ; preds = %2, %1
  br label %4

; <label>:4:                                      ; preds = %3
  %5 = load i8, i8* %c, align 1
  %conv = sext i8 %5 to i32
  %cmp1 = icmp ne i32 %conv, 10
  br i1 %cmp1, label %1, label %6

; <label>:6:                                      ; preds = %4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare void @srand(i32) #3

; Function Attrs: nounwind
declare i64 @time(i64*) #3

; Function Attrs: nounwind
declare i32 @rand() #3

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.1 "}
