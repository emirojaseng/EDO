function [Tn,Wn] = mTrapecio(f,y0,I,n)
%mTrapecio Método de Trapecio explícito
%   resuelve el PVI y'=f(t,y), y(t0)=y0
% donde el vector I=[t0,t0+T] y n es el numero de pasos

Tn=linspace(I(1),I(2),n); %la malla del tiempo
Wn=zeros(1,size(Tn,2)); %preset Wn
Wn(1)=y0; %Condicion inicial
for i=1:size(Tn,2)-1
    Wn(i+1)=paso_Trapecio(f,Wn(i), Tn(i), Tn(i+1));
end
end

function [w_nuevo]= paso_Trapecio(f,w_viejo, t_viejo,t_nuevo)
h=t_nuevo-t_viejo;
w_nuevo=w_viejo+h/2*(f(t_viejo,w_viejo)+f(t_nuevo, w_viejo+h*f(t_viejo,w_viejo)));
end
