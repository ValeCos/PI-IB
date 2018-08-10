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

%asignación de rango de pixeles a longitudes de onda 1nm
n=9;
for a=0:9:3275
    b=mean(ebpn(a+1:a+n+1));
    if a == 0
        EB=[b];
    else 
        EB=[EB b];
    end 
end
figure('name','blanco'), plot(EB)
%D=EB';
%xlswrite('blanco05.xlsx',D);




%%
%Imagen 1.66ug

e1=imread('300718FH-166ug.arw');
e1=e1(800:1200,:,:);
e1g=rgb2gray(e1); 
e1p=mean(e1g);
e1pn=e1p./m;
figure('name','1.66ug'), subplot(4,1,1), imshow (e1)
subplot(4,1,2), imshow (e1g)
subplot(4,1,3), plot (e1p)
subplot(4,1,4), plot (e1pn)

n=9;
for a=0:9:3275
    b=mean(e1pn(a+1:a+n+1));
    if a == 0
        E1=[b];
    else 
        E1=[E1 b];
    end 
end

figure('name','1.66ug'), plot(E1)
%B=E1';
%xlswrite('166ug05.xlsx',B);

%%
%Imagen 8.32ug

e2=imread('300718FH-832ug.arw');
e2=e2(900:1200,:,:);
e2g=rgb2gray(e2);
e2p=mean(e2g);
e2pn=e2p./m;
figure('name','8.32ug'), subplot(4,1,1), imshow (e2)
subplot(4,1,2), imshow (e2g)
subplot(4,1,3), plot (e2p)
subplot(4,1,4), plot (e2pn)

n=9;
for a=0:9:3275
    b=mean(e2pn(a+1:a+n+1));
    if a == 0
        E2=[b];
    else 
        E2=[E2 b];
    end 
end

figure('name','8.32ug'), plot(E2)
%C=E2';
%xlswrite('832ug05.xlsx',C);

%%
%Imagen 11ug

e3=imread('300718FH-11ug.arw');
%imshow (e3)
e3=e3(800:1200,:,:);
e3g=rgb2gray(e3); 
e3p=mean(e3g);
e3pn=e3p./m;%promedio normalizado con el maximo valor del blanco
figure('name','11ug'), subplot(4,1,1), imshow (e3)
subplot(4,1,2), imshow (e3g)
subplot(4,1,3), plot (e3p)
subplot(4,1,4), plot (e3pn)

n=9;
for a=0:9:3275
    b=mean(e3pn(a+1:a+n+1));
    if a == 0
        E3=[b];
    else 
        E3=[E3 b];
    end 
end

figure('name','11ug'), plot(E3)
%A=E3';
%xlswrite('11ug05.xlsx',A);


%%
%Ploteos

%x=0:0.1:1;
%y=350:50:750;

figure('name','promedios')
subplot(4,1,1),plot(EB), title('Blanco');
subplot(4,1,2),plot(E1), title('1.66ug');
subplot(4,1,3),plot(E2), title('8.32ug');
subplot(4,1,4),plot(E3), title('11ug'); 

figure('name','comparativa'), plot(EB, 'yellow')
hold on
plot(E1, 'red')
plot(E2, 'green')
plot(E3, 'blue')
hold off



%%
%absorbancia

figure('name','absorbancia'), plot(-log(E1./EB),'red')
hold on
plot(-log(E3./EB),'blue')
plot(-log(E2./EB),'green')
hold off

%%
% Análisis de resolución

n=9;
for a=0:9:3275
    b=mean(ebpn(a+1:a+n+1));
    if a == 0
        EB9=[b];
    else 
        EB9=[EB9 b];
    end 
end

n=7;
for a=0:7:3275
    b=mean(ebpn(a+1:a+n+1));
    if a == 0
        EB7=[b];
    else 
        EB7=[EB7 b];
    end 
end


n=11;
for a=0:11:3275
    b=mean(ebpn(a+1:a+n+1));
    if a == 0
        EB11=[b];
    else 
        EB11=[EB11 b];
    end 
end

n=5;
for a=0:5:3275
    b=mean(ebpn(a+1:a+n+1));
    if a == 0
        EB5=[b];
    else 
        EB5=[EB5 b];
    end 
end


figure('name','blanco'), 
hold on
plot(EB9,'red')
plot(EB7,'black')
plot(EB11,'green')
plot(EB5,'yellow')
hold off

%%
eFCO2=imread('300718FCO2-1.arw');
figure ('name', 'eFCO2'), imshow(eFCO2);
eFCO2c=eFCO2(300:1300,:,:);
figure ('name', 'eFCO2c'), imshow(eFCO2c);
eFCO2g=rgb2gray(eFCO2c);
eFCO2p=mean(eFCO2g);%promedio
m=max(eFCO2p);%obtengo máximo del blanco
eFCO2pn=eFCO2p./m;%promedio normalizado

eFH2=imread('300718FH2-1.arw');
figure ('name', 'eFH2'), imshow(eFH2);
eFH2c=eFH2(500:1500,:,:);
figure ('name', 'eFH2c'), imshow(eFH2c);
eFH2g=rgb2gray(eFH2c);
eFH2p=mean(eFH2g);%promedio
m=max(eFH2p);%obtengo máximo del blanco
eFH2pn=eFH2p./m;%promedio normalizado

eFM=imread('300718FM-1.arw');
figure ('name', 'eFM'), imshow(eFM);
eFMc=eFM(300:1300,:,:);
figure ('name', 'eFMc'), imshow(eFMc);
eFMg=rgb2gray(eFMc);
eFMp=mean(eFMg);%promedio
m=max(eFMp);%obtengo máximo del blanco
eFMpn=eFMp./m;%promedio normalizado

