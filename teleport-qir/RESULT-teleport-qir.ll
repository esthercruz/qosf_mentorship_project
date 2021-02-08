
%Result = type opaque
%Range = type { i64, i64, i64 }
%Qubit = type opaque
%Array = type opaque
%Tuple = type opaque
%class.RESULT = type opaque

@ResultZero = external global %Result*
@ResultOne = external global %Result*
@PauliI = constant i2 0
@PauliX = constant i2 1
@PauliY = constant i2 -1
@PauliZ = constant i2 -2
@EmptyRange = internal constant %Range { i64 0, i64 1, i64 -1 }

define %Result* @teleport_qir__HelloQ__body() {
entry:
  %msg = call %Qubit* @__quantum__rt__qubit_allocate()
  %here = call %Qubit* @__quantum__rt__qubit_allocate()
  %there = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %here)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %here, %Qubit* %there)
  call void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %msg, %Qubit* %here)
  call void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %msg)
  call void @Microsoft__Quantum__Intrinsic__Ry__body(double 1.230000e-01, %Qubit* %msg)
  %0 = call %Result* @Microsoft__Quantum__Intrinsic__M__body(%Qubit* %msg)
  %1 = load %Result*, %Result** @ResultOne
  %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
  br i1 %2, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  call void @Microsoft__Quantum__Intrinsic__Z__body(%Qubit* %there)
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %entry
  %3 = call %Result* @Microsoft__Quantum__Intrinsic__M__body(%Qubit* %here)
  %4 = load %Result*, %Result** @ResultOne
  %5 = call i1 @__quantum__rt__result_equal(%Result* %3, %Result* %4)
  br i1 %5, label %then0__2, label %continue__2

then0__2:                                         ; preds = %continue__1
  call void @Microsoft__Quantum__Intrinsic__X__body(%Qubit* %there)
  br label %continue__2

continue__2:                                      ; preds = %then0__2, %continue__1
  call void @Microsoft__Quantum__Intrinsic__Ry__body(double -1.230000e-01, %Qubit* %there)
  %6 = call %Result* @Microsoft__Quantum__Intrinsic__M__body(%Qubit* %there)
  call void @__quantum__rt__qubit_release(%Qubit* %there)
  call void @__quantum__rt__qubit_release(%Qubit* %here)
  call void @__quantum__rt__qubit_release(%Qubit* %msg)
  call void @__quantum__rt__result_update_reference_count(%Result* %0, i64 -1)
  call void @__quantum__rt__result_update_reference_count(%Result* %3, i64 -1)
  ret %Result* %6
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @Microsoft__Quantum__Intrinsic__H__body(%Qubit*)

define void @Microsoft__Quantum__Intrinsic__CNOT__body(%Qubit* %control, %Qubit* %target) {
entry:
  %0 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %1 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 0)
  %2 = bitcast i8* %1 to %Qubit**
  store %Qubit* %control, %Qubit** %2
  call void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %0, %Qubit* %target)
  call void @__quantum__rt__array_update_reference_count(%Array* %0, i64 -1)
  ret void
}

define void @Microsoft__Quantum__Intrinsic__Ry__body(double %theta, %Qubit* %qubit) {
entry:
  %0 = load i2, i2* @PauliY
  call void @Microsoft__Quantum__Intrinsic__R__body(i2 %0, double %theta, %Qubit* %qubit)
  ret void
}

define %Result* @Microsoft__Quantum__Intrinsic__M__body(%Qubit* %qubit) {
entry:
  %0 = call %Array* @__quantum__rt__array_create_1d(i32 1, i64 1)
  %1 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 0)
  %2 = bitcast i8* %1 to i2*
  %3 = load i2, i2* @PauliZ
  store i2 %3, i2* %2
  %4 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %5 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %4, i64 0)
  %6 = bitcast i8* %5 to %Qubit**
  store %Qubit* %qubit, %Qubit** %6
  %7 = call %Result* @Microsoft__Quantum__Intrinsic__Measure__body(%Array* %0, %Array* %4)
  call void @__quantum__rt__array_update_reference_count(%Array* %0, i64 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %4, i64 -1)
  ret %Result* %7
}

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

declare void @Microsoft__Quantum__Intrinsic__Z__body(%Qubit*)

declare void @Microsoft__Quantum__Intrinsic__X__body(%Qubit*)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__rt__result_update_reference_count(%Result*, i64)

declare void @Microsoft__Quantum__Intrinsic__R__body(i2, double, %Qubit*)

define void @Microsoft__Quantum__Intrinsic__Ry__adj(double %theta, %Qubit* %qubit) {
entry:
  %0 = load i2, i2* @PauliY
  %1 = fneg double %theta
  call void @Microsoft__Quantum__Intrinsic__R__body(i2 %0, double %1, %Qubit* %qubit)
  ret void
}

