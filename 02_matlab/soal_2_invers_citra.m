% =======================================================================
% UTS Matematika Sains Data Semester Genap 2025/2026
% Soal 2 Enkripsi Citra Logo Toko dengan Invers Matriks 3x3
%
% Nama : Daffa
% NIM  : 2510514033
% Parameter: N=33, a=3, b=3, K=7, theta0=105, alpha=0.004
% Tanggal: 2026-04-24
% =======================================================================
clc; clear; close all;

% Parameter personalisasi
N = 33; a = 3; b = 3; K = 7;
theta0 = 105;     % derajat
alpha_lr = 0.004;

% Deklarasi Matriks Kunci A
matriks_A = [a+1,   b,     2;
               1, a+2,     b;
               b,   1,   a+3];

% === Soal 2.d: Verifikasi Invers dengan Loop Nested ===
determinan_A = det(matriks_A);
matriks_kofaktor = zeros(3, 3);

% Nested loop untuk mencari kofaktor tiap elemen
for baris = 1:3
    for kolom = 1:3
        % Matriks minor dibuat dengan menghapus baris i dan kolom j
        minor_sementara = matriks_A;
        minor_sementara(baris, :) = [];
        minor_sementara(:, kolom) = [];
        
        % Perhitungan nilai kofaktor: (-1)^(i+j) * determinan minor
        matriks_kofaktor(baris, kolom) = ((-1)^(baris+kolom)) * det(minor_sementara);
    end
end

% Adjoin adalah transpose dari matriks kofaktor
matriks_adjoin = matriks_kofaktor.'; 
invers_A_manual = (1 / determinan_A) * matriks_adjoin;
invers_A_matlab = inv(matriks_A);

% Menghitung norma Frobenius untuk memastikan selisih < 1e-10
error_frobenius = norm(invers_A_manual - invers_A_matlab, 'fro');

fprintf('--- Verifikasi Soal 2.d ---\n');
disp('Invers Matriks A (Manual dengan Nested Loop):');
disp(invers_A_manual);
fprintf('Norm Error Frobenius: %e\n\n', error_frobenius);

% === Soal 2.f: Visualisasi Enkripsi-Dekripsi Citra ===
% Deklarasi Blok Piksel Asli P
matriks_P = [120,   50+N,   200;
              80,    a+2,  10+N;
            30+N,     90,   170];

% Proses enkripsi E = A * P
matriks_E = matriks_A * matriks_P;

% Memunculkan hasil citra bersandingan (subplot)
figure('Name', 'Visualisasi Citra Logo');

subplot(1, 2, 1);
imshow(matriks_P, []); % Parameter [] menyesuaikan rentang grayscale otomatis
title('Citra Asli (P)');

subplot(1, 2, 2);
imshow(matriks_E, []);
title('Citra Terenkripsi (E)');

% Menyimpan figure 
saveas(gcf, '../03_figures/fig_s2_citra.png');
disp('Gambar citra logo telah disimpan sebagai fig_s2_citra.png');