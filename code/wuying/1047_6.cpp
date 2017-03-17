#include<iostream>
#include<cstdio>
using namespace std;
long long sum[1000005],x,n,m,l,r;
int main()
{
    scanf("%lld",&n);
    for(int i=1;i<=n;i++) scanf("%lld",&x),sum[i]=sum[i-1]+x;
    scanf("%lld",&m);
    for(int i=1;i<=m;i++)
    {
        scanf("%lld%lld",&l,&r);
        printf("%lld\n",sum[r]-sum[l-1]);
    }
    return 0;
}
