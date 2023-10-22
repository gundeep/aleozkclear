program aleozkclear01.aleo;



function main:
    input r0 as address.public;
    input r1 as address.public;
    input r2 as address.public;
    input r3 as u64.public;
    input r4 as address.private;
    lt r3 1696763811802u64 into r5;
    is.eq r0 r4 into r6;
    is.eq r1 r4 into r7;
    or r6 r7 into r8;
    is.eq r2 r4 into r9;
    or r8 r9 into r10;
    not r5 into r11;
    and r11 r10 into r12;
    ternary r12 false true into r13;
    ternary r5 false r13 into r14;
    output r14 as boolean.private;
