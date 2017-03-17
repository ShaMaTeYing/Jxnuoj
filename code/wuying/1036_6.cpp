#include<iostream>
using namespace std;
int dir[4][2]={{-1,0},{0,1},{1,0},{0,-1}};
int n,m,k,ans;
int vis[10][10];
bool judge(int x,int y)
{
    for(int i=-1;i<=1;i++)
        for(int j=-1;j<=1;j++)
        {
            if(i==0&&j==0) continue;
            int nx=x+i,ny=y+j;
            if(0<=nx&&nx<n&&0<=ny&&ny<m)
            {
                if(vis[nx][ny]) return true;
            }
        }
        return false;
}
void dfs(int d,int cnt)
{
    int x=d/m,y=d%m;
    if(d==n*m)
    {
        if(cnt==k) ans++;
        return ;
    }
    if(judge(x,y)==false)
    {
        vis[x][y]=1;
        dfs(d+1,cnt+1);
        vis[x][y]=0;
    }
    dfs(d+1,cnt);
}
int main()
{
    cin>>n>>m>>k;
    dfs(0,0);
    cout<<ans<<endl;
    return 0;
}
