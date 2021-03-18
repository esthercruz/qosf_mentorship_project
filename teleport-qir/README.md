# Building the Teleport QIR sample

## Ways to build and run this QIR sample

- **Docker**: The docker image in `../.devcontainer` should be updated and work with the version of the QKD specified in the project file. It is a basic Ubuntu container that then installs the .NET SDK and `libgomp1`.
- **Local**: If your machine already has a valid .NET 3.1 SDK install, you should be good to use this directly! Just run `dotnet run` in this directory.

---
---
## OLD: Steps to compile Q# -> QIR
_last updated 8 Feb 2021_

1. Check out the latest Q# compiler source from the [QIR feature branch](https://github.com/microsoft/qsharp-compiler/tree/feature/qir)
2. Go to the compiler directory on your machine and run `dotnet build .\QsCompiler.sln` to build a version of the compiler that will have QIR support.

    **NOTE:** You will get an output probably similar to this, where the compiler builds just fine, but there is a failure somewhere in building one of the extensions for VS and that's ok, since it is after the compiler:

    ```
    Microsoft (R) Build Engine version 16.8.3+39993bd9d for .NET
    Copyright (C) Microsoft Corporation. All rights reserved.

    Determining projects to restore...
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Optimizations\Optimizations.fsproj (in 235 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Simulation\Example\Example.csproj (in 202 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\DataStructures\DataStructures.fsproj (in 235 ms).  Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library1\Library1.csproj (in 235 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Core\Core.fsproj (in 235 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library2\Library2.csproj (in 3 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\BondSchemas\BondSchemas.csproj (in 13 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TextProcessor\TextProcessor.fsproj (in 492 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\Documentation\DocumentationParser\DocumentationParser.csproj (in 492 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\SyntaxProcessor\SyntaxProcessor.fsproj (in 237 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\QirGeneration\QirGeneration.csproj (in 240 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Transformations\Transformations.csproj (in 492 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\CompilationManager\CompilationManager.csproj (in 505 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Compiler\Compiler.csproj (in 506 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\Documentation\DocumentationGenerator\DocumentationGenerator.csproj (in 505 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Simulation\Target\Simulation.csproj (in 263 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\CommandLineTool\CommandLineTool.csproj (in 518 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\Documentation\Tests.DocGenerator\Tests.DocGenerator.csproj (in 538 ms).
    Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Tests.Compiler\Tests.Compiler.fsproj (in 557 ms).  Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\LanguageServer\LanguageServer.csproj (in 561 ms).  Restored C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Tests.LanguageServer\Tests.LanguageServer.csproj (in 576 ms).
    1 of 22 projects are up-to-date for restore.
    Simulation -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Simulation\Target\bin\Debug\netstandard2.1\Simulation.dll
    DataStructures -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\DataStructures\bin\Debug\netstandard2.1\Microsoft.Quantum.QsDataStructures.dll
    BondSchemas -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\BondSchemas\bin\Debug\netstandard2.1\Microsoft.Quantum.BondSchemas.dll
    TextProcessor -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TextProcessor\bin\Debug\netstandard2.1\Microsoft.Quantum.QsTextProcessor.dll
    Core -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Core\bin\Debug\netstandard2.1\Microsoft.Quantum.QsCore.dll
    Optimizations -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Optimizations\bin\Debug\netstandard2.1\Microsoft.Quantum.QsOptimizations.dll
    Transformations -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Transformations\bin\Debug\netstandard2.1\Microsoft.Quantum.QsTransformations.dll
    DocumentationParser -> C:\Users\skais\git\microsoft\qsharp-compiler\src\Documentation\DocumentationParser\bin\Debug\netstandard2.1\Microsoft.Quantum.QsDocumentationParser.dll
    QirGeneration -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\QirGeneration\bin\Debug\netstandard2.1\Microsoft.Quantum.QirGeneration.dll
    Tests.DocGenerator -> C:\Users\skais\git\microsoft\qsharp-compiler\src\Documentation\Tests.DocGenerator\bin\Debug\netcoreapp3.1\Tests.Microsoft.Quantum.QsDocumentationParser.dll
    SyntaxProcessor -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\SyntaxProcessor\bin\Debug\netstandard2.1\Microsoft.Quantum.QsSyntaxProcessor.dll
    CompilationManager -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\CompilationManager\bin\Debug\netstandard2.1\Microsoft.Quantum.QsCompilationManager.dll
    C:\Program Files\dotnet\sdk\5.0.102\Microsoft.Common.CurrentVersion.targets(2123,5): warning MSB3277: Found conflicts between different versions of "Microsoft.Win32.Registry" that could not be resolved.  These reference conflicts are listed in the build log when log verbosity is set to detailed. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\LanguageServer\LanguageServer.csproj]
    C:\Program Files\dotnet\sdk\5.0.102\Microsoft.Common.CurrentVersion.targets(2123,5): warning MSB3277: Found conflicts between different versions of "System.Security.Permissions" that could not be resolved.  These reference conflicts are listed in the build log when log verbosity is set to detailed. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\LanguageServer\LanguageServer.csproj]
    C:\Program Files\dotnet\sdk\5.0.102\Microsoft.Common.CurrentVersion.targets(2123,5): warning MSB3277: Found conflicts between different versions of "System.Windows.Extensions" that could not be resolved.  These reference conflicts are listed in the build log when log verbosity is set to detailed. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\LanguageServer\LanguageServer.csproj]
    C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\LanguageServer\EditorState.cs(173,21): error CS0103: The name 'TemporaryProject' does not exist in the current context [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\LanguageServer\LanguageServer.csproj]
    Compiler -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Compiler\bin\Debug\netstandard2.1\Microsoft.Quantum.QsCompiler.dll
    DocumentationGenerator -> C:\Users\skais\git\microsoft\qsharp-compiler\src\Documentation\DocumentationGenerator\bin\Debug\netstandard2.1\Microsoft.Quantum.DocumentationGenerator.dll
    CommandLineTool -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\CommandLineTool\bin\Debug\netcoreapp3.1\qsc.dll
    Library2 -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library2\bin\Debug\netcoreapp3.1\Library2.dll
    Library1 -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library1\bin\Debug\netcoreapp3.1\Library1.dll
    : info: Compiling with command line arguments
        ResponseFiles:
        OutputFolder: bin\Debug\netcoreapp3.1\
        ProjectName: Library2
        EmitDll: True
        QirOutputFolder: (null)
        PerfOutputFolder: (null)
        TrimLevel: 1
        Plugins:
        TargetSpecificDecompositions:
        ExposeReferencesViaTestNames: False
        AdditionalAssemblyProperties:
        RuntimeCapabilityName: (null)
        MakeExecutable: False
        Verbosity: Detailed
        OutputFormat: MsBuild
        Input: Library.qs
        CodeSnippet: (null)
        WithinFunction: False
        References: C:\Users\skais\.nuget\packages\microsoft.quantum.qsharp.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.QSharp.Core.dll;C:\Users\skais\.nuget\packages\microsoft.quantum.runtime.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Runtime.Core.dll;C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulation.Common.dll;C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulation.QCTraceSimulatorRuntime.dll;C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulators.dll;C:\Users\skais\.nuget\packages\newtonsoft.json\12.0.3\lib\netstandard2.0\Newtonsoft.Json.dll
        NoWarn: System.Int32[]
        PackageLoadFallbackFolders:
    : info: Loaded rewrite steps that are executing as part of the compilation process
        (none)
    : info: Compiling source files
        C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library2\Library.qs
    : info: Compiling with command line arguments
        ResponseFiles:
        OutputFolder: bin\Debug\netcoreapp3.1\
        ProjectName: Library1
        EmitDll: True
        QirOutputFolder: (null)
        PerfOutputFolder: (null)
        TrimLevel: 1
        Plugins:
        TargetSpecificDecompositions:
        ExposeReferencesViaTestNames: False
        AdditionalAssemblyProperties:
        RuntimeCapabilityName: (null)
        MakeExecutable: False
        Verbosity: Detailed
        OutputFormat: MsBuild
        Input: AccessModifiers.qs;Capability.qs;Logging.qs;Types.qs
        CodeSnippet: (null)
        WithinFunction: False
        References: C:\Users\skais\.nuget\packages\microsoft.quantum.qsharp.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.QSharp.Core.dll;C:\Users\skais\.nuget\packages\microsoft.quantum.runtime.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Runtime.Core.dll;C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulation.Common.dll;C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulation.QCTraceSimulatorRuntime.dll;C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulators.dll;C:\Users\skais\.nuget\packages\newtonsoft.json\12.0.3\lib\netstandard2.0\Newtonsoft.Json.dll
        NoWarn: System.Int32[]
        PackageLoadFallbackFolders:
    : info: Loaded rewrite steps that are executing as part of the compilation process
        (none)
    : info: Compiling source files
        C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library1\Types.qs
        C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library1\AccessModifiers.qs
        C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library1\Capability.qs
        C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library1\Logging.qs
    : info: Compiling with referenced assemblies
        C:\Users\skais\.nuget\packages\microsoft.quantum.qsharp.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.QSharp.Core.dll
        C:\Users\skais\.nuget\packages\microsoft.quantum.runtime.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Runtime.Core.dll
        C:\Users\skais\.nuget\packages\newtonsoft.json\12.0.3\lib\netstandard2.0\Newtonsoft.Json.dll
        C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulation.QCTraceSimulatorRuntime.dll
        C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulators.dll
        C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulation.Common.dll
    : info: Compiling with referenced assemblies
        C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulators.dll
        C:\Users\skais\.nuget\packages\microsoft.quantum.qsharp.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.QSharp.Core.dll
        C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulation.Common.dll
        C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulation.QCTraceSimulatorRuntime.dll
        C:\Users\skais\.nuget\packages\microsoft.quantum.runtime.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Runtime.Core.dll
        C:\Users\skais\.nuget\packages\newtonsoft.json\12.0.3\lib\netstandard2.0\Newtonsoft.Json.dll
    EXEC : warning QS7010: The reference to "C:\Users\skais\.nuget\packages\microsoft.quantum.qsharp.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.QSharp.Core.dll" could not be included in the generated dll. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library2\Library2.csproj]
    EXEC : warning QS7010: The reference to "C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulators.dll" could not be included in the generated dll. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library2\Library2.csproj]
    EXEC : warning QS7010: The reference to "C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulators.dll" could not be included in the generated dll. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library1\Library1.csproj]
    EXEC : warning QS7010: The reference to "C:\Users\skais\.nuget\packages\microsoft.quantum.qsharp.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.QSharp.Core.dll" could not be included in the generated dll. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library1\Library1.csproj]

    ____________________________________________

    Q#: Success! (0 errors, 2 warnings)


    ____________________________________________

    Q#: Success! (0 errors, 2 warnings)

    : info: Compiling with command line arguments
        ResponseFiles: generated/config/qsc.rsp
        OutputFolder: (null)
        ProjectName: (null)
        EmitDll: False
        QirOutputFolder: (null)
        PerfOutputFolder: (null)
        TrimLevel: 1
        Plugins:
        TargetSpecificDecompositions:
        ExposeReferencesViaTestNames: False
        AdditionalAssemblyProperties:
        RuntimeCapabilityName: (null)
        MakeExecutable: False
        Verbosity: Detailed
        OutputFormat: MsBuild
        Input:
        CodeSnippet: (null)
        WithinFunction: False
        References:
        NoWarn: System.Int32[]
        PackageLoadFallbackFolders:
    : info: Loaded rewrite steps that are executing as part of the compilation process
        CSharpGeneration (file:///C:/Users/skais/git/microsoft/qsharp-compiler/src/QsCompiler/TestTargets/Simulation/Target/bin/Debug/netstandard2.1/Simulation.dll)
    : info: Compiling source files
        C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Tests.Compiler\TestCases\ExecutionTests\Packaging.qs
        C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Tests.Compiler\TestCases\ExecutionTests\LoggingBasedTests.qs
        C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Simulation\Example\Main.qs
    : info: Compiling with referenced assemblies
        C:\Users\skais\.nuget\packages\microsoft.quantum.runtime.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Runtime.Core.dll
        C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulators.dll
        C:\Users\skais\.nuget\packages\microsoft.quantum.qsharp.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.QSharp.Core.dll
        C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library1\bin\Debug\netcoreapp3.1\Library1.dll
        C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library2\bin\Debug\netcoreapp3.1\Library2.dll
        C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulation.QCTraceSimulatorRuntime.dll
        C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulation.Common.dll
    EXEC : warning QS6202: The project is an executable Q# project but no entry point has been found. The project should be a library, and any C# driver code should be defined in a separate project. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Simulation\Example\Example.csproj]
    : info QS8001: Invokation of the Q# compiler extension for C# generation to demonstrate execution on the simulation framework.

    ____________________________________________

    Q#: Success! (0 errors, 1 warning)

    Example -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Simulation\Example\bin\Debug\netcoreapp3.1\Example.dll
    Tests.Compiler -> C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\Tests.Compiler\bin\Debug\netcoreapp3.1\Tests.Microsoft.Quantum.QsCompiler.dll

    Build FAILED.

    C:\Program Files\dotnet\sdk\5.0.102\Microsoft.Common.CurrentVersion.targets(2123,5): warning MSB3277: Found conflicts between different versions of "Microsoft.Win32.Registry" that could not be resolved.  These reference conflicts are listed in the build log when log verbosity is set to detailed. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\LanguageServer\LanguageServer.csproj]
    C:\Program Files\dotnet\sdk\5.0.102\Microsoft.Common.CurrentVersion.targets(2123,5): warning MSB3277: Found conflicts between different versions of "System.Security.Permissions" that could not be resolved.  These reference conflicts are listed in the build log when log verbosity is set to detailed. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\LanguageServer\LanguageServer.csproj]
    C:\Program Files\dotnet\sdk\5.0.102\Microsoft.Common.CurrentVersion.targets(2123,5): warning MSB3277: Found conflicts between different versions of "System.Windows.Extensions" that could not be resolved.  These reference conflicts are listed in the build log when log verbosity is set to detailed. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\LanguageServer\LanguageServer.csproj]
    EXEC : warning QS7010: The reference to "C:\Users\skais\.nuget\packages\microsoft.quantum.qsharp.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.QSharp.Core.dll" could not be included in the generated dll. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library2\Library2.csproj]
    EXEC : warning QS7010: The reference to "C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulators.dll" could not be included in the generated dll. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library2\Library2.csproj]
    EXEC : warning QS7010: The reference to "C:\Users\skais\.nuget\packages\microsoft.quantum.simulators\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.Simulators.dll" could not be included in the generated dll. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library1\Library1.csproj]
    EXEC : warning QS7010: The reference to "C:\Users\skais\.nuget\packages\microsoft.quantum.qsharp.core\0.14.201219726-alpha\lib\netstandard2.1\Microsoft.Quantum.QSharp.Core.dll" could not be included in the generated dll. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Libraries\Library1\Library1.csproj]
    EXEC : warning QS6202: The project is an executable Q# project but no entry point has been found. The project should be a library, and any C# driver code should be defined in a separate project. [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\TestTargets\Simulation\Example\Example.csproj]
    C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\LanguageServer\EditorState.cs(173,21): error CS0103: The name 'TemporaryProject' does not exist in the current context [C:\Users\skais\git\microsoft\qsharp-compiler\src\QsCompiler\LanguageServer\LanguageServer.csproj]
        8 Warning(s)
        1 Error(s)

    Time Elapsed 00:00:37.82
    ```
