#include<iostream>
#include<cstdio>
using namespace std;
int up,ans;
void dfs(int row,int ld,int rd)
{
    if(row==up) ans++;
    else
    {
        int pos=up&(~(row|ld|rd));
        while(pos)
        {
            int p=pos&((~pos)+1);
            pos-=p;
            dfs(row+p,(ld+p)<<1,(rd+p)>>1);
        }
    }
}
int main()
{
    int n;
    while(cin>>n)
    {
        up=(1<<n)-1;
        ans=0;
        dfs(0,0,0);
        cout<<ans<<endl;
    }
    return 0;
}
