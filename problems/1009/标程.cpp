#include<cstdio>
#include<iostream>
#define LL long long

using namespace std;
int main()
{
    freopen("in.txt","r",stdin);
    freopen("out.txt","w",stdout);
    string s;
    while(cin>>s)
    {
        LL s1=0,s2=0,s3=0,s4=0;
        for(int i=0;i<s.size();i++)
        {
            if(s[i]=='m') s1++;
            else if(s[i]=='i') s2=(s2+s1)%1314;
            else if(s[i]=='a') s3=(s2+s3)%1314;
            else if(s[i]=='o') s4=(s4+s3)%1314;
        }
        cout<<s4<<endl;
    }
    return 0;
}
