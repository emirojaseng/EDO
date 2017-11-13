function [Tn,Wn] = mEuler(f,y0,I,h)
%mEuler Método de Euler explícito
%   resuelve el PVI y'=f(t,y), y(t0)=y0
% donde el vector I=[t0,t0+T] y h es el tamaño del paso

Tn=I(1):h:I(2); %la malla del tiempo
Wn=zeros(1,size(Tn,2)); %preset Wn
Wn(1)=y0; %Condicion inicial
for i=1:size(Tn,2)-1
    Wn(i+1)=paso_Euler(f,Wn(i), Tn(i),h);
end
end

function [w_nuevo]= paso_Euler(f,w_viejo, t_viejo,h)
w_nuevo=w_viejo+h*f(t_viejo,w_viejo);
end
