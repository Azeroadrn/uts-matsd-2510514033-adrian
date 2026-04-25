% =======================================================================
% UTS Matematika Sains Data Semester Genap 2025/2026
% Soal 4 Bilangan Kompleks dan Fasor
%
% Nama : Daffa
% NIM  : 2510514033
% Parameter: N=33, a=3, b=3, K=7, theta0=105, alpha=0.004
% Tanggal: 2026-04-26
% =======================================================================
clc; clear; close all;

% === 4.b Verifikasi Operasi Aljabar ===
z1 = complex(5, 4);
z2 = complex(4, -5);

disp('--- Verifikasi Operasi Aljabar ---');
z_jumlah = z1 + z2
z_kali = z1 * z2
z_bagi = z1 / z2
jarak_modulus = abs(z1 - z2)

% === 4.e Plot Akar Kubik ===
r = 8; theta0 = 105;
sudut_w0 = deg2rad((theta0 + 0*360)/3);
sudut_w1 = deg2rad((theta0 + 1*360)/3);
sudut_w2 = deg2rad((theta0 + 2*360)/3);

w0 = r^(1/3) * exp(1i * sudut_w0);
w1 = r^(1/3) * exp(1i * sudut_w1);
w2 = r^(1/3) * exp(1i * sudut_w2);

figure('Name', 'Plot Akar Kubik');
compass([w0, w1, w2], 'b-');
title('Tiga Akar Kubik w = 8 cis(105^\circ) (NIM: 2510514033)');
hold on;
plot([real(w0), real(w1), real(w2), real(w0)], ...
     [imag(w0), imag(w1), imag(w2), imag(w0)], 'r--', 'LineWidth', 1.5);
hold off;

