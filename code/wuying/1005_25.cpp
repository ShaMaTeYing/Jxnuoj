#include<cstdio>
int months[2][12]={{31,28,31,30,31,30,31,31,30,31,30,31},{31,29,31,30,31,30,31,31,30,31,30,31}};
int is(int n)
{
    if(n%100==0)
    {
        if(n%400==0) return 1;
        return 0;
    }
    if(n%4==0) return 1;
    return 0;
}
int main()
{
    int y,m,d;
    scanf("%d%d%d",&y,&m,&d);
    int f=is(y);
    int ans=0;
    if(m<10)
    {
        ans+=months[f][m-1]-d+1;//过完本月
        m++;//月份++
        for(int i=m;i<10;i++) ans+=months[f][i-1];//一直过完9月
        printf("%d\n",ans);
    }
    else if(m==10&&d==1) printf("%d\n",ans);
    else
    {
        ans+=months[f][m-1]-d+1;//过完本月
        m++;//月份++
        for(int i=m;i<=12;i++) ans+=months[f][i-1];//一直过完12月
        f=is(y+1);
        for(int i=1;i<10;i++) ans+=months[f][i-1];//一直过完9月
        printf("%d\n",ans);
    }
    return 0;
}
