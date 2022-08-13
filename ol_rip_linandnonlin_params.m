clc
clear all;
close all;
m=0.125;
L=0.1675;
r=0.215;
g=9.81;
rm=2.6;
km=0.0076;
kt=0.0076;
kg=70;
Beq=0.004;
nm=0.87;
ng=0.85;
vm=6;
J=0.023;
a=J+(m*r*r);
b=m*L*r;
c=(4/3)*m*L*L;
d=m*g*L;
e=Beq+(nm*ng*kt*kg*kg*km)/rm;
f=(nm*ng*kt*kg)/rm;
sim("ol_rip_linandnonlin.slx");
t=ans.tout
x1=ans.linrip.data(:,1)
x2=ans.linrip.data(:,2)
z1=ans.nonlinrip.data(:,1)
z2=ans.nonlinrip.data(:,2)
subplot(211)
plot(t,x1)
hold on;
plot(t,x2)
xlabel('time')
ylabel('theta')
legend("linear","nonlinear")
subplot(212)
plot(t,z1)
hold on;
plot(t,z2)
xlabel('time')
ylabel('alpha')
legend("linear","nonlinear")