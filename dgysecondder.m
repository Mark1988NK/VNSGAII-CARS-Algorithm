function y =dgysecondder(x,win_num,poly_order)
%+++ Guoyu Ding, 6.15, 2019.
% win_num is the window size (5 7 9 11 13 15 17)
% poly_order is the polynomiar order(3)
[n1,m1]=size(x);
y=zeros(size(x));
if win_num == 5
    if poly_order == 3
        coef1=[2 -1 -2 -1 2]/7;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:2;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,j),polyval(P1,(j+1))],2);
            end
            for j=m1-1:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,j),polyval(P2,(j+1))],2);
            end
            for j=3:m1-2;
                y(i,j)=coef1(1)*x(i,j-2)+coef1(2)*x(i,j-1)+coef1(3)*x(i,j)+coef1(4)*x(i,j+1)+coef1(5)*x(i,j+2);
            end
        end
    end
elseif win_num == 7
    if poly_order == 3
        coef1=[5 0 -3 -4 -3 0 5]/42;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:3;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,j),polyval(P1,(j+1))],2);
            end
            for j=m1-2:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,j),polyval(P2,(j+1))],2);
            end
            for j=4:m1-3;
                y(i,j)=coef1(1)*x(i,j-3)+coef1(2)*x(i,j-2)+coef1(3)*x(i,j-1)+coef1(4)*x(i,j)+coef1(5)*x(i,j+1)+coef1(6)*x(i,j+2)+coef1(7)*x(i,j+3);
            end
        end
    end
elseif win_num == 9
    if poly_order == 3
        coef1=[28 7 -8 -17 -20 -17 -8 7 28]/462;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:4;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,j),polyval(P1,(j+1))],2);
            end
            for j=m1-3:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,j),polyval(P2,(j+1))],2);
            end
            for j=5:m1-4;
                y(i,j)=coef1(1)*x(i,j-4)+coef1(2)*x(i,j-3)+coef1(3)*x(i,j-2)+coef1(4)*x(i,j-1)+coef1(5)*x(i,j)+coef1(6)*x(i,j+1)+coef1(7)*x(i,j+2)+coef1(8)*x(i,j+3)+coef1(9)*x(i,j+4);
            end
        end
    end
elseif win_num == 11
    if poly_order == 3
        coef1=[15 6 -1 -6 -9 -10 -9 -6 -1 6 15]/429;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:5;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,j),polyval(P1,(j+1))],2);
            end
            for j=m1-4:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,j),polyval(P2,(j+1))],2);
            end
            for j=6:m1-5;
                y(i,j)=coef1(1)*x(i,j-5)+coef1(2)*x(i,j-4)+coef1(3)*x(i,j-3)+coef1(4)*x(i,j-2)+coef1(5)*x(i,j-1)+coef1(6)*x(i,j)+coef1(7)*x(i,j+1)+coef1(8)*x(i,j+2)+coef1(9)*x(i,j+3)+coef1(10)*x(i,j+4)+coef1(11)*x(i,j+5);
            end
        end
    end
elseif win_num == 13
    if poly_order == 3
        coef1=[22 11 2 -5 -10 -13 -14 -13 -10 -5 2 11 22]/1001;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:6;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,j),polyval(P1,(j+1))],2);
            end
            for j=m1-5:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,j),polyval(P2,(j+1))],2);
            end
            for j=7:m1-6;
                y(i,j)=coef1(1)*x(i,j-6)+coef1(2)*x(i,j-5)+coef1(3)*x(i,j-4)+coef1(4)*x(i,j-3)+coef1(5)*x(i,j-2)+coef1(6)*x(i,j-1)+coef1(7)*x(i,j)+coef1(8)*x(i,j+1)+coef1(9)*x(i,j+2)+coef1(10)*x(i,j+3)+coef1(11)*x(i,j+4)+coef1(12)*x(i,j+5)+coef1(13)*x(i,j+6);
            end
        end
    end
elseif win_num == 15
    if poly_order == 3
        coef1=[91 52 19 -8 -29 -44 -53 -56 -53 -44 -29 -8 19 52 91]/6188;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:7;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,j),polyval(P1,(j+1))],2);
            end
            for j=m1-6:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,j),polyval(P2,(j+1))],2);
            end
            for j=8:m1-7;
                y(i,j)=coef1(1)*x(i,j-7)+coef1(2)*x(i,j-6)+coef1(3)*x(i,j-5)+coef1(4)*x(i,j-4)+coef1(5)*x(i,j-3)+coef1(6)*x(i,j-2)+coef1(7)*x(i,j-1)+coef1(8)*x(i,j)+coef1(9)*x(i,j+1)+coef1(10)*x(i,j+2)+coef1(11)*x(i,j+3)+coef1(12)*x(i,j+4)+coef1(13)*x(i,j+5)+coef1(14)*x(i,j+6)+coef1(15)*x(i,j+7);
            end
        end
    end
elseif win_num == 17
    if poly_order == 3
        coef1=[40 25 12 1 -8 -15 -20 -23 -24 -23 -20 -15 -8 1 12 25 40]/3876;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:8;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,j),polyval(P1,(j+1))],2);
            end
            for j=m1-7:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,j),polyval(P2,(j+1))],2);
            end
            for j=9:m1-8;
                y(i,j)=coef1(1)*x(i,j-8)+coef1(2)*x(i,j-7)+coef1(3)*x(i,j-6)+coef1(4)*x(i,j-5)+coef1(5)*x(i,j-4)+coef1(6)*x(i,j-3)+coef1(7)*x(i,j-2)+coef1(8)*x(i,j-1)+coef1(9)*x(i,j)+coef1(10)*x(i,j+1)+coef1(11)*x(i,j+2)+coef1(12)*x(i,j+3)+coef1(13)*x(i,j+4)+coef1(14)*x(i,j+5)+coef1(15)*x(i,j+6)+coef1(16)*x(i,j+7)+coef1(17)*x(i,j+8);
            end
        end
    end
end


