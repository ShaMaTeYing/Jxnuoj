#include<cstdio>
int main()
{
    long long k,n;
    long long sum=0;
    scanf("%lld%lld",&k,&n);
    sum+=n/7*30;
    n%=7;
    for(int i=1;i<=n;i++)
    {
        if(1<=k&&k<=5) sum+=2*k;
        k++;
        k%=7;
    }
    printf("%lld\n",sum);
	return 0;
}
