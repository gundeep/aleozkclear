program aleozkclear01.aleo;

struct Addrlist:
    a0 as address;
    a1 as address;
    a2 as address;
    a3 as address;


function main:
    input r0 as u64.public;
    input r1 as address.private;
    cast aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7 aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7 aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7 aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7 into r2 as Addrlist;
    lt r0 1696763811802u64 into r3;
    is.eq r2.a0 r1 into r4;
    is.eq r2.a2 r1 into r5;
    or r4 r5 into r6;
    is.eq r2.a3 r1 into r7;
    or r6 r7 into r8;
    is.eq r2.a3 r1 into r9;
    or r8 r9 into r10;
    not r3 into r11;
    and r11 r10 into r12;
    ternary r12 false true into r13;
    ternary r3 false r13 into r14;
    output r14 as boolean.private;
