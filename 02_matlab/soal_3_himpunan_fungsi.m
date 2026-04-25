% =======================================================================
% UTS Matematika Sains Data Semester Genap 2025/2026
% Soal 3 Segmentasi Pelanggan dan Komposisi Fungsi Harga
%
% Nama : Daffa
% NIM  : 2510514033
% Parameter: N=33, a=3, b=3, K=7, theta0=105, alpha=0.004
% Tanggal: 2026-04-25
% =======================================================================
clc; clear; close all;

% === 3.b Verifikasi Operasi Himpunan ===
U = 33:53;
A = [33, 35, 37, 40, 43, 46, 48];
B = [36, 38, 40, 43, 45, 51];
C = [34, 40, 43, 44, 50, 53];

disp('--- Hasil Operasi Himpunan ---');
A_u_B_u_C = union(union(A, B), C)
A_i_B_i_C = intersect(intersect(A, B), C)
A_u_B_i_C_komp = intersect(union(A, B), setdiff(U, C))
A_symdiff_B = setxor(A, B)

% === 3.d Verifikasi Invers Fungsi ===
disp('--- Verifikasi Invers Fungsi ---');
syms x
pendapatan = 706;
volume = solve(7*x + 6 == pendapatan, x);
fprintf('Volume pembelian untuk pendapatan %d ribu adalah: %d unit\n', pendapatan, double(volume));