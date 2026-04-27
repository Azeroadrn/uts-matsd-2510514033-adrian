% =======================================================================
% UTS Matematika Sains Data Semester Genap 2025/2026
% Soal 6 Optimasi Harga Produk Via Gradient Descent Manual
%
% Nama : Daffa
% NIM  : 2510514033
% Parameter: N=33, a=3, b=3, K=7, theta0=105, alpha=0.004
% Tanggal: 2026-04-26
% =======================================================================
clc; clear; close all;

% Parameter Personalisasi
a = 3; b = 3; K = 7;
alpha = 0.004;

% Definisi Fungsi dan Turunannya (Anonim)
% pi(x) = -4x^3 + 56x^2 + 100x - 490
pi_func = @(x) -4*x.^3 + 56*x.^2 + 100*x - 490;
dpi_func = @(x) -12*x.^2 + 112*x + 100;

% Parameter Gradient Descent
iter_max = 500;
x0 = 1; % Titik awal
x_opt = 10.1540; % Solusi Analitik Global Optimum

% === 6.e Implementasi Gradient Descent (Normal) ===
x_history = zeros(1, iter_max+1);
pi_history = zeros(1, iter_max+1);

x_history(1) = x0;
pi_history(1) = pi_func(x0);

for k = 1:iter_max
    % Gradient Ascent (karena kita mencari maksimum profit)
    x_history(k+1) = x_history(k) + alpha * dpi_func(x_history(k));
    pi_history(k+1) = pi_func(x_history(k+1));
end

% Plot Konvergensi 1: Kurva Profit vs Iterasi
figure('Name', 'Konvergensi Gradient Descent');
plot(0:iter_max, pi_history, 'b-', 'LineWidth', 2);
title('Grafik Konvergensi Gradient Descent (NIM: 2510514033)');
xlabel('Iterasi (k)');
ylabel('Profit \pi(x)');
grid on;


% Plot Fungsi Asli dengan Titik Evaluasi
figure('Name', 'Lanskap Fungsi Profit');
x_vals = -3:0.1:15;
plot(x_vals, pi_func(x_vals), 'k-', 'LineWidth', 1.5); hold on;
plot(x0, pi_func(x0), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 8, 'DisplayName', 'Titik Awal x_0');
plot(x_history(end), pi_history(end), 'bx', 'MarkerSize', 10, 'LineWidth', 2, 'DisplayName', 'Akhir GD');
plot(x_opt, pi_func(x_opt), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8, 'DisplayName', 'Global Optimum');
title('Titik GD pada Kurva Profit Asli');
xlabel('Harga Produk (x)'); ylabel('Profit \pi(x)');
legend('Location', 'best'); grid on; hold off;

% === 6.f Analisis Sensitivitas (Learning Rate) ===
alpha_besar = 10 * alpha; % 0.04
alpha_kecil = 0.1 * alpha; % 0.0004

pi_history_besar = zeros(1, iter_max+1); pi_history_besar(1) = pi_func(x0);
pi_history_kecil = zeros(1, iter_max+1); pi_history_kecil(1) = pi_func(x0);
x_b = x0; x_k = x0;

for k = 1:iter_max
    % GD dengan Alpha Terlalu Besar
    x_b = x_b + alpha_besar * dpi_func(x_b);
    pi_history_besar(k+1) = pi_func(x_b);
    
    % GD dengan Alpha Terlalu Kecil
    x_k = x_k + alpha_kecil * dpi_func(x_k);
    pi_history_kecil(k+1) = pi_func(x_k);
end

% Plot Ketiga Kurva Konvergensi Bersama
figure('Name', 'Analisis Sensitivitas Learning Rate');
plot(0:iter_max, pi_history, 'b-', 'LineWidth', 2, 'DisplayName', ['Normal (\alpha=', num2str(alpha), ')']); hold on;
plot(0:iter_max, pi_history_besar, 'r--', 'LineWidth', 1.5, 'DisplayName', ['Overshooting (\alpha=', num2str(alpha_besar), ')']);
plot(0:iter_max, pi_history_kecil, 'g-.', 'LineWidth', 1.5, 'DisplayName', ['Lambat (\alpha=', num2str(alpha_kecil), ')']);
title('Sensitivitas Learning Rate terhadap Konvergensi');
xlabel('Iterasi (k)'); ylabel('Profit \pi(x)');
% Membatasi axis-Y agar lonjakan ekstrem tidak merusak visual
ylim([-1000, 2500]); 
legend('Location', 'southEast'); grid on; hold off;

disp('Semua plot Soal 6 telah disimpan. Analisis Fenomena:');
disp('Alpha besar (0.04) menyebabkan fenomena OVERSHOOTING / DIVERGENSI.');
disp('Alpha kecil (0.0004) menyebabkan VANISHING GRADIENT / KONVERGENSI SANGAT LAMBAT.');