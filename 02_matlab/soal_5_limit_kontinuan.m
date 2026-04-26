% =======================================================================
% UTS Matematika Sains Data Semester Genap 2025/2026
% Soal 5 Konvergensi CLV dan Kekontinuan Biaya
%
% Nama : Daffa
% NIM  : 2510514033
% Parameter: N=33, a=3, b=3, K=7, theta0=105, alpha=0.004
% Tanggal: 2026-04-26
% =======================================================================
clc; clear; close all;

% Parameter personalisasi
a = 3; b = 3; K = 7;
syms x n

% === Soal 5.1 Verifikasi Limit Aljabar ===
disp('--- Verifikasi 5.1 Limit Aljabar ---');
L1 = limit((x^2 - K^2)/(x - K), x, K);
L2 = limit((sqrt(x + (K+1)^2) - (K+1))/x, x, 0);
L3 = limit(((a+2)*x^3 + b*x + 7)/(x^3 - x + K), x, inf);

fprintf('L1 = %s\n', char(L1));
fprintf('L2 = %s\n', char(L2));
fprintf('L3 = %s\n\n', char(L3));

% === Soal 5.4 Kekontinuan Fungsi dan Plot ===
% Parameter hasil perhitungan manual
p = 14; 
q = -7;

% Membuat figure untuk plot piecewise C(x)
figure('Name', 'Plot Fungsi Biaya C(x) Kontinu');
hold on;

% Plot potongan kiri (x < K)
f_kiri = @(v) (v.^2 - K^2)./(v - K);
% Menggunakan interval hampir sampai K agar tidak menghasilkan NaN division by zero saat di plot
fplot(f_kiri, [0, K-0.001], 'b-', 'LineWidth', 2, 'DisplayName', 'C(x) x < K');

% Plot potongan kanan (x > K)
f_kanan = @(v) a*v + q;
fplot(f_kanan, [K+0.001, 2*K], 'b-', 'LineWidth', 2, 'DisplayName', 'C(x) x > K');

% Plot titik penyambung C(K) = p
plot(K, p, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8, 'DisplayName', 'Titik Kontinu (K, p)');

% Garis vertikal tipis menyorot sambungan
xline(K, 'k:', 'LineWidth', 1.5, 'DisplayName', 'Batas x = K');

% Format dan Label
title('Fungsi Biaya Distribusi Piecewise yang Kontinu (NIM: 2510514033)');
xlabel('Volume (x)');
ylabel('Biaya Distribusi C(x)');
grid on;
legend('Location', 'northwest');
hold off;