define void @Microsoft__Quantum__Intrinsic__Ry__ctl(%Array* %__controlQubits__, { double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i64 1)
  %1 = getelementptr { double, %Qubit* }, { double, %Qubit* }* %0, i64 0, i32 0
  %theta = load double, double* %1
  %2 = getelementptr { double, %Qubit* }, { double, %Qubit* }* %0, i64 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2
  %3 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i2, double, %Qubit* }* getelementptr ({ i2, double, %Qubit* }, { i2, double, %Qubit* }* null, i32 1) to i64))
  %4 = bitcast %Tuple* %3 to { i2, double, %Qubit* }*
  %5 = getelementptr { i2, double, %Qubit* }, { i2, double, %Qubit* }* %4, i64 0, i32 0
  %6 = getelementptr { i2, double, %Qubit* }, { i2, double, %Qubit* }* %4, i64 0, i32 1
  %7 = getelementptr { i2, double, %Qubit* }, { i2, double, %Qubit* }* %4, i64 0, i32 2
  %8 = load i2, i2* @PauliY
  store i2 %8, i2* %5
  store double %theta, double* %6
  store %Qubit* %qubit, %Qubit** %7
  call void @Microsoft__Quantum__Intrinsic__R__ctl(%Array* %__controlQubits__, { i2, double, %Qubit* }* %4)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i64 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i64 -1)
  ret void
}

declare void @__quantum__rt__array_update_alias_count(%Array*, i64)

declare void @Microsoft__Quantum__Intrinsic__R__ctl(%Array*, { i2, double, %Qubit* }*)

declare %Tuple* @__quantum__rt__tuple_create(i64)

declare void @__quantum__rt__tuple_update_reference_count(%Tuple*, i64)

define void @Microsoft__Quantum__Intrinsic__Ry__ctladj(%Array* %__controlQubits__, { double, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i64 1)
  %1 = getelementptr { double, %Qubit* }, { double, %Qubit* }* %0, i64 0, i32 0
  %theta = load double, double* %1
  %2 = getelementptr { double, %Qubit* }, { double, %Qubit* }* %0, i64 0, i32 1
  %qubit = load %Qubit*, %Qubit** %2
  %3 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i2, double, %Qubit* }* getelementptr ({ i2, double, %Qubit* }, { i2, double, %Qubit* }* null, i32 1) to i64))
  %4 = bitcast %Tuple* %3 to { i2, double, %Qubit* }*
  %5 = getelementptr { i2, double, %Qubit* }, { i2, double, %Qubit* }* %4, i64 0, i32 0
  %6 = getelementptr { i2, double, %Qubit* }, { i2, double, %Qubit* }* %4, i64 0, i32 1
  %7 = getelementptr { i2, double, %Qubit* }, { i2, double, %Qubit* }* %4, i64 0, i32 2
  %8 = load i2, i2* @PauliY
  %9 = fneg double %theta
  store i2 %8, i2* %5
  store double %9, double* %6
  store %Qubit* %qubit, %Qubit** %7
  call void @Microsoft__Quantum__Intrinsic__R__ctl(%Array* %__controlQubits__, { i2, double, %Qubit* }* %4)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i64 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %3, i64 -1)
  ret void
}

declare %Result* @Microsoft__Quantum__Intrinsic__Measure__body(%Array*, %Array*)

declare %Array* @__quantum__rt__array_create_1d(i32, i64)

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)

declare void @__quantum__rt__array_update_reference_count(%Array*, i64)

declare void @Microsoft__Quantum__Intrinsic__X__ctl(%Array*, %Qubit*)

define void @Microsoft__Quantum__Intrinsic__CNOT__ctl(%Array* %__controlQubits__, { %Qubit*, %Qubit* }* %0) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i64 1)
  %1 = getelementptr { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i64 0, i32 0
  %control = load %Qubit*, %Qubit** %1
  %2 = getelementptr { %Qubit*, %Qubit* }, { %Qubit*, %Qubit* }* %0, i64 0, i32 1
  %target = load %Qubit*, %Qubit** %2
  %3 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %4 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %3, i64 0)
  %5 = bitcast i8* %4 to %Qubit**
  store %Qubit* %control, %Qubit** %5
  %6 = call %Array* @__quantum__rt__array_concatenate(%Array* %__controlQubits__, %Array* %3)
  call void @Microsoft__Quantum__Intrinsic__X__ctl(%Array* %6, %Qubit* %target)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i64 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %3, i64 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %6, i64 -1)
  ret void
}

declare %Array* @__quantum__rt__array_concatenate(%Array*, %Array*)

define %class.RESULT* @teleport_qir__HelloQ() #0 {
entry:
  %0 = call %Result* @teleport_qir__HelloQ__body()
  %1 = bitcast %Result* %0 to %class.RESULT*
  ret %class.RESULT* %1
}

attributes #0 = { "EntryPoint" }
