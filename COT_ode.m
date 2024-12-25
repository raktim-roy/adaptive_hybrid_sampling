clc;
clear all;
hold on;
parameters;
x_on_initial = [0 0];

% y_on = zeros(41,1);
% y_off = zeros(41,1); 

for n=0:2000
    [t_on x_on] = ode45(@ON_state,[(n*T) ((n*T)+T_on)],x_on_initial);
    figure(1),plot(t_on,x_on(:,1),'b');
    hold on;
    figure(2),plot(t_on,x_on(:,2),'b');
    hold on;
    t_last = length(t_on);
    x_off_initial = x_on(t_last,:);
    hold on;
    
%     y_on = (R0/(R0+r_C))*x_on(:,2);
%     figure(3),plot(t_on,y_on,'b')
%     hold on;
    
    [t_off,x_off] = ode45(@OFF_state,[((n*T)+T_on) ((n+1)*T)],x_off_initial);
    figure(1),plot(t_off,x_off(:,1),'b');
    hold on;
    figure(2),plot( t_off,x_off(:,2),'b');
    hold on;
    t_last = length(t_off);
    x_on_initial = x_off(t_last,:);
    
%     y_off = ((R0*r_C)/(R0+r_C))*x_off(:,1) + (R0/(R0+r_C))*x_off(:,2);
%     figure(3),plot(t_off,y_off,'b')
%     hold on;    
end