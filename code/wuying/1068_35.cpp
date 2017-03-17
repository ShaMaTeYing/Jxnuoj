#include<cstdio>
#include<cstring>
int dp[1005][30];
bool judge(int s1,int s2,int len)
{
    for(int i=0;i<26;i++)
        if(dp[s1+len][i]-dp[s1-1][i]!=dp[s2+len][i]-dp[s2-1][i]) return false;
//printf("%d %d %d \n",s1,s2,len+1);
    return true;
}
int main()
{
	char s[1005];
	gets(s);
    int len=strlen(s);
    long long ans=0;
    dp[1][s[0]-'a']=1;
    for(int i=2;i<=len;i++)
    {
        for(int j=0;j<26;j++) dp[i][j]=dp[i-1][j];
        dp[i][s[i-1]-'a']++;
    }
//    for(int i=1;i<=len;i++)
//    {
//        for(int j=0;j<2;j++)
//       {
//           printf("%c:%d ",'a'+j,dp[i][j]);
//        }
//        puts("");
//    }
    for(int i=0;i<len;i++)
    {
    	for(int j=i;j<len;j++)
        {
            int tmp=j-i;
        	for(int k=i+1;k<len;k++)
                if(judge(i+1,k+1,tmp)) ans++;
        }
    }
    printf("%lld\n",ans);
	return 0;
}
