#include<cstdio>
#include<cstring>
#define L 100
int a[L],len,cnt,n;
bool vis[L],flag;
void dfs(int pre,int s,int ans)
{
    int i,j;
    if(ans==cnt) {flag=1;return ;}
    if(flag) return ;
    for(i=pre+1;i<n;i++)
    {
        if(vis[i]||s+a[i]>len) continue;
        vis[i]=1;
        if(s+a[i]==len) dfs(-1,0,ans+1);
        else dfs(i,s+a[i],ans);
        vis[i]=0;
        if(flag) return ;
        if(!s) return ;
        for(j=i+1;j<n;j++)
            if(a[j]!=a[j-1]) break;
        i=j-1;
    }
}
int main()
{
    while(~scanf("%d",&n)&&n)
    {
        int Max=-1,sum=0,i;
        for(i=0;i<n;i++)
        {
            scanf("%d",&a[i]);
            if(Max<a[i]) Max=a[i];
            sum+=a[i];
        }
        for(i=n;i>=2;i--)
        {
            flag=0;
            if(sum%i) continue;
            if(sum/i<Max) continue;
            len=sum/i;cnt=i;
            dfs(-1,0,0);
            if(flag) break;
        }
        printf("%d\n",sum/i);
    }
    return 0;
}
