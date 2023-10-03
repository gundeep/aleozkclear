program helloworld.aleo;



function main:
    input r0 as address.public;
    input r1 as address.public;
    input r2 as address.public;
    input r3 as address.private;
    is.eq r0 r3 into r4;
    is.eq r1 r3 into r5;
    or r4 r5 into r6;
    is.eq r2 r3 into r7;
    or r6 r7 into r8;
    output r8 as boolean.private;
