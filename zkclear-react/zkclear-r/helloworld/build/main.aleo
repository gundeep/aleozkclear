program helloworld.aleo;



function main:
    input r0 as address.public;
    input r1 as address.public;
    input r2 as address.public;
    input r3 as address.private;
    assert.eq r0 r1;
    output false as boolean.private;
