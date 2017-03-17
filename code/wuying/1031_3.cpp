#include<cstdio>
#include<iostream>
#include<algorithm>
using namespace std;
const int maxn=2000005;
int a[maxn],n;
int main()
{
    scanf("%d",&n);
    for(int i=0;i<n;i++) scanf("%d",&a[i]);
    for(int i=n;i<n+n;i++) a[i]=a[i-n];
    int Max=-2147483648,cnt=1,sum=-1;
    for(int i=0;i<2*n;i++)
    {
        if(sum<=0) sum=a[i],cnt=1;
        else if(cnt==n) sum+=a[i]-a[i-n];
        else sum+=a[i],cnt++;
        Max=max(Max,sum);
    }
    if(Max<0) Max=0;
    printf("%d\n",Max);

    return 0;
}
