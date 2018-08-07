%%
%Imagen Blanco
eb=imread('300718FH-blanco.arw');
eb=eb(800:1200,:,:);
ebg=rgb2gray(eb);
ebp=mean(ebg);%promedio
m=max(ebp);%obtengo máximo del blanco
ebpn=ebp./m;%promedio normalizado
figure('name','blanco'), subplot(4,1,1), imshow (eb)
subplot(4,1,2), imshow (ebg)
subplot(4,1,3), plot (ebp)
subplot(4,1,4), plot (ebpn)