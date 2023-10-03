program zkclear.aleo;



function main:
    input r0 as address.public;
    input r1 as address.public;
    input r2 as address.public;
    input r3 as address.private;
    is.eq r0 r3 into r4;
    output r4 as boolean.private;
