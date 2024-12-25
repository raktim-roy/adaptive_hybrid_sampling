function x_dot = OFF_state(t,x)

    x_dot = zeros(2,1);
    parameters;
    
    A_11 = -((r_L+((R0*r_C)/(R0+r_C)))/L);
    A_12 = -((R0/(R0+r_C))/L);
    A_21 = ((R0/(R0+r_C))/C);
    A_22 = -((R0/(R0+r_C))/C);
    
    B_11 = 0;
    B_21 = 0;
    
    x_dot(1) = A_11*x(1) + A_12*x(2) + B_11*V_in;
    x_dot(2) = A_21*x(1) + A_22*x(2) + B_21*V_in;
end