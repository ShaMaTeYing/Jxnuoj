#include<iostream>
#include<algorithm>
using namespace std;
const int maxn=1005;
int is[maxn],prime[maxn],primeNumber=0;
int cnt1[maxn],cnt2[maxn];
void getPrime()
{
    fill(is,is+maxn,1);
    is[0]=0;is[1]=0;
    for(int i=2;i<maxn;i++)
    {
        if(is[i])
        {
            prime[primeNumber++]=i;
            for(int j=2*i;j<maxn;j+=i) is[j]=0;
        }
    }
}
void factor(int n,int cnt[])
{
    for(int i=0;i<primeNumber;i++)
    {
        while(n%prime[i]==0)
        {
            cnt[i]++;
            n/=prime[i];
        }
        if(n==1) break;
    }
}
int main()
{
    getPrime();
    int n,a;
    cin>>n>>a;
    factor(n,cnt1);
    factor(a,cnt2);
    int ans=999999;
    for(int i=0;i<primeNumber;i++)
        if(cnt1[i]>cnt2[i]) ans=min(ans,cnt1[i]-cnt2[i]);
    cout<<ans<<endl;
    return 0;
}