figure, hold on
plot(eFCO2pn,'red')
plot(eFH2pn, 'green')
plot(eFMpn,'blue')
hold off

% figure ('name', 'espectros'), subplot(2,2,1), imshow(ef1), title('slit mas abierto');
% subplot(2,2,3), imshow(ef5), title('slit mas cerrado');
% subplot(2,2,2), plot(ef1pn);
% subplot(2,2,4), plot(ef5pn);

n=9;
for a=0:9:3275
    b=mean(eFCO2pn(a+1:a+n+1));
    if a == 0
        EFCO2=[b];
    else 
        EFCO2=[EFCO2 b];
    end 
end

n=9;
for a=0:9:3275
    b=mean(eFH2pn(a+1:a+n+1));
    if a == 0
        EFH2=[b];
    else 
        EFH2=[EFH2 b];
    end 
end

n=9;
for a=0:9:3275
    b=mean(eFMpn(a+1:a+n+1));
    if a == 0
        EFM=[b];
    else 
        EFM=[EFM b];
    end 
end

figure, hold on
plot(EFCO2,'red')
plot(EFH2,'green')
plot(EFM,'blue')
hold off
%% Análisis de ISO y Tiempo de exposición
% Idea: poder conseguir la configuracion más acertada

% Comparación de intensidad entre slit completo y slit limitado en altura 

FH1= imread('010818FH-1.arw');
figure ('name', 'FH1'), imshow(FH1);
FH1c=FH1(1000:1600,:,:);
figure ('name', 'FH1c'), imshow(FH1c);
FH1g=rgb2gray(FH1c);
FH1p=mean(FH1g);%promedio
m=max(FH1p);%obtengo máximo del blanco
FH1pn=FH1p./m;%promedio normalizado

FH2= imread('010818FH-2.arw');
figure ('name', 'FH2'), imshow(FH2);
FH2c=FH2(1100:1700,:,:);
figure ('name', 'FH2c'), imshow(FH2c);
FH2g=rgb2gray(FH2c);
FH2p=mean(FH2g);%promedio
m=max(FH2p);%obtengo máximo del blanco
FH2pn=FH2p./m;%promedio normalizado

figure, title('Comparación de intensidad entre slit completo (red) y slit limitado en altura (green)'),
hold on
plot(FH1pn,'red')
plot(FH2pn,'green')
hold off

% Comparación ISO 400 - Variación de SS de 4000 a 10000

FH3= imread('010818FH-3.arw');
%figure ('name', 'FH3'), imshow(FH3);
FH3c=FH3(1100:1700,:,:);
%figure ('name', 'FH3c'), imshow(FH3c);
FH3g=rgb2gray(FH3c);
FH3p=mean(FH3g);%promedio
m=max(FH3p);%obtengo máximo del blanco
FH3pn=FH3p./m;%promedio normalizado

FH4= imread('010818FH-4.arw');
%figure ('name', 'FH4'), imshow(FH4);
FH4c=FH4(1100:1700,:,:);
%figure ('name', 'FH4c'), imshow(FH4c);
FH4g=rgb2gray(FH4c);
FH4p=mean(FH4g);%promedio
m=max(FH4p);%obtengo máximo del blanco
FH4pn=FH4p./m;%promedio normalizado

FH5= imread('010818FH-5.arw');
%figure ('name', 'FH5'), imshow(FH5);
FH5c=FH5(1100:1700,:,:);
%figure ('name', 'FH5c'), imshow(FH5c);
FH5g=rgb2gray(FH5c);
FH5p=mean(FH5g);%promedio
m=max(FH5p);%obtengo máximo del blanco
FH5pn=FH5p./m;%promedio normalizado

FH6= imread('010818FH-6.arw');
%figure ('name', 'FH6'), imshow(FH6);
FH6c=FH6(1100:1700,:,:);
%figure ('name', 'FH6c'), imshow(FH6c);
FH6g=rgb2gray(FH6c);
FH6p=mean(FH6g);%promedio
m=max(FH6p);%obtengo máximo del blanco
FH6pn=FH6p./m;%promedio normalizado

FH7= imread('010818FH-7.arw');
%figure ('name', 'FH7'), imshow(FH7);
FH7c=FH7(1100:1700,:,:);
%figure ('name', 'FH7c'), imshow(FH7c);
FH7g=rgb2gray(FH7c);
FH7p=mean(FH7g);%promedio
m=max(FH7p);%obtengo máximo del blanco
FH7pn=FH7p./m;%promedio normalizado

FH8= imread('010818FH-8.arw');
%figure ('name', 'FH8'), imshow(FH8);
FH8c=FH8(1100:1700,:,:);
%figure ('name', 'FH8c'), imshow(FH8c);
FH8g=rgb2gray(FH8c);
FH8p=mean(FH8g);%promedio
m=max(FH8p);%obtengo máximo del blanco
FH8pn=FH8p./m;%promedio normalizado

figure, title('Comparación de intensidad ISO 400 - Variación de SS de 4000 a 10000 '),
hold on
plot(FH1pn)
plot(FH2pn)
plot(FH3pn)
plot(FH4pn)
plot(FH5pn)
plot(FH6pn)
plot(FH7pn)
plot(FH8pn)
legend('FH1', 'FH2', 'FH3', 'FH4', 'FH5', 'FH6', 'FH7', 'FH8')
hold off