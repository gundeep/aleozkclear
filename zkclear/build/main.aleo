program zkclear.aleo;

record addrToBeChecked:
    owner as address.private;
    is_allowed as boolean.private;


function main:
    input r0 as address.public;
    input r1 as address.private;
    is.eq r0 r1 into r2;
    ternary r2 true false into r3;
    output r3 as boolean.private;
