#include<iostream>
#include<cstdio>
using namespace std;
int n=6,m=3;
bool vis[100];
int a[]={1,2,5,7,8,9};
int ans[100];
int res=0;
void dfs(int d)
{
    if(d==m)
    {

        for(int i=0;i<m;i++) cout<<ans[i]<<" ";cout<<endl;

        return ;
    }
    for(int i=0;i<n;i++)
    {
        if(vis[i]==0)
        {
            vis[i]=1;
            ans[d]=a[i];
            dfs(d+1);
            vis[i]=0;
        }
    }
}
int main()
{
    //freopen("out.txt","w",stdout);
    res=0;
    cin>>n>>m;
    for(int i=0;i<n;i++) a[i]=i+1;
    dfs(0);
   // cout<<res<<endl;
    return 0;
}
