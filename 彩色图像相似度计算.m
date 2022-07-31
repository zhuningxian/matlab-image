[file1,path1]=uigetfile({'*.jpg';'*.png'},'ѡ��ͼƬ');%ȡԭͼ
r1=imread([path1,file1]);
[file2,path2] = uigetfile({'*.jpg';'*.png'},'ѡ��ͼƬ');%ȡ�Ƚ�ͼ
r2=imread([path2,file2]);
r1 = mat2gray(r1);
r2 = mat2gray(r2);

x=0:1:255;

R1 = r1(:,:,1);%ԭͼ��ͨ������
G1 = r1(:,:,2);  
B1 = r1(:,:,3);
H_R1=imhist(R1);%��ԭͼ��ÿ��ͨ������ֱ��ͼ
H_G1=imhist(G1);
H_B1=imhist(B1);

R2 = r2(:,:,1);  %�Ƚ�ͼ��ͨ������
G2 = r2(:,:,2);  
B2 = r2(:,:,3);  
H_R2=imhist(R2);% �ԱȽ�ͼ��ÿ��ͨ������ֱ��ͼ
H_G2=imhist(G2);
H_B2=imhist(B2);

subplot(231);imshow(r1);title('ԭͼ');
subplot(232);imshow(r2);title('�Ƚ�ͼ');
subplot(233);text(0.5,.5,{'���ƶ�Ϊ',num2str(fin)},'FontSize',24,'HorizontalAlignment','center');
subplot(234);plot(x,H_R1,'b',x,H_R2,'r:');title('Rֱ��ͼ�Ƚ�');legend('ԭͼ','�Ƚ�ͼ');
subplot(235);plot(x,H_G1,'b',x,H_G2,'r:');title('Gֱ��ͼ�Ƚ�');legend('ԭͼ','�Ƚ�ͼ');
subplot(236);plot(x,H_B1,'b',x,H_B2,'r:');title('Bֱ��ͼ�Ƚ�');legend('ԭͼ','�Ƚ�ͼ');

t1=0;n1=0;m1=0;%����ʼֵ
t2=0;n2=0;m2=0;
t3=0;n3=0;m3=0;
for i=1:length(H_R1)
    y1=[];                %��Rͨ�����㷨����
    if H_R1(i)~=H_R2(i)
        y1=min([H_R1(i),H_R2(i)]);
    else
        y1=H_R1(i);
    end
    L1(i)=y1;
    t1=t1+L1(i);
    n1=n1+H_R1(i);
    m1=m1+H_R2(i);
    

     y2=[];                %��Gͨ�����㷨����
    if H_G1(i)~=H_G2(i)
        y2=min([H_G1(i),H_G2(i)]);
    else
        y2=H_G1(i);
    end
    L2(i)=y2;
    t2=t2+L2(i);
    n2=n2+H_G1(i);
    m2=m2+H_G2(i);
    
    y3=[];                %��Bͨ�����㷨����
    if H_B1(i)~=H_B2(i)
        y3=min([H_B1(i),H_B2(i)]);
    else
        y3=H_B1(i);
    end
    L3(i)=y3;
    t3=t3+L2(i);
    n3=n3+H_B1(i);
    m3=m3+H_B2(i);

end
s1=min([n1,m1]);
fin1=(t1/s1);%Rͨ�������ƶ�

s2=min([n2,m2]);
fin2=(t2/s2);%Gͨ�������ƶ�

s3=min([n3,m3]);
fin3=(t3/s3);%Bͨ�������ƶ�

fin=mean([fin1,fin2,fin3])%���յ�ͼ�����ƶ