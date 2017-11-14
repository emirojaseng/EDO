clear all; close all; clc;fprintf("3.4 Ecuaciones stiff : explıcito vs implicito")fprintf('\n')fprintf("1.- Aplicar Euler implicito al PVI")fprintf('\n')%Genera [Tn Wn] con el metodo de Euler implicitoTn=0:0.5:20; %Crea el espaciado con h=.5Wn=zeros(1,size(Tn,2));Wn(1)=0.5; %condicion inicialfor i=1:size(Tn,2)-1    Wn(i+1)=(1+(1+(8/3)*Wn(i))^0.5)/2; %esquemaendfprintf("y(20)= "); display(Wn(size(Wn,2)));plot(Tn,Wn);title("implicito")waitforbuttonpressfprintf('\n')%Pregunta 2fprintf("2.- Euler explicito")f=@(t,y) 5*y-3*y^2;y0=1/2;I=[0,20];fprintf('\n')fprintf("h=1/6");[Tn,Wn]=mTrapecio(f,y0,I,1/6);plot(Tn,Wn);title("h=1/6")waitforbuttonpressfprintf('\n')fprintf("h=1/5");[Tn,Wn]=mEuler(f,y0,I,1/5);plot(Tn,Wn);title("h=1/5")waitforbuttonpressfprintf('\n')fprintf("h=1/4");[Tn,Wn]=mEuler(f,y0,I,1/4);plot(Tn,Wn);title("h=1/4")waitforbuttonpressfprintf('\n')fprintf("h=1/2");[Tn,Wn]=mEuler(f,y0,I,1/2);plot(Tn,Wn);title("h=1/2")waitforbuttonpress