3. Once you have done that you need to find the path to the newly built compiler, which should look like the following, just replace the first part with the path on your machine to the compiler repo.

    `{PATH TO qsharp-compiler project}\src\QsCompiler\CommandLineTool\bin\Debug\netcoreapp3.1\qsc.dll`

    Once you have this path, add it to the `teleport-qir.csproj` file where you see the field `<QscExe>` (replacing the `C:\Users\skais\git\microsoft\...` you see which was the path on my machine)
4. Now, in the `teleport-qir` directory you should be able to run 
    `dotnet build` and it should generate the following `*.ll` file in the `QIR` folder it will make:

    **NOTE: it will not generate a log file for some reason, but at least we have the QIR file we need to then test running it!

    ```
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
    ```


## Additional info

### .NET versions

```ps
> dotnet --info
.NET SDK (reflecting any global.json):
 Version:   5.0.102
 Commit:    71365b4d42

Runtime Environment:
 OS Name:     Windows
 OS Version:  10.0.18363
 OS Platform: Windows
 RID:         win10-x64
 Base Path:   C:\Program Files\dotnet\sdk\5.0.102\

Host (useful for support):
  Version: 5.0.2
  Commit:  cb5f173b96

.NET SDKs installed:
  3.1.101 [C:\Program Files\dotnet\sdk]
  3.1.402 [C:\Program Files\dotnet\sdk]
  3.1.405 [C:\Program Files\dotnet\sdk]
  5.0.102 [C:\Program Files\dotnet\sdk]

.NET runtimes installed:
  Microsoft.AspNetCore.All 2.1.22 [C:\Program Files\dotnet\shared\Microsoft.AspNetCore.All]
  Microsoft.AspNetCore.App 2.1.22 [C:\Program Files\dotnet\shared\Microsoft.AspNetCore.App]
  Microsoft.AspNetCore.App 3.1.1 [C:\Program Files\dotnet\shared\Microsoft.AspNetCore.App]
  Microsoft.AspNetCore.App 3.1.8 [C:\Program Files\dotnet\shared\Microsoft.AspNetCore.App]
  Microsoft.AspNetCore.App 3.1.11 [C:\Program Files\dotnet\shared\Microsoft.AspNetCore.App]
  Microsoft.AspNetCore.App 5.0.2 [C:\Program Files\dotnet\shared\Microsoft.AspNetCore.App]
  Microsoft.NETCore.App 2.1.22 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
  Microsoft.NETCore.App 3.1.1 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
  Microsoft.NETCore.App 3.1.8 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
  Microsoft.NETCore.App 3.1.11 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
  Microsoft.NETCore.App 5.0.2 [C:\Program Files\dotnet\shared\Microsoft.NETCore.App]
  Microsoft.WindowsDesktop.App 3.1.1 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
  Microsoft.WindowsDesktop.App 3.1.8 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
  Microsoft.WindowsDesktop.App 3.1.11 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]
  Microsoft.WindowsDesktop.App 5.0.2 [C:\Program Files\dotnet\shared\Microsoft.WindowsDesktop.App]

To install additional .NET runtimes or SDKs:
  https://aka.ms/dotnet-download
```

### Q# 
Template project generated from templates `dotnet new -i Microsoft.Quantum.ProjectTemplates::0.15.2101125897`. Not needed to reproduce, but just documenting for now.