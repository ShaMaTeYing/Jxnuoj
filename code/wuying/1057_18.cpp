#include<cstdio>
#include<iostream>
#include<algorithm>
#include<cstring>
#define LL long long
using namespace std;
const int maxn=1000005;
char s[maxn];
LL cnt[30];
int main()
{
    gets(s);
    int len=strlen(s);
    for(int i=0;i<len;i++)
    {
        if('A'<=s[i]&&s[i]<='Z') cnt[s[i]-'A']++;
        else cnt[s[i]-'a']++;
    }
    sort(cnt,cnt+26);
    LL ans=0;
    for(int i=1;i<=26;i++)
        ans+=i*cnt[i-1];
    printf("%lld\n",ans);
    return 0;
}
