#include<cstdio>
#include<iostream>
#include<cmath>
#include<algorithm>
#define LL long long

using namespace std;
int ans=0;
LL dp[105];
LL dfs(int cur)
{
    if(cur==0) return dp[cur]=1;
    if(cur==1) return dp[cur]=1;
    if(cur==2) return dp[cur]=2;
    if(dp[cur]) return dp[cur];
    if(cur-1>=0) dp[cur]+=1;
    if(cur-2>=0) dp[cur]+=dfs(cur-2);
    if(cur-5>=0) dp[cur]+=dfs(cur-5);
    return dp[cur];
}
int main()
{
    freopen("in.txt","r",stdin);
    freopen("out.txt","w",stdout);
    dfs(100);
    //for(int i=1;i<=80;i++) cout<<dp[i]<<endl;
    cout<<dp[100]<<endl;
    return 0;
}
