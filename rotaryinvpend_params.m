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
J=0.0023;
a=J+(m*r*r);
b=m*L*r;
c=(4/3)*m*L*L;
d=m*g*L;
e=Beq+(nm*ng*kt*kg*kg*km)/rm;
f=(nm*ng*kt*kg)/rm;
g=a*c-b*b
theta_init=0;
alpha_init=0;

A=[[0 0 1 0];[0 0 0 1];[0 b*d/g -e*c/g 0];[0 a*d/g -b*e/g 0]];
B=[0;0;f*c/g;f*b/g];

p=[1 21 340 2700 10000];
P=roots(p);
K=acker(A,B,P);
k1=-K(1);
k2=-K(2);
k3=-K(3);
k4=-K(4);

Q=[6 0 0 0; 0 1 0 0;0 0 1 0;0 0 0 0 ]
R=1

P= ctrb(A,B);
%M= obsv(A,C);
[k,z,e]=lqr(A,B,Q,R,0)
% k1=-k(1);
% k2=-k(2);
% k3=-k(3);
% k4=-k(4);
sim("rotaryinvpend.slx");
t=ans.tout;
z1=ans.nonlinrip_sf.data(:,1);
z2=ans.nonlinrip_sf.data(:,2);
subplot(211);
plot(t,z1);
xlabel('time');
ylabel('theta');
subplot(212);
plot(t,z2);
xlabel('time');
ylabel('alpha');