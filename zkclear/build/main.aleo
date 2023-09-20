program zkclear.aleo;

record addrToBeChecked:
    owner as address.private;
    is_allowed as boolean.private;


function main:
    input r0 as u32.public;
    input r1 as u32.private;
    add r0 r1 into r2;
    output r2 as u32.private;
