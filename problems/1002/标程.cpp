#include<cstdio>
#define LL long long
//函数功能：求出整数n二进制表示中1的个数
LL getOneNumber(LL n)
{
    LL cnt=0;
    while(n)
        n&=n-1,cnt++;
    return cnt;
}
int main()
{
    LL a,b;
    while(~scanf("%I64d%I64d",&a,&b))
        printf("%I64d\n",getOneNumber(a^b));
    return 0;
}
