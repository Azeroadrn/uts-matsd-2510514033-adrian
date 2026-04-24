% =======================================================================
% UTS Matematika Sains Data Semester Genap 2025/2026
% Soal 1 Eksplorasi Awal dan Profil Data Transaksi
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

% --- Pembangkitan Data Toko (D1 - D7) ---
indeks_toko = 1:7;
penjualan_toko = zeros(1, 7);

for i = 1:7
    % Rumus: D_i = 20 + (K*i) + ((a*i) mod 7) - ((b*i) mod 5)
    penjualan_toko(i) = 20 + (K * i) + mod((a * i), 7) - mod((b * i), 5);
end

% === Soal 1.b: Verifikasi Statistik ===
rata_rata = mean(penjualan_toko);
nilai_tengah = median(penjualan_toko);
modus_data = mode(penjualan_toko);
rentang_data = range(penjualan_toko);
standar_deviasi_populasi = std(penjualan_toko, 1); % Angka '1' menunjukkan rumus populasi

fprintf('--- Verifikasi Soal 1.b ---\n');
fprintf('Mean      : %.2f Juta\n', rata_rata);
fprintf('Median    : %.2f Juta\n', nilai_tengah);
fprintf('Modus     : %.2f Juta\n', modus_data);
fprintf('Range     : %.2f Juta\n', rentang_data);
fprintf('Std. Dev  : %.2f Juta\n\n', standar_deviasi_populasi);

% === Soal 1.c: Diagram Batang Penjualan ===
figure('Name', 'Diagram Batang Penjualan');
bar(indeks_toko, penjualan_toko, 'FaceColor', [0.2 0.6 0.8]);
hold on;
% Garis rata-rata horizontal
yline(rata_rata, 'r--', 'LineWidth', 2, 'Label', 'Rata-rata');

% Label dan Judul
xlabel('Toko Ke-');
ylabel('Penjualan (Juta Rupiah)');
title('Penjualan Harian 7 Toko - NIM 2510514033');
grid on;
hold off;

% Menyimpan figure sesuai panduan nama file
saveas(gcf, '../03_figures/fig_s1_barchart.png');
disp('Gambar diagram batang telah disimpan sebagai fig_s1_barchart.png');