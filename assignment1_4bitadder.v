module full_add(
    input wire a, 
    input wire b, 
    input wire cin, 
    output wire sum, 
    output wire cout
);
    wire xor1;
    wire and1;
    wire and2;

    assign and1 = a & b;
    assign xor1 = a ^ b;
    assign and2 = xor1 & cin;
    assign sum  = xor1 ^ cin;
    assign cout = and2 | and1;
endmodule

module adder_4bit(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire Cin,
    output wire [3:0] Sum,
    output wire Cout
);
    wire c1, c2, c3;

    full_add col1(A[0], B[0], Cin, Sum[0], c1);
    full_add col2(A[1], B[1], c1,  Sum[1], c2);
    full_add col3(A[2], B[2], c2,  Sum[2], c3);
    full_add col4(A[3], B[3], c3,  Sum[3], Cout);
endmodule
