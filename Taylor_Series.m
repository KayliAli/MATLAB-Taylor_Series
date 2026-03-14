%% TAYLOR SERISI ILE e^x HESABI
clc; clear; close all;  % Çalışma alanını temizlenmesi.

x=input("f(x)=e^x için x değeri giriniz :"); % x değerini al
n_terim=input("Hesaplanacak Terim Sayısı: "); % Hesaplanacak Terim sayısını al

% Serinin toplamını tutacak değişken;
taylor_toplam = 0; 

for k=0 : n_terim-1
    
    faktor=factorial(k); % faktoryiel Hesaplama

    terim = (x^k)/faktor ; % Mevcut Terimi Hesapla

    taylor_toplam=taylor_toplam + terim ; % Hesaplanan Terimi Toplam Terime Ekle

end

% MATLAB yerleşik fonksiyonu ile gerçek değeri hesaplama
gercek_deger = exp(x);


% Sonuçları komut penceresine yazdırma
fprintf('\n--- Sonuçlar ---\n');
fprintf('Taylor Yaklaşımı: %.6f\n', taylor_toplam);
fprintf('MATLAB exp(x) Değeri: %.6f\n', gercek_deger);
fprintf('Mutlak Hata: %.6e\n', abs(gercek_deger - taylor_toplam));


% Grafik Çizme

x_noktalari = -4:0.1:4;  % X ekseni için -4 ile 4 aralığında noktaların belirlenmesi.

y_gercek = exp(x_noktalari);  % Gerçek  değerlerinin hesaplanması.

taylor_grafik = zeros(size(x_noktalari));   % Yaklaşma değerleri için boş bir liste

                         
for i=0:(n_terim-1)
    taylor_grafik=taylor_grafik + (x_noktalari.^i)/factorial(i);      % Yaklaşma Değerlerini tek tek hesapla ve listeye ekle
end

figure(1);  % 1 Numaralı grafik penceresi açılması.

plot(x_noktalari, y_gercek, 'b-', 'LineWidth', 2);  % Gerçek e^x eğrisi

hold on; 

plot(x_noktalari, taylor_grafik, 'r--', 'LineWidth', 2);  % Taylor serisi ile bulunan yaklaşık eğrinin çizdirilmesi.

xlabel('x');  % x ekseni etiketi
ylabel('y');  % y ekseni etiketi

legend('Gerçek e^x Eğrisi', 'Taylor Serisi Yaklaşımı');  % Grafik açıklaması

grid on;  % Grafiğe kareli arka plan eklenmesi
