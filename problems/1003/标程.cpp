#include<cstdio>
#define LL long long
int main()
{
    LL a,b;
    while(~scanf("%I64d%I64d",&a,&b))
    {
        int t=a;a=b;b=t;
        printf("%I64d %I64d\n",a,b);
    }
    return 0;
}
