clear all
syms x;
f=(exp(x)-1)*(sin(x)-1);        %ֱ�����Ѷ���ķ��ű����������ű��ʽ
xx=-pi:pi/200:pi;
yy=subs(f,x,xx);   %�����ű��ʽ�е�x���ű�����Ϊxx��ֵ����ֵ
n=9;%�޸�n���ۿ�ͼ�α任
f1=fseries(f,x,n); 
y1=subs(f1,x,xx);
plot(xx,y1,xx,yy)
