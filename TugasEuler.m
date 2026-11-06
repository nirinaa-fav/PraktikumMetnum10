clc;
clear;

% Soal: dy/dx = (4x^3 - 2x + 1)/(2 + y),  y(0) = 1,  cari y(2)

f = @(x,y) (4*x^3 - 2*x + 1)/(2 + y);

% Solusi eksak: y = -2 + sqrt(9 + 2(x^4 - x^2 + x))
y_exact = @(x) -2 + sqrt(9 + 2*(x^4 - x^2 + x));

% Kondisi awal
x = 0;
y = 1;
x_target = 2;
N = 15;
h = (x_target - x)/N;

fprintf('     Tabel Iterasi Metode Euler\n\n');
fprintf('%-4s%-10s%-12s%-14s%-12s\n','i','xi','yi','f(xi,yi)','yi+1');
fprintf('%s\n', repmat('.',1,52));

for i = 0:N-1
    fi = f(x,y);
    y_next = y + h*fi;
    fprintf('%-4d%-10.4f%-12.4f%-14.4f%-12.4f\n', i, x, y, fi, y_next);
    x = x + h;
    y = y_next;
end

y_euler = y;
y_eksak = y_exact(x_target);
galat_absolut = abs(y_eksak - y_euler);
galat_relatif = galat_absolut / abs(y_eksak) * 100;

fprintf('\n       Perbandingan Solusi Eksak\n');
fprintf('Solusi eksak y(2) = -2 + sqrt(37) = %.4f\n', y_eksak);
fprintf('Metode Euler y(2)                 = %.4f\n', y_euler);
fprintf('Galat absolut                     = %.4f\n', galat_absolut);
fprintf('Galat relatif                     = %.4f%%\n', galat_relatif);
