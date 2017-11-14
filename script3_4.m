%clear all; close all; clc;
fprintf("3.4 Ecuaciones stiff : explıcito vs implicito")
fprintf('\n')
fprintf("1.- Aplicar Euler implicito al PVI")
fprintf('\n')
%Genera [Tn Wn] con el metodo de Euler implicito
Tn=0:0.5:20; %Crea el espaciado con h=.5
Wn=zeros(1,size(Tn,2));
Wn(1)=0.5; %condicion inicial
for i=1:size(Tn,2)-1
    Wn(i+1)=(1+(1+(8/3)*Wn(i))^0.5)/2; %esquema
end

fprintf("y(20)= "); display(Wn(size(Wn,2)));
plot(Tn,Wn);
title("implicito")
waitforbuttonpress
fprintf('\n')


%Pregunta 2
fprintf("2.- Euler explicito")
f=@(t,y) 5*y-3*y^2;
y0=1/2;
I=[0,20];
fprintf('\n')
fprintf("h=1/6");
[Tn1,Wn1]=mEuler(f,y0,I,1/6);
plot(Tn1,Wn1);
title("h=1/6")
waitforbuttonpress
fprintf('\n')
fprintf("h=1/5");
[Tn2,Wn2]=mEuler(f,y0,I,1/5);
plot(Tn2,Wn2);
title("h=1/5")
waitforbuttonpress
fprintf('\n')
fprintf("h=1/4");
[Tn3,Wn3]=mEuler(f,y0,I,1/4);
plot(Tn3,Wn3);
title("h=1/4")
waitforbuttonpress
fprintf('\n')
fprintf("h=1/2");
[Tn4,Wn4]=mEuler(f,y0,I,1/2);
plot(Tn4,Wn4);
title("h=1/2")
waitforbuttonpress

%Pregunta 3
[Tn5,Wn5]=mRK2_3(f,y0,I,1/10);
plot(Tn5,Wn5);
title("RK2/3 tol=1/10")
waitforbuttonpress
[Tn6,Wn6]=mRK2_3(f,y0,I,1/100);
plot(Tn6,Wn6);
title("RK2/3 tol=1/100")
waitforbuttonpress

fprintf("y(20)= "); display(Wn(size(Wn,2)));
plot(Tn,Wn);
hold
plot(Tn5,Wn5);
title("implicito vs RK2/3 tol=1/10")
waitforbuttonpress
hold off

plot(Tn,Wn)
hold
plot(Tn6,Wn6);
hold
title("implicito vs RK2/3 tol=1/100")
waitforbuttonpress
hold off

plot(Tn1,Wn1)
hold
plot(Tn2,Wn2)
plot(Tn3,Wn3)
plot(Tn5,Wn5);
title("tol=1/10 vs Euler explicito")
waitforbuttonpress
hold off

plot(Tn1,Wn1)
plot(Tn2,Wn2)
plot(Tn3,Wn3)
plot(Tn6,Wn6);
title("tol=1/100 vs Euler explicito")
waitforbuttonpress
hold off


