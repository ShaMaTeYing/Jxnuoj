#include<cstdio>
#include<iostream>
#include<cmath>
#include<algorithm>
#define LL long long

using namespace std;
int main()
{
freopen("in.txt","r",stdin);
   // freopen("out.txt","w",stdout);
    string s;
    while(cin>>s)
    {
        if(s.size()<10) cout<<"NO"<<endl;
        else
        {
            if(!(('a'<=s[0]&&s[0]<='z')||('A'<=s[0]&&s[0]<='Z'))) cout<<"NO"<<endl;
            else
            {
                int a[10]={0},cnt=0,f=0;
                for(int i=1;i<s.size();i++)
                {
                    if('0'<=s[i]&&s[i]<='9')
                    {
                        if(a[s[i]-'0']==0) cnt++,a[s[i]-'0']=1;

                    }
                    if(s[i]=='='||s[i]=='*') f=1;
                }
                if(f) cout<<"NO"<<endl;
                else
                {
                    if(2<=cnt&&cnt<=6) cout<<"YES"<<endl;
                    else cout<<"NO"<<endl;
                }
            }
        }
    }

    return 0;
}
