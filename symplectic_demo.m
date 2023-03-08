function symplectic_demo()
method = 4;
rad = 0.1;
cat = rad*load('cat.txt');
ncat = length(cat);
y(1:2,:) = cat';
y(1,:) = y(1,:) + 1;
h = pi/16;
Tmax = 100*pi;
nt = floor(Tmax/h);
figure(1); clf
clf; hold on; grid;
xlabel('p','FontSize',24);
ylabel('q','FontSize',24);
set(gca,'DataAspectRatio',[1 1 1]);
plot(y(1,:),y(2,:),'r','Linewidth',2);
jplot = 10;
 for j = 1 : nt
     i = j*2;
     ind = [i - 1 : i];
    if method == 1 % Forward Euler
        A = [1, -h; h, 1];
    end
    if method == 2 % Backward Euler
        A = [1, -h; h, 1]/(1 + h^2);
    end
    if method == 3 % Runge-Trapezoidal
        aux = h^2/2;
        A = [1 - aux, -h; h, 1 - aux];
    end
    if method == 4 % Implicit Midpoint Rule
        aux = h^2/4;
        A = [1 - aux, -h; h, 1 - aux]/(1 + aux);
    end
    y(ind + 2,:) = A*y(ind,:);
    if mod(j,jplot) == 0
        plot(y(2*j + 1,:),y(2*j + 2,:),'k','Linewidth',2);
        drawnow;
    end    
 end
