#include<stdio.h>
#include<algorithm>
using namespace std;
long long b[25],n,p,k;
long long a[11000005];
void qsort(int l,int r)
{
    int tmp=a[l];
    int i=l,j=r;
    while(i<j)
    {
        while(tmp<=a[j]&&j>i) j--;
        a[i]=a[j];
        while(tmp>=a[i]&&j>i) i++;
        a[j]=a[i];
    }
    a[i]=tmp;
    if(l<i-1) qsort(l,i-1);
    if(r>i+1) qsort(i+1,r);
}
void dfs(long long d,long long s)
{
    if(d==n)
    {
        if(s) a[p++]=s;
        return ;
    }
    dfs(d+1,s);
    dfs(d+1,s+b[d]);
}
int main()
{
    scanf("%lld%lld",&n,&k);
    for(int i=0;i<n;i++)
    {
        scanf("%lld",&b[i]);
    }
    dfs(0,0);
    qsort(0,p-1);
    printf("%lld\n",a[k-1]);
    return 0;
}
