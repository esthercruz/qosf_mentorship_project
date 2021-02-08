namespace teleport_qir {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    

    @EntryPoint()
    operation HelloQ() : Result {
        use msg = Qubit();
        use here = Qubit();
        use there = Qubit();

        H(here);
        CNOT(here, there);
        CNOT(msg, here);
        H(msg);

        Ry(0.123, msg);

        if M(msg) == One  { Z(there); }
        if M(here) == One { X(there); }

        Ry(-0.123, there);
        return M(there);
    }
}

