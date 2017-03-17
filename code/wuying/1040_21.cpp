#include<iostream>
#include<cstdio>
#include<algorithm>
#include<cstring>
#define lson l,m,rt<<1
#define rson m+1,r,rt<<1|1
#define LL long long
using namespace std;
const int maxn=100005;
int sum[maxn<<2];
int a[maxn],b[maxn],n;
LL dp[maxn][2];
void PushUp(int rt)
{
    sum[rt]=sum[rt<<1]+sum[rt<<1|1];
}
void build(int l,int r,int rt)
{
    sum[rt]=0;
    if(l==r) return ;
    int m=(l+r)>>1;
    build(lson);
    build(rson);
}
void update(int l,int r,int rt,int p)
{
    if(l==r)
    {
        sum[rt]++;
        return ;
    }
    int m=(l+r)>>1;
    if(p<=m) update(lson,p);
    else update(rson,p);
    PushUp(rt);
}
LL query(int l,int r,int rt,int L,int R)
{
    if(L<=l&&r<=R) return sum[rt];
    int m=(l+r)>>1;
    LL ans=0;
    if(L<=m) ans+=query(lson,L,R);
    if(R>m) ans+=query(rson,L,R);
    return ans;
}
int main()
{
    while(~scanf("%d",&n))
    {
        memset(dp,0,sizeof(dp));
        for(int i=0;i<n;i++) scanf("%d",&a[i]),b[i]=a[i];
        sort(b,b+n);
        int len=unique(b,b+n)-b;
        build(1,len,1);
        LL ans=0;
        for(int i=0;i<n;i++)
        {
            int p=upper_bound(b,b+len,a[i])-b;
            if(dp[p][0]==0&&p<len) dp[p][0]=query(1,len,1,p+1,len);
            //if(dp[p][1]==0&&p>1) dp[p][1]=query(1,len,1,1,p-1);
           // printf("%lld\n",dp[p][0]);
            //ans+=(dp[p][0]*(dp[p][0]+1))/2;
            //if(p<len) ans+=query(1,len,1,p+1,len);
            update(1,len,1,p);
            //printf("%d\n",p);
        }
        build(1,len,1);
        for(int i=n-1;i>=0;i--)
        {
            int p=upper_bound(b,b+len,a[i])-b;
            //if(dp[p][0]==0&&p<len) dp[p][0]=query(1,len,1,p+1,len);
            if(dp[p][1]==0&&p>1) dp[p][1]=query(1,len,1,1,p-1);
            //printf("%lld %lld\n",dp[p][0],dp[p][1]);
           // ans+=(dp[p][1]*(dp[p][1]+1))/2;
            //if(p<len) ans+=query(1,len,1,p+1,len);
            update(1,len,1,p);
            //printf("%d\n",p);
        }
        for(int i=0;i<n;i++)
        {
            int p=upper_bound(b,b+len,a[i])-b;
            int t=dp[p][0]+dp[p][1];
            ans+=t*(t+1)/2;
        }
        printf("%lld\n",ans);
    }
    return 0;
}
