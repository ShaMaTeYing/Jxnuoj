#include<iostream>
#include<cstdio>
#include<cstring>
#define mod 1000000007
using namespace std;
long long cnt1,cnt2,sum,n;
char s[1000005];
int main()
{
    scanf("%s",s);
    int len=strlen(s);
    for(int i=0;i<len;i++)
    {
        if(s[i]=='N') cnt1=(cnt1+1)%mod;
        else if(s[i]=='O') cnt2=(cnt2+cnt1)%mod;
        else sum=(sum+cnt2)%mod;
    }
    cout<<sum<<endl;
    return 0;
}
