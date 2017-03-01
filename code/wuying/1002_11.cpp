#include<cstdio>
int abs(int n)
{
    if(n<0) return -n;
    return n;
}
int dp[1005];
int main()
{
	dp[1]=1;
    for(int i=3;i<1005;i+=2) dp[i]=dp[i-2]+2*i;
    int n,ans;
    char c;
    scanf("%d %c",&n,&c);
    for(int i=1;i<1005;i+=2)
        if(dp[i]<=n) ans=i;
        else break;
    for(int i=1;i<=ans;i++)
    {
    	int cnt=(ans+1)/2-abs((ans+1)/2-i)-1;
        while(cnt--) printf(" ");
        for(int j=1;j<=2*(abs((ans+1)/2-i))+1;j++) printf("%c",c);
        printf("\n");
    }
    printf("%d\n",n-dp[ans]);
	return 0;
}
